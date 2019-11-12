switch(state){
	
case plasma_cannon_1.scanning:
	image_angle += .5
	var nearest_enemy_target = instance_nearest(x, y, o_enemy_unit)
	
	if (distance_to_object(nearest_enemy_target) < weapon_range){
		ship_target = nearest_enemy_target
		state = plasma_cannon_1.engaging
	}
		
break;

case plasma_cannon_1.engaging:
	if (instance_exists(ship_target)){
			//set up variables used for the combat state machine
			_target_direction = ship_target.direction
			_target_speed = ship_target.speed
			_distance_to_target = distance_to_object(ship_target)
			_projectile_flight_time = _distance_to_target/projectile_speed
					
			_lead_target_x = ship_target.x + lengthdir_x((_target_speed * _projectile_flight_time), _target_direction)
			_lead_target_y = ship_target.y + lengthdir_y((_target_speed * _projectile_flight_time), _target_direction)
			
			if (fire_counter = fire_rate) charge_counter++
			
			//Pick up from here, 10:24 on 11/11/2019.
			
			//make a plasma ball, when it hits the charge rates, it shoots!
				
	}
	if (!instance_exsists(ship_target)){
		state = plasma_cannon_1.scanning
	}
break;

}

if (fire_counter < fire_rate){
	fire_counter ++
}
