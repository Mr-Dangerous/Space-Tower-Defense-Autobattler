//@param movement direction

//turns the ship or object towards the object, and then moves it while limiting it's speed

var _direction_to_target = argument0

face_target(_direction_to_target)
direction = image_angle
speed += acceleration_rate
limit_speed()