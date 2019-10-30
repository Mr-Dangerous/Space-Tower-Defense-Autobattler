
var projectile = instance_create_layer(x, y, "Projectile", projectile_type)
			
lead_target_multiplier = distance_to_object(ship_target)*projectile_speed*.2
accuracy_factor = 0
accuracy_roll = irandom(100)
if(accuracy_roll > accuracy){
	accuracy_factor=6*lead_target_multiplier
if (accuracy_factor % 2 = 1){
	accuracy_factor*= -1
}
	show_debug_message("miss")
} else {
	accuracy_factor = 0
}
lead_target_x = lengthdir_x(ship_target.speed*(lead_target_multiplier + accuracy_factor), ship_target.direction)
lead_target_y = lengthdir_y(ship_target.speed*(lead_target_multiplier + accuracy_factor), ship_target.direction)
_projectile_p_dir = point_direction(x, y, ship_target.x+lead_target_x, ship_target.y+lead_target_y)
with (projectile){
	damage = other.projectile_damage
	speed = other.projectile_speed
	direction = other._projectile_p_dir
	image_angle = other._projectile_p_dir
}
