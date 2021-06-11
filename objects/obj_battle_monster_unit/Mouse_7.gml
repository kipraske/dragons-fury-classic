/// @description Insert description here
// You can write your code in this editor

if (global.battle.menu_focus != battle_focus.pause_menu && global.battle.monster_units[unit_index]._battle_stats[stats.current_HP] > 0) {
	with (obj_battle_monster_menu ) {
		is_clicked = true;
	}
}