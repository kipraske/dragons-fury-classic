/// @description Insert description here
// You can write your code in this editor
if (global.battle.menu_focus != battle_focus.action_select &&  global.battle.menu_focus != battle_focus.target_player_select && global.battle.menu_focus != battle_focus.target_monster_select) {
	global.battle.next_menu_focus = battle_focus.execute_button;
}