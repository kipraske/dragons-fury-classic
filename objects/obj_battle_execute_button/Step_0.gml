/// @description Insert description here
// You can write your code in this editor

if ( global.battle.menu_focus == battle_focus.execute_button ) {

	if ( check_up_pressed() || check_down_pressed() ) {
		global.battle.next_menu_focus = battle_focus.player_select;
	}
	
	if ( check_right_pressed() || check_left_pressed() ) {
		global.battle.next_menu_focus = battle_focus.monster_select;
	}
	
	if ( check_select_pressed() || is_clicked ) {
		is_clicked = false;
		global.battle.phase = battle_phase.set_up_turn_order;
	}
}