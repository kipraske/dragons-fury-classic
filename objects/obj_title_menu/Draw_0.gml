/// @description Insert description here
// You can write your code in this editor

menu_spacing = 16;

draw_set_color(c_white);
draw_set_halign(fa_left);
for (var i = 0; i < array_length_1d(menu_spacing); i++ ){
	draw_text_shadow(x + i*menu_spacing, y + i*menu_spacing, menu_items[@ i]);
}
