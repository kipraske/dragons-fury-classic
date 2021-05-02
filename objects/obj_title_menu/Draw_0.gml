/// @description Insert description here
// You can write your code in this editor

menu_spacing = 18;

draw_set_font(dialog);
draw_set_color(c_white);
draw_set_halign(fa_left);

for (var i = 0; i < array_length(menu_items); i++){
	draw_text_shadow(x, y + i*menu_spacing, menu_items[@ i]);	
}