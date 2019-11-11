
/*========================================
Pre state machine checks

This region is for variables that the commanding squad object uses to change the state
of the ships.  

*/
if (target_acquired = true){
	state = alien_interceptor_1_enemy.approaching
	target_acquired = false
	target_scan_counter = 0
}

if (hp < 1){
	instance_destroy()
}

#region State Machine
switch (state){
#region alien_interceptor_1.idle
	case alien_interceptor_1_enemy.idle:
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
	case alien_interceptor_1_enemy.approaching:
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
			player_ship_list = ds_list_create()
			with(targeted_squad){
				if (instance_exists(ship_1)){
					ds_list_add(other.player_ship_list, ship_1)
				}
				if (instance_exists(ship_2)){
					ds_list_add(other.player_ship_list, ship_2)
				}
				if (instance_exists(ship_3)){
					ds_list_add(other.player_ship_list, ship_3)
				}
				if (instance_exists(ship_4)){
					ds_list_add(other.player_ship_list, ship_4)
				}
				if (instance_exists(ship_5)){
					ds_list_add(other.player_ship_list, ship_5)
				}
			}
			player_ship_list_size = ds_list_size(player_ship_list)
			//variables for each type of ship class, might change up!
			var targeted_interceptor = noone
			var targeted_fighter = noone
			var targeted_corvette = noone
			var targeted_emplacement = noone
			
			//This loop will find the closest instance of each kind of ship
			for (i = 0; i < player_ship_list_size; i++){
				var target = ds_list_find_value(player_ship_list, i)
				
				if (target.class = "interceptor"){
					if (targeted_interceptor = noone){
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
					if (targeted_fighter = noone){
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
					if (targeted_corvette = noone){
						targeted_corvette = target
					} else {
						distance_to_previous_target = distance_to_object(targeted_corvette)
						distance_to_new_target = distance_to_object(target)
						if (distance_to_new_target < distance_to_previous_target){
							targeted_corvette = target
						}
					}
				}
				if (target.class = "emplacement"){
					if (targeted_emplacement = noone){
						targeted_emplacement = target
					} else {
						distance_to_previous_target = distance_to_object(targeted_emplacement)
						distance_to_new_target = distance_to_object(target)
						if (distance_to_new_target < distance_to_previous_target){
							targeted_emplacement = target
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
			
			//Other overriding commands for targeting (such as ults) could be placed here 
			ds_list_destroy(player_ship_list)
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
				state = alien_interceptor_1_enemy.engaging
				//the exact state will be determined by comparing the current trajectory of both
				//just not right now
				combat_state = alien_interceptor_1_combat_state_enemy.orbiting_clockwise
			}
						
		}
		//exit the loop if there is no target
		if (!instance_exists(ship_target)){
			state = alien_interceptor_1_enemy.idle
		}
		
	break;
	
	case alien_interceptor_1_enemy.engaging:
		
		if (instance_exists(ship_target)){
			_target_direction = ship_target.direction
			_target_speed = ship_target.speed
			_distance_to_target = distance_to_object(ship_target)
			_projectile_flight_time = _distance_to_target/projectile_speed
					
			_lead_target_x = ship_target.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
			_lead_target_y = ship_target.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
			
			
			
			 //execute behavior based on the combat substate
			switch(combat_state){
				case alien_interceptor_1_combat_state_enemy.none:
				
				break;
				#region orbiting
				case alien_interceptor_1_combat_state_enemy.orbiting_clockwise:
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
					_random_seed = 0
					switch(_random_seed){
						case 0:
							combat_state = alien_interceptor_1_combat_state_enemy.slide_attack
							accuracy_factor = 1
							missed_shot_direction = 0
							
							accuracy_roll = irandom(100)
							if (accuracy_roll > accuracy){
								accuracy_factor = accuracy_roll - accuracy
								missed_shot_direction = irandom(1)
								if (missed_shot_direction = 0){
									accuracy_factor *= -1
								}
							}
						break;
						
						case 1:
							combat_state = alien_interceptor_1_combat_state_enemy.straight_on_attack
						break;
						
						case 2:
						
						break;
					}
				}
					
				
				
				
				break;
				
				#endregion
				
				#region attacking
				case alien_interceptor_1_combat_state_enemy.slide_attack:
				
			
				
				_lead_target_direction = point_direction(x, y, _lead_target_x + accuracy_factor, _lead_target_y + accuracy_factor)
				face_target(_lead_target_direction)
				if (image_angle = _lead_target_direction){
					//fire the shot
					fire_counter = 0
					var _projectile = instance_create_layer(x, y, "Projectiles", o_bio_ball_enemy)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other.image_angle
						direction = image_angle
						damage = other.projectile_damage
					}
					//change state back
					//will be random, or more intelligent later
					var _combat_mode_to_change_to = 1
					
					switch (_combat_mode_to_change_to){
						case 1:
							combat_state = alien_interceptor_1_combat_state_enemy.orbiting_clockwise	
						break;
					}
					
				}
				break;
				
				case alien_interceptor_1_combat_state_enemy.straight_on_attack:
				
				break;
					
				#endregion
			}	
				
		}
		//return back to approaching or idle state
		if (!instance_exists(ship_target)){
			state = alien_interceptor_1_enemy.approaching
			target_scan_counter = 0
		}
	break;

}
#endregion

//Post State machine checks (including counters)
if (fire_counter < fire_rate){
	fire_counter++
}
