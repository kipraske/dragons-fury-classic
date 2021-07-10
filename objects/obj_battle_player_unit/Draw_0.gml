/// @description Draws the players on the left

// Basic Player Draw
if ( global.battle.player_frontline[unit_index]._battle_stats[stats.current_HP] > 0) { // dead status
	draw_self();
}

if ( is_attack_animation ) {
	//draw_text(x, y-10, num_hand1_attacks);
	//draw_text(x+25, y-10, num_hand2_attacks);
	
	// Show the hand 1 weapon and swing it (or poke it etc, depending on type)
	if ( attack_animation_counter >= game_speed * 0.5 && attack_animation_counter < game_speed * 0.5 + hand1_anim_duration ) {
		animate_weapon_attack( unit.equipment.hand1, attack_animation_counter - game_speed * 0.5, single_attack_duration ); // using a 0.2 sec animation to start with
	}
	
	// And then the hand2 weapon
	if ( attack_animation_counter >= game_speed * 0.5 + hand1_anim_duration && attack_animation_counter < game_speed * 0.5 + hand1_anim_duration + hand2_anim_duration ) {
		animate_weapon_attack( unit.equipment.hand2, attack_animation_counter - game_speed * 0.5 + hand1_anim_duration, single_attack_duration);
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