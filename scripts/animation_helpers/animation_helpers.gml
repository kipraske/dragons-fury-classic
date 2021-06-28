// Animations to be used in the draw function. That are too complicated to repeat there
// These all take a counter and run through it based on that.

function animate_weapon_attack( weapon, counter ) {
	counter++;
	show_debug_message( weapon );
	var test_text = global.labels.equipment_types[weapon.item_type];
	draw_sprite_ext( spr_sword_rare, 0, x, y, 1, 1, 0, c_white, 1 );
	draw_text(x, y, test_text);
}