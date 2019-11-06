//Pre state machine checks
/*
if (!instance_exists(ship_target) and target_acquired = false){
	state = alien_interceptor_1.idle
	target_acquired = false
} else {
	state = alien_interceptor_1.approaching
	target_acquired = true
}
*/

#region State Machine
switch (state){
#region alien_interceptor_1.idle
	case alien_interceptor_1.idle:
	_formation_direction_offset_calculated = squad_object.direction + formation_direction_offset
	if (_formation_direction_offset_calculated < 0){
		_formation_direction_offset_calculated += 360
	}
	_formation_point_x = round(lengthdir_x(formation_distance_offset, _formation_direction_offset_calculated))
	_formation_point_y = round(lengthdir_y(formation_distance_offset, _formation_direction_offset_calculated))
		
	_distance_to_formation_point = distance_to_point(squad_object.x + _formation_point_x, squad_object.y + _formation_point_y)
	if (_distance_to_formation_point >= 4){
		_direction_to_formation_point = point_direction(x, y, squad_object.x + _formation_point_x, squad_object.y+_formation_point_y)
		face_target(_direction_to_formation_point)
		direction = image_angle
		speed += acceleration_rate
		limit_speed()
		
			
	}
	if (_distance_to_formation_point < 4){
		//fully locked relative to the formation.
		//remeber when leaving to give the ships the same speed as the squad object.
		x = squad_object.x + _formation_point_x
		y = squad_object.y + _formation_point_y
		if (speed != 0){
			speed = 0
			//speed -= acceleration_rate
			if (speed < 0){
				speed = 0
			}
		}
	}
	if(image_angle != squad_object.direction){
		face_target(squad_object.direction)
	}
	direction = image_angle
			
		
		/*
		if (!locked_formation){
			_direction_to_formation_point = point_direction(x, y, squad_object.x+_formation_point_x, squad_object.y+_formation_point_y)
			face_target(_direction_to_formation_point)
			direction = image_angle
			speed += acceleration_rate
			limit_speed()
			_distance_to_point = distance_to_point(squad_object.x + _formation_point_x, squad_object.y + _formation_point_y)
			if(_distance_to_point < 8){
				locked_formation = true
			}
		}
		*/
			
			
	break;

#endregion

}
#endregion
