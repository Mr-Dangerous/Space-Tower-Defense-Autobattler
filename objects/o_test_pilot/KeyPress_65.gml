//this is a test functino to pair the pilot with the squad.
show_debug_message("doop")
paired_squad = instance_nearest(x, y, o_player_squad)

if (instance_exists(paired_squad)){
	ship_to_pair_to = paired_squad.ship_1
	with (paired_squad){
		pilot = other
	}
	
	if (instance_exists(ship_to_pair_to)){
		paired_ship = ship_to_pair_to
		with(ship_to_pair_to){
			pilot = other
		}
	}
}