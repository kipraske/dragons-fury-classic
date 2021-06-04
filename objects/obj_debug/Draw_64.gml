/// @description Insert description here
// You can write your code in this editor

spacing = 18;
draw_set_font(ft_default);
draw_set_color(c_white);

with(obj_battle_pause_menu) {
	draw_text( 240, 20, selected_index );
}