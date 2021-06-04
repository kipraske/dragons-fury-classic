/// @description menu up and down

if (global.battle.menu_focus == battle_focus.pause_menu ) {

	if (selected_index < 0) {
		selected_index = 0;
	}

	if ( check_down_pressed() ) {
		selected_index += 1;
	}

	if ( check_up_pressed() ) {
		selected_index -= 1;
	}

	// Rotate around the menu
	if (selected_index < 0 ) {
		selected_index = array_length(menu_items) - 1;
	}

	if (selected_index >= array_length(menu_items)) {
		selected_index = 0;
	}

	// Execute menu item
	if ( check_select_pressed() || is_clicked ) {
		is_clicked = false;
		switch (selected_index) {
			case 0: // Continue -- same as cancel below
				global.battle.next_menu_focus = battle_focus.player_select;
				with (obj_battle_player_menu ){
					selected_index = 0;
				}
			case 1: // Save State -- TODO later
				break;
			case 2: // Options
				break;
			case 3: { // Abandon Battle -- TODO go back to map and undo temp
				game_end();
				break;
			}
		}
	}
	
	if (check_cancel_pressed() ){
		global.battle.next_menu_focus = battle_focus.player_select;
		with (obj_battle_player_menu ){
			selected_index = 0;
		}
	}
}