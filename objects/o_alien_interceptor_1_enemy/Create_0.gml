enum alien_interceptor_1_enemy {
	idle,
	approaching,
	engaging,
	slide_attack,
	straight_on_attack,
	returning
}

state = alien_interceptor_1_enemy.idle

enum alien_interceptor_1_combat_state_enemy {
	orbiting_clockwise,
	orbiting_counter_clockwise,
	attacking,
	slide_attack,
	straight_on_attack,
	disengaging,
	pursuing,
	none
}

combat_state = alien_interceptor_1_combat_state_enemy.none
	