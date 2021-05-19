/// @description Insert description here
// You can write your code in this editor

if (global.battle.menu_focus == battle_focus.pause_menu ) {
	// Create the overlay
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	// Text
	for (var i = 0; i < array_length(menu_items); i++){
		draw_text_shadow(xx + sprite_width + 4, yy + i*menu_spacing, menu_items[i]);	
	}

	y = yy + menu_spacing*selected_index - sprite_up_adjust;

	draw_self();
}