
/*========================================
Pre state machine checks

This region is for variables that the commanding squad object uses to change the state
of the ships.  

*/
if (target_acquired = true){
	state = alien_interceptor_1.approaching
	target_acquired = false
	target_scan_counter = 0
}
	

#region State Machine
switch (state){
#region alien_interceptor_1.idle
	case alien_interceptor_1.idle:
	//save and set new movement variables.  might want to just make it a new variable.
	turn_speed_previous = turn_speed
	turn_speed = turn_speed/2
	
	
	_formation_direction_offset_calculated = squad_object.direction + formation_direction_offset
	if (_formation_direction_offset_calculated < 0){
		_formation_direction_offset_calculated += 360
	}
	_formation_point_x = (round(lengthdir_x(formation_distance_offset, _formation_direction_offset_calculated)) + squad_object.x)
	_formation_point_y = (round(lengthdir_y(formation_distance_offset, _formation_direction_offset_calculated)) + squad_object.y)
		
	_distance_to_formation_point = distance_to_point(_formation_point_x, _formation_point_y)
	
	if (_distance_to_formation_point > 0){
		_direction_to_formation_point = point_direction(x, y,  _formation_point_x, _formation_point_y)
		face_target(_direction_to_formation_point)
		direction = image_angle
		speed += acceleration_rate
		limit_speed()
		if (formation_locked){
			speed = squad_object.speed
			}
			
	}
	if (_distance_to_formation_point = 0){
		
		x = _formation_point_x
		y = _formation_point_y
		speed = 0
		
		if(image_angle != squad_object.direction){
			face_target(squad_object.direction)
		}
		direction = image_angle
	}
	
	//reset movement variables
	turn_speed = turn_speed_previous
			
			
	break;

#endregion
/*General notes before programming this section
approaching state is used when a valid target is acquired in range of the squad.

First, each ship in the squad is assigned a target via a targeting tree.  Interceptors 
focus fighters or interceptors, then focus other types of units, and focus emplacements
after all other ships are destroyed.

When all targers in range of the squad object are destroyed, the ships return to idle state.

*/
	case alien_interceptor_1.approaching:
		//find the appropriate ship target
		#region target finding - if (!instance_exists(ship_target))
		//rescan for target or start the target scan counter
		//rescan targets after 1 second
		if (target_scan_counter = 0){
			target_scan_counter = 60
		}
		if (target_scan_counter = 60){
			ship_target = noone
		}
		target_scan_counter--
		
		if (!instance_exists(ship_target) or ship_target = noone){
			//find new target
			enemy_ship_list = ds_list_create()
			with(targeted_squad){
				if (instance_exists(ship_1)){
					ds_list_add(other.enemy_ship_list, ship_1)
				}
				if (instance_exists(ship_2)){
					ds_list_add(other.enemy_ship_list, ship_2)
				}
				if (instance_exists(ship_3)){
					ds_list_add(other.enemy_ship_list, ship_3)
				}
				if (instance_exists(ship_4)){
					ds_list_add(other.enemy_ship_list, ship_4)
				}
				if (instance_exists(ship_5)){
					ds_list_add(other.enemy_ship_list, ship_5)
				}
			}
			enemy_ship_list_size = ds_list_size(enemy_ship_list)
			//variables for each type of ship class, might change up!
			var targeted_interceptor = 0
			var targeted_fighter = 0
			var targeted_corvette = 0
			var targeted_emplacement = 0
			
			//This loop will find the closest instance of each kind of ship
			for (i = 0; i < enemy_ship_list_size; i++){
				var target = ds_list_find_value(enemy_ship_list, i)
				
				if (target.class = "interceptor"){
					if (targeted_interceptor = 0){
						targeted_interceptor = target
					} else {
						distance_to_previous_target = distance_to_object(targeted_interceptor)
						distance_to_new_target = distance_to_object(target)
						if (distance_to_new_target < distance_to_previous_target){
							targeted_interceptor = target
						}
					}
				}
				if (target.class = "fighter"){
					if (targeted_fighter = 0){
						targeted_fighter = target
					} else {
						distance_to_previous_target = distance_to_object(targeted_fighter)
						distance_to_new_target = distance_to_object(target)
						if (distance_to_new_target < distance_to_previous_target){
							targeted_fighter = target
						}
					}
				}
				if (target.class = "corvette"){
					if (targeted_corvette = 0){
						targeted_corvette = target
					} else {
						distance_to_previous_target = distance_to_object(targeted_corvette)
						distance_to_new_target = distance_to_object(target)
						if (distance_to_new_target < distance_to_previous_target){
							targeted_corvette = target
						}
					}
				}
				//this targeting function can continue, and likely can jsut be put into a script.
			}
			
			//Here, the target is assigned based on target priorties.
			//At this point, the catagories are all the closest examples of 
			//that class of ship.
			
			//interceptors fight other interceptors first, then fighters, then corvettes
			//the highest priority target will be LAST in the chain
			if (instance_exists(targeted_emplacement)){
				ship_target = targeted_emplacement
			}
			if (instance_exists(targeted_corvette)){
				ship_target = targeted_corvette
			}
			
			if (instance_exists(targeted_fighter)){
				ship_target = targeted_fighter
			}
			
			if (instance_exists(targeted_interceptor)){
				ship_target = targeted_interceptor
			}
			ds_list_destroy(enemy_ship_list)
		}
		#endregion
		
		//AI action against the target
		//approach the target
		if (instance_exists(ship_target)){
			//variables needed for everything
			_target_direction = point_direction(x, y, ship_target.x, ship_target.y)
			_target_distance = distance_to_object(ship_target)
			//move towards target
			face_target(_target_direction)
			direction = image_angle
			speed += acceleration_rate
			limit_speed()
			
			//engage with target if close enough
			if (_target_distance < engagement_range){
				state = alien_interceptor_1.engaging
				//the exact state will be determined by comparing the current trajectory of both
				//just nto right now
				combat_state = alien_interceptor_1_combat_state.orbiting_clockwise
			}
			
			
			
		}
		
	break;
	
	case alien_interceptor_1.engaging:
		
		if (instance_exists(ship_target)){
			_target_direction = ship_target.direction
			_target_speed = ship_target.speed
			_distance_to_target = distance_to_object(ship_target)
			_projectile_flight_time = _distance_to_target/projectile_speed
			//calculate the accuracy factor - a 1 means thats teh target should be a dead on hit
			_accuracy_roll = irandom(100)
			_accuracy_factor = 1
			if (_accuracy_roll > accuracy){
				//factor by which the shot is off
				_accuracy_factor = _accuracy_roll - accuracy
				//direction of misaimed shot
				var _shot_direction =irandom(1)
				if (_shot_direction = 0){
					_accuracy_factor *= -1
				}
			}
			_lead_target_x = ship_target.x + lengthdir_x((_target_speed * accuracy_factor) * _projectile_flight_time, _target_direction)
			_lead_target_y = ship_target.y + lengthdir_y((_target_speed * accuracy_factor) * _projectile_flight_time, _target_direction)
			
			 //execute behavior based on the combat substate
			switch(combat_state){
				case none:
				
				break;
				#region orbiting
				case alien_interceptor_1_combat_state.orbiting_clockwise:
				_direction_from_target = point_direction(ship_target.x, ship_target.y, x, y)
				_tangent_direction = _direction_from_target - 90
				if (_tangent_direction < 0){
					_tangent_direction += 359
				}
				face_target(_tangent_direction)
				direction = image_angle
				speed += acceleration_rate
				limit_speed()
				
				//set up the attack... this might need to become a script
				if (fire_counter = fire_rate){
					//select attack mode, right now random, will be more intelligent later
					_random_seed = irandom(1)
					switch(_random_seed){
						case 0:
							combat_state = alien_interceptor_1_combat_state.slide_attack
						break;
						
						case 1:
							combat_state = alien_interceptor_1_combat_state.straight_on_attack
						break;
						
						case 2:
						
						break;
					}
					fire_counter = 0
				}
					
				
				
				
				break;
				
				case alien_interceptor_1_combat_state.orbiting_counter_clockwise:
				_direction_from_target = point_direction(ship_target.x, ship_target.y, x, y)
				_tangent_direction = _direction_from_target + 90
				if (_tangent_direction < 0){
					_tangent_direction += 359
				}
				face_target(_tangent_direction)
				direction = image_angle
				speed += acceleration_rate
				limit_speed()
				
				//set up the attack... this might need to become a script
				if (fire_counter = fire_rate){
					//select attack mode, right now random, will be more intelligent later
					_random_seed = irandom(1)
					switch(_random_seed){
						case 0:
							combat_state = alien_interceptor_1_combat_state.slide_attack
						break;
						
						case 1:
							combat_state = alien_interceptor_1_combat_state.straight_on_attack
						break;
						
						case 2:
						
						break;
					}
					fire_counter = 0
				}
									
				break;
				#endregion
				
				#region attacking
				case alien_interceptor_1.slide_attack:
				
				//YOU LEFT OFF HERE AT 10:51
				_lead_target_direction = 
				break;
				
				case alien_interceptor_1.straight_on_attack:
				
				break;
					
				#endregion
			}	
				
		}
		//return back to approaching or idle state
		if (!instance_exists(ship_target)){
			state = alien_interceptor_1.approaching
			target_scan_counter = 0
		}
	break;

}
#endregion

//Post State machine checks (including counters)
if (fire_counter < fire_rate){
	fire_counter++
}
