_tile_width = 53
_x_repeats = floor(room_width/_tile_width) 
_y_repeats = floor(room_height/_tile_width) 
for (var _x = 0; _x < _x_repeats; _x++) {
    for (var _y = 0; _y < _y_repeats; _y++){
		instance_create_layer((_x*_tile_width), (_y*_tile_width), "Map_Elements", o_grid_box) 
	}
}


/* If you go back to 64 pixel width
_tile_width = 64

for (var _x = 0; _x < 12; _x++) {
    for (var _y = 0; _y < 12; _y++){
		instance_create_layer(256+(_x*_tile_width), 0+(_y*_tile_width), "Map_Elements", o_grid_box) 
	}
}
*/