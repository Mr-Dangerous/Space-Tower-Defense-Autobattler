enum alien_interceptor_1 {
	idle,
	approaching,
	engaging,
	slide_attack,
	straight_on_attack,
	returning
}

state = alien_interceptor_1.idle

enum alien_interceptor_1_combat_state {
	orbiting_clockwise,
	orbiting_counter_clockwise,
	attacking,
	disengaging,
	pursuing,
	none
}

combat_state = alien_interceptor_1_combat_state.none
	