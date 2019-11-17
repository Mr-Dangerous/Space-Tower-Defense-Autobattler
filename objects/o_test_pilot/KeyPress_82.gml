//This is a test function event to charge the ult.

//Ults are charged by playing cards.  This event woudl likely be changed into
//a different kind of even that would trigger on a global check whenever a card is played

if (instance_exists(paired_ship)){
	with(paired_ship){
		ultimate_energy++
		show_debug_message(ultimate_energy)
	}
}