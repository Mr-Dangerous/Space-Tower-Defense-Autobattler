x = player_base.x
y = player_base.y

position_width = 128



i = - 7
repeat (14){
	j = -7
	repeat (14){
		var grid_box = instance_create_layer((x - (i * position_width)), y - (j*position_width), "Map_Elements", o_grid_box)
		if (i = 0  and j = 0){
			instance_destroy(grid_box)
		}
		//assign prebuilt_emplacements
		if (i = 1 or i = -1){
			if (j = -1 or j = 0 or j = 1){
				var plasma_cannon = instance_create_layer(grid_box.x, grid_box.y, "Emplacements", o_plasma_cannon)
				with(o_grid_box){
					player_unit_stored = plasma_cannon
				}
			}
		}
		
		if (i = 0){
			if (j = -1 or j = 1){
				var plasma_cannon = instance_create_layer(grid_box.x, grid_box.y, "Emplacements", o_plasma_cannon)
				with(o_grid_box){
					player_unit_stored = plasma_cannon
				}
			}
		}
		j++
	}
	i++
}