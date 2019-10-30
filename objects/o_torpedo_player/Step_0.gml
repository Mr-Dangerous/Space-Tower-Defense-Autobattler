duration--

if (duration = 0){
	instance_destroy()
}

speed += acceleration_rate

if (speed > max_speed){
	speed = max_speed
}
