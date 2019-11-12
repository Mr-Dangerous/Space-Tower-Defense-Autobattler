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
		j++
	}
	i++
}