if (dodge_counter = 0){
	dodge_counter = 60
	dodge_roll = irandom(100)
	if (dodge_roll > dodge_chance){
		
		dodge_direction = sign(irandom_range(-10, 10))
		new_direction = other.direction + (90 * dodge_direction)
		max_speed *= 2
		motion_add(new_direction, 4)
		show_debug_message("Dodged!")
	}
}
