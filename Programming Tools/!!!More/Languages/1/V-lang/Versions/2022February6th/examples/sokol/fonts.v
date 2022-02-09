import sokol
import sokol.sapp
import sokol.gfx
import sokol.sgl
import fontstash
import sokol.sfons
import os

struct AppState {
mut:
	pass_action gfx.PassAction
	fons        &fontstash.Context
	font_normal int
}

[console]
fn main() {
	mut color_action := gfx.ColorAttachmentAction{
		action: .clear
		value: gfx.Color{
			r: 0.3
			g: 0.3
			b: 0.32
			a: 1.0
		}
	}
	mut pass_action := gfx.PassAction{}
	pass_action.colors[0] = color_action
	state := &AppState{
		pass_action: pass_action
		fons: voidptr(0) // &fontstash.Context(0)
	}
	title := 'V Metal/GL Text Rendering'
	desc := sapp.Desc{
		user_data: state
		init_userdata_cb: init
		frame_userdata_cb: frame
		window_title: title.str
		html5_canvas_name: title.str
	}
	sapp.run(&desc)
}

fn init(mut state AppState) {
	desc := sapp.create_desc()
	gfx.setup(&desc)
	s := &sgl.Desc{}
	C.sgl_setup(s)
	state.fons = sfons.create(512, 512, 1)
	// or use DroidSerif-Regular.ttf
	if bytes := os.read_bytes(os.resource_abs_path(os.join_path('..', 'assets', 'fonts',
		'RobotoMono-Regular.ttf')))
	{
		println('loaded font: $bytes.len')
		state.font_normal = state.fons.add_font_mem('sans', bytes, false)
	}
}

fn frame(user_data voidptr) {
	mut state := &AppState(user_data)
	state.render_font()
	gfx.begin_default_pass(&state.pass_action, sapp.width(), sapp.height())
	sgl.draw()
	gfx.end_pass()
	gfx.commit()
}

fn (state &AppState) render_font() {
	mut sx := f32(0.0)
	mut sy := f32(0.0)
	mut dx := f32(0.0)
	mut dy := f32(0.0)
	lh := f32(0.0)
	white := sfons.rgba(255, 255, 255, 255)
	black := sfons.rgba(0, 0, 0, 255)
	brown := sfons.rgba(192, 128, 0, 128)
	blue := sfons.rgba(0, 192, 255, 255)

	fons := state.fons
	fons.clear_state()
	sgl.defaults()
	sgl.matrix_mode_projection()
	sgl.ortho(0.0, f32(sapp.width()), f32(sapp.height()), 0.0, -1.0, 1.0)
	sx = 0
	sy = 50
	dx = sx
	dy = sy
	fons.set_font(state.font_normal)
	fons.set_size(100.0)
	ascender := f32(0.0)
	descender := f32(0.0)
	fons.vert_metrics(&ascender, &descender, &lh)
	dx = sx
	dy += lh
	fons.set_color(white)
	dx = fons.draw_text(dx, dy, 'The quick ')
	fons.set_font(state.font_normal)
	fons.set_size(48.0)
	fons.set_color(brown)
	dx = fons.draw_text(dx, dy, 'brown ')
	fons.set_font(state.font_normal)
	fons.set_size(24.0)
	fons.set_color(white)
	dx = fons.draw_text(dx, dy, 'fox ')
	dx = sx
	dy += lh * 1.2
	fons.set_size(20.0)
	fons.set_font(state.font_normal)
	fons.set_color(blue)
	fons.draw_text(dx, dy, 'Now is the time for all good men to come to the aid of the party.')
	dx = 300
	dy = 350
	fons.set_align(C.FONS_ALIGN_LEFT | C.FONS_ALIGN_BASELINE)
	fons.set_size(60.0)
	fons.set_font(state.font_normal)
	fons.set_color(white)
	fons.set_spacing(5.0)
	fons.set_blur(6.0)
	fons.draw_text(dx, dy, 'Blurry...')
	dx = 300
	dy += 50.0
	fons.set_size(28.0)
	fons.set_font(state.font_normal)
	fons.set_color(white)
	fons.set_spacing(0.0)
	fons.set_blur(3.0)
	fons.draw_text(dx, dy + 2, 'DROP SHADOW')
	fons.set_color(black)
	fons.set_blur(0)
	fons.draw_text(dx, dy, 'DROP SHADOW')
	fons.set_size(18.0)
	fons.set_font(state.font_normal)
	fons.set_color(white)
	dx = 50
	dy = 350
	line(f32(dx - 10), f32(dy), f32(dx + 250), f32(dy))
	fons.set_align(C.FONS_ALIGN_LEFT | C.FONS_ALIGN_TOP)
	dx = fons.draw_text(dx, dy, 'Top')
	dx += 10
	fons.set_align(C.FONS_ALIGN_LEFT | C.FONS_ALIGN_MIDDLE)
	dx = fons.draw_text(dx, dy, 'Middle')
	dx += 10
	fons.set_align(C.FONS_ALIGN_LEFT | C.FONS_ALIGN_BASELINE)
	dx = fons.draw_text(dx, dy, 'Baseline')
	dx += 10
	fons.set_align(C.FONS_ALIGN_LEFT | C.FONS_ALIGN_BOTTOM)
	fons.draw_text(dx, dy, 'Bottom')
	dx = 150
	dy = 400
	line(f32(dx), f32(dy - 30), f32(dx), f32(dy + 80.0))
	fons.set_align(C.FONS_ALIGN_LEFT | C.FONS_ALIGN_BASELINE)
	fons.draw_text(dx, dy, 'Left')
	dy += 30
	fons.set_align(C.FONS_ALIGN_CENTER | C.FONS_ALIGN_BASELINE)
	fons.draw_text(dx, dy, 'Center')
	dy += 30
	fons.set_align(C.FONS_ALIGN_RIGHT | C.FONS_ALIGN_BASELINE)
	fons.draw_text(dx, dy, 'Right')
	C.sfons_flush(fons)
}

fn line(sx f32, sy f32, ex f32, ey f32) {
	sgl.begin_lines()
	sgl.c4b(255, 255, 0, 128)
	sgl.v2f(sx, sy)
	sgl.v2f(ex, ey)
	sgl.end()
}
