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
		draw_text_shadow(room_width/2 + 0.5*hand_width - box_offset_width, room_height/2 + i*menu_spacing - box_offset_height, menu_items[i]);	
	}

	hand_y = room_height/2 + selected_index*menu_spacing - box_offset_height - sprite_up_adjust;
	hand_x = room_width/2 - box_offset_width - 0.5*hand_width - 4;
	draw_sprite(spr_hand_icon_right, 0, hand_x, hand_y);
	
	// draw sprite mask
	draw_self();
}