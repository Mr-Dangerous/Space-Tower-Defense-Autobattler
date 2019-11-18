duration--

if (duration = 0){
	instance_destroy()
}

with(projectile_leader){
	image_angle = other.image_angle
	x = other.x
	y = other.y
}

if (instance_exists(target)){
	travel_direction = point_direction(x, y, target.x, target.y)
	direction = travel_direction
	image_angle = direction
}

if (place_meeting(x, y, o_enemy_ship)){
	var net_ult_shock = instance_create_layer(x, y, "Projectiles", o_net_ult_shock)
	with (net_ult_shock){
		direction = other.direction
		image_angle = other.image_angle
		speed = other.speed
		duration = other.stun_duration
	}
	instance_destroy()
}

