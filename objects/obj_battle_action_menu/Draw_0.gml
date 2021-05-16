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
	
	// Will need to get the players skills in these boxes based on selected player. For now just draw the 6 boxes here
	for (var i = 0; i < menu_length; i++){
	
		// Left Column
		if (i % 2 == 0) {
			var _row = i / 2;
			draw_dialog_box(x + 1, y + 1 + button_height*(_row), x + 0.5*menu_width, y + button_height*(_row+1), c_blue);
			draw_text_shadow(x + padding, y + button_height*(_row) + padding, menu_skill_list[i]);
		}
	
		// Right Column
		if (i % 2 == 1) {
			var _row = (i - 1)/2
			draw_dialog_box(x + 1 + 0.5*menu_width, y + 1 + button_height*(_row), x + menu_width, y + button_height*(_row+1), c_blue);
			draw_text_shadow(x + 0.5*menu_width + padding, y + button_height*(_row) + padding, menu_skill_list[i]);
		}
	}
}