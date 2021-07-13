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
	
	// Note we ALWAYS combo even if the skill isn't an attack
	num_hand1_attacks = calculate_num_attacks( unit );
	hand1_anim_duration = single_attack_duration * num_hand1_attacks;
	

	if ( variable_struct_get(unit.equipment.hand2, "item_type") ) {
		num_hand2_attacks = ceil(num_hand1_attacks / 4 );
		hand2_anim_duration = single_attack_duration * num_hand2_attacks;
	} else {
		num_hand2_attacks = 0;
		hand2_anim_duration = 0;
	}
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
	if ( attack_animation_counter >= game_speed * 0.5 && attack_animation_counter < game_speed * 0.5 + hand1_anim_duration ) {
		image_index = 3;
		image_speed = 0;
		speed = 0;

		var tared_counter = attack_animation_counter - game_speed * 0.5	
		attack_counter = floor( tared_counter / single_attack_duration );

		if (attack_counter > last_attack_count) {
			// Note: apply damage data is now doing quite a bit of stuff here so I will note it here too:
			// Apply damage to the unit(s), stop attack if they are dead, and spawn animation sprites
			var interrupt_attack = apply_damage_data( unit, 1, num_hand1_attacks );
			if ( interrupt_attack ) {
				hand1_anim_duration = single_attack_duration; // Finish this animation
			}
			last_attack_count = attack_counter;
		}		
	}
	
	// And then the hand2 weapon
	if ( attack_animation_counter >= game_speed * 0.5 + hand1_anim_duration && attack_animation_counter < game_speed * 0.5 + hand1_anim_duration + hand2_anim_duration ) {
		speed = 0;
	}
	
	// Target Animation effect animation hand 1 ( cycles along with above)
	if ( attack_animation_counter >= game_speed * 0.6 && attack_animation_counter < game_speed * 0.6 + hand1_anim_duration ) {
		
	}



	// Target Animation effect animation hand 2
	if ( attack_animation_counter >= game_speed * 0.6 + hand1_anim_duration && attack_animation_counter < game_speed * 0.6 + hand1_anim_duration + hand2_anim_duration ) {
		
	}
	
	if ( attack_animation_counter >= game_speed * 0.75 && attack_animation_counter < game_speed * 1.5 ) {
		// Display Damage Numbers - for each attack
		
		// TODO we have to time this as well. Push them onto an array and loop through them -- since we are going to be showing like 4-5 at once
		// show_weapon = 0;
	}

	if ( attack_animation_counter >= game_speed * 1.0 + hand1_anim_duration + hand2_anim_duration && attack_animation_counter < game_speed * 1.5 + hand1_anim_duration + hand2_anim_duration) {
		direction = 0;
		image_speed = start_animation_speed;
		var distance_to_move = sprite_width;
		speed = sprite_width/(game_speed*0.5);
		if ( x > xstart ) { // sometimes rounding issues
			speed = 0;
		}
	}
	
	if ( attack_animation_counter > game_speed * 1.5 + hand1_anim_duration + hand2_anim_duration ) {
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