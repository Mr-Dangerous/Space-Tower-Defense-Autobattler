enum pirate_interceptor_1 {
	idle,
	approaching,
	engaging,
	returning, 
	ultimate, 
	disabled,
	control_overidden
}

state = pirate_interceptor_1.idle

enum pirate_interceptor_1_combat_state {
	orbiting_clockwise,
	orbiting_counter_clockwise,
	jousting,
	slide_attack,
	straight_on_attack,
	disengaging,
	pursuing,
	returning_to_engagement,
	none
}

combat_state = pirate_interceptor_1_combat_state.none
	