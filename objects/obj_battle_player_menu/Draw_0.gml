/// @description Insert description here
// You can write your code in this editor

var _frontline_length = array_length(global.battle.player_frontline);
var _backline_length = array_length(global.battle.player_backline);
var _monster_length = array_length(global.battle.monster_units);

draw_dialog_box(x, y, x + menu_width, y + menu_height, c_blue);

draw_set_color(c_white);
for ( var i = 0; i < _frontline_length; i++ ) {
	draw_text_shadow( x + menu_sprite_gap, y + menu_item_spacing*i +2, global.battle.player_frontline[i].name);
}

draw_set_color(c_grey);
for ( var i = 0; i < _backline_length; i++ ) {
	draw_text_shadow( x + menu_sprite_gap, y + menu_item_spacing*(i + _frontline_length ), global.battle.player_backline[i].name);
}