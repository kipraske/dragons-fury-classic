/// @description set temporary state for testing code
// You can write your code in this editor

global.battle.player_frontline = [
	global.player.catherine,
	global.player.earnest,
	global.player.mary,
]

global.battle.player_backline = [
	global.player.thomas,
	global.player.isabelle,
]

global.battle.monster_layout = monster_layout_types.five

global.battle.monster_units = [
	get_red_mushroom( get_random_npc_name() ),
	get_red_mushroom( get_random_npc_name() ),
	get_red_mushroom( get_random_npc_name() ),
	get_red_mushroom( get_random_npc_name() ),
	get_red_mushroom( get_random_npc_name() )
];

// Level Catherine Way up to test ranges
global.player.catherine.level = 9999; // some extreme testing
global.player.catherine.equipment.hand1 = {
	item_type: equipment_types.bow,
	item_tier: equipment_tiers.void,
	item_level: 100,
	item_bonus: [attr.HP_up, attr.DEF_up]
}
calculate_player_stats_and_attr( global.player.catherine );

global.player.earnest.level = 100; // some extreme testing
calculate_player_stats_and_attr( global.player.earnest );

// Make alfred dead
global.player.alfred._battle_stats[stats.current_HP] = 0;
global.player.thomas._battle_stats[stats.current_HP] = 0;

// Make a monster dead
global.battle.monster_units[1]._battle_stats[stats.current_HP] = 0;