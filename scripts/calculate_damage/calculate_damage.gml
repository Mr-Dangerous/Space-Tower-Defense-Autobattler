//@param damage_type
//@param damage
//@damaged object

var damage_type = argument0
var damage = argument1
var damaged_object = argument2

damage_to_armor = 0
damage_to_shields = 0

switch(damage_type){
	case "light":
		//damage to shields
		/*
		if (shields > 0){
			shield_damage = round(damage * .5)
			carry_over_damage = 0
			if (shield_damage > damaged_object.sheilds){
				carry_over_damage = shield_damage - damaged_object.shields
				shield_damage = damaged_object.sheilds
			}
			damage_to_sheilds = shield_damage
		}
		*/
		
		if (damaged_object.shields > 0){
			damage_to_shields = round(damage * .5)
			damage_to_armor = round(damage * .1)
			
		}
		
		//damage_to_armor
		if (damaged_object.shields < 0){
			damage_to_armor = damage
		}
		
	
	break;
	
	case "medium":
		
		if (damaged_object.shields > 0){
			damage_to_shields = round(damage * .45)
			damage_to_armor = round(damage * .30)
			
		}
		
		//damage_to_armor
		if (damaged_object.shields < 0){
			damage_to_armor = damage
		}
	break;
	
	case "heavy":
		
		if (damaged_object.shields > 0){
			damage_to_shields = round(damage * .15)
			damage_to_armor = round(damage * .85)
			
		}
		
		//damage_to_armor
		if (damaged_object.shields < 0){
			damage_to_armor = damage
		}
	break;
	
	case "energy":
	
		if (damaged_object.shields > 0){
			damage_to_shields = damage
			damage_to_armor = 0
			
		}
		
		//damage_to_armor
		if (damaged_object.shields < 0){
			damage_to_armor = damage * .2
		}
	break;
	
	case "true":

		damage_to_armor = damage
		
	break;
}
with (damaged_object){
	//reduce damage with armor damage reduction
	
	armor -= damage_to_armor-armor_damage_reduction
	shields -= damage_to_shields-shield_damage_reduction
}