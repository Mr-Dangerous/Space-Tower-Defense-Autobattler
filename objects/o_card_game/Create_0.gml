i = 0
var _card_width = 332
repeat (5){
	card_slots[i, 0] = card_slot_0  //card slot
	card_slots[i, 1] = 0 //card in slot
	card_slots[i, 2] = 452	+ (_card_width*i)		//x_position
	i++
}
card_slots[2, 0] = card_slot_2
card_slots[3, 0] = card_slot_3
card_slots[4, 0] = card_slot_4
	