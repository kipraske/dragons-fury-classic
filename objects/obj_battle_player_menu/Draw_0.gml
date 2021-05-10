/// @description Insert description here
// You can write your code in this editor

var _frontline_length = array_length(global.battle.player_frontline);
var _backline_length = array_length(global.battle.player_backline);
var _monster_length = array_length(global.battle.monster_units);


draw_dialog_box(x, y, x + menu_width -2, y + menu_height-2, c_blue);
draw_set_color(c_white);

// Labels Line
draw_set_font(ft_stat_heading);
draw_text_shadow( x + menu_sprite_gap + menu_width/3, y + 4, "HP");
draw_text_shadow( x + menu_sprite_gap + menu_width/2, y + 4, "MP");
draw_text_shadow( x + menu_sprite_gap + 2*menu_width/3, y + 4, "Action");

// Character Stats (actual menu)
draw_set_font(ft_default);
for ( var i = 0; i < _frontline_length; i++ ) {
	draw_text_shadow( x + menu_sprite_gap, y + menu_item_spacing*(i + 1) +2, global.battle.player_frontline[i].name);
}

draw_set_color(c_grey);
for ( var i = 0; i < _backline_length; i++ ) {
	draw_text_shadow( x + menu_sprite_gap, y + menu_item_spacing*(i + _frontline_length + 1), global.battle.player_backline[i].name);
}