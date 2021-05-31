///@desc holding to show little arrow

//mouse_x is already bounded by the colision mask, we don't need to mess with it
// mouse_y = ystart + i*menu_spacing is the positioning menu, let's calculate i backwards:
i = floor((mouse_y - ystart) / menu_spacing );
show_debug_message(mouse_y);

if ( i >= 0 && i < array_length(menu_items) ) {
	selected_index = i;
}