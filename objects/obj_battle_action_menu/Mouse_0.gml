// Note that the click box is only drawn for battle_focus.action_menu so we don't need to check for that here

// left_column (even indexes)
if ( mouse_x < 0.5*menu_width && mouse_x > 1 ) {
	selected_index = 2*floor((mouse_y - yy )/button_height);
}

// right_column (odd indexes)
if ( mouse_x < menu_width && mouse_x > 0.5*menu_width ) {
	selected_index = 2*floor((mouse_y - yy)/button_height) + 1;
}
