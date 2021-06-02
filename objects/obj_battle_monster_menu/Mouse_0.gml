//mouse_x is already bounded by the colision mask, we don't need to mess with it
// mouse_y = ystart + i*menu_spacing is the positioning menu, let's calculate i backwards:
if ( global.battle.menu_focus != battle_focus.action_select ) {
	global.battle.next_menu_focus = battle_focus.monster_select;
	i = floor((mouse_y - yy - padding) / menu_spacing );
	selected_index = i;
	show_debug_message(i);
}