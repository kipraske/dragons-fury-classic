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
		var _selected_player_index = selected_index;
		var _selected_player_is_frontend = false;
		var _selected_player_is_backend = false;
		
		if (selected_index < array_length(global.battle.player_frontline) ){
			var _selected_player = global.battle.player_frontline[_selected_player_index];
			var _selected_player_is_frontend = true;
		} else {
			var _selected_player = global.battle.player_backline[_selected_player_index - array_length(global.battle.player_frontline)];
			var _selected_player_is_backend = true;
		}
		
		with (obj_battle_action_menu ){
			selected_index = 0;
			selected_player_index = _selected_player_index;
			selected_player_is_frontend = _selected_player_is_frontend;
			selected_player_is_backend = _selected_player_is_backend;
			selected_player = _selected_player;
		}
	}
	
	if ( check_cancel_pressed() ){
		global.battle.next_menu_focus = battle_focus.pause_menu;
		with (obj_battle_pause_menu ){
			selected_index = 0;
		}
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

if ( global.battle.menu_focus == battle_focus.target_player_select ) {
	
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
		var _selected_player_index = selected_index;
		var _selected_player_is_frontend = false;
		var _selected_player_is_backend = false;
		
		if (selected_index < array_length(global.battle.player_frontline) ){
			var _selected_player = global.battle.player_frontline[_selected_player_index];
			var _selected_player_is_frontend = true;
		} else {
			var _selected_player = global.battle.player_backline[_selected_player_index - array_length(global.battle.player_frontline)];
			var _selected_player_is_backend = true;
		}

		global.battle.selected_targets[selected_actor_index] = _selected_player;
		global.battle.next_menu_focus = battle_focus.player_select;
		selected_actor_index = -1;
	}
	
	if ( check_cancel_pressed() ){
		global.battle.next_menu_focus = battle_focus.action_select;
	}

	var _actor_index = selected_actor_index; // local for scoping into monster menu

	if (selected_index < 0 ) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.target_monster_select
		with (obj_battle_monster_menu){
			selected_index = array_length(global.battle.monster_units) - 1;
			selected_actor_index = _actor_index;
		}
	}

	if (selected_index >= menu_length) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.target_monster_select
		with (obj_battle_monster_menu){
			selected_index = 0;
			selected_actor_index = _actor_index;
		}
	}

}
