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
	global.player.thomas,
	global.player.isabelle,
]

global.battle.monster_layout = monster_layout_types.five

global.battle.monster_units = [
	get_red_mushroom( "Fred" ),
	get_red_mushroom( "Rod" ),
	get_red_mushroom( "Emily" ),
	get_red_mushroom( "Funk" ),
	get_red_mushroom( "Steve" )
];