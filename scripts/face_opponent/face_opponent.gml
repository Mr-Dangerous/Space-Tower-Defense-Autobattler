if (image_angle != _p_dir){
		_angle_difference = angle_difference(image_angle, _p_dir)
		image_angle -= sign(_angle_difference)*turn_speed
		if (abs(_angle_difference) < 4){
			image_angle = _p_dir
		}
		direction = image_angle
	}