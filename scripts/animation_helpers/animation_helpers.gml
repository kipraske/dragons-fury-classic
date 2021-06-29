// Animations to be used in the draw function. That are too complicated to repeat there
// These all take a counter and run through it based on that.

function animate_weapon_attack( weapon, start_counter, repeat_frames ) {

	var weapon_sprite_set = get_weapon_sprites( weapon.item_type, weapon.item_tier );
	show_debug_message(weapon_sprite_set);
	
	draw_sprite_ext( weapon_sprite_set[0], 0, x, y, 1, 1, 0, c_white, 1 );
	draw_text(x, y, weapon);
}