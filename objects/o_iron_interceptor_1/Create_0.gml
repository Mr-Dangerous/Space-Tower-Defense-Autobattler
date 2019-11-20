//This object will be created by dragging the ship from teh hangar and placing it on the grid
//A lot of things will be handled in determining ship synergies here as well
enum iron_interceptor_1{
	approaching,
	engaging,
	ultimate,
	disabled,
	planning
}

state = iron_interceptor_1.planning

assigned_grid_space = instance_nearest(x, y, o_grid_box)
if (assigned_grid_space != noone){
	//return object to hangar
}

