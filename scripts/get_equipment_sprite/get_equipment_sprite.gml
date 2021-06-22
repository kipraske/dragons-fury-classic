
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
					return [ spr_book_common_closed, spr_book_common_open, spr_effect_glow_blue ];
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
			case equipment_tiers.common:
				break;
			case equipment_tiers.rare:
				break;
			case equipment_tiers.legendary:
				break;
			case equipment_tiers.personal:
				break;
			case equipment_tiers.void:
				break;
			break;
		case equipment_types.mace:
			case equipment_tiers.common:
				break;
			case equipment_tiers.rare:
				break;
			case equipment_tiers.legendary:
				break;
			case equipment_tiers.personal:
				break;
			case equipment_tiers.void:
				break;
			break;
		case equipment_types.pistol:
			case equipment_tiers.common:
				break;
			case equipment_tiers.rare:
				break;
			case equipment_tiers.legendary:
				break;
			case equipment_tiers.personal:
				break;
			case equipment_tiers.void:
				break;
			break;
		case equipment_types.rifle:
			case equipment_tiers.common:
				break;
			case equipment_tiers.rare:
				break;
			case equipment_tiers.legendary:
				break;
			case equipment_tiers.personal:
				break;
			case equipment_tiers.void:
				break;
			break;
		case equipment_types.short_sword:
			case equipment_tiers.common:
				break;
			case equipment_tiers.rare:
				break;
			case equipment_tiers.legendary:
				break;
			case equipment_tiers.personal:
				break;
			case equipment_tiers.void:
				break;
			break;
		case equipment_types.spear:
			case equipment_tiers.common:
				break;
			case equipment_tiers.rare:
				break;
			case equipment_tiers.legendary:
				break;
			case equipment_tiers.personal:
				break;
			case equipment_tiers.void:
				break;
			break;
		case equipment_types.sword:
			case equipment_tiers.common:
				break;
			case equipment_tiers.rare:
				break;
			case equipment_tiers.legendary:
				break;
			case equipment_tiers.personal:
				break;
			case equipment_tiers.void:
				break;
			break;
		case equipment_types.unarmed:
			case equipment_tiers.common:
				break;
			case equipment_tiers.rare:
				break;
			case equipment_tiers.legendary:
				break;
			case equipment_tiers.personal:
				break;
			case equipment_tiers.void:
				break;
			break;
		default: // TODO - gotta deal with shields etc.
			
	}
}

function get_armor_sprites( type, tier ){

}

function get_accessory_sprites( type, tier ) {

}