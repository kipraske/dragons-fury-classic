// Animations to be used in the draw function. That are too complicated to repeat there
// These all take a counter and run through it based on that.

function animate_weapon_attack( weapon, counter, repeat_frames ) {


	var step = counter % repeat_frames;
	var anim_percent = step/repeat_frames;
	var weapon_sprite_set = get_weapon_sprites( weapon.item_type, weapon.item_tier );

	if ( weapon.item_type == equipment_types.axe
		|| equipment_types.hammer
		|| equipment_types.mace
		|| equipment_types.short_sword
		|| equipment_types.sword ) {
		// Slash	
	} else if ( weapon.item_type == equipment_types.dagger || weapon.item_type == equipment_types.spear ) {
		// Stab
	} else if ( weapon.item_type == equipment_types.bow || weapon.item_type == equipment_types.crossbow ) {
		// Bow
	} else if ( weapon.item_type == equipment_types.rifle || weapon.item_type == equipment_types.pistol ) {
		// Gun
	} else if (	weapon.item_type == equipment_types.book || weapon.item_type == equipment_types.staff ) {
		// Magic
	} else {
		// Unarmed
	}

	// TODO - all of the sprite types by weapon type, but for now assume a swing.
	var arc_percent = anim_percent*135 - 90;
	draw_sprite_ext( weapon_sprite_set[0], 0, x+18, y+52, -1, 1, arc_percent, c_white, 1 );
	show_debug_message(anim_percent);
	draw_text(x, y, arc_percent);
}