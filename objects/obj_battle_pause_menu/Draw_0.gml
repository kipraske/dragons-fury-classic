/// @description Insert description here
// You can write your code in this editor

if (global.battle.menu_focus == battle_focus.pause_menu ) {
	// Create the overlay
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(0, 0, room_width, room_height, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	draw_dialog_box(room_width/2 - box_offset_width, room_height/2 - box_offset_height - padding, room_width/2 + box_offset_width, room_height/2 + box_offset_height + padding, c_blue);
	
	// Text
	for (var i = 0; i < array_length(menu_items); i++){
		draw_text_shadow(room_width/2 + 0.5*sprite_width - box_offset_width, room_height/2 + i*menu_spacing - box_offset_height, menu_items[i]);	
	}

	y = yy + menu_spacing*selected_index - sprite_up_adjust;

	draw_self();
}