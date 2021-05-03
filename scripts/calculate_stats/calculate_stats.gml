#macro player_base_stat 3;


///@desc takes equipment and skill info of a player to determine player stats
function calculate_player_stats( player_name ){

var this_player = variable_struct_get( global.player, player_name );

if ( variable_struct_exists( this_player.equipment.hand1, "item_bonus" ) ) {
	this_player.perm_stats[stats.ATK] = player_base_stat;
}

}


function calculate_monster_stats(){

}