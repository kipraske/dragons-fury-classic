/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor

if ( global.battle.menu_focus == battle_focus.action_select ) {

	if (selected_index = -1 ) {
		selected_index = 0;
	}

	if ( check_down_pressed() && sprite_grid_y < sprite_grid_max_y) {
		selected_index += 2;
		sprite_grid_y++;
	}

	if ( check_up_pressed() && sprite_grid_y > sprite_grid_min_y) {
		selected_index -= 2;
		sprite_grid_y--;
	}
	
	if ( check_right_pressed() && sprite_grid_x < sprite_grid_max_x) {
		selected_index += 1;
		sprite_grid_x++;
	}

	if ( check_left_pressed() && sprite_grid_x > sprite_grid_min_x) {
		selected_index -= 1;
		sprite_grid_x--;
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
	
	if (selected_index < 0 ) {
		selected_index = 0;
	}

	if (selected_index >= menu_length - 1) {
		selected_index = menu_length - 1;
	}
}
