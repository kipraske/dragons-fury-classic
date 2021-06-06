/// @description Insert description here
// You can write your code in this editor

if (global.battle.menu_focus != battle_focus.pause_menu && global.battle.monster_units[unit_index].battle_stats[stats.current_HP] > 0) {
	var _unit_index = unit_index;
	
	if (global.battle.menu_focus != battle_focus.monster_select && global.battle.menu_focus != battle_focus.target_monster_select ) {
		global.battle.next_menu_focus = battle_focus.monster_select;
	}
	
	with (obj_battle_monster_menu ) {
		selected_index = _unit_index;
	}
}