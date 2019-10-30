_tile_width = 53

for (var _x = 0; _x < 12; _x++) {
    for (var _y = 0; _y < 12; _y++){
		instance_create_layer(318+(_x*_tile_width), 42+(_y*_tile_width), "Map_Elements", o_grid_box) 
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