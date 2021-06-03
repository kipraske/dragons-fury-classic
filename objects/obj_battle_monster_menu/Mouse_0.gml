//mouse_x is already bounded by the colision mask, we don't need to mess with it
// mouse_y = ystart + i*menu_spacing is the positioning menu, let's calculate i backwards:
if ( global.battle.menu_focus != battle_focus.action_select ) {
	selected_index = floor((mouse_y - yy - padding) / menu_spacing );
	
	if ( global.battle.menu_focus == battle_focus.target_monster_select || global.battle.menu_focus == battle_focus.target_player_select ) {
	global.battle.next_menu_focus = battle_focus.target_monster_select;
	} else {
		global.battle.next_menu_focus = battle_focus.monster_select;
	}
}