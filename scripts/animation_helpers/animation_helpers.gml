// Animations to be used in the draw function. That are too complicated to repeat there
// These all take a counter and run through it based on that.

function animate_weapon_attack( weapon, counter ) {
	counter++;
	var test_text = global.labels.equipment_types[weapon.item_type];
	draw_text(x, y, test_text);
}