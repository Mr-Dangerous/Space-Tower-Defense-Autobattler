/// @description Insert description here
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
var speed_differece = max_speed - speed
//I'll figure this out later

#endregion

#region State Machine

switch(state){
	case iron_fighter_1.planning:
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
	
	case iron_fighter_1.approaching:
		target_ship = instance_nearest(x, y, o_enemy_ship)
		
		if (!instance_exists(target_ship)){
			state = iron_fighter_1.planning
			//reset everything!
			exit;
		}
		
		if (distance_to_object(target_ship) < attack_range){
			state = iron_fighter_1.engaging
		}
		var _direction_to_target = point_direction(x, y, target_ship.x, target_ship.y)
		move_towards_target(_direction_to_target)
	break;
	
	case iron_fighter_1.engaging:
	if (!instance_exists(target_ship)){
		state = iron_fighter_1.approaching
		exit;
	}
	if (instance_exists(target_ship)){
		
		
		var _target_class = target_ship.ship_class
		switch(_target_class){
			
			#region vs interceptor
			case "interceptor":
				_target_direction = target_ship.direction
				_target_speed = target_ship.speed
				_distance_to_target = distance_to_object(target_ship)
				_projectile_flight_time = _distance_to_target/projectile_speed
					
				_lead_target_x = target_ship.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
				_lead_target_y = target_ship.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
				_lead_target_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
				
				face_target(_target_direction)
				//Fire on target if ready and allowed
				if (abs(angle_difference(image_angle, _lead_target_direction)) < 15 and fire_counter <= fire_rate and distance_to_point(_lead_target_x, lead_target_y)<weapon_range){
					var _projectile = instance_create_layer(x, y, "Projectiles", projectile_type)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other._lead_target_direction
						direction = image_angle
						damage = other.projectile_damage
					}	
				}
			break;
			#endregion
			
			#region vs fighters
			case "fighter":
			
			break;
			#endregion
			
			#region vs frigates
			case "frigate":
			
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
#endregion