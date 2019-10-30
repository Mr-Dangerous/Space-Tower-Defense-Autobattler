enum iron_interceptor_1{
	approaching,
	engaging,
	attacking,
	escorting,
	return_from_edge,
	destroyed
}

state = iron_interceptor_1.approaching
if (is_escort){
	state = iron_interceptor_1.escorting
}
//temporary code to assign escort for testing
escort_ship = instance_nearest(x, y, o_player_corvette)
