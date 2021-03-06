
// 
function get_red_mushroom_sprites() {
	return {
		right: spr_red_mushroom_right,
		down: spr_red_mushroom_down,
	};
}

// @desc provides template for creating this monster
// @param {string} label - extra data to differentiate this monster
function get_red_mushroom( label ){
	var monster =  {
		full_name: "Red Mushroom",
		name: "Red Mush" + " " + label,
		unit_type: unit_types.monster,
		level: 1,
		pattern: attack_pattern.random,
		select_coord: [64, 44],							// Offset from top right to display select target
		_battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		base_stats: fill_array( stats.length, 0 ),      // monsters don't have skills/equipment. They have base stats
		_battle_stats: fill_array( stats.length, 0),     // stats adjusted from _battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		_selected_action: skills.noskill,
		_selected_target: noone,
		_menu_position: 0,
		_unit_position: 0,
		total_xp: 0,
		equipped_skills: [
			skills.attack,
			skills.attack,
			skills.sleep,
			skills.quake,
			skills.quake,
		],
		_sprites: get_red_mushroom_sprites()
	};
	
	monster.base_stats[stats.MAX_HP] = 5
	monster.base_stats[stats.MAX_MP] = 5
	monster.base_stats[stats.ATK]    = 4
	monster.base_stats[stats.DEF] = 5
	monster.base_stats[stats.RES] = 5
	monster.base_stats[stats.SPD] = 3
	monster.base_stats[stats.LUK] = 3
	
	monster.perm_attr[attr.earth_resist] = 1;
	monster.perm_attr[attr.sea_resist] = 1;
	monster.perm_attr[attr.sky_weak] = 1;
	monster.perm_attr[attr.slash_weak] = 1;
	monster.perm_attr[attr.blunt_resist] = 2;
	
	// mushrooms resist stats
	monster.perm_attr[attr.sleep_resist] = 1;
	monster.perm_attr[attr.pain_resist] = 2;
	monster.perm_attr[attr.poison_resist] = 2;
	
	calculate_monster_stats(monster);
	
	return monster;
}