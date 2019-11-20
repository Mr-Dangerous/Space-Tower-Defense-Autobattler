view_port_height = view_get_hport(0)
//all placeholders for now

//populate the array with the required cards
if (cards_dealt = false){
	cards_dealt = true
	for (i = 0; i < 5; i++){
		//this will obviosuly be different later, needs to work with stacks
		var (_random) = irandom(2)
		switch (_random){
			case 0:
			var random_card = o_pirate_interceptor_1_card
			break;
			case 1:
			var random_card = o_alien_interceptor_1_card
			break;
			case 2:
			var random_card = o_iron_fighter_1_card
			break;
		}
		
		card_slots[i, 1] = random_card
	}
}

//spawn the cards from the array and create the card
if (spawn_cards = true){
	for (i = 0; i<5; i++){
		
		if(!instance_position(card_slots[i, 2], view_port_height - 110, o_card) or 
			instance_position(card_slots[i, 2], view_port_height - 110, o_card_empty)){
			var _empty_card = instance_position(card_slots[i, 2], view_port_height - 110, o_card)
			if (instance_exists(_empty_card)){
				instance_destroy(_empty_card)
			}
			var _card = instance_create_layer(card_slots[i, 2], (view_port_height - 110)*2,"Cards", card_slots[i, 1])
			
			with (_card){
				card_game_rules_manager = other
				show_debug_message("rules assigned")
				card_slot = other.i
			}
		
		}
		
	}
	spawn_cards = false
}

//placeholder for now to see if the hand is empty

//check to see if the card slots array is full of empty cards
var _all_empty = true

for (i = 0; i < 5; i++){
	if(card_slots[i, 1] != o_card_empty){
		_all_empty = false
		break;
	}
}

//allow a new hand to repoopulate the cards
if (_all_empty = true){
	cards_dealt = false
}





