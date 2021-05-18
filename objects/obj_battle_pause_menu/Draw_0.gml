/// @description Insert description here
// You can write your code in this editor

if (global.battle.menu_focus == battle_focus.pause_menu ) {
	// Create the overlay
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}