enum squad{
	defend_sector
}

state = squad.defend_sector

//these ships will be assigned by a squad building object in the card game
//for now, they will be instances spawned
//ship_1 is always the squad leader, and usually will be a hero ship.
//for now, it's a corvette, which might be a squad leader type ship
ship_1 = instance_create_layer(x, y, "Instances", o_alien_corvette_1)
ship_2 = instance_create_layer(x + 10, y+40, "Instances", o_alien_interceptor_1)
ship_3 = instance_create_layer(x + 10, y-40, "Instances", o_alien_interceptor_1)
