#region  Pre state Machine checks
/*========================================Good luck!
Pre state machine checks

This region is for variables that the commanding squad object uses to change the state
of the ships.  

*/

//Check to see if a pilot is attached to this
//should the pilot be an pbject?  Yes!
if (instance_exists(pilot) and pilot_attached = false){
	if (image_xscale = 1.35){
		pilot_attached = true
		dodge_chance = pilot.dodge_chance
		projectile_damage *= pilot.damage_boost
		max_speed *= pilot.speed_boost
	}
	image_xscale += .01
	image_yscale += .01
	
}
//Use ultimate ability, may want to also check to see if disabled
//checks to see if disabled via the state check later
if (instance_exists(ship_target) and ultimate_energy >= max_ultimate_energy and ultimate_energy !=0){
	state = pirate_interceptor_1.ultimate
}

//Destroy self if hp = dead
if (hp < 1){
	instance_destroy()
}

//Set up saved movement variables, ISSUE:  could just be seperate variable defintions
turn_speed_previous = turn_speed
if (turn_speed_counter < 5 and turn_speed_counter > 0){
	turn_speed /= 2
}
if (turn_speed_counter > 0){
	turn_speed /= 2
}

//what even is this?
if (target_acquired = true){
	state = pirate_interceptor_1.approaching
	target_acquired = false
	target_scan_counter = 0
}

//This section will check for all of the various status effects that can hit the ship and adjust the state accordingly
//This section is only for disabling effects.
//ISSUE: Blinds and other such abilities will be handled elsewhere, and not right now.
//likely will still be in the pre state machine checks
if (stun_counter > 0){
	state = pirate_interceptor_1.disabled
}


#endregion


#region State Machine
switch (state){
#region pirate_interceptor_1.idle
	case pirate_interceptor_1.idle:
	
	if (instance_exists(ship_target)){
		state = pirate_interceptor_1.approaching
	}
	
	//save and set new movement variables.  might want to just make it a new variable.
	turn_speed = turn_speed/2
	
	//find formation points
	_formation_direction_offset_calculated = squad_object.direction + formation_direction_offset
	if (_formation_direction_offset_calculated < 0){
		_formation_direction_offset_calculated += 360
	}
	_formation_point_x = (round(lengthdir_x(formation_distance_offset, _formation_direction_offset_calculated)) + squad_object.x)
	_formation_point_y = (round(lengthdir_y(formation_distance_offset, _formation_direction_offset_calculated)) + squad_object.y)
		
	_distance_to_formation_point = distance_to_point(_formation_point_x, _formation_point_y)
	
	//move into formation.
	
	if (_distance_to_formation_point > 0){
		_direction_to_formation_point = point_direction(x, y,  _formation_point_x, _formation_point_y)
		move_towards_target(_direction_to_formation_point)
		//ISSUE:  Whats teh prupose of this?  I think this is a previosu artifact of
		//the moving into formation attempt
		if (formation_locked){
			speed = squad_object.speed
			}
			
	}
	
	//lock into formation.  
	//ISSUE:  ship will just jump to point if the collision mask intersects.  Needs to be smoother
	if (_distance_to_formation_point = 0){
		
		x = _formation_point_x
		y = _formation_point_y
		speed = 0
		
		if(image_angle != squad_object.direction){
			face_target(squad_object.direction)
		}
		direction = image_angle
	}
	
			
			
	break;

#endregion

#region old notes
/*General notes before programming this section
approaching state is used when a valid target is acquired in range of the squad.

First, each ship in the squad is assigned a target via a targeting tree.  Interceptors 
focus fighters or interceptors, then focus other types of units, and focus emplacements
after all other ships are destroyed.

When all targers in range of the squad object are destroyed, the ships return to idle state.

*/
#endregion

	case pirate_interceptor_1.approaching:
		//find the appropriate ship target
		#region target finding - if (!instance_exists(ship_target))
		//rescan for target or start the target scan counter
		//rescan targets after 1 second
		//ISSUE:  May now be unessecary
		if (target_scan_counter = 0){
			target_scan_counter = 60
		}
		if (target_scan_counter = 60){
			ship_target = noone
		}
		target_scan_counter--
		
		//find the target
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
			var targeted_interceptor = noone
			var targeted_fighter = noone
			var targeted_corvette = noone
			var targeted_emplacement = noone
			
			//This loop will find the closest instance of each kind of ship
			for (i = 0; i < enemy_ship_list_size; i++){
				var target = ds_list_find_value(enemy_ship_list, i)
				
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
			ds_list_destroy(enemy_ship_list)
		}
		#endregion
		
		//AI action against the target
		//approach the target
		if (instance_exists(ship_target)){
			//variables needed for everything
			_target_direction = point_direction(x, y, ship_target.x, ship_target.y)
			_target_distance = distance_to_object(ship_target)
			move_towards_target(_target_direction)
			
			//engage with target if close enough
			if (_target_distance < engagement_range){
				state = pirate_interceptor_1.engaging
				//the exact state will be determined by comparing the current trajectory of both
				//just not right now
				combat_state = pirate_interceptor_1_combat_state.orbiting_clockwise
			}
						
		}
		//exit the loop if there is no target, and head back to idle
		if (!instance_exists(ship_target)){
			state = pirate_interceptor_1.approaching
			if (!instance_exists(targeted_squad)){
				state = pirate_interceptor_1.idle
				
			}
		}
		
	break;
	
	case pirate_interceptor_1.engaging:
		
		if (instance_exists(ship_target)){
			//set up variables used for the combat state machine
			_target_direction = ship_target.direction
			_target_speed = ship_target.speed
			_distance_to_target = distance_to_object(ship_target)
			_projectile_flight_time = _distance_to_target/projectile_speed
					
			_lead_target_x = ship_target.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
			_lead_target_y = ship_target.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
			
			
			
			 //execute behavior based on the combat substate
			 #region Combat State MAchine
			switch(combat_state){
				
				case pirate_interceptor_1_combat_state.none:
					//for later
				break;
				
				#region orbiting
				#region orbiting_clockwise
				case pirate_interceptor_1_combat_state.orbiting_clockwise:
					_direction_from_target = point_direction(ship_target.x, ship_target.y, x, y)
					_tangent_direction = _direction_from_target - 90
				if (_tangent_direction < 0){
					_tangent_direction += 359
				}
				move_towards_target(_tangent_direction)
				
				//set up the attack... this might need to become a script
				if (fire_counter = fire_rate){
					
					//select attack mode, right now random, will be more intelligent later
					_random_seed = irandom(1)
					switch(_random_seed){
						case 0:
							combat_state = pirate_interceptor_1_combat_state.slide_attack
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
							combat_state = pirate_interceptor_1_combat_state.straight_on_attack
							accuracy_factor = 1
							missed_shot_direction = 0
							accuracy_roll = irandom(100)
							if (accuracy_roll > accuracy){
								accuracy_factor = accuracy_roll - accuracy
								missed_shot_direction = irandom(1)
								if (missed_shot_direction = 0){
									accuracy_factor *= -1
									string_factor = string(accuracy_factor)
									show_debug_message("straight on miss " + string_factor)
								}
							}
						break;
						
						case 2:
						
						break;
					}
					
				}
				
				//disengage
				var nearest_enemy_ship = instance_nearest(x, y, o_enemy_ship)
				if (distance_to_object(nearest_enemy_ship) < 25){
					combat_state = pirate_interceptor_1_combat_state.disengaging
					ship_target = nearest_enemy_ship
					//needs to eventually transition to approaching to reacquire the correct target
				}
				if (_distance_to_target > weapon_range - 20){
					combat_state = pirate_interceptor_1_combat_state.jousting
					
				}
				if (_distance_to_target > engagement_range and distance_to_object(squad_object) < 200){
					combat_state = pirate_interceptor_1_combat_state.none
					state = pirate_interceptor_1.approaching
				}
				
				if (distance_to_object(squad_object) > 200){
					combat_state = pirate_interceptor_1_combat_state.returning_to_engagement
				}
					
												
				break;
				#endregion
				
				#region orbiting_counter_clockwise
				case pirate_interceptor_1_combat_state.orbiting_counter_clockwise:
					_direction_from_target = point_direction(ship_target.x, ship_target.y, x, y)
					_tangent_direction = _direction_from_target + 90
				if (_tangent_direction < 0){
					_tangent_direction += 359
				}
				move_towards_target(_tangent_direction)
				
				//set up the attack... this might need to become a script
				if (fire_counter = fire_rate){
					
					//select attack mode, right now random, will be more intelligent later
					_random_seed = irandom(1)
					switch(_random_seed){
						case 0:
						show_debug_message("slide_attack")
							combat_state = pirate_interceptor_1_combat_state.slide_attack
							accuracy_factor = 1
							missed_shot_direction = 0
							
							accuracy_roll = irandom(100)
							if (accuracy_roll > accuracy){
								accuracy_factor = accuracy_roll - accuracy
								missed_shot_direction = irandom(1)
								if (missed_shot_direction = 0){
									accuracy_factor *= -1
									string_factor = string(accuracy_factor)
								
								}
							}
						break;
						
						case 1:
						show_debug_message("straight_on_attack")
							combat_state = pirate_interceptor_1_combat_state.straight_on_attack
							accuracy_factor = 1
							missed_shot_direction = 0
							accuracy_roll = irandom(100)
							if (accuracy_roll > accuracy){
								accuracy_factor = accuracy_roll - accuracy
								missed_shot_direction = irandom(1)
								if (missed_shot_direction = 0){
									accuracy_factor *= -1
									string_factor = string(accuracy_factor)
									
								}
							}
						break;
						
						case 2:
						
						break;
					}
					
				}
				
				//disengage
				var nearest_enemy_ship = instance_nearest(x, y, o_enemy_ship)
				if (distance_to_object(nearest_enemy_ship) < 25){
					combat_state = pirate_interceptor_1_combat_state.disengaging
					ship_target = nearest_enemy_ship
				}
				if (_distance_to_target > weapon_range - 20){
					combat_state = pirate_interceptor_1_combat_state.jousting
					
				}
				if (_distance_to_target > engagement_range and distance_to_object(squad_object) < 200){
					combat_state = pirate_interceptor_1_combat_state.none
					state = pirate_interceptor_1.approaching
				}
				
				if (distance_to_object(squad_object) > 200){
					combat_state = pirate_interceptor_1_combat_state.returning_to_engagement
				}
				
					
												
				break;
				#endregion
				
				
				#endregion
				
				#region attacking
				case pirate_interceptor_1_combat_state.slide_attack:
				if (turn_speed_counter = 0){
					turn_speed_counter = irandom_range(10, 20)
				}
			
				
				_lead_target_direction = point_direction(x, y, _lead_target_x + accuracy_factor, _lead_target_y + accuracy_factor)
				face_target(_lead_target_direction)
				if (image_angle = _lead_target_direction){
					fire_counter = 0
					//fire the shot
					
					
					//rear right gun
					right_angle_direction  = direction - 49
					_new_x_right = lengthdir_x(29, right_angle_direction)
					_new_y_right = lengthdir_y(29, right_angle_direction)
					var _projectile = instance_create_layer(x+_new_x_right, y+_new_y_right, "Projectiles", projectile_type)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other.image_angle
						direction = image_angle
						damage = other.projectile_damage
					}
					
					//rear left gun
					left_angle_direction = direction + 49
					_new_x_left = lengthdir_x(31, left_angle_direction)
					_new_y_left = lengthdir_y(31, left_angle_direction)
					var _projectile = instance_create_layer(x+_new_x_left, y+_new_y_left, "Projectiles", projectile_type)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other.image_angle
						direction = image_angle
						damage = other.projectile_damage
					}
					//change state back
					//will be random, or more intelligent later
					var _combat_mode_to_change_to = irandom(1)
					
					switch (_combat_mode_to_change_to){
						case 0:
							combat_state = pirate_interceptor_1_combat_state.orbiting_clockwise	
						break;
						
						case 1:
							combat_state = pirate_interceptor_1_combat_state.orbiting_counter_clockwise
						break;
					}
					
				}
				break;
				
				case pirate_interceptor_1_combat_state.straight_on_attack:
				
				_lead_target_direction = point_direction(x, y, _lead_target_x + accuracy_factor, _lead_target_y + accuracy_factor)
				face_target(_lead_target_direction)
				direction = image_angle
				if (image_angle = _lead_target_direction){
					//fire the shot
					fire_counter = 0
					
					
					//rear right gun
					right_angle_direction  = direction - 49
					_new_x_right = lengthdir_x(29, right_angle_direction)
					_new_y_right = lengthdir_y(29, right_angle_direction)
					var _projectile = instance_create_layer(x+_new_x_right, y+_new_y_right, "Projectiles", projectile_type)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other.image_angle
						direction = image_angle
						damage = other.projectile_damage
					}
					
					//rear left gun
					left_angle_direction = direction + 49
					_new_x_left = lengthdir_x(31, left_angle_direction)
					_new_y_left = lengthdir_y(31, left_angle_direction)
					var _projectile = instance_create_layer(x+_new_x_left, y+_new_y_left, "Projectiles", projectile_type)
					with (_projectile){
						speed = other.projectile_speed
						image_angle = other.image_angle
						direction = image_angle
						damage = other.projectile_damage
					}
					//change state back
					//will be random, or more intelligent later
					var _combat_mode_to_change_to = irandom(1)
					
					switch (_combat_mode_to_change_to){
						case 0:
							combat_state = pirate_interceptor_1_combat_state.orbiting_clockwise	
						break;
						
						case 1:
							combat_state = pirate_interceptor_1_combat_state.orbiting_counter_clockwise
						break;
					}
										
				}
				
				break;
					
				#endregion
				
				#region disengaging
				case pirate_interceptor_1_combat_state.disengaging:
					
					if (manuever_counter == 0){
						manuever_counter = irandom_range(20, 50)
					}
					if (fire_counter = fire_rate and speed = max_speed){
						combat_state = pirate_interceptor_1_combat_state.slide_attack
						manuever_counter = 0
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
					}
						
					_direction_from_target = point_direction(ship_target.x, ship_target.y, x, y)
					move_towards_target(_direction_from_target)
					
					if (manuever_counter = 1){
						state = pirate_interceptor_1.approaching
						combat_state = pirate_interceptor_1_combat_state.none
						target_scan_counter = 0
					}
					
				
				break;
				#endregion
				
				#region jousting
				case pirate_interceptor_1_combat_state.jousting:
					if (manuever_counter == 0){
						manuever_counter = irandom_range(20, 80)
					}
					if (fire_counter = fire_rate and speed = max_speed){
						combat_state = pirate_interceptor_1_combat_state.slide_attack
						manuever_counter = 0
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
					}
						
					
					face_target(_target_direction)
					direction = image_angle
					speed += acceleration_rate
					limit_speed()
				break;
				#endregion
				
				#region returning_to_engagement
				case pirate_interceptor_1_combat_state.returning_to_engagement:
					if (manuever_counter == 0){
						manuever_counter = irandom_range(20, 80)
					}
					if (fire_counter = fire_rate and speed = max_speed and (_distance_to_target < weapon_range)){
						combat_state = pirate_interceptor_1_combat_state.slide_attack
						manuever_counter = 0
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
					}
						
					
					face_target(point_direction(x, y, squad_object.x, squad_object.y))
					direction = image_angle
					speed += acceleration_rate
					limit_speed()
					
					if (position_meeting(x, y, squad_object) or manuever_counter = 1){
						state = pirate_interceptor_1.approaching
						combat_state = pirate_interceptor_1_combat_state.none
						manuever_counter = 0
					}
				
				break;
				#endregion
				#endregion
				
				
				
			}	
				
		}
		//return back to approaching or idle state
		if (!instance_exists(ship_target)){
			state = pirate_interceptor_1.approaching
			combat_state = pirate_interceptor_1_combat_state.none
			target_scan_counter = 0
		}
	break;
	
	case pirate_interceptor_1.ultimate:
		combat_state = pirate_interceptor_1_combat_state.none
		if (!instance_exists(ship_target)){
			state = pirate_interceptor_1.approaching
		}
		if (instance_exists(ship_target)){
			
			_target_direction = ship_target.direction
			_target_speed = ship_target.speed
			_distance_to_target = distance_to_object(ship_target)
			_projectile_flight_time = _distance_to_target/projectile_speed
					
			_lead_target_x = ship_target.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
			_lead_target_y = ship_target.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
		
			_direction_to_lead_target = point_direction(x, y, _lead_target_x, _lead_target_y)
			
			move_towards_target(_direction_to_lead_target)
			
			if (distance_to_object(ship_target) < 150 and image_angle = _direction_to_lead_target) {
				//create the net, shoot it
				var net_ult = instance_create_layer(x, y, "Projectiles", o_net_ult)
				with (net_ult){
					speed = other.projectile_speed
					damage = other.projectile_damage
					stun_duration = other.ult_stun_duration
					direction = other._direction_to_lead_target
					image_angle = direction
				}
				ultimate_energy = 0
				state = pirate_interceptor_1.approaching
			}
		}
		
	break;
	
	case pirate_interceptor_1.disabled:
		if (stun_counter > 0){
			speed = .05
		}
		
		show_debug_message("stunned!")
	break;

}
#endregion

//Post State machine checks (including counters)
#region post statemachine checks
if (fire_counter < fire_rate){
	fire_counter++
}

if (manuever_counter > 0){
	manuever_counter --
}
if (turn_speed_counter > 0){
	turn_speed_counter --
}
if (turn_speed != turn_speed_previous){
	turn_speed = turn_speed_previous
}

if (dodge_counter > 0){
	dodge_counter--
	if (max_speed > base_max_speed){
		max_speed -= .05
	}
}
if (dodge_counter = 0){
	max_speed = base_max_speed
}

if (stun_counter > 0){
	stun_counter--
	if (stun_counter = 0){
		state = pirate_interceptor_1.approaching
		combat_state = pirate_interceptor_1_combat_state.none
	}
}
#endregion