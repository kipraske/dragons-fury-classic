/// @description Insert description here
// You can write your code in this editor

// Only appears when it has focus
if (global.battle.menu_focus == battle_focus.action_select ) {
	draw_set_color(c_white);
	draw_set_font(ft_default);
	draw_set_halign(fa_left);
	
	// Tack on swap skill to any player in the last slot
	var menu_skill_list = selected_player.equipped_skills;
	menu_skill_list[MAX_EQUIPPED_SKILLS] = skills.swap;
	
	// We want to draw the sprite on top of the menu, so we wait to draw it until the end
	var sprite_x = xx;
	var sprite_y = yy;
	
	// Will need to get the players skills in these boxes based on selected player. For now just draw the 6 boxes here
	for (var i = 0; i < menu_length; i++){
	
		// Left Column
		if (i % 2 == 0) {
			var _row = i / 2;
			draw_dialog_box(xx + 1, yy + 1 + button_height*(_row), xx + 0.5*menu_width, yy + button_height*(_row+1), c_blue);
			draw_text_shadow(xx + padding, yy + button_height*(_row) + padding, menu_skill_list[i]);
			
			// Draw the select hand
			if ( selected_index == i ){
				sprite_y = yy + 1 + button_height*(_row) + 0.25*button_height - sprite_up_adjust;
				sprite_x = xx + 0.5*menu_width;
			}
		}
	
		// Right Column
		if (i % 2 == 1) {
			var _row = (i - 1)/2
			draw_dialog_box(xx + 1 + 0.5*menu_width, yy + 1 + button_height*(_row), xx + menu_width, yy + button_height*(_row+1), c_blue);
			draw_text_shadow(xx + 0.5*menu_width + padding, yy + button_height*(_row) + padding, menu_skill_list[i]);
		
			// Draw the select hand
			if (selected_index == i ) {
				sprite_y = yy + 1 + button_height*(_row) + 0.25*button_height - sprite_up_adjust;
				sprite_x = xx + menu_width;
			}
		}
	}
	
	if (selected_index != -1 ){
		x = sprite_x;
		y = sprite_y;
		draw_self();
	}
	
}