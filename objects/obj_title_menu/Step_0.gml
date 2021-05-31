/// @description menu up and down
/// there is only one menu in this room so we don't have to check for focus

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