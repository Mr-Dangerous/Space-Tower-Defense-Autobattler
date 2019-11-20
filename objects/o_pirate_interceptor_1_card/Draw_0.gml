draw_self()

//Set up the color variable
//a nice pastel blue for level 1 cards.
//color will later be determined vias script
//var _color = $5555AC
draw_set_font(font0)
draw_set_color(c_blue)

//draw the sprite on the card
graphic_width = sprite_get_width(card_graphic)
graphic_height = sprite_get_height(card_graphic)
scale = 2
draw_sprite_stretched(card_graphic, 0, x+100, y+100, graphic_width * scale, graphic_height * scale)

//draw text
draw_text(x + 16, y + 26, card_origin)
draw_text(x+16, y+62, card_class)

draw_set_font(font0)
draw_text(x+16, y+166, card_name)
draw_text(x+270, y+26, card_cost)


draw_set_color(c_black)
draw_set_font(font0)


