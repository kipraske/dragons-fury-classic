
// 
function get_red_mushroom_sprites() {
	return {
		right: spr_red_mushroom_right,
		down: spr_red_mushroom_down,
	};
}

// @desc provides template for creating this monster
function get_red_mushroom(){
	var base_monster =  {
		name: "Red Mushroom",
		level: 1,
		pattern: attack_pattern.random,
		battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		base_stats: fill_array( stats.length, 0 ),      // monsters don't have skills/equipment. They have base stats
		battle_stats: fill_array( stats.length, 0),     // stats adjusted from battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		total_xp: 0,
		equipped_skills: [
			skills.attack,
			skills.sleep,
			skills.quake,
		],
		sprites: get_red_mushroom_sprites()
	};
	
	base_monster.base_stats[stats.MAX_HP] = 5
	base_monster.base_stats[stats.MAX_MP] = 5
	base_monster.base_stats[stats.ATK]    = 4
	base_monster.base_stats[stats.DEF] = 5
	base_monster.base_stats[stats.RES] = 5
	base_monster.base_stats[stats.SPD] = 3
	base_monster.base_stats[stats.LUK] = 3
	
	// TODO calculate monster attr
	    //    "earth": 1,
        //"sea": 1,
        //"sky": -1,
        //"slash": -1,
        //"pierce": 1,
        //"blunt": 2,
        //"magic": 0
	
	calculate_monster_stats(base_monster);
	
}