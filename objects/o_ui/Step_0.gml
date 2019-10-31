var view_x_position = camera_get_view_x(view_camera[0])
var view_y_position = camera_get_view_y(view_camera[0])
var view_width = camera_get_view_width(view_camera[0])
var view_height = camera_get_view_height(view_camera[0])



if (keyboard_check_pressed(vk_space)){
	zoom_level++
	view_width =1280
	view_height = 768
	zoom = array_get(a_zoom_level, zoom_level)
	if (zoom_level >= max_zoom_level){
		zoom_level = 0
		
	}
	camera_set_view_size(view_camera[0], view_width*zoom, view_height*zoom)
}


//scrolling handling
camera_moving_x = false
camera_moving_y = false

//scroll left
if ((mouse_x) < view_x_position+64){
	camera_speed_x += -1
	if ((mouse_x) < view_x_position+8){
		camera_speed_x += -1
		fast_camera = true
	}
	camera_moving_x = true
}

//scroll right
if ((mouse_x) > view_x_position+view_width-64){
	camera_speed_x += 1
	if ((mouse_x) > view_x_position+view_width-8){
		camera_speed_x += 1
		fast_camera = true
	}
	camera_moving_x = true
}
//scroll up
if ((mouse_y) < view_y_position+64){
	camera_speed_y += -1
	if ((mouse_y) < view_y_position+8){
		camera_speed_y += -1
		fast_camera = true
	}
	camera_moving_y = true
}
//scroll down
if ((mouse_y) > view_y_position+view_height-64){
	camera_speed_y += 1
	if ((mouse_y) > view_y_position+view_height-8){
		camera_speed_y += 1
		fast_camera = true
	}
	camera_moving_y = true
}

if (camera_moving_x = false){
	camera_speed_x = 0
}
if (camera_moving_y = false){
	camera_speed_y = 0
}


if (fast_camera = true){
	max_camera_speed = 10
}

if (abs(camera_speed_x)>max_camera_speed){
	camera_speed_x = max_camera_speed*sign(camera_speed_x)
}
if (abs(camera_speed_y)>max_camera_speed){
	camera_speed_y = max_camera_speed*sign(camera_speed_y)
}


//move the camera


camera_x = camera_get_view_x(view_camera[0])
camera_y = camera_get_view_y(view_camera[0])
if ((camera_x + camera_speed_x) < 0 or (camera_x + camera_speed_x) > room_width){
	camera_speed_x = 0
}
if ((camera_y + camera_speed_y) < 0 or (camera_y + camera_speed_y) > room_height){
	camera_speed_y = 0
}
camera_set_view_pos(view_camera[0], camera_x+camera_speed_x, camera_y+camera_speed_y)
//parralax backgrounds
var _cam_x = camera_get_view_x(view_camera[0])
var _cam_y = camera_get_view_y(view_camera[0])

//cameras


layer_x("Background", _cam_x * .95)
layer_y("Background", _cam_y * .95)



//end of step resets
fast_camera = false
max_camera_speed = 4


