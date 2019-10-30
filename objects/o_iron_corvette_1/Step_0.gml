#region Pre State machine checks

#endregion

#region State Machine
switch (state){
	#region approaching
	case iron_corvette_1.approaching:
	//find the nearby static targets
	
	emplacement_target = instance_nearest(x, y, o_enemy_emplacement)
	
	//find the nearest enemy ship, once state is changed, this target will not change.
	ship_target = instance_nearest(x, y, o_enemy_ship)
	
	
	//check to see if the corvette is in range of an enemy ship and fire, but also check to see if the ship is the only target
	if (instance_exists(ship_target)){
		var _distance_to_ship = distance_to_object(ship_target)
		if (_distance_to_ship <= engagement_range){
			if (fire_counter >= fire_rate){
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
		if (!instance_exists(emplacement_target)){
			state = iron_corvette_1.engaging
		}
	}
	//check to see if the corvette is in range of a bombard target
	if (instance_exists(emplacement_target)){
		var _distance_to_emplacement = distance_to_object(emplacement_target)
		if (_distance_to_emplacement <= bombard_range){
			state = iron_corvette_1.bombarding
		}
	}
	
	//figure out where the ship is moving
	_p_dir = 0
	if (instance_exists(emplacement_target)){
		_p_dir = point_direction(x, y, emplacement_target.x, emplacement_target.y)
	}
	if (!instance_exists(emplacement_target) && instance_exists(ship_target)){
		_p_dir = point_direction(x, y, ship_target.x, ship_target.y)
	}
	
	//turn to face emplacement target
	_angle_difference = angle_difference(image_angle, _p_dir)
	image_angle += sign(_angle_difference)*turn_speed
	direction = image_angle
	
	//add speed
	speed += acceleration_rate
	if (speed > max_speed){
		speed = max_speed
	}
	break;
	#endregion
	
	#region engaging with a ship
	case iron_corvette_1.engaging:
	//check to see if the engaging ship has left range or if an emplacement has appeared
	_ship_target_exists = instance_exists(ship_target)
	if (!_ship_target_exists){
		state = iron_corvette_1.approaching
		exit;
	}
	_distance_to_target = distance_to_object(ship_target)
	if (_distance_to_target < engagement_range){
		var new_enemy_ship = instance_nearest(x, y, o_enemy_ship)
		if (distance_to_object(new_enemy_ship) < engagement_range){
			ship_target = new_enemy_ship
		} else {
		state = iron_corvette_1.approaching
		}
	}
	
	
	
	
	break;
	#endregion
	
	#region Bombarding an emplacement
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
	#endregion
	
	#region destroyed
	case iron_corvette_1.destroyed:
	
	break;
	#endregion
}
#endregion

#region Post State machine checks

if (fire_counter < fire_rate){
	fire_counter++
}

#endregion

