/// @description Insert description here
// You can write your code in this editor



// Kick off intro animation if we are in init phase
if ( global.battle.phase == battle_phase.init && start_intro_animation ) {
	start_intro_animation = false; // only start it once per animation
	is_intro_animation = true;
	//Start just off edge of screen
	x = room_width + sprite_width;
	direction = 180;
	var time = game_speed*1; // fps * animation time = 1 sec
	speed = (x - xstart)/time;
}

// Stop intro animation
if ( is_intro_animation ) {
	if ( x < xstart ) {
		speed = 0;
		x = xstart;
		is_intro_animation = false;
	}
}

// Initialize the attack animation
if ( global.battle.phase = battle_phase.execute_unit_action && start_attack_animation ) {
	// Initialize attack animation
	start_attack_animation = false;
	is_attack_animation = true;
	show_debug_message("Attack Animation Start");
	
	// Get the number of attacks from unit
}

// Play attack animation
if ( is_attack_animation ) {
	// Move forward a bit
	if ( attack_animation_counter < game_speed * 0.5 ) {
		direction = 180;
		var distance_to_move = sprite_width;
		speed = sprite_width/(game_speed*0.5);
		if ( x < xstart - distance_to_move ) { // sometimes rounding issues
			speed = 0;
		}
	}

	// Show the weapon and swing it (or poke it etc, depending on type)
	if ( attack_animation_counter >= game_speed * 0.5 && attack_animation_counter < game_speed * 0.75 ) {
		image_index = 3;
		image_speed = 0;
		speed = 0;
	}
	
	// And then the hand2 weapon
	if ( attack_animation_counter >= game_speed * 0.75 && attack_animation_counter < game_speed * 1.0 ) {
		speed = 0;
	}
	
	// Target Animation effect animation hand 1
	if ( attack_animation_counter >= game_speed * 0.6 && attack_animation_counter < game_speed * 0.85 ) {
		
	}
	
	// Target Animation effect animation hand 2
	if ( attack_animation_counter >= game_speed * 0.85 && attack_animation_counter < game_speed * 1.1 ) {
		
	}
	
	if ( attack_animation_counter >= game_speed * 0.75 && attack_animation_counter < game_speed * 1.5 ) {
		// Display Damage Numbers - for each attack
		show_weapon = 0;
	}
	
	// TODO - apply damage numbers gradually in this animation here
	if ( attack_animation_counter >= game_speed * 1.0 && attack_animation_counter < game_speed * 1.5 ) {
		direction = 0;
		image_speed = start_animation_speed;
		var distance_to_move = sprite_width;
		speed = sprite_width/(game_speed*0.5);
		if ( x > xstart ) { // sometimes rounding issues
			speed = 0;
		}
	}
	
	if ( attack_animation_counter > game_speed * 1.5 ) {
		show_debug_message("Attack Animation End")
		x = xstart;
		speed = 0;
		is_attack_animation = false;
		attack_animation_counter = 0;
		attack_damage_data = [0, 0]
		global.battle.phase = battle_phase.check_win_lose; // we check at tthe end of EVERY turn
	} else {	
		attack_animation_counter++
	}
}