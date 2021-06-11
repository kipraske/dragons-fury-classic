/// @description Insert description here
// You can write your code in this editor

var game_speed = game_get_speed(gamespeed_fps); // ideal fps

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

if ( global.battle.phase = battle_phase.execute_unit_action && start_attack_animation ) {
	// Initialize attack animation
	start_attack_animation = false;
	is_attack_animation = true;
	
	// TODO - make sure we start the animation on the right sprite frame so we end in the right place
}

if ( is_attack_animation ) {

	if ( attack_animation_counter < game_speed * 1 ) {
		// Walk forward a bit
	}
	
	if ( attack_animation_counter >= game_speed * 1 && attack_animation_counter < game_speed * 1.5 ) {
		// Swing Weapon attack
	}
	
	if ( attack_animation_counter >= game_speed * 1.2 && attack_animation_counter < game_speed * 1.7 ) {
		// Target Animation VS
	}
	
	if ( attack_animation_counter >= game_speed * 1.7 && attack_animation_counter < game_speed * 3 ) {
		// Display Damage Numbers
	}
	
	if ( attack_animation_counter >= game_speed * 2 && attack_animation_counter < game_speed * 2.5 ) {
		// Walk back to spot
	}
	
	if ( attack_animation_counter > game_speed * 3 ) {
		is_intro_animation = false;
		attack_animation_counter = 0;
		global.battle.phase = battle_phase.execute_turn;
	} else {	
		attack_animation_counter++
	}
}