// Animations to be used in the draw function. That are too complicated to repeat there
// These all take a counter and run through it based on that.

function animate_weapon_attack( weapon, counter, repeat_frames ) {

	// Unarmed isn't set
	if ( ! variable_struct_get(weapon, "item_type") ) {
		weapon.item_type = equipment_types.unarmed;
		weapon.item_tier = equipment_tiers.common;
	}

	var step = counter % repeat_frames;
	var anim_percent = step/repeat_frames;
	var weapon_sprite_set = get_weapon_sprites( weapon.item_type, weapon.item_tier );

	if ( weapon.item_type == equipment_types.axe
		|| weapon.item_type == equipment_types.hammer
		|| weapon.item_type == equipment_types.mace
		|| weapon.item_type == equipment_types.short_sword
		|| weapon.item_type == equipment_types.sword ) {
		// Swing
		var arc_percent = anim_percent*135 - 90;
		draw_sprite_ext( weapon_sprite_set[0], 0, x+18, y+52, -1, 1, arc_percent, c_white, 1 );
	} else if ( weapon.item_type == equipment_types.dagger || weapon.item_type == equipment_types.spear ) {
		// Stab
		var slope_percent = anim_percent*30;
		draw_sprite_ext( weapon_sprite_set[0], 0, x + 40 - slope_percent, y + 40 + slope_percent, -1, -1, 0, c_white, 1 );
	} else if ( weapon.item_type == equipment_types.bow || weapon.item_type == equipment_types.crossbow ) {
		// The Bow
		draw_sprite_ext( weapon_sprite_set[0], 0, x+18, y+52, -1, 1, 0, c_white, 1 );
		var slope_percent = anim_percent*60;
		var arrow_alpha = 1;
		if ( anim_percent > 0.25 ) {
			arrow_alpha = 1 - anim_percent;
		}
		// The Arrow
		draw_sprite_ext( weapon_sprite_set[1], 0, x + 18 - slope_percent, y + 52 - slope_percent, -1, 1, 0, c_white, arrow_alpha );
	} else if ( weapon.item_type == equipment_types.rifle || weapon.item_type == equipment_types.pistol ) {
		// The Gun
		draw_sprite_ext( weapon_sprite_set[0], 0, x+8, y+28, -1, 1, 0, c_white, 1 );
		// The Fire
		var fire_phase = floor(anim_percent * 5);
		draw_sprite_ext( weapon_sprite_set[1], fire_phase, x+8, y + 28, 1, 1, 0, c_white, 1);
	} else if (	weapon.item_type == equipment_types.book || weapon.item_type == equipment_types.staff ) {
		var sprite_frames = 7;
		
		if ( weapon_sprite_set[2] = spr_effect_glow_white ) {
			var sprite_frames = 9;
		}
		
		var glow_phase = floor(anim_percent * sprite_frames);
		draw_sprite_ext( weapon_sprite_set[2], glow_phase, x+18, y+52, 1, 1, 0, c_white, 1 );
		draw_sprite_ext( weapon_sprite_set[1], 0, x+18, y+52, 0.5, 0.5, 0, c_white, 1 );
	} else {
		// Unarmed
	}

	// TODO - all of the sprite types by weapon type, but for now assume a swing.
	draw_text(x, y, global.labels.equipment_types[weapon.item_type]);
}