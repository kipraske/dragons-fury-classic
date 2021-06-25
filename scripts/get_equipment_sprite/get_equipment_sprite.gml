
// Some weapon sprites have more than one piece, so I guess this returns an array of sprites
// 0 - Base item sprite
// 1 - Additional Attack Sprite (Arrow, Slash, Shooting, etc)
// 2 - Enemy Hit Sprite
function get_weapon_sprites( type, tier ){

	switch (type ) {
		case equipment_types.axe:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_axe_common, noone, spr_effect_slash ];
				case equipment_tiers.rare:
					return [ spr_axe_rare, noone, spr_effect_slash ];
				case equipment_tiers.legendary:
					return [ spr_axe_legendary, noone, spr_effect_slash ];
				case equipment_tiers.personal:
					return [ spr_axe_personal, noone, spr_effect_slash ];
				case equipment_tiers.void:
					// TODO - create void effect slash which is purple
					return [ spr_axe_void, noone, spr_effect_slash ];
			}
		case equipment_types.book:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_book_common_closed, spr_book_common_open, spr_effect_glow_small ];
				case equipment_tiers.rare:
					return [ spr_book_rare_closed, spr_book_rare_open, spr_effect_glow_blue ];
				case equipment_tiers.legendary:
					return [ spr_book_legendary_closed, spr_book_legendary_open, spr_effect_glow_yellow ];
				case equipment_tiers.personal:
					return [ spr_book_personal_closed, spr_book_personal_open, spr_effect_glow_white ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_book_void_closed, spr_book_void_open, spr_effect_glow_white ];
			}
		case equipment_types.bow:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_bow_base, spr_arrow_common, spr_effect_arrow_down ];
				case equipment_tiers.rare:
					return [ spr_bow_base, spr_arrow_rare, spr_effect_arrow_down ];
				case equipment_tiers.legendary:
					return [ spr_bow_base, spr_arrow_legendary, spr_effect_arrow_down ];
				case equipment_tiers.personal:
					return [ spr_bow_base, spr_arrow_personal, spr_effect_arrow_down ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_bow_base, spr_arrow_void, spr_effect_arrow_down ];
			}
		case equipment_types.crossbow:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_xbow_base, spr_arrow_common, spr_effect_arrow_down ];
				case equipment_tiers.rare:
					return [ spr_xbow_base, spr_arrow_rare, spr_effect_arrow_down ];
				case equipment_tiers.legendary:
					return [ spr_xbow_base, spr_arrow_legendary, spr_effect_arrow_down ];
				case equipment_tiers.personal:
					return [ spr_xbow_base, spr_arrow_personal, spr_effect_arrow_down ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_xbow_base, spr_arrow_void, spr_effect_arrow_down ];
			}
		case equipment_types.dagger:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_dagger_common, noone, spr_effect_stab ];
				case equipment_tiers.rare:
					return [ spr_dagger_rare, noone, spr_effect_stab ];
				case equipment_tiers.legendary:
					return [ spr_dagger_legendary, noone, spr_effect_stab ];
				case equipment_tiers.personal:
					return [ spr_dagger_personal, noone, spr_effect_stab ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_dagger_void, noone, spr_effect_stab ];
			}
		case equipment_types.hammer:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_hammer_common, noone, spr_effect_smash ];
				case equipment_tiers.rare:
					return [ spr_hammer_rare, noone, spr_effect_smash ];
				case equipment_tiers.legendary:
					return [ spr_hammer_legendary, noone, spr_effect_smash ];
				case equipment_tiers.personal:
					return [ spr_hammer_personal, noone, spr_effect_smash ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_hammer_void, noone, spr_effect_smash ];
			}
		case equipment_types.mace:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_mace_common, noone, spr_effect_smash ];
				case equipment_tiers.rare:
					return [ spr_mace_rare, noone, spr_effect_smash ];
				case equipment_tiers.legendary:
					return [ spr_mace_legendary, noone, spr_effect_smash ];
				case equipment_tiers.personal:
					return [ spr_mace_personal, noone, spr_effect_smash ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_mace_void, noone, spr_effect_smash ];
			}
		case equipment_types.pistol:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_pistol_common, spr_effect_shoot_fire, spr_effect_shoot_hit ];
				case equipment_tiers.rare:
					return [ spr_pistol_rare, spr_effect_shoot_fire, spr_effect_shoot_hit ];
				case equipment_tiers.legendary:
					return [ spr_pistol_legendary, spr_effect_shoot_fire, spr_effect_shoot_hit ];
				case equipment_tiers.personal:
					return [ spr_pistol_personal, spr_effect_shoot_fire, spr_effect_shoot_hit ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_pistol_void, spr_effect_shoot_fire, spr_effect_shoot_hit ];
			}
		case equipment_types.rifle:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_rifle_common, spr_effect_shoot_fire, spr_effect_shoot_hit ];
				case equipment_tiers.rare:
					return [ spr_rifle_rare, spr_effect_shoot_fire, spr_effect_shoot_hit ];
				case equipment_tiers.legendary:
					return [ spr_rifle_legendary, spr_effect_shoot_fire, spr_effect_shoot_hit ];
				case equipment_tiers.personal:
					return [ spr_rifle_personal, spr_effect_shoot_fire, spr_effect_shoot_hit ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_rifle_void, spr_effect_shoot_fire, spr_effect_shoot_hit ];
			}
		case equipment_types.short_sword:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_short_sword_common, noone, spr_effect_small_slash ];
				case equipment_tiers.rare:
					return [ spr_short_sword_rare, noone, spr_effect_small_slash ];
				case equipment_tiers.legendary:
					return [ spr_short_sword_legendary, noone, spr_effect_small_slash ];
				case equipment_tiers.personal:
					return [ spr_short_sword_personal, noone, spr_effect_small_slash ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_short_sword_void, noone, spr_effect_small_slash ];
			}
		case equipment_types.spear:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_spear_common, noone, spr_effect_stab ];
				case equipment_tiers.rare:
					return [ spr_spear_rare, noone, spr_effect_stab ];
				case equipment_tiers.legendary:
					return [ spr_spear_legendary, noone, spr_effect_stab ];
				case equipment_tiers.personal:
					return [ spr_spear_personal, noone, spr_effect_stab ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_spear_void, noone, spr_effect_stab ];
			}
		case equipment_types.staff:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_staff_common, noone, spr_effect_glow_small ];
				case equipment_tiers.rare:
					return [ spr_staff_rare, noone, spr_effect_glow_blue ];
				case equipment_tiers.legendary:
					return [ spr_staff_legendary, noone, spr_effect_glow_yellow ];
				case equipment_tiers.personal:
					return [ spr_staff_personal, noone, spr_effect_glow_white ];
				case equipment_tiers.void:
					// TODO - create void effect glow which is purple
					return [ spr_staff_void, noone, spr_effect_glow_white ];
			}
		case equipment_types.sword:
			switch ( tier ) {
				case equipment_tiers.common:
					return [ spr_sword_common, noone, spr_effect_slash ];
				case equipment_tiers.rare:
					return [ spr_sword_rare, noone, spr_effect_slash ];
				case equipment_tiers.legendary:
					return [ spr_sword_legendary, noone, spr_effect_slash ];
				case equipment_tiers.personal:
					return [ spr_sword_personal, noone, spr_effect_slash ];
				case equipment_tiers.void:
					// TODO - create void effect slash which is purple
					return [ spr_sword_void, noone, spr_effect_slash ];
			}
		case equipment_types.unarmed:
			return [ spr_unarmed_fist, spr_unarmed_fist_strike, spr_effect_fist_hit ];
		default:
			return [ spr_unarmed_fist, spr_unarmed_fist_strike, spr_effect_fist_hit ];
	}
}

function get_armor_sprites( type, tier ){

}

function get_accessory_sprites( type, tier ) {

}