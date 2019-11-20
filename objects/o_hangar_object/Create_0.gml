image_xscale *= graphic_scale
image_yscale *= graphic_scale
moving_graphic_scale = graphic_scale
original_x = x
original_y = y
enum hangar_object{
	in_hangar,
	moving
}
state = hangar_object.in_hangar