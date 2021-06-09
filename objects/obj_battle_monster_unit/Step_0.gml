/// @description Insert description here
// You can write your code in this editor

// Kick off intro animation if we are in init phase
if ( global.battle.phase == battle_phase.init && start_intro_animation ) {
	start_intro_animation = false; // only start it once per animation
	is_intro_animation = true;
	//Start just off edge of screen (on lefT)
	x = xstart - room_width/3;
	direction = 0;
	speed = 10;
}

// Stop intro animation
if ( global.battle.phase == battle_phase.init && is_intro_animation ) {
	if ( x > xstart ) {
		speed = 0;
		x = xstart;
		is_intro_animation = false;
	}
}