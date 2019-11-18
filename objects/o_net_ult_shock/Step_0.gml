duration--

if (duration = 0){
	instance_destroy()
}

if (image_index = image_number - 1){
	image_speed = 0
}
if (speed > 0 ){
	speed -=.2
}
if (speed < 0){
	speed = 0
}
