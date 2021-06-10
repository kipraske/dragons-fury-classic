//mouse_x is already bounded by the colision mask, we don't need to mess with it
// mouse_y = ystart + i*menu_spacing is the positioning menu, let's calculate i backwards:
if ( global.battle.menu_focus == battle_focus.player_select || global.battle.menu_focus == battle_focus.target_player_select ) {
	selected_index = floor((mouse_y - yy) / menu_item_spacing );
} else if ( global.battle.menu_focus != battle_focus.pause_menu && global.battle.menu_focus == battle_focus.target_monster_select ){
	global.battle.next_menu_focus = battle_focus.target_player_select;
} else if ( global.battle.menu_focus != battle_focus.pause_menu ) {
	global.battle.next_menu_focus = battle_focus.player_select;
}
