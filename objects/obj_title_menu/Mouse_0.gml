///@desc holding to show little arrow

//mouse_x is already bounded by the colision mask, we don't need to mess with it
// mouse_y = ystart + i*menu_spacing is the positioning menu, let's calculate i backwards:
selected_index = floor((mouse_y - ystart) / menu_spacing );