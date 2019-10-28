
switch(state){
	case player_unit.patrolling:
	target = instance_nearest(x, y, o_enemy_unit)
	if (distance_to_object(target) < range){
		state = player_unit.engaging
	}
	break;
	
	case player_unit.engaging:
	if (target == noone){
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
		fire_counter = 0
		var _projectile = instance_create_layer(x, y, "Instances", o_cannon_shot_player)
		with(_projectile){
			//assign the projectile some variable properties.
			image_angle = other.image_angle
			direction = other.direction
			speed = 10
			damage = 5
		}
	}
	
	break;
	case player_unit.destroyed:
	
	break;
}
if (fire_counter < fire_rate){
		fire_counter++
	}