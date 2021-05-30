// At the moment this isn't that useful, but eventually we will need to handle
// both controller axes, dpad, keyboard, mouse, and touch controls
// So just make some functions to get them regardless of where the input comes from
// The mouse/touch functions are going to be triggered via the object events always.

// To make things easy, and since it is a single player game. ALL game pad inputs will register input

function init_gamepad_axis_pressed() {
	global.last_axis_pressed = {
		lv: 0,
		lh: 0,
	}
	global.axis_pressed = {
		lv: 0,
		lh: 0
	}
}

function gamepad_axis_pressed( device, axis ) {
	switch (axis) {
		case gp_axislv:
			global.axis_pressed.lv = sign(gamepad_axis_value(device, gp_axislv))
			if ( global.axis_pressed.lv != global.last_axis_pressed.lv ) {
				global.last_axis_pressed.lv = global.axis_pressed.lv;
				return global.axis_pressed.lv;
			} else {
				return 0;
			}
		case gp_axislh:
			global.axis_pressed.lh = sign(gamepad_axis_value(device, gp_axislh))
			if ( global.axis_pressed.lh != global.last_axis_pressed.lh ) {
				global.last_axis_pressed.lh = global.axis_pressed.lh;
				return global.axis_pressed.lh;
			} else {
				return 0;
			}
	}
}

function check_up_pressed(){
	var _axis_up = 0;
	if ( gamepad_axis_pressed(0, gp_axislv) < 0) {
		_axis_up = 1;
	}

	return (max(
		keyboard_check_pressed(vk_up),
		gamepad_button_check_pressed(0, gp_padu), 
		_axis_up
		) == 1);
}

function check_right_pressed(){	
	var _axis_right = 0;
	if ( gamepad_axis_pressed(0, gp_axislh) > 0) {
		_axis_right = 1;
	}

	return (max(
		keyboard_check_pressed(vk_right),
		gamepad_button_check_pressed(0, gp_padr), 
		_axis_right
		) == 1);
}

function check_down_pressed(){	
	var _axis_down = 0;
	if ( gamepad_axis_pressed(0, gp_axislv) > 0) {
		_axis_down = 1;
	}

	return (max(
		keyboard_check_pressed(vk_down),
		gamepad_button_check_pressed(0, gp_padd), 
		_axis_down
		) == 1);
}

function check_left_pressed(){
	var _axis_left = 0;
	if ( gamepad_axis_pressed(0, gp_axislh) < 0) {
		_axis_left = 1;
	}

	return (max(
		keyboard_check_pressed(vk_left),
		gamepad_button_check_pressed(0, gp_padl), 
		_axis_left
		) == 1);
}

function check_select_pressed() {	
	return (max(
		keyboard_check_pressed(vk_enter),
		keyboard_check_pressed(vk_space),
		gamepad_button_check_pressed(0, gp_face2), 
		gamepad_button_check_pressed(0, gp_face3)
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

