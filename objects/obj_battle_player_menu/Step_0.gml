if ( global.battle.menu_focus == battle_focus.player_select ) {
	
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
		// Switch focus to the action select menu
		global.battle.next_menu_focus = battle_focus.action_select;
		
		if (selected_index < array_length(global.battle.player_frontline) ){
			var _selected_player = global.battle.player_frontline[selected_index];
		} else {
			var _selected_player = global.battle.player_backline[selected_index];
		}
		
		//with (obj_battle_action_menu ){
		//	selected_index = 0;
		//  selected_player = _selected_player;
		//}

	}

	if (selected_index < 0 ) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.monster_select
		with (obj_battle_monster_menu){
			selected_index = array_length(global.battle.monster_units) - 1;
		}
	}

	if (selected_index >= menu_length) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.monster_select
		with (obj_battle_monster_menu){
			selected_index = 0;
		}
	}

}
