var projectile = instance_create_layer(x, y, "Projectiles", o_bio_ball_destroyed)

with(projectile){
	image_angle= other.image_angle
}