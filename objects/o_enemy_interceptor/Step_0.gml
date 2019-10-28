
if (target == noone){
	target = instance_nearest(x, y, o_player_unit)
}
if (target == noone){
	instance_destroy()
}
	
switch (state){
	case enemy.approaching:
	_p_dir = point_direction(x, y, target.x, target.y)
	image_angle = _p_dir
	direction = _p_dir
	speed += acceleration_rate
	var _distance_to_target = distance_to_object(target)
	if (_distance_to_target <= range){
		state = enemy.engaging
		
	}

	break;
	
	case enemy.engaging:
	//placeholder code for now
	speed = 0
	_p_dir = point_direction(x, y, target.x, target.y)
	image_angle = _p_dir
	direction = _p_dir
	if (fire_counter = fire_rate){
		fire_counter = 0
		var _projectile = instance_create_layer(x, y, "Instances", o_cannon_shot_enemy)
		with(_projectile){
			//assign the projectile some variable properties.
			image_angle = other.image_angle
			direction = other.direction
			speed = 10
		}
	}
	if (fire_counter < fire_rate){
		fire_counter++
	}
	
		
	
	
	break;
	
	case enemy.destroyed:
	
	break;
}
if (speed > max_speed){
	speed = max_speed
}

