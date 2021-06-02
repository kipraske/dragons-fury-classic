//mouse_x is already bounded by the colision mask, we don't need to mess with it
// mouse_y = ystart + i*menu_spacing is the positioning menu, let's calculate i backwards:
i = floor((mouse_y - yy) / menu_item_spacing );

selected_index = i;
