draw_self()
energy_tick_size = 16/max_energy
energy_bar_subimage = round(energy*energy_tick_size)
if (max_energy - energy < 4){
	energy_bar_subimage = 15
}
draw_sprite(s_energy_bar, energy_bar_subimage, x, y + 16)