//Pre state machine checks
if (!instance_exists(ship_target) and target_acquired = false){
	state = alien_interceptor_1.idle
	target_acquired = false
} else {
	state = alien_interceptor_1.approaching
	target_acquired = true
}

#region State Machine
switch (state){
#region alien_interceptor_1.idle
	case alien_interceptor_1.idle:
	_formation_direction_offset_calculated = squad_object.direction + formation_direction_offset
	if (_formation_direction_offset_calculated < 0){
		_formation_direction_offset_calculated += 360
	}
	_formation_point_x = lengthdir_x(formation_distance_offset, _formation_direction_offset_calculated)
	_formation_point_y = lengthdir_y(formation_distance_offset, _formation_direction_offset_calculated)
		if (locked_formation){
			x = squad_object.x + _formation_point_x
			y = squad_object.y + _formation_point_y
			image_angle = squad_object.image_angle
			direction = image_angle
			speed = 0
		}
		if (!locked_formation){
			if (distance_to_point(_formation_point_x, _formation_point_y > 500 and arrival_counter = 0)){
				arrival_counter = 20
			}
			if (arrival_counter ==20){
				speed += acceleration_rate
				limit_speed()
				face_target(point_direction(x, y, _formation_point_x, _formation_point_y))
				direction = image_angle
				
			}
			if (distance_to_point(_formation_point_x,_formation_point_y < 25)){
				speed -= acceleration_rate * .2
				arrival_counter--
				if (arrival_counter = 0){
					speed = 0
				}
				limit_speed()
				face_target(point_direction(x, y, _formation_point_x, _formation_point_y))
				direction = image_angle
			}
		}
			
			
	break;

#endregion

}
#endregion
