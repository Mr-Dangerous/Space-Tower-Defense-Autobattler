//o_player_projectile step event

var _damage = calculate_damage(projectile_damage_type, damage, other)
armor_damage = _damage[0]
shield_damage = _damage[1]

with (other){
	armor -= other.armor_damage
	shields -= other.shield_damage
	show_debug_message(armor)
	show_debug_message(shields)
	
}
instance_destroy()
