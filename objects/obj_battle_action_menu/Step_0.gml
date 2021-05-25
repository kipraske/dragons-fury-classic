/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

if ( global.battle.menu_focus == battle_focus.action_select ) {

	if (selected_index = -1 ) {
		selected_index = 0;
	}
	
	// Gotta make sure swap is in our equipped skills list
	var menu_skill_list = selected_player.equipped_skills;
	menu_skill_list[MAX_EQUIPPED_SKILLS] = skills.swap;

	// If the input is not valid, keep going until you find one
	var _row_loop_count = 0; // We don't want to get stuck going down a row
	var _col_loop_count = 0;
	var _half_list_length = (MAX_EQUIPPED_SKILLS + 1)/2; // I mean it is 3 sure
	 do {
		if ( check_down_pressed() ) {
			selected_index += 2;
			_row_loop_count++;
		}

		if ( check_up_pressed() ) {
			selected_index -= 2;
			_row_loop_count++;
		}
	
		if ( check_right_pressed() ) {
			selected_index += 1;
			_col_loop_count++;
		}

		if ( check_left_pressed() ) {
			selected_index -= 1;
			_col_loop_count++;
		}
		
		if ( selected_index > MAX_EQUIPPED_SKILLS ) {
			selected_index = selected_index % (MAX_EQUIPPED_SKILLS + 1);
		}
		
		if ( selected_index < 0 ) {
			selected_index = (selected_index + MAX_EQUIPPED_SKILLS + 1) % (MAX_EQUIPPED_SKILLS + 1)
		}
		
		if (_row_loop_count / _half_list_length >= 1) {
			_row_loop_count = 0;
			_col_loop_count += _half_list_length;
		}
		
		if (_col_loop_count > MAX_EQUIPPED_SKILLS + 1 ) {
			break; // in case ALL the skills are unavailable we don't want to go infinite
		}
	 }
	 until  ( global.skill_targets_by_type[menu_skill_list[selected_index]] != skill_target_types.passive);
	
	if ( check_select_pressed() ) {
		var _selected_player_index = selected_player_index; // local copy for scoping
		global.battle.selected_actions[_selected_player_index] = menu_skill_list[selected_index];
		selected_index = -1;
		sprite_grid_x = 0;
		sprite_grid_y = 0;
		global.battle.next_menu_focus = battle_focus.target_player_select;
		with( obj_battle_player_menu ) {
			selected_index = 0;
			selected_actor_index = _selected_player_index; // when selected they are the action actor
		}
	}

	// Remember to reset the full battle state
	if (check_cancel_pressed()) {
		selected_index = -1;
		sprite_grid_x = 0;
		sprite_grid_y = 0;
		global.battle.next_menu_focus = battle_focus.player_select
	}
	
	// Whatever is selected gets the status description regardless of what you do here
	var _status_text = global.labels.skills[selected_player.equipped_skills[selected_index]][1];
	with (obj_battle_status){
		status_text = _status_text;
	}
	
}
