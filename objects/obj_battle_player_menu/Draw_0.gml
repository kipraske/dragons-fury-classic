/// @description Insert description here
// You can write your code in this editor

var _frontline_length = array_length(global.battle.player_frontline);
var _backline_length = array_length(global.battle.player_backline);
var _monster_length = array_length(global.battle.monster_units);

// oops I am off a bit on the player section, give them a bit of room:
// also the -2 doesn't seem to be built into this menu like the others. Oh well. It works
draw_dialog_box(xx+1, yy+1, xx + menu_width-2, yy + menu_height-2 + menu_bottom_padding, c_blue);
draw_set_color(c_white);

// Character Stats and actions (actual menu)
for ( var i = 0; i < _frontline_length; i++ ) {
	var _is_unit_dead = false;
	var _is_unit_disabled = false;
	var _sprite_shading = c_white;
	if (global.battle.player_frontline[i]._battle_stats[stats.current_HP] <= 0) { // dead status
		_is_unit_dead = true;
		_sprite_shading = $888888;
	}
	
	draw_set_font(ft_default);
	draw_set_halign(fa_left);
	draw_text_shadow( xx + 3*menu_sprite_gap -2, yy + menu_item_spacing*i, global.battle.player_frontline[i].name);

	draw_sprite_ext(global.battle.player_frontline[i]._sprites.face, 0, xx + 2, yy + menu_item_spacing*i + sub_menu_spacing - 2, 1, 1, 0, _sprite_shading, 1);

	// Draw status icons on portrait
	if (_is_unit_dead) {
		draw_sprite(spr_skull_icon, 0, xx + 22, yy + 24 + menu_item_spacing*i);
	}

	// HP and MP Bars
	var _hp_percent = global.battle.player_frontline[i]._battle_stats[stats.current_HP] / global.battle.player_frontline[i]._battle_stats[stats.MAX_HP] * 100;
	draw_healthbar( xx + 3*menu_sprite_gap, yy + menu_item_spacing*i + hp_pos + 2, xx + menu_width - menu_left_padding, yy + menu_item_spacing*i + hp_pos + 10, _hp_percent, c_grey, c_red, c_green, 0, true, true);
	var _mp_percent = global.battle.player_frontline[i]._battle_stats[stats.current_MP] / global.battle.player_frontline[i]._battle_stats[stats.MAX_MP] * 100;
	draw_healthbar( xx + 3*menu_sprite_gap, yy + menu_item_spacing*i + mp_pos + 2, xx + menu_width - menu_left_padding, yy + menu_item_spacing*i + mp_pos + 10, _mp_percent, c_grey, c_navy, c_blue, 0, true, true);
	
	draw_set_font(ft_stat_heading);
	draw_text_shadow( xx + 3*menu_sprite_gap - 2, yy + menu_item_spacing*i + hp_pos - sub_menu_spacing, "HP");
	draw_text_shadow( xx + 3*menu_sprite_gap - 2, yy + menu_item_spacing*i + mp_pos - sub_menu_spacing, "MP");
	
	draw_set_halign(fa_right);
	draw_set_font(ft_damage);
	draw_text_shadow( xx + menu_width - menu_left_padding, yy + menu_item_spacing*i + 0.5*hp_pos, global.battle.player_frontline[i]._battle_stats[stats.current_HP]);
	draw_text_shadow( xx + menu_width - menu_left_padding, yy + menu_item_spacing*i + mp_pos, global.battle.player_frontline[i]._battle_stats[stats.current_MP]);

	// The selected skills
	if ( global.battle.player_frontline[i]._selected_action != skills.noskill && global.battle.player_frontline[i]._selected_target != noone) {
		draw_dialog_box(xx + menu_width -1, yy + menu_item_spacing*i + 2*sub_menu_spacing, xx + menu_width + 0.5*menu_width + 0.5*action_arrow_width -2, yy + menu_item_spacing*(i+1) - 0*sub_menu_spacing - 2, c_blue);
		draw_set_halign(fa_left);
		draw_set_font(ft_default);
		draw_text( xx + menu_width + menu_left_padding, yy + menu_item_spacing*i + action_top_padding, global.labels.skills[global.battle.player_frontline[i]._selected_action][0]);
		draw_text( xx + menu_width + menu_left_padding, yy + menu_item_spacing*i + action_top_padding + action_text_spacing, global.battle.player_frontline[i]._selected_target.name);
	}
	
	// Draw targeting icon with player unit selected Remember 2/9/4/9 settings. See object manager for positions
	if (global.battle.menu_focus == battle_focus.target_player_select && i = selected_index){
		draw_sprite(spr_exclamation_bubble, 0, room_width - 85, (i+1)*2*room_height/9 - 16)
	} else if (global.battle.menu_focus == battle_focus.player_select && i = selected_index){
		draw_sprite(spr_question_bubble, 0, room_width - 85, (i+1)*2*room_height/9 - 16)
	}
}

// Backline characters are always at the bottom
for ( var i = 0; i < _backline_length; i++ ) {
	var _is_unit_dead = false;
	var _is_unit_disabled = false;
	var _sprite_shading = $888888;
	if (global.battle.player_backline[i]._battle_stats[stats.current_HP] == 0) { // dead status
		_is_unit_dead = true;
	}
	
	draw_set_color(c_grey);
	draw_set_font(ft_default);
	draw_set_halign(fa_left);
	draw_text_shadow( xx + 3*menu_sprite_gap -2, yy + menu_item_spacing*(i + _frontline_length), global.battle.player_backline[i].name);
	
	draw_sprite_ext(global.battle.player_backline[i]._sprites.face, 0, xx + 2, yy + menu_item_spacing*(i + _frontline_length) + sub_menu_spacing - 2, 1, 1, 0, _sprite_shading, 1);
	
	// Draw status icons on portrait
	if (_is_unit_dead) {
		draw_sprite(spr_skull_icon, 0, xx + 22, yy + 24 + menu_item_spacing*(i + _frontline_length));
	}
	
	// HP and MP Bars
	var _hp_percent = global.battle.player_backline[i]._battle_stats[stats.current_HP] / global.battle.player_backline[i]._battle_stats[stats.current_HP] * 100;
	draw_healthbar( xx + 3*menu_sprite_gap, yy + menu_item_spacing*(i + _frontline_length) + hp_pos + 2, xx + menu_width - menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + hp_pos + 10, _hp_percent, c_grey, c_red, c_green, 0, true, true);
	var _mp_percent = global.battle.player_backline[i]._battle_stats[stats.current_MP] / global.battle.player_backline[i]._battle_stats[stats.current_MP] * 100;
	draw_healthbar( xx + 3*menu_sprite_gap, yy + menu_item_spacing*(i + _frontline_length) + mp_pos + 2, xx + menu_width - menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + mp_pos + 10, _mp_percent, c_grey, c_navy, c_blue, 0, true, true);

	draw_set_font(ft_stat_heading);
	draw_text_shadow( xx + 3*menu_sprite_gap - 2, yy + menu_item_spacing*(i + _frontline_length) + hp_pos - sub_menu_spacing, "HP");
	draw_text_shadow( xx + 3*menu_sprite_gap - 2, yy + menu_item_spacing*(i + _frontline_length) + mp_pos - sub_menu_spacing, "MP");

	draw_set_halign(fa_right);
	draw_set_font(ft_damage);
	draw_text_shadow( xx + menu_width - menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + 0.5*hp_pos, global.battle.player_backline[i]._battle_stats[stats.current_HP]);
	draw_text_shadow( xx + menu_width - menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + mp_pos, global.battle.player_backline[i]._battle_stats[stats.current_MP]);

	// The selected skills
	draw_set_color(c_white);
	if ( global.battle.player_backline[i]._selected_action != skills.noskill && global.battle.player_backline[i]._selected_target != noone ) {
		draw_dialog_box(xx + menu_width -1, yy + menu_item_spacing*(i + _frontline_length ) + 2*sub_menu_spacing, xx + menu_width + 0.5*menu_width + 0.5*action_arrow_width -2, yy + menu_item_spacing*(i + _frontline_length +1) - 0*sub_menu_spacing - 2, c_blue);
		draw_set_halign(fa_left);
		draw_set_font(ft_default);
		draw_text( xx + menu_width + menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + action_top_padding, global.labels.skills[global.battle.player_backline[i]._selected_action][0]);
		draw_text( xx + menu_width + menu_left_padding, yy + menu_item_spacing*(i + _frontline_length) + action_top_padding + action_text_spacing, global.battle.player_backline[i]._selected_target.name);
	}
}

if (global.battle.menu_focus == battle_focus.action_select ) {
	hand_sprite = spr_hand_grab_left;
	grab_hand_x_adjust = -8;
	grab_hand_y_adjust = -8;
} else {
	hand_sprite = spr_hand_icon_left;
	grab_hand_x_adjust = 0;
	grab_hand_y_adjust = 0;
}


// Draw the little hand, the x position is dynamic while xx is static above
if (global.battle.menu_focus == battle_focus.player_select || global.battle.menu_focus == battle_focus.target_player_select || global.battle.menu_focus == battle_focus.action_select ) {
	if ( selected_index != -1 ) {
		hand_y = yy + menu_item_spacing*selected_index + 0.5*menu_item_spacing - sprite_up_adjust + grab_hand_y_adjust;
		hand_x = menu_width - 8 + grab_hand_x_adjust;
		draw_sprite(hand_sprite, 0, hand_x, hand_y);
	}
}

// Mask for mouse
draw_self();