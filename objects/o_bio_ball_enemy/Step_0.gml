duration--
//animation
if (duration = 198) image_index = 1


if (duration = 0){
	instance_destroy()
}

with(projectile_leader){
	image_angle = other.image_angle
	x = other.x
	y = other.y
}
