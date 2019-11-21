
// You can write your code in this editor
/*
iron_fighter_1{
	approaching,
	engaging,
	ultimate,
	disabled,
	planning
}
General notes:

This fighter ship will be the basis by which I will try and program the ships in the game
It will find the enemy targets, and it will target the nearest enemy.  It's attack mode
will change based on what it's fighting.




*/


#region prestatemachine
//turn speed lowers as ship gets closer to max_speed
turn_speed = max_turn_speed - (speed/max_speed)
//Does this work?
if (armor < 1){
	instance_destroy()
}


#endregion

#region State Machine

switch(state){
	case iron_fighter_1_player.planning:
		x = assigned_grid_space.x
		y = assigned_grid_space.y
		//slowly rotate while idle, but facing enemy.  equivalent of idle animations
		if (idle_turning_counter = 0){
			idle_turning_counter = irandom_range(30, 120)
			idle_spin = sign(irandom_range(-30, 30))
			if (sign(angle_difference(image_angle, 0))){
				idle_spin = 1
			}
			if (sign(angle_difference(image_angle, 0))){
				idle_spin = -1
			}
			
		}
		if (idle_turning_counter > 0){
			image_angle += .2 * idle_spin
			if (image_angle = 15){
				idle_spin *= -1
			}
			if (image_angle = 345){
				idle_spin *= -1
			}
		}
	break;
	
	case iron_fighter_1_player.approaching:
		target_ship = instance_nearest(x, y, o_enemy_ship)
		
		if (!instance_exists(target_ship)){
			state = iron_fighter_1_player.planning
			//reset everything!
			exit;
		}
		
		if (distance_to_object(target_ship) < weapon_range){
			state = iron_fighter_1_player.engaging
		}
		var _direction_to_target = point_direction(x, y, target_ship.x, target_ship.y)
		move_towards_target(_direction_to_target)
	break;
	
	case iron_fighter_1_player.engaging:
	if (!instance_exists(target_ship)){
		state = iron_fighter_1_player.approaching
		exit;
	}
	if (instance_exists(target_ship)){
		
		
		var _target_class = target_ship.ship_class
		switch(_target_class){
			
			#region vs interceptor
			case "interceptor":
			//Find the lead target and face it and fire upon it
				_target_direction = target_ship.direction
				_target_speed = target_ship.speed
				_distance_to_target = distance_to_object(target_ship)
				_projectile_flight_time = _distance_to_target/projectile_speed
					
				_lead_target_x = target_ship.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
				_lead_target_y = target_ship.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
				_lead_target_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
				
				face_target(_lead_target_direction)
				direction = image_angle
				//Fire on target if ready and allowed
				if (abs(angle_difference(image_angle, _lead_target_direction)) <= gimbal_max_angle and fire_counter >= fire_rate and distance_to_point(_lead_target_x, _lead_target_y)<weapon_range){
					var _projectile = instance_create_layer(x, y, "Projectiles", projectile_type)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other._lead_target_direction
						direction = image_angle
						damage = other.projectile_damage
						projectile_damage_type = other.projectile_damage_type
					}	
					fire_counter = 0
				}
				if (distance_to_object(target_ship) < (weapon_range*.75)){
					speed -= acceleration_rate
				} else {
					speed += acceleration_rate
				}
				
				//change targets if it leaves range
				if (distance_to_object(target_ship > weapon_range)){
					state = iron_fighter_1_player.approaching
				}
					
				
				
			// move around the target
			//I'll handle movement later
				
			break;
			#endregion
			
			#region vs fighters
			case "fighter":
				_target_direction = target_ship.direction
				_target_speed = target_ship.speed
				_distance_to_target = distance_to_object(target_ship)
				_projectile_flight_time = _distance_to_target/projectile_speed
					
				_lead_target_x = target_ship.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
				_lead_target_y = target_ship.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
				_lead_target_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
				
				face_target(_lead_target_direction)
				direction = image_angle
				//Fire on target if ready and allowed
				if (abs(angle_difference(image_angle, _lead_target_direction)) <= gimbal_max_angle and fire_counter >= fire_rate and distance_to_point(_lead_target_x, _lead_target_y)<weapon_range){
					var _projectile = instance_create_layer(x, y, "Projectiles", projectile_type)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other._lead_target_direction
						direction = image_angle
						damage = other.projectile_damage
						projectile_damage_type = other.projectile_damage_type
					}	
					fire_counter = 0
				}
				if (distance_to_object(target_ship) < (weapon_range*.75)){
					speed -= acceleration_rate
				} else {
					speed += acceleration_rate
				}
				
				//change targets if it leaves range
				if (distance_to_object(target_ship > weapon_range)){
					state = iron_fighter_1_player.approaching
				}
			break;
			#endregion
			
			#region vs frigates
			case "frigate":
				if (distance_to_object(target_ship) < ordinance_range){
					ordinance_counter++
				} else {
					ordinance_counter = 0
				}
			
				_target_direction = target_ship.direction
				_target_speed = target_ship.speed
				_distance_to_target = distance_to_object(target_ship)
				_projectile_flight_time = _distance_to_target/projectile_speed
					
				_lead_target_x = target_ship.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
				_lead_target_y = target_ship.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
				_lead_target_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
				
				face_target(_lead_target_direction)
				direction = image_angle
				//Fire on target if ready and allowed
				if (abs(angle_difference(image_angle, _lead_target_direction)) <= gimbal_max_angle and fire_counter >= fire_rate and distance_to_point(_lead_target_x, lead_target_y)<weapon_range){
					var _projectile = instance_create_layer(x, y, "Projectiles", projectile_type)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other._lead_target_direction
						direction = image_angle
						damage = other.projectile_damage
						projectile_damage_type = other.projectile_damage_type
					}	
					fire_counter = 0
				}
				//fire ordinance 
				if (ordinance_ammo > 0){
					if (image_angle = _lead_target_direction and ordinance_counter = ordinance_fire_rate){
						var _ordinance = instance_create_layer(x, y, "Projectiles", ordinance_type)
						with (_ordinance){
							speed = other.ordinance_speed
							image_angle = other._lead_target_direction
							direction = image_angle
							damage = other.ordinance_damage
							projectile_damage_type = other.ordinance_mass
						}	
						ordinance_counter = 0
						ordinance_ammo--
					}
				}
				
				//move towards target
				if (ordinance_ammo = 0){
					if (distance_to_object(target_ship) < (weapon_range*.75)){
						speed -= acceleration_rate
					} else {
						speed += acceleration_rate
					}
				}
				if (ordinance_ammo != 0){
					if (distance_to_object(target_ship) < (ordinance_range*.75)){
						speed -= acceleration_rate
					} else {
						speed += acceleration_rate
					}
				}
				//adjust to missiles
				if (distance_to_object(target_ship > weapon_range)){
					state = iron_fighter_1_enemy.approaching
				}
			
			
			break;
			#endregion
			
		}
	}
	break;
}
#endregion

#region Post State Machine
if (idle_turning_counter > 0){
	idle_turning_counter--
}
if (fire_counter < fire_rate){
	fire_counter++

}
clamp(speed, 0, max_speed)
clamp (turn_speed, min_turn_speed, max_turn_speed)
#endregion