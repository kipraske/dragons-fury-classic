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
