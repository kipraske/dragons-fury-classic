// Animations to be used in the draw function. That are too complicated to repeat there
// These all take a counter and run through it based on that.

function animate_weapon_attack( weapon, start_counter, repeat_frames ) {

	show_debug_message( weapon );
	var test_text = global.labels.equipment_types[weapon.item_type];
	var weapon_sprite = get_equipment_sprite( weapon.item_type, weapon.item_tier );
	
	// here is when we apply the transforms
	// and animate based on counter
	
	draw_sprite_ext( weapon_sprite, 0, x, y, 1, 1, 0, c_white, 1 );
	draw_text(x, y, test_text);
}