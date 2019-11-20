delete_all_cards_in_hand = true
if (delete_all_cards_in_hand = true){
	for (i = 0; i< 5; i++){
		var _card = instance_position(card_slots[i, 2], (view_port_height - 110)*2, o_card)
		instance_destroy(_card)
	}
	delete_all_cards_in_hand = false
}
spawn_cards = true
