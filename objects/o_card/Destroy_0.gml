if (instance_exists(card_game_rules_manager)){
	card_game_rules_manager.card_slots[card_slot, 0] = 0
	card_game_rules_manager.card_slots[card_slot, 1] = o_card_empty
	
}
instance_create_layer(x, y, "Cards", o_card_empty)
