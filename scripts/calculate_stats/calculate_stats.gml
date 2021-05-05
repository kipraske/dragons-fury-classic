#macro stat_level_constant 0.7
#macro stat_first_level_boost 7
#macro player_base_stat 3
#macro player_hp_multipler 10
#macro monster_hp_multipler 25
#macro player_mp_multipler 3

///@desc takes equipment and skill info of a player to determine player stats
// First we fill the perm_attr array, this will be used for raw resist/weakness + item stat bonuses
// Next we will loop over the stat attr and add these to the stats on the player
// Lastly we will add stats from equipped skills
function calculate_player_stats_and_attr( player_name ){

	var this_player = variable_struct_get( global.player, player_name );
	this_player.perm_attr = fill_array( attr.length, 0 )

	// note that an empty hand will be an empty {}
	if ( variable_struct_exists( this_player.equipment.hand1, "item_bonus" ) ) {
		var _hand1_bonus = variable_struct_get( this_player.equipment.hand1, "item_bonus" );
		for ( var i = 0; i < array_length(_hand1_bonus); i++ ) {
			this_player.perm_attr[_hand1_bonus[i]]++
		}
	}
	
	if ( variable_struct_exists( this_player.equipment.hand2, "item_bonus" ) ) {
		var _hand2_bonus = variable_struct_get( this_player.equipment.hand2, "item_bonus" );
		for ( var i = 0; i < array_length(_hand1_bonus); i++ ) {
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
	var _has_passive_MP_up = find_array_value(this_player.equipped_skills, skills.passive_MP_up);
	if ( _has_passive_MP_up >= 0) {
		
	}
	
	var _has_passive_RES_up = find_array_value(this_player.equipped_skills, skills.passive_RES_up);
	var _has_passive_SPD_up = find_array_value(this_player.equipped_skills, skills.passive_SPD_up);
	var _has_passive_LUK_up = find_array_value(this_player.equipped_skills, skills.passive_LUK_up);
	var _has_passive_HP_up = find_array_value(this_player.equipped_skills, skills.passive_HP_up);
	var _has_passive_DEF_up = find_array_value(this_player.equipped_skills, skills.passive_DEF_up);
	var _has_passive_ATK_up = find_array_value(this_player.equipped_skills, skills.passive_ATK_up);

	this_player.perm_stats[stats.ATK] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.ATK_up] - this_player.perm_attr[attr.ATK_down])) + stat_first_level_boost;
	this_player.perm_stats[stats.DEF] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.DEF_up] - this_player.perm_attr[attr.DEF_down])) + stat_first_level_boost;
	this_player.perm_stats[stats.RES] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.RES_up] - this_player.perm_attr[attr.RES_down])) + stat_first_level_boost;
	this_player.perm_stats[stats.SPD] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.SPD_up] - this_player.perm_attr[attr.SPD_down])) + stat_first_level_boost;
	this_player.perm_stats[stats.LUK] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.LUK_up] - this_player.perm_attr[attr.LUK_down])) + stat_first_level_boost;
	
	this_player.perm_stats[stats.MAX_HP] = player_hp_multipler * stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.HP_up] - this_player.perm_attr[attr.HP_down])) + stat_first_level_boost * player_hp_multipler;
	this_player.perm_stats[stats.MAX_MP] = player_mp_multipler * stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.MP_up] - this_player.perm_attr[attr.MP_down])) + stat_first_level_boost * player_mp_multipler;
}


function calculate_monster_stats() {

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