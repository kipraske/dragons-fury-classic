/// @description Draws the players on the left

// Basic Player Draw
if ( global.battle.player_frontline[unit_index]._battle_stats[stats.current_HP] > 0) { // dead status
	draw_self();
}

