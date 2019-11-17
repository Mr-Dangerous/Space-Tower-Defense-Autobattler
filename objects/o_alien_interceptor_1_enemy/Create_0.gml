enum alien_interceptor_1_enemy {
	idle,
	approaching,
	engaging,
	returning,
	disabled
}

state = alien_interceptor_1_enemy.idle

enum alien_interceptor_1_enemy_combat_state {
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

combat_state = alien_interceptor_1_enemy_combat_state.none
	
	