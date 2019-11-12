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
				switch (i){
					case -1:
						switch(j){
							case -1:
								with(player_base){
									ship_1 = plasma_cannon
								}
							break;
							
							case 0:
								with(player_base){
									ship_2 = plasma_cannon
								}
							break;
						
							
							case 1:
								with(player_base){
									ship_3 = plasma_cannon
								}
							break;
						}
					break;
					
					case 1:
						switch(j){
							case -1:
								with(player_base){
									ship_4 = plasma_cannon
								}
							break;
							
							case 0:
								with(player_base){
									ship_5 = plasma_cannon
								}
							break;
							
							case 1:
								with(player_base){
									ship_6 = plasma_cannon
								}
							break;
						}
					break;
			}
		}
		
		if (i = 0){
			if (j = -1 or j = 1){
				var plasma_cannon = instance_create_layer(grid_box.x, grid_box.y, "Emplacements", o_plasma_cannon)
				with(o_grid_box){
					player_unit_stored = plasma_cannon
				}
				switch(j){
					case -1:
						with(player_base){
							ship_7 = plasma_cannon
						}	
					break;
							
							
					case 1:
						with(player_base){
							ship_8 = plasma_cannon
						}
					break;
					}
				}
				
				
			}
		}
		j++
	}
	i++
}