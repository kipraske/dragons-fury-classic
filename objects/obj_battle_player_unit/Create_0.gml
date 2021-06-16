/// @description Insert description here
// You can write your code in this editor

unit_index = -1;

// Animation Starts and Stops
start_animation_speed = image_speed;

start_intro_animation = true; // Kicking off the intro animation right away
is_intro_animation = false;

// We need to know who is going to get targeted, what spirtes to use etc.
animation_actor = noone;
animation_target = noone;
animation_skill = skills.noskill;

// Attack animations
start_attack_animation = false;
attack_animation_counter = 0;
is_attack_animation = false;
attack_damage_data = [0, 0];
show_weapon = false;
equipment = {
	hand1: {},
	hand2: {},
	armor: {},
	accessory: {}
}

// Swap Animations
start_swap_animation = false;
swap_animation_counter = 0;
is_swap_animation = false;