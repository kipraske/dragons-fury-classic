/// @description Draws the players on the left

// Basic Player Draw
if ( global.battle.player_frontline[unit_index]._battle_stats[stats.current_HP] > 0) { // dead status
	draw_self();
}

if ( show_weapon > 0 ) {
	// draw_sprite_ext( get_weapon_sprite( equipment.hand1 ), 0, x, y, 1, 1, 0, c_white, 1 );
	draw_sprite_ext( sword_rare, 0, x, y, 1, 1, 0, c_white, 1 );
}

if ( attack_animation_counter > 0 ) {
	draw_text(x, y, "attack animation go!");
}