enum squad{
	defend_sector,
	engage_enemy
}

state = squad.defend_sector

//these ships will be assigned by a squad building object in the card game
//for now, they will be instances spawned
//ship_1 is always the squad leader, and usually will be a hero ship.
//for now, it's a corvette, which might be a squad leader type ship

ship_1 = instance_create_layer(x, y, "Instances", o_alien_interceptor_1)
ship_2 = instance_create_layer(x, y, "Instances", o_alien_interceptor_1)
ship_3 = instance_create_layer(x, y, "Instances", o_alien_interceptor_1)
ship_4 = instance_create_layer(x, y, "Instances", o_alien_interceptor_1)
ship_5 = instance_create_layer(x, y, "Instances", o_alien_interceptor_1)

//assign fomation details to the squad

with(ship_1){
	squad_object = other
	formation_direction_offset = 0
	formation_distance_offset = 0
}
with(ship_2){
	squad_object = other
	formation_direction_offset = 95

}
with(ship_3){
	squad_object = other
	formation_direction_offset = -95
}
with(ship_4){
	squad_object = other
	formation_direction_offset = 45
}
with(ship_5){
	squad_object = other
	formation_direction_offset = -45
}

//for testing purposes only
