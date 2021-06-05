// Very similar to the title screen
if ( global.battle.menu_focus != battle_focus.pause_menu ) {
	selected_index = floor((mouse_y - y - padding) / menu_spacing );
	
	// Have a bit of wiggle room on the bottom, the top is taken care of in the step
	if ( selected_index > (menu_length - 1)) {
		selected_index = menu_length - 1
	}
}