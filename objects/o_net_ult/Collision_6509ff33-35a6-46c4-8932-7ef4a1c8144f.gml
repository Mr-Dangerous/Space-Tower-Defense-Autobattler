//o_net_ult step event

with (other){
	hp -= other.damage
	stun_counter = other.stun_duration
}
instance_destroy()