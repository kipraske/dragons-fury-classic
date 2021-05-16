/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

if ( global.battle.menu_focus == battle_focus.action_select ) {

	if (selected_index = -1 ) {
		selected_index = 0;
	}

	if ( check_down_pressed() ) {
		selected_index += 1;
	}

	if ( check_up_pressed() ) {
		selected_index -= 1;
	}
	
	if ( check_select_pressed() ) {
		// Move to select unit phase
	}

	if (check_cancel_pressed()) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.player_select
		with (obj_battle_player_menu){
			selected_index = 0;
		}
	}
}
