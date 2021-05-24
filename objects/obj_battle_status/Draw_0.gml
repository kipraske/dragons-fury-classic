/// @description Insert description here
// You can write your code in this editor

if ( global.battle.menu_focus == battle_focus.action_select ) {
	
	draw_dialog_box(room_width/3, room_height - menu_height, room_width - 2, room_height - 2, c_blue);
	draw_set_halign(fa_center);
	draw_text_shadow( 2*room_width/3, room_height - text_offset, status_text);
	draw_set_halign(fa_left);

}
