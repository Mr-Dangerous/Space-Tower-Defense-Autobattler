enum iron_interceptor_1{
	approaching,
	engaging,
	attacking,
	escorting,
	destroyed
}

state = iron_interceptor_1.approaching
if (is_escort){
	state = iron_interceptor_1.escorting
}
