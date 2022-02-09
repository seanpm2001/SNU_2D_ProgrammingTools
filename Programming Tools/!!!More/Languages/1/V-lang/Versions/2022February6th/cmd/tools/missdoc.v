// Copyright (c) 2020 Lars Pontoppidan. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
import os
import flag

const (
	tool_name        = os.file_name(os.executable())
	tool_version     = '0.0.3'
	tool_description = 'Prints all V functions in .v files under PATH/, that do not yet have documentation comments.'
)

struct UndocumentedFN {
	line      int
	signature string
	tags      []string
}

struct Options {
	show_help       bool
	collect_tags    bool
	deprecated      bool
	private         bool
	js              bool
	no_line_numbers bool
}

fn collect(path string, mut l []string, f fn (string, mut []string)) {
	if !os.is_dir(path) {
		return
	}
	mut files := os.ls(path) or { return }
	for file in files {
		p := path + os.path_separator + file
		if os.is_dir(p) && !os.is_link(p) {
			collect(p, mut l, f)
		} else if os.exists(p) {
			f(p, mut l)
		}
	}
	return
}

fn report_undocumented_functions_in_path(opt Options, path string) {
	mut files := []string{}
	collect_fn := fn (path string, mut l []string) {
		if os.file_ext(path) == '.v' {
			l << os.real_path(path)
		}
	}
	collect(path, mut files, collect_fn)
	for file in files {
		if file.ends_with('_test.v') {
			continue
		}
		if !opt.js && file.ends_with('.js.v') {
			continue
		}
		report_undocumented_functions_in_file(opt, file)
	}
}

fn report_undocumented_functions_in_file(opt Options, file string) {
	contents := os.read_file(file) or { panic(err) }
	lines := contents.split('\n')
	mut info := []UndocumentedFN{}
	for i, line in lines {
		if line.starts_with('pub fn') || (opt.private && (line.starts_with('fn ')
			&& !(line.starts_with('fn C.') || line.starts_with('fn main')))) {
			// println('Match: $line')
			if i > 0 && lines.len > 0 {
				mut line_above := lines[i - 1]
				if !line_above.starts_with('//') {
					mut tags := []string{}
					mut grab := true
					for j := i - 1; j >= 0; j-- {
						prev_line := lines[j]
						if prev_line.contains('}') { // We've looked back to the above scope, stop here
							break
						} else if prev_line.starts_with('[') {
							tags << collect_tags(prev_line)
							continue
						} else if prev_line.starts_with('//') { // Single-line comment
							grab = false
							break
						}
					}
					if grab {
						clean_line := line.all_before_last(' {')
						info << UndocumentedFN{i + 1, clean_line, tags}
					}
				}
			}
		}
	}
	if info.len > 0 {
		for undocumented_fn in info {
			mut line_numbers := '$undocumented_fn.line:0:'
			if opt.no_line_numbers {
				line_numbers = ''
			}
			tags_str := if opt.collect_tags && undocumented_fn.tags.len > 0 {
				'$undocumented_fn.tags'
			} else {
				''
			}
			if opt.deprecated {
				println('$file:$line_numbers$undocumented_fn.signature $tags_str')
			} else {
				if 'deprecated' !in undocumented_fn.tags {
					println('$file:$line_numbers$undocumented_fn.signature $tags_str')
				}
			}
		}
	}
}

fn collect_tags(line string) []string {
	mut cleaned := line.all_before('/')
	cleaned = cleaned.replace_each(['[', '', ']', '', ' ', ''])
	return cleaned.split(',')
}

fn main() {
	if os.args.len == 1 {
		println('Usage: $tool_name PATH \n$tool_description\n$tool_name -h for more help...')
		exit(1)
	}
	mut fp := flag.new_flag_parser(os.args[1..])
	fp.application(tool_name)
	fp.version(tool_version)
	fp.description(tool_description)
	fp.arguments_description('PATH [PATH]...')
	// Collect tool options
	opt := Options{
		show_help: fp.bool('help', `h`, false, 'Show this help text.')
		deprecated: fp.bool('deprecated', `d`, false, 'Include deprecated functions in output.')
		private: fp.bool('private', `p`, false, 'Include private functions in output.')
		js: fp.bool('js', 0, false, 'Include JavaScript functions in output.')
		no_line_numbers: fp.bool('no-line-numbers', 0, false, 'Exclude line numbers in output.')
		collect_tags: fp.bool('tags', `t`, false, 'Also print function tags if any is found.')
	}
	if opt.show_help {
		println(fp.usage())
		exit(0)
	}
	for path in os.args[1..] {
		if os.is_file(path) {
			report_undocumented_functions_in_file(opt, path)
		} else {
			report_undocumented_functions_in_path(opt, path)
		}
	}
}
