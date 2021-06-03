

// mouse_x and mouse_y are more complicated here because of the two columns:

// left_column
if ( mouse_x < 0.5*menu_width && mouse_x > 1 ) {
	// mouse_y = yy + 1 + button_height*(1 + i/2)
	selected_index = floor(2*(mouse_y - yy - 1 - button_height)/button_height);
	show_debug_message("left col!");
}

// right_column
if ( mouse_x < menu_width && mouse_x > 0.5*menu_width ) {
	// mouse_y = yy + 1 + button_height*(1 + (i-1)/2)
	selected_index = floor((2*(mouse_y - yy - 1)/button_height) - 1);
	show_debug_message("right col!");
}

show_debug_message(selected_index)


//if ( global.battle.menu_focus != battle_focus.action_select ) {
//	i = floor((mouse_y - yy - padding) / menu_spacing );
//	selected_index = i;
	
//	if ( global.battle.menu_focus == battle_focus.target_monster_select || global.battle.menu_focus == battle_focus.target_player_select ) {
//	global.battle.next_menu_focus = battle_focus.target_monster_select;
//	} else {
//		global.battle.next_menu_focus = battle_focus.monster_select;
//	}
//}