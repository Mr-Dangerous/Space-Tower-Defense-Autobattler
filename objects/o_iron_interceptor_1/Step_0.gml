#region Prestate machine checks
if (!instance_exists(target)){
	state = iron_interceptor_1.approaching
}

if (hp < 1){
	instance_destroy()
}
#endregion


#region State Machine	
switch (state){
	#region approaching
	case iron_interceptor_1.approaching:
	target = instance_nearest(x, y, o_enemy_unit)
	_p_dir = point_direction(x, y, target.x, target.y)
	
	direction = _p_dir

	speed += acceleration_rate
	var _distance_to_target = distance_to_object(target)
	if (_distance_to_target <= range){
		state = iron_interceptor_1.engaging
		
	}

	break;
	#endregion
	
	#region Engaging
	case iron_interceptor_1.engaging:
	//placeholder code for now
	var _distance_to_target = distance_to_object(target)
	movement_counter++
	
			
		
	_p_dir = point_direction(x, y, target.x, target.y)
	motion_add(_p_dir + 90, .1)
	if (_distance_to_target < 25){
		state = iron_interceptor_1.jousting
		motion_set(direction, 0)
		}
	
	if (fire_counter >= fire_rate and _distance_to_target <= range){
		fire_counter = 0
		
		state = iron_interceptor_1.attacking
	}
	break;
	#endregion
	
	#region destroyed
	case iron_interceptor_1.destroyed:
	
	break;
	#endregion
	
	#region jousting
	case iron_interceptor_1.jousting:
	if (direction_changed = false){
		direction_changed = true
		direction = point_direction(target.x, target.y, x, y)
		reengage_counter = irandom_range(40, 50)
		
	}
	speed += acceleration_rate
	if (reengage_counter = 0){
		state = iron_interceptor_1.approaching
		direction_changed = false
	}
	
	break;
	#endregion
	
	#region attacking
	case iron_interceptor_1.attacking:
	
		var _projectile = instance_create_layer(x, y, "Instances", o_cannon_shot_player)
			with(_projectile){
				//assign the projectile some variable properties.
				image_angle = other.image_angle
				direction = other._p_dir
				speed = 10
				image_xscale = .25
				image_yscale = .25
				damage = other.projectile_damage
			}
		state = iron_interceptor_1.approaching
	
	break;
	#endregion
}
#endregion

#region post state machine checks
if (speed > max_speed){
	speed = max_speed
}

var _angle_difference = angle_difference(image_angle, direction)
if (image_angle != direction){
	if (sign(_angle_difference) = 1){
		image_angle -= turn_speed
	}
	if (sign(_angle_difference) = -1){
		image_angle += turn_speed
	}
}

if (fire_counter < fire_rate){
		fire_counter++
	}
if (reengage_counter > 0){
	reengage_counter --
}
#endregion
