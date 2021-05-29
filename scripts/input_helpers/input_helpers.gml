// At the moment this isn't that useful, but eventually we will need to handle
// both controller axes, dpad, keyboard, mouse, and touch controls
// So just make some functions to get them regardless of where the input comes from
// The mouse/touch functions are going to be triggered via the object events always.

// To make things easy, and since it is a single player game. ALL game pad inputs will register input

// @desc returns connected controller index if it is connected, and -1 if there isn't one
function get_connected_controller_index() {
	var gp_num = gamepad_get_device_count();
	var button_pressed = 0;
	for ( var i = 0; i < gp_num; i++ ) {
		if gamepad_is_connected(i) {
			return i;
		} else { 
			return -1;
		}
	}
}

function check_up_pressed(){
	return (keyboard_check_pressed(vk_up) == 1);
}

function check_right_pressed(){
	return (keyboard_check_pressed(vk_right) == 1);
}

function check_down_pressed(){
	return (keyboard_check_pressed(vk_down) == 1);
}

function check_left_pressed(){
	return (keyboard_check_pressed(vk_left) == 1);
}

function check_select_pressed() {
	var gamepad_button_index = get_connected_controller_index();
	var is_gamepad_button = 0;
	if ( gamepad_button_index > 0 ) {
		is_gamepad_button = max(gamepad_button_check_pressed(gamepad_button_index, gp_face2), gamepad_button_check_pressed(gamepad_button_index, gp_face3));
	}
	
	show_debug_message(gamepad_button_index);
	
	return (max(
		keyboard_check_pressed(vk_enter),
		keyboard_check_pressed(vk_space),
		is_gamepad_button,
		) == 1);
}

function check_cancel_pressed() {
	return (max( 
		keyboard_check_pressed(vk_escape), 
		gamepad_button_check_pressed(0, gp_face1),
		gamepad_button_check_pressed(0, gp_face4),
		) == 1);
}

// TODO - do we need start/stop buttons?
function check_pause_pressed() {
	return keyboard_check_pressed(vk_escape) == 1;
}

