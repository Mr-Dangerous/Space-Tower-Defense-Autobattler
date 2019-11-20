view_port_height = view_get_hport(0)
//all placeholders for now
if (cards_dealt = false){
	cards_dealt = true
	for (i = 0; i < 5; i++){
		//this will obviosuly be different later, needs to work with stacks
		var random_card = o_pirate_interceptor_1_card
		with (random_card){
			card_game_rules_manager = other
			card_slot = i
		}
		card_slots[i, 1] = random_card
	}
}


if (spawn_cards = true){
	for (i = 0; i<5; i++){
		if(!instance_position(card_slots[i, 2], view_port_height - 110, o_card)){
			instance_create_layer(card_slots[i, 2], (view_port_height - 110)*2,"Cards", card_slots[i, 1])
		
		}
	}
	spawn_cards = false
}

//placeholder for now
//check to see if the card slots array is full of empty cards
var _all_empty = true

for (i = 0; i < 5; i++){
	if(card_slots[i, 1] != o_card_empty){
		_all_empty = false
		break;
	}
}

if (_all_empty = true){
	cards_dealt = false
}

	

