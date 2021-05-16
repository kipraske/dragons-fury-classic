/// @description Insert description here
// You can write your code in this editor

var _frontline_length = array_length(global.battle.player_frontline);
var _backline_length = array_length(global.battle.player_backline);
var _monster_length = array_length(global.battle.monster_units);

// oops I am off a bit on the player section, give them a bit of room:
// also the -2 doesn't seem to be built into this menu like the others. Oh well. It works
draw_dialog_box(xx+1, yy+1, xx + menu_width-2, yy + menu_height-2 + menu_bottom_padding, c_blue);
draw_set_color(c_white);

// Character Stats (actual menu)
for ( var i = 0; i < _frontline_length; i++ ) {
	draw_set_font(ft_default);
	draw_set_halign(fa_left);
	draw_text_shadow( xx + 3*menu_sprite_gap -2, yy + menu_item_spacing*i, global.battle.player_frontline[i].name);

	draw_sprite(global.battle.player_frontline[i].sprites.face, 0, xx + 2, yy + menu_item_spacing*i + sub_menu_spacing - 2);

	var _hp_percent = global.battle.player_frontline[i].battle_stats[stats.current_HP] / global.battle.player_frontline[i].battle_stats[stats.current_HP] * 100;
	draw_healthbar( xx + 3*menu_sprite_gap, yy + menu_item_spacing*i + hp_pos + 2, xx + menu_width - menu_left_padding, yy + menu_item_spacing*i + hp_pos + 10, _hp_percent, c_grey, c_red, c_green, 0, true, true);
	var _mp_percent = global.battle.player_frontline[i].battle_stats[stats.current_MP] / global.battle.player_frontline[i].battle_stats[stats.current_MP] * 100;
	draw_healthbar( xx + 3*menu_sprite_gap, yy + menu_item_spacing*i + mp_pos + 2, xx + menu_width - menu_left_padding, yy + menu_item_spacing*i + mp_pos + 10, _mp_percent, c_grey, c_navy, c_blue, 0, true, true);
	
	draw_set_font(ft_stat_heading);
	draw_text_shadow( xx + 3*menu_sprite_gap - 2, yy + menu_item_spacing*i + hp_pos - sub_menu_spacing, "HP");
	draw_text_shadow( xx + 3*menu_sprite_gap - 2, yy + menu_item_spacing*i + mp_pos - sub_menu_spacing, "MP");
	
	draw_set_halign(fa_right);
	draw_set_font(ft_damage);
	draw_text_shadow( xx + menu_width - menu_left_padding, yy + menu_item_spacing*i + 0.5*hp_pos, global.battle.player_frontline[i].battle_stats[stats.current_HP]);
	draw_text_shadow( xx + menu_width - menu_left_padding, yy + menu_item_spacing*i + mp_pos, global.battle.player_frontline[i].battle_stats[stats.current_MP]);
}

// Backline characters are always at the bottom
draw_set_color(c_grey);
for ( var i = 0; i < _backline_length; i++ ) {
	draw_set_font(ft_default);
	draw_set_halign(fa_left);
	draw_text_shadow( xx + 3*menu_sprite_gap -2, yy + menu_item_spacing*(i + _frontline_length), global.battle.player_backline[i].name);
	
	draw_sprite(global.battle.player_backline[i].sprites.face, 0, xx + 2, yy + menu_item_spacing*(i + _frontline_length) + sub_menu_spacing - 2);
	
	var _hp_percent = global.battle.player_backline[i].battle_stats[stats.current_HP] / global.battle.player_backline[i].battle_stats[stats.current_HP] * 100;
	draw_healthbar( xx + 3*menu_sprite_gap, yy + menu_item_spacing*(i + _frontline_length) + hp_pos + 2, xx + menu_width - menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + hp_pos + 10, _hp_percent, c_grey, c_red, c_green, 0, true, true);
	var _mp_percent = global.battle.player_backline[i].battle_stats[stats.current_MP] / global.battle.player_backline[i].battle_stats[stats.current_MP] * 100;
	draw_healthbar( xx + 3*menu_sprite_gap, yy + menu_item_spacing*(i + _frontline_length) + mp_pos + 2, xx + menu_width - menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + mp_pos + 10, _mp_percent, c_grey, c_navy, c_blue, 0, true, true);

	draw_set_font(ft_stat_heading);
	draw_text_shadow( xx + 3*menu_sprite_gap - 2, yy + menu_item_spacing*(i + _frontline_length) + hp_pos - sub_menu_spacing, "HP");
	draw_text_shadow( xx + 3*menu_sprite_gap - 2, yy + menu_item_spacing*(i + _frontline_length) + mp_pos - sub_menu_spacing, "MP");

	draw_set_halign(fa_right);
	draw_set_font(ft_damage);
	draw_text_shadow( xx + menu_width - menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + 0.5*hp_pos, global.battle.player_backline[i].battle_stats[stats.current_HP]);
	draw_text_shadow( xx + menu_width - menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + mp_pos, global.battle.player_backline[i].battle_stats[stats.current_MP]);
}

// Draw the little hand, the x position is dynamic while xx is static above
if ( selected_index != -1 ) {
	y = yy + menu_item_spacing*selected_index + 0.5*menu_item_spacing - sprite_up_adjust;
	x = menu_width - 8;
	draw_self();
}