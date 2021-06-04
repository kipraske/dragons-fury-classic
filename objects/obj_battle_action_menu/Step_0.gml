/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

if ( global.battle.menu_focus == battle_focus.action_select ) {

	if (selected_index = -1 ) {
		selected_index = 0;
	}
	
	// ONLY swap available for backend units
	var menu_skill_list = fill_array(MAX_EQUIPPED_SKILLS + 1, skills.noskill);
	menu_skill_list[MAX_EQUIPPED_SKILLS] = skills.swap;
	
	// For frontend we have the unit skills + swap
	if (selected_player_index < array_length(global.battle.player_frontline) ) {
		menu_skill_list = selected_player.equipped_skills;
		menu_skill_list[MAX_EQUIPPED_SKILLS] = skills.swap;
	}

	// Lock in this frame's input so it doesn't change while we are looping for valid below
	var _down = check_down_pressed();
	var _up = check_up_pressed();
	var _right = check_right_pressed();
	var _left = check_left_pressed();

	// If the first element is not valid we need to seek the first valid one. We ALWAYS have swap
	// available so we should get to that at least
	while ( global.skill_targets_by_type[menu_skill_list[selected_index]] == skill_target_types.passive ) {
		selected_index++;	
	}

	// If the input is not valid, keep going until you find one
	do {
		if ( _down ) {
			selected_index += 2;
			// swap columns if needed
			if (selected_index > MAX_EQUIPPED_SKILLS && selected_index % 2 == 0){
				selected_index = 1;
			}
			else if (selected_index > MAX_EQUIPPED_SKILLS && selected_index % 2 == 1) {
				selected_index = 0;
			}
		}

		if ( _up ) {
			selected_index -= 2;
			// swap columns if needed
			if (selected_index < 0 && abs(selected_index) % 2 == 0){
				selected_index = MAX_EQUIPPED_SKILLS;
			}
			else if (selected_index < 0 && abs(selected_index) % 2 == 1) {
				selected_index = MAX_EQUIPPED_SKILLS - 1;	
			}
		}
	
		if ( _right ) {
			selected_index += 1;
		}

		if ( _left ) {
			selected_index -= 1;
		}
		
		if ( selected_index > MAX_EQUIPPED_SKILLS ) {
			selected_index = selected_index % (MAX_EQUIPPED_SKILLS + 1);
		}
		
		if ( selected_index < 0 ) {
			selected_index = (selected_index + MAX_EQUIPPED_SKILLS + 1) % (MAX_EQUIPPED_SKILLS + 1)
		}	
	}
	until  ( global.skill_targets_by_type[menu_skill_list[selected_index]] != skill_target_types.passive);
	
	// Whatever is selected gets the status description regardless of what you do here
	var _status_text = global.labels.skills[menu_skill_list[selected_index]][1];
	with (obj_battle_status){
		status_text = _status_text;
	}
	
	if ( check_select_pressed() || is_clicked ) {
		is_clicked = false;
		var _selected_player_index = selected_player_index; // local copy for scoping
		if ( global.skill_targets_by_type[menu_skill_list[selected_index]] != skill_target_types.passive ) {
			global.battle.selected_actions[_selected_player_index] = menu_skill_list[selected_index];
		
			with( obj_battle_player_menu ) {
				selected_index = 0;
				selected_actor_index = _selected_player_index; // when selected they are the action actor
			}
			with( obj_battle_monster_menu ) {
				selected_index = 0;
				selected_actor_index = _selected_player_index; // when selected they are the action actor
			}
			if ( global.skill_targets_by_type[menu_skill_list[selected_index]] == skill_target_types.defense ) {
				global.battle.next_menu_focus = battle_focus.target_player_select;
			} else { // it is an attack
				global.battle.next_menu_focus = battle_focus.target_monster_select;
			}
		
			selected_index = -1;
		}
	}

	// Remember to reset the full battle state
	if (check_cancel_pressed()) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.player_select
	}
	
}
