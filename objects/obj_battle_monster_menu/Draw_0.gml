
// Shows up by default, but is replaced by action select
if (global.battle.menu_focus != battle_focus.action_select ) {
	draw_set_color(c_white);
	draw_set_font(ft_default);
	draw_set_halign(fa_left);

	draw_dialog_box(xx+1, yy+1, xx + menu_width, yy + menu_height-2, c_blue);

	for (var i = 0; i < menu_length; i++){
		draw_text_shadow(xx + padding, yy + i*menu_spacing + padding, global.battle.monster_units[i].name);	
	}

}