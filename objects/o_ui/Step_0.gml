var view_x_position = view_xport[0]
var view_y_position = view_yport[0]
var view_width = camera_get_view_width(0)
var view_height = camera_get_view_height(0)

camera_moving_x = false
camera_moving_y = false

//scroll left
if ((mouse_x) < view_x_position+64){
	camera_speed_x -= 1
	camera_moving_x = true
}

//scroll right
if ((mouse_x) > view_x_position+view_width-64){
	camera_speed_x += 1
	camera_moving_x = true
}
//scroll up
if ((mouse_y) > view_y_position+64){
	camera_speed_y -= 1
	camera_moving_y = true
}
//scroll down
if ((mouse_y) > view_y_position+view_height-64){
	camera_speed_y += 1
	camera_moving_y = true
}
if (camera_moving_x = false){
	camera_speed_x = 0
}
if (camera_moving_y = false){
	camera_speed_y = 0
}

max_camera_speed = 6
if (abs(camera_speed_x)>max_camera_speed){
	camera_speed_x = max_camera_speed*sign(camera_speed_x)
}
if (abs(camera_speed_y)>max_camera_speed){
	camera_speed_y = max_camera_speed*sign(camera_speed_y)
}


//move the camera
view_xport[0] += camera_speed_x
view_yport[0] += camera_speed_y
show_debug_message(camera_speed_x)