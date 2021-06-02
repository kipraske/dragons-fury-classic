
// Shows up by default, but is replaced by action select
if (global.battle.menu_focus != battle_focus.action_select ) {
	draw_set_color(c_white);
	draw_set_font(ft_default);
	draw_set_halign(fa_left);

	draw_dialog_box(xx+1, yy+1, xx + menu_width, yy + menu_height-2, c_blue);

	for (var i = 0; i < menu_length; i++){
		
		if ( global.battle.monster_units[i].battle_stats[stats.current_HP] == 0) { // dead
			draw_set_color(c_grey);
		}
		
		draw_text_shadow(xx + padding, yy + i*menu_spacing + padding, global.battle.monster_units[i].name);
		
		// Draw targeting icon with this monster selected wehther targeting or standard
		if (i = selected_index){
			var _monst_coord = get_monster_cooridinates(global.battle.monster_layout);
			var _select_offset_x = global.battle.monster_units[i].select_coord[0];
			var _select_offset_y = global.battle.monster_units[i].select_coord[1];
			if ( global.battle.menu_focus = battle_focus.target_monster_select ) {
				draw_sprite(spr_exclamation_bubble, 0, _monst_coord[i][0] + _select_offset_x, _monst_coord[i][1] + _select_offset_y);
			} else if (global.battle.menu_focus = battle_focus.monster_select) {
				draw_sprite(spr_question_bubble, 0, _monst_coord[i][0] + _select_offset_x, _monst_coord[i][1] + _select_offset_y);
			}
		}
		
		draw_set_color(c_white);
	}
	
	// Draw the little hand
	if ( selected_index != -1 && ( global.battle.menu_focus == battle_focus.monster_select || global.battle.menu_focus == battle_focus.target_monster_select )) {
		hand_y = yy + menu_spacing*selected_index + 0.5*menu_spacing - sprite_up_adjust;
		hand_x = string_width(global.battle.monster_units[selected_index].name) + padding + 4;
		draw_sprite(spr_hand_icon_left, 0, hand_x, hand_y);
	}
}