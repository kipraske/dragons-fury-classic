// Note that the click box is only drawn for battle_focus.action_menu so we don't need to check for that here
// We do need to makes sure we don't select passive things

// left_column (even indexes)
if ( mouse_x < 0.5*menu_width && mouse_x > 1 ) {
	var _this_selected_index = 2*floor((mouse_y - yy )/button_height);
	if ( global.skill_targets_by_type[menu_skill_list[_this_selected_index]] != skill_target_types.passive ) {
		selected_index = _this_selected_index;
	}
}

// right_column (odd indexes)
if ( mouse_x < menu_width && mouse_x > 0.5*menu_width ) {
	var _this_selected_index = 2*floor((mouse_y - yy)/button_height) + 1;
	if ( global.skill_targets_by_type[menu_skill_list[_this_selected_index]] != skill_target_types.passive ) {
		selected_index = _this_selected_index;
	}
}
