// At the moment this isn't that useful, but eventually we will need to handle
// both controller axes, dpad, keyboard, mouse, and touch controls
// So just make some functions to get them regardless of where the input comes from
// The mouse/touch functions are going to be triggered via the object events always.

// To make things easy, and since it is a single player game. ALL game pad inputs will register input

function init_gamepad_axis_pressed_as_button() {
	global.last_axis_as_button = 0;
	global.axis_frame_hold = false;
}

// @desc making the analog sticks work like gamepad_button_check_pressed
// i.e. we want one input registered and then it stop registering.
function gamepad_axis_pressed_as_button( device, button_equivalent) {
	if (gamepad_axis_value(device, gp_axislv) == 0 && gamepad_axis_value(device, gp_axislh) == 0) {
		global.last_axis_as_button = 0;
		global.axis_frame_hold = false;
	}
	
	if ( global.axis_frame_hold ) {
		return 0;
	}
	
	switch (button_equivalent) {
		case gp_padu:
			if (gamepad_axis_value(device, gp_axislv) < 0)
			{
				global.last_axis_as_button = gp_padu;
				global.axis_frame_hold = true;
				return 1;
			}
			break;
		case gp_padr:
			if (gamepad_axis_value(device, gp_axislh) > 0) 
			{
				global.last_axis_as_button = gp_padr;
				global.axis_frame_hold = true;
				return 1;
			}
			break;
		case gp_padd:
			if (gamepad_axis_value(device, gp_axislv) > 0) 
			{
				global.last_axis_as_button = gp_padd;
				global.axis_frame_hold = true;
				return 1;
			}
			break;
		case gp_padl:
			if (gamepad_axis_value(device, gp_axislh) < 0) 
			{
				global.last_axis_as_button = gp_padl;
				global.axis_frame_hold = true;
				return 1;
			}
			break;
	}
	
	return 0; // if nothing applies than we don't have input
}

function check_up_pressed(){
	return (max(
		keyboard_check_pressed(vk_up),
		gamepad_button_check_pressed(0, gp_padu),
		gamepad_axis_pressed_as_button(0, gp_padu)
		) == 1);
}

function check_right_pressed(){	
	return (max(
		keyboard_check_pressed(vk_right),
		gamepad_button_check_pressed(0, gp_padr), 
		gamepad_axis_pressed_as_button(0, gp_padr)
		) == 1);
}

function check_down_pressed(){	
	return (max(
		keyboard_check_pressed(vk_down),
		gamepad_button_check_pressed(0, gp_padd), 
		gamepad_axis_pressed_as_button(0, gp_padd)
		) == 1);
}

function check_left_pressed(){
	return (max(
		keyboard_check_pressed(vk_left),
		gamepad_button_check_pressed(0, gp_padl), 
		gamepad_axis_pressed_as_button(0, gp_padl)
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

