///@desc takes equipment and skill info of a player to determine player stats
// First we fill the perm_attr array, this will be used for raw resist/weakness + item stat bonuses
// Next we will loop over the stat attr and add these to the stats on the player
// Lastly we will add stats from equipped skills
function calculate_player_stats_and_attr( this_player ){

	// note that an empty hand will be an empty {}
	if ( variable_struct_exists( this_player.equipment.hand1, "item_bonus" ) ) {
		var _hand1_bonus = variable_struct_get( this_player.equipment.hand1, "item_bonus" );
		for ( var i = 0; i < array_length(_hand1_bonus); i++ ) {
			this_player.perm_attr[_hand1_bonus[i]]++
		}
	}
	
	if ( variable_struct_exists( this_player.equipment.hand2, "item_bonus" ) ) {
		var _hand2_bonus = variable_struct_get( this_player.equipment.hand2, "item_bonus" );
		for ( var i = 0; i < array_length(_hand2_bonus); i++ ) {
			this_player.perm_attr[_hand2_bonus[i]]++
		}
	}
	
	if ( variable_struct_exists( this_player.equipment.body, "item_bonus" ) ) {
		var _body_bonus = variable_struct_get( this_player.equipment.body, "item_bonus" );
		for ( var i = 0; i < array_length(_body_bonus); i++ ) {
			this_player.perm_attr[_body_bonus[i]]++
		}
	}
	
	if ( variable_struct_exists( this_player.equipment.accessory, "item_bonus" ) ) {
		var _accessory_bonus = variable_struct_get( this_player.equipment.accessory, "item_bonus" );
		for ( var i = 0; i < array_length(_accessory_bonus); i++ ) {
			this_player.perm_attr[_accessory_bonus[i]]++
		}
	}

	// Apply stat-boost skill effects here directly to the stats
	// Each level of skill give 10% more to a stat (including level 0)
	var _passive_MP_multiplier = 1;
	var _has_passive_MP_up = find_array_value(this_player.equipped_skills, skills.passive_MP_up);
	if ( _has_passive_MP_up >= 0 ) {
		var _passive_MP_level = this_player.available_skills[skills.passive_MP_up];
		_passive_MP_multiplier = 1 + ( _passive_MP_level + 1 ) * 0.1
	}

	var _passive_RES_multiplier = 1;
	var _has_passive_RES_up = find_array_value(this_player.equipped_skills, skills.passive_RES_up);
	if ( _has_passive_RES_up >= 0 ) {
		var _passive_RES_level = this_player.available_skills[skills.passive_RES_up];
		_passive_RES_multiplier = 1 + ( _passive_RES_level + 1 ) * 0.1
	}
	
	var _passive_SPD_multiplier = 1;
	var _has_passive_SPD_up = find_array_value(this_player.equipped_skills, skills.passive_SPD_up);
	if ( _has_passive_SPD_up >= 0 ) {
		var _passive_SPD_level = this_player.available_skills[skills.passive_SPD_up];
		_passive_SPD_multiplier = 1 + ( _passive_SPD_level + 1 ) * 0.1
	}
	
	var _passive_LUK_multiplier = 1;
	var _has_passive_LUK_up = find_array_value(this_player.equipped_skills, skills.passive_LUK_up);
	if ( _has_passive_LUK_up >= 0 ) {
		var _passive_LUK_level = this_player.available_skills[skills.passive_LUK_up];
		_passive_LUK_multiplier = 1 + ( _passive_LUK_level + 1 ) * 0.1
	}
	
	var _passive_HP_multiplier = 1;
	var _has_passive_HP_up = find_array_value(this_player.equipped_skills, skills.passive_HP_up);
	if ( _has_passive_HP_up >= 0 ) {
		var _passive_HP_level = this_player.available_skills[skills.passive_HP_up];
		_passive_HP_multiplier = 1 + ( _passive_HP_level + 1 ) * 0.1
	}

	var _passive_DEF_multiplier = 1;
	var _has_passive_DEF_up = find_array_value(this_player.equipped_skills, skills.passive_DEF_up);
	if ( _has_passive_DEF_up >= 0 ) {
		var _passive_DEF_level = this_player.available_skills[skills.passive_DEF_up];
		_passive_DEF_multiplier = 1 + ( _passive_DEF_level + 1 ) * 0.1
	}
	
	var _passive_ATK_multiplier = 1;
	var _has_passive_ATK_up = find_array_value(this_player.equipped_skills, skills.passive_ATK_up);
	if ( _has_passive_ATK_up >= 0 ) {
		var _passive_ATK_level = this_player.available_skills[skills.passive_ATK_up];
		_passive_ATK_multiplier = 1 + ( _passive_ATK_level + 1 ) * 0.1
	}

	this_player.perm_stats[stats.ATK] = round((stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.ATK_up] - this_player.perm_attr[attr.ATK_down])) + stat_first_level_boost) * _passive_ATK_multiplier);
	this_player.perm_stats[stats.DEF] = round((stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.DEF_up] - this_player.perm_attr[attr.DEF_down])) + stat_first_level_boost) * _passive_DEF_multiplier);
	this_player.perm_stats[stats.RES] = round((stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.RES_up] - this_player.perm_attr[attr.RES_down])) + stat_first_level_boost) * _passive_RES_multiplier);
	this_player.perm_stats[stats.SPD] = round((stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.SPD_up] - this_player.perm_attr[attr.SPD_down])) + stat_first_level_boost) * _passive_SPD_multiplier);
	this_player.perm_stats[stats.LUK] = round((stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.LUK_up] - this_player.perm_attr[attr.LUK_down])) + stat_first_level_boost) * _passive_LUK_multiplier);
	this_player.perm_stats[stats.MAX_HP] = round((stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.HP_up] - this_player.perm_attr[attr.HP_down])) + stat_first_level_boost) * player_hp_multipler * _passive_HP_multiplier);
	this_player.perm_stats[stats.MAX_MP] = round((stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.MP_up] - this_player.perm_attr[attr.MP_down])) + stat_first_level_boost) * player_mp_multipler * _passive_MP_multiplier);
	// players are always full health and revived out of battle
	this_player.perm_stats[stats.current_HP] = this_player.perm_stats[stats.MAX_HP];
	this_player.perm_stats[stats.current_MP] = this_player.perm_stats[stats.MAX_MP];
	// note level and total_xp are managed directly and are only applied post-battle. We use level so much we have a quick alias here
	this_player._battle_stats[stats.level] = this_player.level;
	this_player._battle_stats[stats.total_xp] = this_player.total_xp;
	
	// battle stats are the temporary ones used for stat up/down effects, as well as that which is gained in battle but not commited yet
	this_player._battle_stats[stats.ATK] = this_player.perm_stats[stats.ATK];
	this_player._battle_stats[stats.DEF] = this_player.perm_stats[stats.DEF];
	this_player._battle_stats[stats.RES] = this_player.perm_stats[stats.RES];
	this_player._battle_stats[stats.SPD] = this_player.perm_stats[stats.SPD];
	this_player._battle_stats[stats.LUK] = this_player.perm_stats[stats.LUK];
	this_player._battle_stats[stats.MAX_HP] = this_player.perm_stats[stats.MAX_HP];
	this_player._battle_stats[stats.MAX_MP] = this_player.perm_stats[stats.MAX_MP];
	
	this_player._battle_stats[stats.current_HP] = this_player.perm_stats[stats.current_HP];
	this_player._battle_stats[stats.current_MP] = this_player.perm_stats[stats.current_MP];
	this_player._battle_stats[stats.level] = this_player.perm_stats[stats.level];
	this_player._battle_stats[stats.total_xp] = this_player.perm_stats[stats.total_xp];
}


function calculate_monster_stats( this_monster ) {
	this_monster.perm_stats[stats.ATK] = round(stat_level_constant * this_monster.level * this_monster.base_stats[stats.ATK] + stat_first_level_boost);
	this_monster.perm_stats[stats.DEF] = round(stat_level_constant * this_monster.level * this_monster.base_stats[stats.DEF] + stat_first_level_boost);
	this_monster.perm_stats[stats.RES] = round(stat_level_constant * this_monster.level * this_monster.base_stats[stats.RES] + stat_first_level_boost);
	this_monster.perm_stats[stats.SPD] = round(stat_level_constant * this_monster.level * this_monster.base_stats[stats.SPD] + stat_first_level_boost);
	this_monster.perm_stats[stats.LUK] = round(stat_level_constant * this_monster.level * this_monster.base_stats[stats.LUK] + stat_first_level_boost);
	
	this_monster.perm_stats[stats.MAX_HP] = round((stat_level_constant * this_monster.level * this_monster.base_stats[stats.MAX_HP] + stat_first_level_boost) * monster_hp_multipler);
	this_monster.perm_stats[stats.MAX_MP] = round((stat_level_constant * this_monster.level * this_monster.base_stats[stats.MAX_MP] + stat_first_level_boost) * monster_mp_multiplier);

	this_monster.perm_stats[stats.current_HP] = this_monster.perm_stats[stats.MAX_HP];
	this_monster.perm_stats[stats.current_MP] = this_monster.perm_stats[stats.MAX_MP];
	
	this_monster._battle_stats[stats.ATK] = this_monster.perm_stats[stats.ATK];
	this_monster._battle_stats[stats.DEF] = this_monster.perm_stats[stats.DEF];
	this_monster._battle_stats[stats.RES] = this_monster.perm_stats[stats.RES];
	this_monster._battle_stats[stats.SPD] = this_monster.perm_stats[stats.SPD];
	this_monster._battle_stats[stats.LUK] = this_monster.perm_stats[stats.LUK];
	this_monster._battle_stats[stats.MAX_HP] = this_monster.perm_stats[stats.MAX_HP];
	this_monster._battle_stats[stats.MAX_MP] = this_monster.perm_stats[stats.MAX_MP];
	
	this_monster._battle_stats[stats.current_HP] = this_monster.perm_stats[stats.current_HP];
	this_monster._battle_stats[stats.current_MP] = this_monster.perm_stats[stats.current_MP];
	this_monster._battle_stats[stats.level] = this_monster.perm_stats[stats.level];
	this_monster._battle_stats[stats.total_xp] = this_monster.perm_stats[stats.total_xp];
}

#macro xp_growth_constant = 7;

// @desc get player level from xp_total. Used for temp battle levels and real perminent levels.
// The next level requires the 2x the level amount of XP to get to the next plus a constant to make low levels not trivial, hey those are triangular numbers.
// So xp_total = lv*(lv + 1) + lv*c = lv^2 + lv(c+1). 
// Oh dear then level 1 requires 9 XP, we need to reset level 1 to be the 0 in this formula: (lv - 1)*lv + (lv-1)*c = lv^2 + (c-1)lv - c
// But we need to do the opposite to get level: quadratic formula time!
function calculate_level_from_xp( xp_total ) {
	return floor(0.5 * (-6 + sqrt(36 + 4*(xp_total+7))));
}

function generate_equipment( equipment_type, equipment_tier, level ) {

	var type_label = global.labels.equipment_types[weapon_type];
	
	var base_weapon_damage = 0;
	var basic_attributes = 0;
	var is_cursed = false;
	
	var item_bonus = [];
	
	switch (equipment_type) {
		case equipment_types.unarmed:
			base_weapon_damage = 2;
			break;
		case equipment_types.pistol:
			base_weapon_damage = 2;
			break;
		case equipment_types.dagger:
			base_weapon_damage = 4;
			break;
		case equipment_types.short_sword:
			base_weapon_damage = 4;
			break;
		case equipment_types.book:
			base_weapon_damage = 4;
			break;
		case equipment_types.crossbow: 
			base_weapon_damage = 4;
			break;
		case equipment_types.rifle:
			base_weapon_damage = 4;
			break;
		case equipment_types.sword:
			base_weapon_damage = 5;
			break;
		case equipment_types.mace:
			base_weapon_damage = 5;
			break;
		case equipment_types.spear:
			base_weapon_damage = 7;
			break;
		case equipment_types.bow:
			base_weapon_damage = 5;
			break;
		case equipment_types.staff:
			base_weapon_damage = 7;
			break;
		case equipment_types.axe:
			base_weapon_damage = 8;
			break;
		case equipment_types.hammer:
			base_weapon_damage = 8;
			break;
		case equipment_types.shield:
			base_weapon_damage = 2;
			break;
		case equipment_types.unarmored:
			base_weapon_damage = 2;
			break;
		case equipment_types.light_armor:
			base_weapon_damage = 2;
			break;
		case equipment_types.medium_armor:
			base_weapon_damage = 2;
			break;
		case equipment_types.heavy_armor:
			base_weapon_damage = 2;
			break;
		case equipment_types.shoes:
			base_weapon_damage = 2;
			break;
		case equipment_types.necklace:
			base_weapon_damage = 2;
			break;
		case equipment_types.cloak:
			base_weapon_damage = 2;
			break;
		case equipment_types.bracers:
			base_weapon_damage = 2;
			break;
		case equipment_types.belt:
			base_weapon_damage = 2;
			break;
		case equipment_types.claw:
			base_weapon_damage = 2;
			break;
		case equipment_types.bite:
			base_weapon_damage = 2;
			break;
		default:
			base_weapon_damage = 2;
			break;
	}
	
	switch (equipment_tier) {
		case equipment_tiers.common:
			basic_attributes = 1;
			break;
		case equipment_tiers.rare:
			basic_attributes = 2;
			break;
		case equipment_tiers.legendary:
			basic_attributes = 3;
			break;
		case equipment_tiers.personal:
			basic_attributes = 1; // + personal attribute
			break;
		case equipment_tiers.void:
			basic_attributes = 0;
			break;
		break;
	}
	
	if ( equipment_tier == equipment_tiers.personal ) {
		var personal_rand_index = irandom(array_length(global.all_personal_attr_list));
		array_push(item_bonus, global.all_personal_attr_list[personal_rand_index]);
	}
	
	var basic_attribute_list = ds_list_create();
	
	// Create a deck of our basic attributes, randomize, and draw off the top
	for ( var i = 0; i < array_length(global.all_buff_list); i++ ) {
		ds_list_add(basic_attribute_list, global.all_buff_list[i]);
	}
	ds_list_shuffle(basic_attribute_list);
	for ( var i = 0; i < basic_attributes; i++) {
		var top_basic_random_attr = basic_attribute_list[| i];
		array_push(item_bonus, top_basic_random_attr);
	}
	
	//global.all_buff_list;
	//global.all_debuff_list;
	
	

			    //item_name: "Lucky Hammer",
			    //item_type: equipment_types.hammer, -- done lol
				//item_tier: equipment_tiers.common, -- done lol
				//item_stats: [ ] -- ATK for weapons, DEF/RES for armor, ?? for accessory types
			    //item_level: 1,
			    //item_bonus: [attr.LUK_up,attr.HP_up]
				
				
	ds_list_destroy(basic_attribute_list);

}