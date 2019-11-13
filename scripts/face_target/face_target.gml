//@param target_direction

//only turns the sprite, does not change the actual direction (this is to allow for the
//ships to travel in a vector, turn, and shoot.
var _point_direction = argument0

if (image_angle != _point_direction){
		_angle_difference = angle_difference(image_angle, _point_direction)
		image_angle -= sign(_angle_difference)*turn_speed
		if (abs(_angle_difference) < 4){
			image_angle = _point_direction
		}

	}