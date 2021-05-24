// At the moment this isn't that useful, but eventually we will need to handle
// both controller axes, dpad, keyboard, mouse, and touch controls
// So just make some functions to get them regardless of where the input comes from
// The mouse/touch functions are going to be triggered via the object events always.

// TODO add game controller support. No need now

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
	return (max( keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space) ) == 1);
}

function check_cancel_pressed() {
	return keyboard_check_pressed(vk_escape) == 1;
}

function check_pause_pressed() {
	return keyboard_check_pressed(vk_escape) == 1;
}

