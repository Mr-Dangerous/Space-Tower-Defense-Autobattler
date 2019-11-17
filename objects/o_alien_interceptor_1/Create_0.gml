enum alien_interceptor_1 {
	idle,
	approaching,
	engaging,
	returning,
	ultimate
}

state = alien_interceptor_1.idle

enum alien_interceptor_1_combat_state {
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

combat_state = alien_interceptor_1_combat_state.none
	