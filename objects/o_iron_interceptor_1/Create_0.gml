enum iron_interceptor_1{
	approaching,
	engaging,
	escorting,
	destroyed
}

state = iron_interceptor_1.approaching
if (is_escort){
	state = iron_interceptor_1.escorting
}
