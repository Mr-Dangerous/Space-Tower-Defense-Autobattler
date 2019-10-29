#region Pre statemachine checks
if(!instance_exists(target)){
	state = player_unit.patrolling
}
if (energy >= max_energy && state != player_unit.ultimate){
	state = player_unit.ultimate
}
#endregion

#region statemachine
switch(state){
	#region Patrolling
	case player_unit.patrolling:
	target = instance_nearest(x, y, o_enemy_unit)
	if (distance_to_object(target) < range){
		state = player_unit.engaging
	}
	break;
	#endregion
	
	#region engaging (not shooting)
	case player_unit.engaging:
	if (!instance_exists(target)){
		target = instance_nearest(x, y, o_enemy_unit)
		if (distance_to_object(target) > range){
			state = player_unit.patrolling
			exit;
		}
	}
	
	_p_dir = point_direction(x, y, target.x, target.y)
	image_angle = _p_dir
	direction = _p_dir
	if (fire_counter = fire_rate){
		state = player_unit.attacking
		fire_counter = 0
	}
	break;
	#endregion
	
	#region attacking
	case player_unit.attacking:
	var _projectile = instance_create_layer(x, y, "Instances", o_cannon_shot_player)
		with(_projectile){
			//assign the projectile some variable properties.
			image_angle = other.image_angle
			direction = other.direction
			speed = 5
			damage = 5
		}
		energy += energy_on_hit
		state = player_unit.patrolling
	break;
	#endregion
	
	#region Destroyed
	case player_unit.destroyed:
	
	break;
	#endregion
	
	#region Ultimate
	case player_unit.ultimate:
	//Rapid volley fire
	
	if (!instance_exists(target)){
		target = instance_nearest(x, y, o_enemy_unit)
		if (distance_to_object(target) > range){
			ultimate_volley_counter = 0
			fire_counter = 0
			state = player_unit.patrolling
			exit;
		}
	}
	_p_dir = point_direction(x, y, target.x, target.y)
	direction = _p_dir
	image_angle = _p_dir
	if (fire_counter = fire_rate){
		fire_counter = 90
		var _projectile = instance_create_layer(x, y, "Instances", o_cannon_shot_player)
		with(_projectile){
			//assign the projectile some variable properties.
			image_angle = other.direction
			direction = other.direction
			speed = 10
			damage = 5
		}
		ultimate_volley_counter++
		
	}
	if (ultimate_volley_counter = ultimate_volley_number_of_shots){
		state = player_unit.patrolling
		ultimate_volley_counter = 0
		energy = 0
		fire_counter = 0
	}
	break;
	#endregion
	
}
#endregion

#region post statemachine checks
if (fire_counter < fire_rate){
		fire_counter++
	}
#endregion