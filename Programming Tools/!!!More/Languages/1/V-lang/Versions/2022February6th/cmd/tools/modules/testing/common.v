module testing

import os
import time
import term
import benchmark
import sync.pool
import v.pref
import v.util.vtest
import runtime

pub const github_job = os.getenv('GITHUB_JOB')

pub const show_start = os.getenv('VTEST_SHOW_START') == '1'

pub const hide_skips = os.getenv('VTEST_HIDE_SKIP') == '1'

pub const hide_oks = os.getenv('VTEST_HIDE_OK') == '1'

pub const fail_fast = os.getenv('VTEST_FAIL_FAST') == '1'

pub const test_only = os.getenv('VTEST_ONLY').split_any(',')

pub const test_only_fn = os.getenv('VTEST_ONLY_FN').split_any(',')

pub const is_node_present = os.execute('node --version').exit_code == 0

pub const all_processes = os.execute('ps ax').output.split_any('\r\n')

pub struct TestSession {
pub mut:
	files         []string
	skip_files    []string
	vexe          string
	vroot         string
	vtmp_dir      string
	vargs         string
	failed        bool
	fail_fast     bool
	benchmark     benchmark.Benchmark
	rm_binaries   bool = true
	silent_mode   bool
	progress_mode bool
	root_relative bool // used by CI runs, so that the output is stable everywhere
	nmessages     chan LogMessage // many publishers, single consumer/printer
	nmessage_idx  int      // currently printed message index
	nprint_ended  chan int // read to block till printing ends, 1:1
	failed_cmds   shared []string
}

enum MessageKind {
	ok
	fail
	skip
	info
	sentinel
}

struct LogMessage {
	message string
	kind    MessageKind
}

pub fn (mut ts TestSession) add_failed_cmd(cmd string) {
	lock ts.failed_cmds {
		ts.failed_cmds << cmd
	}
}

pub fn (mut ts TestSession) show_list_of_failed_tests() {
	for i, cmd in ts.failed_cmds {
		eprintln(term.failed('Failed command ${i + 1}:') + '    $cmd')
	}
}

pub fn (mut ts TestSession) append_message(kind MessageKind, msg string) {
	ts.nmessages <- LogMessage{
		message: msg
		kind: kind
	}
}

pub fn (mut ts TestSession) print_messages() {
	empty := term.header(' ', ' ')
	mut print_msg_time := time.new_stopwatch()
	for {
		// get a message from the channel of messages to be printed:
		mut rmessage := <-ts.nmessages
		if rmessage.kind == .sentinel {
			// a sentinel for stopping the printing thread
			if !ts.silent_mode && ts.progress_mode {
				eprintln('')
			}
			ts.nprint_ended <- 0
			return
		}
		if rmessage.kind != .info {
			ts.nmessage_idx++
		}
		msg := rmessage.message.replace_each([
			'TMP1',
			'${ts.nmessage_idx:1d}',
			'TMP2',
			'${ts.nmessage_idx:2d}',
			'TMP3',
			'${ts.nmessage_idx:3d}',
			'TMP4',
			'${ts.nmessage_idx:4d}',
		])
		is_ok := rmessage.kind == .ok
		//
		time_passed := print_msg_time.elapsed().seconds()
		if time_passed > 10 && ts.silent_mode && is_ok {
			// Even if OK tests are suppressed,
			// show *at least* 1 result every 10 seconds,
			// otherwise the CI can seem stuck ...
			eprintln(msg)
			print_msg_time.restart()
			continue
		}
		if ts.progress_mode {
			// progress mode, the last line is rewritten many times:
			if is_ok && !ts.silent_mode {
				print('\r$empty\r$msg')
			} else {
				// the last \n is needed, so SKIP/FAIL messages
				// will not get overwritten by the OK ones
				eprint('\r$empty\r$msg\n')
			}
			continue
		}
		if !ts.silent_mode || !is_ok {
			// normal expanded mode, or failures in -silent mode
			eprintln(msg)
			continue
		}
	}
}

pub fn new_test_session(_vargs string, will_compile bool) TestSession {
	mut skip_files := []string{}
	if will_compile {
		$if msvc {
			skip_files << 'vlib/v/tests/const_comptime_eval_before_vinit_test.v' // _constructor used
		}
		$if solaris {
			skip_files << 'examples/gg/gg2.v'
			skip_files << 'examples/pico/pico.v'
			skip_files << 'examples/sokol/fonts.v'
			skip_files << 'examples/sokol/drawing.v'
		}
		$if macos {
			skip_files << 'examples/database/mysql.v'
			skip_files << 'examples/database/orm.v'
			skip_files << 'examples/database/psql/customer.v'
		}
		$if windows {
			skip_files << 'examples/database/mysql.v'
			skip_files << 'examples/database/orm.v'
			skip_files << 'examples/websocket/ping.v' // requires OpenSSL
			skip_files << 'examples/websocket/client-server/client.v' // requires OpenSSL
			skip_files << 'examples/websocket/client-server/server.v' // requires OpenSSL
			$if tinyc {
				skip_files << 'examples/database/orm.v' // try fix it
			}
		}
		if testing.github_job != 'sokol-shaders-can-be-compiled' {
			// These examples need .h files that are produced from the supplied .glsl files,
			// using by the shader compiler tools in https://github.com/floooh/sokol-tools-bin/archive/pre-feb2021-api-changes.tar.gz
			skip_files << 'examples/sokol/simple_shader_glsl/simple_shader.v'
			skip_files << 'examples/sokol/02_cubes_glsl/cube_glsl.v'
			skip_files << 'examples/sokol/03_march_tracing_glsl/rt_glsl.v'
			skip_files << 'examples/sokol/04_multi_shader_glsl/rt_glsl.v'
			skip_files << 'examples/sokol/05_instancing_glsl/rt_glsl.v'
			// Skip obj_viewer code in the CI
			skip_files << 'examples/sokol/06_obj_viewer/show_obj.v'
		}
		if testing.github_job != 'ubuntu-tcc' {
			skip_files << 'examples/c_interop_wkhtmltopdf.v' // needs installation of wkhtmltopdf from https://github.com/wkhtmltopdf/packaging/releases
			skip_files << 'examples/call_v_from_python/test.v' // the example only makes sense to be compiled, when python is installed
			// the ttf_test.v is not interactive, but needs X11 headers to be installed, which is done only on ubuntu-tcc for now
			skip_files << 'vlib/x/ttf/ttf_test.v'
			skip_files << 'vlib/vweb/vweb_app_test.v' // imports the `sqlite` module, which in turn includes sqlite3.h
		}
		if testing.github_job != 'audio-examples' {
			skip_files << 'examples/sokol/sounds/melody.v'
			skip_files << 'examples/sokol/sounds/wav_player.v'
			skip_files << 'examples/sokol/sounds/simple_sin_tones.v'
		}
	}
	vargs := _vargs.replace('-progress', '').replace('-progress', '')
	vexe := pref.vexe_path()
	vroot := os.dir(vexe)
	new_vtmp_dir := setup_new_vtmp_folder()
	if term.can_show_color_on_stderr() {
		os.setenv('VCOLORS', 'always', true)
	}
	return TestSession{
		vexe: vexe
		vroot: vroot
		skip_files: skip_files
		fail_fast: testing.fail_fast
		vargs: vargs
		vtmp_dir: new_vtmp_dir
		silent_mode: _vargs.contains('-silent')
		progress_mode: _vargs.contains('-progress')
	}
}

pub fn (mut ts TestSession) init() {
	ts.files.sort()
	ts.benchmark = benchmark.new_benchmark_no_cstep()
}

pub fn (mut ts TestSession) add(file string) {
	ts.files << file
}

pub fn (mut ts TestSession) test() {
	// Ensure that .tmp.c files generated from compiling _test.v files,
	// are easy to delete at the end, *without* affecting the existing ones.
	current_wd := os.getwd()
	if current_wd == os.wd_at_startup && current_wd == ts.vroot {
		ts.root_relative = true
	}
	//
	ts.init()
	mut remaining_files := []string{}
	for dot_relative_file in ts.files {
		file := os.real_path(dot_relative_file)
		$if windows {
			if file.contains('sqlite') || file.contains('httpbin') {
				continue
			}
		}
		$if !macos {
			if file.contains('customer') {
				continue
			}
		}
		$if msvc {
			if file.contains('asm') {
				continue
			}
		}
		remaining_files << dot_relative_file
	}
	remaining_files = vtest.filter_vtest_only(remaining_files, fix_slashes: false)
	ts.files = remaining_files
	ts.benchmark.set_total_expected_steps(remaining_files.len)
	mut njobs := runtime.nr_jobs()
	if remaining_files.len < njobs {
		njobs = remaining_files.len
	}
	ts.benchmark.njobs = njobs
	mut pool_of_test_runners := pool.new_pool_processor(callback: worker_trunner)
	// for handling messages across threads
	ts.nmessages = chan LogMessage{cap: 10000}
	ts.nprint_ended = chan int{cap: 0}
	ts.nmessage_idx = 0
	go ts.print_messages()
	pool_of_test_runners.set_shared_context(ts)
	pool_of_test_runners.work_on_pointers(unsafe { remaining_files.pointers() })
	ts.benchmark.stop()
	ts.append_message(.sentinel, '') // send the sentinel
	_ := <-ts.nprint_ended // wait for the stop of the printing thread
	eprintln(term.h_divider('-'))
	// cleanup generated .tmp.c files after successful tests:
	if ts.benchmark.nfail == 0 {
		if ts.rm_binaries {
			os.rmdir_all(ts.vtmp_dir) or {}
		}
	}
	ts.show_list_of_failed_tests()
}

fn worker_trunner(mut p pool.PoolProcessor, idx int, thread_id int) voidptr {
	mut ts := &TestSession(p.get_shared_context())
	if ts.fail_fast {
		if ts.failed {
			return pool.no_result
		}
	}
	tmpd := ts.vtmp_dir
	show_stats := '-stats' in ts.vargs.split(' ')
	// tls_bench is used to format the step messages/timings
	mut tls_bench := &benchmark.Benchmark(p.get_thread_context(idx))
	if isnil(tls_bench) {
		tls_bench = benchmark.new_benchmark_pointer()
		tls_bench.set_total_expected_steps(ts.benchmark.nexpected_steps)
		p.set_thread_context(idx, tls_bench)
	}
	tls_bench.no_cstep = true
	tls_bench.njobs = ts.benchmark.njobs
	mut relative_file := os.real_path(p.get_item<string>(idx))
	mut cmd_options := [ts.vargs]
	mut run_js := false

	is_fmt := ts.vargs.contains('fmt')

	if relative_file.ends_with('js.v') {
		if !is_fmt {
			cmd_options << ' -b js'
		}
		run_js = true
	}

	if relative_file.contains('global') && !is_fmt {
		cmd_options << ' -enable-globals'
	}
	if ts.root_relative {
		relative_file = relative_file.replace(ts.vroot + os.path_separator, '')
	}
	file := os.real_path(relative_file)
	normalised_relative_file := relative_file.replace('\\', '/')
	// Ensure that the generated binaries will be stored in the temporary folder.
	// Remove them after a test passes/fails.
	fname := os.file_name(file)
	generated_binary_fname := if os.user_os() == 'windows' && !run_js {
		fname.replace('.v', '.exe')
	} else if !run_js {
		fname.replace('.v', '')
	} else {
		fname.replace('.v', '')
	}
	generated_binary_fpath := os.join_path_single(tmpd, generated_binary_fname)
	if os.exists(generated_binary_fpath) {
		if ts.rm_binaries {
			os.rm(generated_binary_fpath) or {}
		}
	}

	if !ts.vargs.contains('fmt') {
		cmd_options << ' -o ${os.quoted_path(generated_binary_fpath)}'
	}
	cmd := '${os.quoted_path(ts.vexe)} ' + cmd_options.join(' ') + ' ${os.quoted_path(file)}'
	ts.benchmark.step()
	tls_bench.step()
	if relative_file.replace('\\', '/') in ts.skip_files {
		ts.benchmark.skip()
		tls_bench.skip()
		if !testing.hide_skips {
			ts.append_message(.skip, tls_bench.step_message_skip(normalised_relative_file))
		}
		return pool.no_result
	}
	if show_stats {
		ts.append_message(.ok, term.h_divider('-'))
		mut status := os.system(cmd)
		if status != 0 {
			details := get_test_details(file)
			os.setenv('VTEST_RETRY_MAX', '$details.retry', true)
			for retry := 1; retry <= details.retry; retry++ {
				ts.append_message(.info, '                 retrying $retry/$details.retry of $relative_file ...')
				os.setenv('VTEST_RETRY', '$retry', true)
				status = os.system(cmd)
				if status == 0 {
					unsafe {
						goto test_passed_system
					}
				}
				time.sleep(500 * time.millisecond)
			}
			ts.failed = true
			ts.benchmark.fail()
			tls_bench.fail()
			ts.add_failed_cmd(cmd)
			return pool.no_result
		} else {
			test_passed_system:
			ts.benchmark.ok()
			tls_bench.ok()
		}
	} else {
		if testing.show_start {
			ts.append_message(.info, '                 starting $relative_file ...')
		}
		mut r := os.execute(cmd)
		if r.exit_code < 0 {
			ts.failed = true
			ts.benchmark.fail()
			tls_bench.fail()
			ts.append_message(.fail, tls_bench.step_message_fail(normalised_relative_file))
			ts.add_failed_cmd(cmd)
			return pool.no_result
		}
		if r.exit_code != 0 {
			details := get_test_details(file)
			os.setenv('VTEST_RETRY_MAX', '$details.retry', true)
			for retry := 1; retry <= details.retry; retry++ {
				ts.append_message(.info, '                 retrying $retry/$details.retry of $relative_file ...')
				os.setenv('VTEST_RETRY', '$retry', true)
				r = os.execute(cmd)
				if r.exit_code == 0 {
					unsafe {
						goto test_passed_execute
					}
				}
			}
			ts.failed = true
			ts.benchmark.fail()
			tls_bench.fail()
			ending_newline := if r.output.ends_with('\n') { '\n' } else { '' }
			ts.append_message(.fail, tls_bench.step_message_fail('$normalised_relative_file\n$r.output.trim_space()$ending_newline'))
			ts.add_failed_cmd(cmd)
		} else {
			test_passed_execute:
			ts.benchmark.ok()
			tls_bench.ok()
			if !testing.hide_oks {
				ts.append_message(.ok, tls_bench.step_message_ok(normalised_relative_file))
			}
		}
	}
	if os.exists(generated_binary_fpath) {
		if ts.rm_binaries {
			os.rm(generated_binary_fpath) or {}
		}
	}
	return pool.no_result
}

pub fn vlib_should_be_present(parent_dir string) {
	vlib_dir := os.join_path_single(parent_dir, 'vlib')
	if !os.is_dir(vlib_dir) {
		eprintln('$vlib_dir is missing, it must be next to the V executable')
		exit(1)
	}
}

pub fn prepare_test_session(zargs string, folder string, oskipped []string, main_label string) TestSession {
	vexe := pref.vexe_path()
	parent_dir := os.dir(vexe)
	vlib_should_be_present(parent_dir)
	vargs := zargs.replace(vexe, '')
	eheader(main_label)
	if vargs.len > 0 {
		eprintln('v compiler args: "$vargs"')
	}
	mut session := new_test_session(vargs, true)
	files := os.walk_ext(os.join_path_single(parent_dir, folder), '.v')
	mut mains := []string{}
	mut skipped := oskipped.clone()
	next_file: for f in files {
		fnormalised := f.replace('\\', '/')
		// NB: a `testdata` folder, is the preferred name of a folder, containing V code,
		// that you *do not want* the test framework to find incidentally for various reasons,
		// for example module import tests, or subtests, that are compiled/run by other parent tests
		// in specific configurations, etc.
		if fnormalised.contains('testdata/') || fnormalised.contains('modules/')
			|| f.contains('preludes/') {
			continue
		}
		$if windows {
			// skip pico and process/command examples on windows
			if fnormalised.ends_with('examples/pico/pico.v')
				|| fnormalised.ends_with('examples/process/command.v') {
				continue
			}
		}
		c := os.read_file(f) or { panic(err) }
		maxc := if c.len > 500 { 500 } else { c.len }
		start := c[0..maxc]
		if start.contains('module ') && !start.contains('module main') {
			skipped_f := f.replace(os.join_path_single(parent_dir, ''), '')
			skipped << skipped_f
		}
		for skip_prefix in oskipped {
			if f.starts_with(skip_prefix) {
				continue next_file
			}
		}
		mains << f
	}
	session.files << mains
	session.skip_files << skipped
	return session
}

pub type FnTestSetupCb = fn (mut session TestSession)

pub fn v_build_failing_skipped(zargs string, folder string, oskipped []string, cb FnTestSetupCb) bool {
	main_label := 'Building $folder ...'
	finish_label := 'building $folder'
	mut session := prepare_test_session(zargs, folder, oskipped, main_label)
	cb(mut session)
	session.test()
	eprintln(session.benchmark.total_message(finish_label))
	return session.failed
}

pub fn build_v_cmd_failed(cmd string) bool {
	res := os.execute(cmd)
	if res.exit_code < 0 {
		return true
	}
	if res.exit_code != 0 {
		eprintln('')
		eprintln(res.output)
		return true
	}
	return false
}

pub fn building_any_v_binaries_failed() bool {
	eheader('Building V binaries...')
	eprintln('VFLAGS is: "' + os.getenv('VFLAGS') + '"')
	vexe := pref.vexe_path()
	parent_dir := os.dir(vexe)
	vlib_should_be_present(parent_dir)
	os.chdir(parent_dir) or { panic(err) }
	mut failed := false
	v_build_commands := ['$vexe -o v_g             -g  cmd/v', '$vexe -o v_prod_g  -prod -g  cmd/v',
		'$vexe -o v_cg            -cg cmd/v', '$vexe -o v_prod_cg -prod -cg cmd/v',
		'$vexe -o v_prod    -prod     cmd/v']
	mut bmark := benchmark.new_benchmark()
	for cmd in v_build_commands {
		bmark.step()
		if build_v_cmd_failed(cmd) {
			bmark.fail()
			failed = true
			eprintln(bmark.step_message_fail('command: $cmd . See details above ^^^^^^^'))
			eprintln('')
			continue
		}
		bmark.ok()
		if !testing.hide_oks {
			eprintln(bmark.step_message_ok('command: $cmd'))
		}
	}
	bmark.stop()
	eprintln(term.h_divider('-'))
	eprintln(bmark.total_message('building v binaries'))
	return failed
}

pub fn eheader(msg string) {
	eprintln(term.header_left(msg, '-'))
}

pub fn header(msg string) {
	println(term.header_left(msg, '-'))
}

pub fn setup_new_vtmp_folder() string {
	now := time.sys_mono_now()
	new_vtmp_dir := os.join_path(os.temp_dir(), 'v', 'test_session_$now')
	os.mkdir_all(new_vtmp_dir) or { panic(err) }
	os.setenv('VTMP', new_vtmp_dir, true)
	return new_vtmp_dir
}

pub struct TestDetails {
pub mut:
	retry int
}

pub fn get_test_details(file string) TestDetails {
	mut res := TestDetails{}
	lines := os.read_lines(file) or { [] }
	for line in lines {
		if line.starts_with('// vtest retry:') {
			res.retry = line.all_after(':').trim_space().int()
		}
	}
	return res
}

pub fn find_started_process(pname string) ?string {
	for line in testing.all_processes {
		if line.contains(pname) {
			return line
		}
	}
	return error('could not find process matching $pname')
}
