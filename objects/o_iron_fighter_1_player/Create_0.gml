//This object will be created by dragging the ship from teh hangar and placing it on the grid
//A lot of things will be handled in determining ship synergies here as well
enum iron_fighter_1_player{
	approaching,
	engaging,
	ultimate,
	disabled,
	planning
}

state = iron_fighter_1_player.planning

enum iron_fighter_1_player_combat{
	none
}
combat_state = iron_fighter_1_player_combat.none
