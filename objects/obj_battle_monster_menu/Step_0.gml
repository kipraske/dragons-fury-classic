/// @description Insert description here
// You can write your code in this editor

if ( global.battle.menu_focus == battle_focus.monster_select && global.battle.menu_focus != battle_focus.action_select ) {

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
		// Open known monster stats
	}
	
	if ( check_cancel_pressed() ){
		global.battle.next_menu_focus = battle_focus.pause_menu;
		with (obj_battle_pause_menu ){
			selected_index = 0;
		}
	}

	if (selected_index < 0 ) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.player_select
		with (obj_battle_player_menu){
			selected_index = array_length(global.battle.monster_units) - 1;
		}
	}

	if (selected_index >= menu_length) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.player_select
		with (obj_battle_player_menu){
			selected_index = 0;
		}
	}

}

if ( global.battle.menu_focus == battle_focus.target_monster_select && global.battle.menu_focus != battle_focus.action_select ) {

	if (selected_index = -1 ) {
		selected_index = 0;
	}

	if ( check_down_pressed() ) {
		selected_index += 1;
	}

	if ( check_up_pressed() ) {
		selected_index -= 1;
	}
	
	var _actor_index = selected_actor_index; // local for scoping back into player menu (if needed)
	
	if ( check_select_pressed() ) {
		global.battle.selected_targets[selected_actor_index] = global.battle.monster_units[selected_index];
		global.battle.next_menu_focus = battle_focus.player_select;
		with (obj_battle_player_menu){
			selected_index = _actor_index; // send you right back where you were
		}
		selected_actor_index = -1;
	}
	
	if ( check_cancel_pressed() ){
		global.battle.next_menu_focus = battle_focus.action_select;
	}

	if (selected_index < 0 ) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.target_player_select
		with (obj_battle_player_menu){
			selected_index = array_length(global.battle.monster_units) - 1;
			selected_actor_index = _actor_index;
		}
	}

	if (selected_index >= menu_length) {
		selected_index = -1;
		global.battle.next_menu_focus = battle_focus.target_player_select
		with (obj_battle_player_menu){
			selected_index = 0;
			selected_actor_index = _actor_index;
		}
	}

}
