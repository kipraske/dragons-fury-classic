/// @description menu up and down
/// there is only one menu in this room so we don't have to check for focus

if ( keyboard_check_pressed(vk_down) == 1 ) {
	selected_index += 1;
}

if ( keyboard_check_pressed(vk_up) == 1 ) {
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
if ( max( keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space) ) == 1 ) {

	switch (selected_index) {
		case 0: // begin playing
			break;
		case 1: // open options menu
			break;
		case 2: { // Quit Game
			game_end();
			break;
		}
		case 3: {
			room_goto(battle_screen);
			break;
		}
	}
}