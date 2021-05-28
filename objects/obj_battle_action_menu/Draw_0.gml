/// @description Insert description here
// You can write your code in this editor

// Only appears when it has focus
if (global.battle.menu_focus == battle_focus.action_select ) {
	draw_set_color(c_white);
	draw_set_font(ft_default);
	draw_set_halign(fa_left);
	
	// ONLY swap available for backend units
	var menu_skill_list = fill_array(MAX_EQUIPPED_SKILLS + 1, skills.noskill);
	menu_skill_list[MAX_EQUIPPED_SKILLS] = skills.swap;
	
	// For frontend we have the unit skills + swap
	if (selected_player_index < array_length(global.battle.player_frontline) ) {
		menu_skill_list = selected_player.equipped_skills;
		menu_skill_list[MAX_EQUIPPED_SKILLS] = skills.swap;
	}
	
	// We want to draw the sprite on top of the menu, so we wait to draw it until the end
	var sprite_x = xx;
	var sprite_y = yy;

	for (var i = 0; i < menu_length; i++){
		
		var _is_unselectable = (global.skill_targets_by_type[menu_skill_list[i]] == skill_target_types.passive); // passives and bound
		if (_is_unselectable) {
			draw_set_color(c_grey);
		}

		// Left Column
		if (i % 2 == 0) {
			var _row = i / 2;
			draw_dialog_box(xx + 1, yy + 1 + button_height*(_row), xx + 0.5*menu_width, yy + button_height*(_row+1), c_blue);
			draw_text_shadow(xx + padding, yy + button_height*(_row) + padding, global.labels.skills[menu_skill_list[i]][0]);
			
			// Draw the select hand
			if ( selected_index == i ){
				sprite_y = yy + 1 + button_height*(_row) + 0.25*button_height - sprite_up_adjust;
				sprite_x = xx + string_width(global.labels.skills[menu_skill_list[i]][0]) + padding + 4;
			}
		}
	
		// Right Column
		if (i % 2 == 1) {
			var _row = (i - 1)/2
			draw_dialog_box(xx + 1 + 0.5*menu_width, yy + 1 + button_height*(_row), xx + menu_width, yy + button_height*(_row+1), c_blue);
			draw_text_shadow(xx + 0.5*menu_width + padding, yy + button_height*(_row) + padding, global.labels.skills[menu_skill_list[i]][0]);
		
			// Draw the select hand
			if (selected_index == i ) {
				sprite_y = yy + 1 + button_height*(_row) + 0.25*button_height - sprite_up_adjust;
				sprite_x = xx + 0.5*menu_width + string_width(global.labels.skills[menu_skill_list[i]][0]) + padding + 4;
			}
		}
		
		draw_set_color(c_white); // reset for next loop
	}
	
	if (selected_index != -1 
		&& global.skill_targets_by_type[menu_skill_list[selected_index]] != skill_target_types.passive // no hand for passives (in case it is first)
	){
		x = sprite_x;
		y = sprite_y;
		draw_self();
	}
	
	// Debugging where the menu is
	// draw_text(menu_width+16, yy+32, selected_index);
	
}