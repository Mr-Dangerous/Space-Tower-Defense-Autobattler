view_port_height = view_get_hport(0)
view_port_width = view_get_wport(0)

draw_set_alpha(.2)
//left side GUI - placeholder
draw_rectangle_color(4,4, 220,view_port_height-4,c_gray, c_gray, c_gray, c_gray, false)

//bottom GUI - placeholder
i = 0
_width = 166
repeat(5){
	draw_rectangle_color(224 + (i*_width), view_port_height - 114, 220 + ((i+1)*_width), view_port_height - 4, c_gray, c_gray, c_gray, c_gray, false)
	i++
}

//right side GUI - placeholder

draw_rectangle_color(view_port_width - 226, 4, view_port_width - 4, view_port_height-4,c_gray, c_gray, c_gray, c_gray, false)

//econ GUI - placeholder

draw_rectangle_color(224, view_port_height - 173, view_port_width - 230, view_port_height - 118, c_gray, c_gray, c_gray, c_gray, false)
draw_set_alpha(1)