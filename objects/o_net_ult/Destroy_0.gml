instance_destroy(projectile_leader)
var net_ult = instance_create_layer(x, y, "Projectiles", o_net_ult_shock)
with (net_ult){
	direction = other.direction
	image_angle = other.image_angle
	
}