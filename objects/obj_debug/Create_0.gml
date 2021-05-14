/// @description set temporary state for testing code
// You can write your code in this editor

global.player.catherine.level = 20; // some extreme testing
calculate_player_stats_and_attr( global.player.catherine );

global.battle.player_frontline = [
	global.player.catherine,
	global.player.alfred,
	global.player.mary,
]

global.battle.player_backline = [
	global.player.ashley,
	global.player.isabelle,
]

global.battle.monster_units = [
	get_red_mushroom(),
	get_red_mushroom(),
	get_red_mushroom(),
	get_red_mushroom(),
	get_red_mushroom()
];