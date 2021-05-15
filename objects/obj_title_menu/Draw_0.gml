/// @description Insert description here
// You can write your code in this editor

draw_set_font(ft_default);
draw_set_color(c_white);
draw_set_halign(fa_left);

for (var i = 0; i < array_length(menu_items); i++){
	draw_text_shadow(xstart + sprite_width + 4, ystart + i*menu_spacing, menu_items[@ i]);	
}

y = ystart + menu_spacing*selected_index - sprite_up_adjust;

draw_self();