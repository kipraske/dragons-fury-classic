/// @description Insert description here
// You can write your code in this editor

unit_index = -1;
unit = noone; // link to active unit

// Animation Starts and Stops
start_animation_speed = image_speed;
game_speed = game_get_speed(gamespeed_fps); // ideal fps

start_intro_animation = true; // Kicking off the intro animation right away
is_intro_animation = false;

// Attack variables
start_attack_animation = false;
is_attack_animation = false;
attack_animation_counter = 0;
num_hand1_attacks = 0;
num_hand2_attacks = 0;
single_attack_duration = game_speed * 0.2;
attack_counter = 0;
last_attack_count = 0;
damage_queue = [];

// Swap Animations
start_swap_animation = false;
is_swap_animation = false;
swap_animation_counter = 0;