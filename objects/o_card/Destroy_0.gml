if (instance_exists(card_game_rules_manager)){
	
	card_game_rules_manager.card_slots[card_slot, 1] = o_card_empty
	show_debug_message("card_destroyed")
	
}
instance_create_layer(x, y, "Empty_Cards", o_card_empty)
