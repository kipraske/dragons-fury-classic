#macro stat_level_constant 0.7
#macro player_base_stat 3
#macro player_hp_multipler 50
#macro monster_hp_multipler 100
#macro player_mp_multipler 10

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


	this_player.perm_stats[stats.ATK] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.ATK_up] - this_player.perm_attr[attr.ATK_down]));
	this_player.perm_stats[stats.DEF] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.DEF_up] - this_player.perm_attr[attr.DEF_down]));
	this_player.perm_stats[stats.RES] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.RES_up] - this_player.perm_attr[attr.RES_down]));
	this_player.perm_stats[stats.SPD] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.SPD_up] - this_player.perm_attr[attr.SPD_down]));
	this_player.perm_stats[stats.LUK] = stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.LUK_up] - this_player.perm_attr[attr.LUK_down]));
	
	this_player.perm_stats[stats.MAX_HP] = player_hp_multipler * stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.HP_up] - this_player.perm_attr[attr.HP_down]));
	this_player.perm_stats[stats.MAX_MP] = player_mp_multipler * stat_level_constant * this_player.level * (player_base_stat + (this_player.perm_attr[attr.MP_up] - this_player.perm_attr[attr.MP_down]));
}


function calculate_monster_stats() {

}