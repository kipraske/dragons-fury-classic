/// @description Insert description here
// You can write your code in this editor

if (global.battle.menu_focus != battle_focus.pause_menu && global.battle.player_frontline[unit_index]._battle_stats[stats.current_HP] > 0) {
	with (obj_battle_player_menu ) {
		is_clicked = true;
	}
}