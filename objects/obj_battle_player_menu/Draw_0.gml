/// @description Insert description here
// You can write your code in this editor

var _frontline_length = array_length(global.battle.player_frontline);
var _backline_length = array_length(global.battle.player_backline);
var _monster_length = array_length(global.battle.monster_units);


draw_dialog_box(x+1, y+1, x + menu_width-2, y + menu_height-2, c_blue);
draw_set_color(c_white);

// Character Stats (actual menu)
for ( var i = 0; i < _frontline_length; i++ ) {
	draw_set_font(ft_default);
	draw_text_shadow( x + menu_sprite_gap, y + menu_item_spacing*i, global.battle.player_frontline[i].name);
	draw_set_font(ft_stat_heading);
	draw_text_shadow( x + menu_sprite_gap + 16, y + menu_item_spacing*i + hp_pos, "HP");
	draw_text_shadow( x + menu_sprite_gap + 16, y + menu_item_spacing*i + mp_pos, "MP");
	
	var _hp_percent = global.battle.player_frontline[i].battle_stats[stats.current_HP] / global.battle.player_frontline[i].battle_stats[stats.current_HP] * 100;
	draw_healthbar( x + menu_sprite_gap + 36, y + menu_item_spacing*i + hp_pos + 2, x + menu_width - 16, y + menu_item_spacing*i + hp_pos + 10, _hp_percent, c_grey, c_red, c_green, 0, true, true);
	var _mp_percent = global.battle.player_frontline[i].battle_stats[stats.current_MP] / global.battle.player_frontline[i].battle_stats[stats.current_MP] * 100;
	draw_healthbar( x + menu_sprite_gap + 36, y + menu_item_spacing*i + mp_pos + 2, x + menu_width - 16, y + menu_item_spacing*i + mp_pos + 10, _mp_percent, c_grey, c_navy, c_blue, 0, true, true);
}

// Backline characters are always at the bottom
draw_set_color(c_grey);
for ( var i = 0; i < _backline_length; i++ ) {
	draw_set_font(ft_default);
	draw_text_shadow( x + menu_sprite_gap, y + menu_item_spacing*(i + _frontline_length), global.battle.player_backline[i].name);
	draw_set_font(ft_stat_heading);
	draw_text_shadow( x + menu_sprite_gap + 16, y + menu_item_spacing*(i + _frontline_length) + hp_pos, "HP");
	draw_text_shadow( x + menu_sprite_gap + 16, y + menu_item_spacing*(i + _frontline_length) + mp_pos, "MP");
}

draw_sprite(spr_alfred_face, 0, 50, 50);