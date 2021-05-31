/// @description Insert description here
// You can write your code in this editor

draw_set_font(ft_default);
draw_set_color(c_white);
draw_set_halign(fa_left);

for (var i = 0; i < array_length(menu_items); i++){
	draw_text_shadow(xstart + hand_width + 4, ystart + i*menu_spacing, menu_items[i]);	
}

hand_y = ystart + menu_spacing*selected_index - sprite_up_adjust;
draw_sprite(spr_hand_icon_right, 0, hand_x, hand_y);
draw_self(); //invisible click mask