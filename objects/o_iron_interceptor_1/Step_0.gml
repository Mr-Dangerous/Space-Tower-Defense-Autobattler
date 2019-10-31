#region Pre State machine checks

#endregion

#region State Machine
switch (state){
	#region approaching
	case iron_interceptor_1.approaching:
	
	//find the nearest enemy ship, once state is changed, this target will not change.
	ship_target = instance_nearest(x, y, o_enemy_ship)
	if (instance_exists(target_override)){
		ship_target = target_override
	}
	//find the nearest emplacement.  Emplacements aren't going to be focused by interceptors
	emplacement_target = instance_nearest(x, y, o_enemy_emplacement)
	
	
	//check to see if the interceptor is in range of an enemy ship
	if (instance_exists(ship_target)){
		var _distance_to_ship = distance_to_object(ship_target)
		if (_distance_to_ship <= engagement_range){
			//pursue the ship and begin to fight
			state = iron_interceptor_1.engaging
			target_override = noone
			exit;
		}
		
	}
	//check to see if the corvette is in range of a bombard target
	if (!instance_exists(ship_target) && instance_exists(emplacement_target)){
		var _distance_to_emplacement = distance_to_object(emplacement_target)
		if (_distance_to_emplacement <= engagement_range){
			state = iron_interceptor_1.engaging//may later change to a bombard or strafe
			target_override = noone
		}
	}
	
	//figure out where the ship is moving
	_p_dir = 0
	if (instance_exists(ship_target)){
		_p_dir = point_direction(x, y, ship_target.x, ship_target.y)
	}
	//if there is no ship, the interceptor will atempt to engage the nearest emplacement.  Might change to fighter.
	if (!instance_exists(ship_target) && instance_exists(emplacement_target)){
		_p_dir = point_direction(x, y, emplacement_target.x, emplacement_target.y)
	}
	
	//turn to face target
	if (image_angle != _p_dir){
		_angle_difference = angle_difference(image_angle, _p_dir)
		image_angle -= sign(_angle_difference)*turn_speed
		if (abs(_angle_difference) < 4){
			image_angle = _p_dir
		}
		direction = image_angle
	}
	
	//add speed
	speed += acceleration_rate

	break;
	#endregion
	
	#region engaging with a ship
	case iron_interceptor_1.engaging:
	//set up the manuever counter
	if (manuever_counter = 0){
		manuever_counter = irandom_range(80, 120)
	}
	//check to see if the engaging ship has left ranged
	
	_ship_target_exists = instance_exists(ship_target)
	if (!_ship_target_exists){
		if (!is_escort){
			state = iron_interceptor_1.escorting
			manuever_counter = 0
		} else {
			state = iron_interceptor_1.approaching
			manuever_counter = 0
			exit;
		}
	}
	_distance_to_target = distance_to_object(ship_target)
	if (_distance_to_target > engagement_range*1.2){
		var new_enemy_ship = instance_nearest(x, y, o_enemy_ship)
		if (distance_to_object(new_enemy_ship) < engagement_range){
			ship_target = new_enemy_ship
		} else {
			if (!is_escort){
				state = iron_interceptor_1.escorting
				exit;
			} else {
				state = iron_interceptor_1.approaching
				exit;
			}
		}
	}
	//orbit the target
	_p_dir = point_direction(x, y, ship_target.x, ship_target.y)-90
	manuever_counter--
	
	if (manuever_counter < 30){
		_p_dir +=90
	}
	
	if (image_angle != _p_dir){
		_angle_difference = angle_difference(image_angle, _p_dir)
		image_angle -= sign(_angle_difference)*turn_speed
		
	}
	
	direction = image_angle
	speed += acceleration_rate
		
	if (fire_counter >= fire_rate and weapon_range >= _distance_to_target){
		state = iron_interceptor_1.attacking
		manuever_counter = 0
	}
	

	
	break;
	#endregion
	
	#region attacking (uses vectors and turns to target, then goes back to engaging
	case iron_interceptor_1.attacking:
	_ship_target_exists = instance_exists(ship_target)
	if (!_ship_target_exists){
		if (!is_escort){
			state = iron_interceptor_1.escorting
		} else {
			state = iron_interceptor_1.approaching
			exit;
		}
	}
	_p_dir = point_direction(x, y, ship_target.x, ship_target.y)
	
	if (image_angle != _p_dir){
		_angle_difference = angle_difference(image_angle, _p_dir)
		image_angle -= sign(_angle_difference)*(turn_speed*2)
		if (abs(_angle_difference) < 4) image_angle = _p_dir
	}
	if (image_angle = _p_dir){
		//make this a burst shot later
		fire_counter++
		if (fire_counter = fire_rate+10){
			fire_counter = 0
			fire_ballistic_projectile()
			state = iron_interceptor_1.engaging
		}
		
	}
	break;

	
	#endregion
	
	#region Bombarding an emplacement
	/*
	case iron_corvette_1.bombarding:
	//check to make sure the target still exsists - break out of the state
	emplacement_exists = instance_exists(emplacement_target)
	ship_target_exists = instance_exists(ship_target)
	if (!emplacement_exists){
		state = iron_corvette_1.approaching
		exit;
	}
	if (distance_to_object(emplacement_target)>bombard_range){
		state = iron_corvette_1.approaching
		exit;
	}
	//halt forward movement and rotate to face emplacement
	if (speed != 0){
		speed -= acceleration_rate
	}
	_p_dir = point_direction(x, y, emplacement_target.x, emplacement_target.y)
	if (image_angle != _p_dir){
		_angle_difference = angle_difference(image_angle, _p_dir)
		image_angle += sign(_angle_difference)*turn_speed
		if (abs(_angle_difference) < 4){
			image_angle = _p_dir
		}
		direction = image_angle
	}
	
	//launch a missile if possible
	if (torpedo_counter >= torpedo_rate && _p_dir = image_angle){
		torpedo_counter = 0
		var torpedo = instance_create_layer(x, y, "Projectile", o_torpedo_player)
		with (torpedo){
			image_angle = other.image_angle
			direction = other.image_angle
		}
	}
	//increment torpedo counter
	if (speed = 0 && image_angle = _p_dir){
		torpedo_counter++
	}
	if (speed != 0){
		torpedo_counter = 0
	}
	
	//shoot nearby ships
	if (ship_target_exists){
		if (fire_counter >= fire_rate && engagement_range >= distance_to_object(ship_target)){
			fire_counter = 0
			var projectile = instance_create_layer(x, y, "Projectile", o_cannon_shot_player)
			
			lead_target_multiplier = distance_to_object(ship_target)*projectile_speed*.2
			accuracy_factor = 0
			accuracy_roll = irandom(100)
			if(accuracy_roll > accuracy){
				accuracy_factor=6*lead_target_multiplier
				if (accuracy_factor % 2 = 1){
					accuracy_factor*= -1
				}
				show_debug_message("miss")
			} else {
				accuracy_factor = 0
			}
			lead_target_x = lengthdir_x(ship_target.speed*(lead_target_multiplier + accuracy_factor), ship_target.direction)
			lead_target_y = lengthdir_y(ship_target.speed*(lead_target_multiplier + accuracy_factor), ship_target.direction)
			_projectile_p_dir = point_direction(x, y, ship_target.x+lead_target_x, ship_target.y+lead_target_y)
			with (projectile){
				damage = other.projectile_damage
				speed = other.projectile_speed
				direction = other._projectile_p_dir
				image_angle = other._projectile_p_dir
			}
		}
	}
	
	
	
	break;
	*/
	#endregion
	
	#region Escorting
	
	case iron_interceptor_1.escorting:
	
	_p_dir = direction
	escort_ship_target = instance_nearest(escort_ship.x, escort_ship.y, o_enemy_ship)
	_distance_to_escort = distance_to_object(escort_ship)
	
	//return to the escort if too far
	if (_distance_to_escort > 50){
		_p_dir = point_direction(x, y, escort_ship.x, escort_ship.y)
		
	}
	//engage an enemy near the escorted ship
	if (distance_to_object(escort_ship_target) < escort_ship.engagement_range * 2){
		state = iron_interceptor_1.approaching
		ship_target = escort_ship_target
		target_override = escort_ship_target		
		
	}
	//travel with the escort
	new_x = lengthdir_x(20*escort_number, escort_ship.x)
	new_y = lengthdir_y(20*escort_number, escort_ship.y)
	_p_dir = point_direction(x, y, escort_ship.x + new_x, escort_ship.y + new_y)
	
	//face travel direction
	if (image_angle != _p_dir){
		_angle_difference = angle_difference(image_angle, _p_dir)
		image_angle -= sign(_angle_difference)*turn_speed
		if (abs(_angle_difference) < 4){
			image_angle = _p_dir
		}
		direction = image_angle
	}
	speed += acceleration_rate
	
	
	
		
		
		
	break;
	
	#endregion
	
	#region destroyed
	case iron_interceptor_1.destroyed:
	
	break;
	#endregion
	
	#region return from edge (when heading too close to the edge)
	
	case iron_interceptor_1.return_from_edge:
		_p_dir = point_direction(x, y, 640, 384)
		speed += acceleration_rate
		
		if (image_angle != _p_dir){
			_angle_difference = angle_difference(image_angle, _p_dir)
			image_angle -= sign(_angle_difference)*(turn_speed*2)
			if (abs(_angle_difference) < 4){
			image_angle = _p_dir
			}
		}	
		if (image_angle = _p_dir){
			return_counter++
		}
		
		direction = image_angle
		
		if (return_counter = 50){
			return_counter = 0
			if (!is_escort){
				state = iron_interceptor_1.approaching
			} else {
				state = iron_interceptor_1.escorting
			}
		}
		
	
	
	
	break;
	
	#endregion
}
#endregion

#region Post State machine checks

if (fire_counter < fire_rate){
	fire_counter++
}
//speed minimum annd maximum limits
if (speed > max_speed){
		speed = max_speed
	}
if (speed < 0){
	speed = 0
}

//check to see if out of bounds
if (x > 636+318 || x < 318 || y > 42+636 || y < 42 && state != iron_interceptor_1.return_from_edge){
	return_counter = 0
	state = iron_interceptor_1.return_from_edge
}

//check to see if escort ship still exists
if(!instance_exists(escort_ship)){
	is_escort = false
} else {
	is_escort = true
}
 



#endregion

