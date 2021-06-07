/// @description Insert description here
// You can write your code in this editor

// Kick off intro animation if we are in init phase
if ( global.battle.phase == battle_phase.init && !is_intro_animation ) {
	is_intro_animation = true;
	// if intro animation, start at edge of screen
	x = room_width;
	direction = 180;
	speed = 5;
}

// Stop intro animation
if ( global.battle.phase == battle_phase.init && is_intro_animation ) {
	if ( x < xstart ) {
		x = xstart;
		is_intro_animation = false;
	}
}

show_debug_message(x);