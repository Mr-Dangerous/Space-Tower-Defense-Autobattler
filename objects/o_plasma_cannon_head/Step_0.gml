switch(state){
	
case plasma_cannon_1.scanning:
	image_angle += .5
	var nearest_enemy_target = instance_nearest(x, y, o_enemy_ship)
	
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
			_lead_target_direction = point_direction(x, y, _lead_target_x, _lead_target_y)
			face_target(_lead_target_direction)
			if (fire_counter = fire_rate) charge_counter++
			
			if (charge_counter = 1){
				charge_attack = instance_create_layer(x, y, "Projectiles", o_plasma_shot_player)
			}
			
			if (instance_exists(charge_attack)){
				with (charge_attack){
					if(other.charge_counter <= 80){
						var _scale = other.charge_counter/80
						image_xscale = _scale
						image_yscale = _scale
						image_angle = other._target_direction
					}
				}
				_new_x = x + lengthdir_x(30, image_angle)
				_new_y = y + lengthdir_y(30, image_angle)
				charge_attack.x = _new_x
				charge_attack.y = _new_y
				if (charge_counter = charge_rate){
					charge_counter = 0
					fire_counter = 0
					with (charge_attack){
						speed = other.projectile_speed
						image_angle = other.image_angle
						direction = image_angle
						damage = other.projectile_damage
					}
					charge_attack = noone
				}
			}
			//Pick up from here, 10:24 on 11/11/2019.
			
			//make a plasma ball, when it hits the charge rates, it shoots!
				
	}
	if (!instance_exists(ship_target) or distance_to_object(ship_target)>weapon_range){
		state = plasma_cannon_1.scanning
		if (instance_exists(charge_attack)){
			instance_destroy(charge_attack)
			charge_attack = noone
			charge_counter = 0
		}
	}
break;

}

if (fire_counter < fire_rate){
	fire_counter ++
}
