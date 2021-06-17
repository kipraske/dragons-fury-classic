/// @description Draws the players on the left

// Basic Player Draw
if ( global.battle.player_frontline[unit_index]._battle_stats[stats.current_HP] > 0) { // dead status
	draw_self();
}

if ( show_weapon > 0 ) {
	// draw_sprite_ext( get_weapon_sprite( equipment.hand1 ), 0, x, y, 1, 1, 0, c_white, 1 );
	draw_sprite_ext( sword_rare, 0, x, y, 1, 1, 0, c_white, 1 );
}

if ( is_attack_animation ) {
	// Show the hand 1 weapon and swing it (or poke it etc, depending on type)
	if ( attack_animation_counter >= game_speed * 0.5 && attack_animation_counter < game_speed * 0.75 ) {
		animate_weapon_attack( unit.equipment.hand1, attack_animation_counter - game_speed * 0.5);
	}
	
	// And then the hand2 weapon
	if ( attack_animation_counter >= game_speed * 0.75 && attack_animation_counter < game_speed * 1.0 ) {
		animate_weapon_attack( unit.equipment.hand1, attack_animation_counter - game_speed * 0.75);
	}
	
	// Target Animation effect animation hand 1
	if ( attack_animation_counter >= game_speed * 0.6 && attack_animation_counter < game_speed * 0.85 ) {
		
	}
	
	// Target Animation effect animation hand 2
	if ( attack_animation_counter >= game_speed * 0.85 && attack_animation_counter < game_speed * 1.1 ) {
		
	}
	
	if ( attack_animation_counter >= game_speed * 0.75 && attack_animation_counter < game_speed * 1.5 ) {
		
	}
	
	// TODO - apply damage numbers gradually in this animation here
	if ( attack_animation_counter >= game_speed * 1.0 && attack_animation_counter < game_speed * 1.5 ) {

	}
}