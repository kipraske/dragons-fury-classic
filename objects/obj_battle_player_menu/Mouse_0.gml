//mouse_x is already bounded by the colision mask, we don't need to mess with it
// mouse_y = ystart + i*menu_spacing is the positioning menu, let's calculate i backwards:
if ( global.battle.menu_focus == battle_focus.player_select || global.battle.menu_focus == battle_focus.target_player_select ) {
	selected_index = floor((mouse_y - yy) / menu_item_spacing );
} else {
	global.battle.next_menu_focus = battle_focus.player_select;
}
