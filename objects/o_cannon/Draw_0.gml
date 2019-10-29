draw_self()
energy_tick_size = 16/max_energy
energy_bar_subimage = floor(energy*energy_tick_size)
if (max_energy - energy < 4){
	energy_bar_subimage = 15
}
draw_sprite(s_energy_bar, energy_bar_subimage, x, y + 16)

if (object_exists(target)){
	draw_sprite(s_energy_bar, 1, target.x, target.y,)
}