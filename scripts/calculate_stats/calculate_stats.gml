#macro player_base_stat 3;
#macro player_hp_multipler 150;
#macro monster_hp_multipler 300;
#macro player_mp_multipler 25;

///@desc takes equipment and skill info of a player to determine player stats
// First we fill the perm_attr array, this will be used for raw resist/weakness + item stat bonuses
// Next we will loop over the stat attr and add these to the stats on the player
// Lastly we will add stats from equipped skills
function calculate_player_stats_and_attr( player_name ){

	var this_player = variable_struct_get( global.player, player_name );
	this_player.perm_attr = fill_array( attr.length, 0 )

	if ( variable_struct_exists( this_player.equipment.hand1, "item_bonus" ) ) {
		var _hand1_bonus = variable_struct_get( this_player.equipment.hand1, "item_bonus" );
		show_debug_message(_hand1_bonus);
		for ( var i = 0; i < array_length(_hand1_bonus); i++ ) {
			this_player.perm_attr[_hand1_bonus[i]]++
		}
	}
	
	// Next, hand 2

}


function calculate_monster_stats() {

}