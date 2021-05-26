/// @function init_constants
/// @desc defines all global enum and macros for the application, only call this once!
function init_constants(){

	#macro MAX_FRONTEND_UNITS 3
	#macro MAX_TOTAL_UNITS 5
	#macro MAX_EQUIPPED_SKILLS 5

	enum stats {
		MAX_HP,
		MAX_MP,
		ATK,
		DEF,
		RES,
		SPD,
		LUK,
		current_HP,
		current_MP,
		level,
		total_xp,
		length
	}

	enum jobs {
		mage,
		druid,
		thief,
		oracle,
		inventor,
		knight,
		monk
	}
	
	#macro MAGIC_SKILLS_START_INDEX 2
	#macro MAGIC_SKILLS_END_INDEX 33 // 2 + 31
	#macro JOB_SKILLS_START_INDEX 34
	#macro JOB_SKILLS_END_INDEX 76 // 42 + 34
	
	enum skills {
		// Basic Skills
		noskill,
		attack,
		swap,
		
		// basic magic group
		heal,
		poison,
		quake,
		tornado,
		flood,
		
		// combo damage magic group
		thunder, //sea+sky
		ice,	 //sea+earth
		meteor,  //earth+sky
		smite,   //earth+sea+sky
		
		// healing/buff magic group
		DEF_up,  //light+earth
		RES_up,  //light+sea
		regen,   //light+sky
		SPD_up, //light+thunder
		LUK_up,  //light+ice
		ATK_up,  //light+meteor
		revive,  //light+smite
		mp_regen,//dark+light+sea
		
		// debuff magic group
		DEF_down, //dark+earth
		RES_down, //dark+sea
		aggro,    //dark+sky
		SPD_down,  //dark+thunder
		LUK_down, //dark+ice
		ATK_down, //dark+meteor
		plague,   //dark+smite
		flash,    //dark+light+lightning
		
		// status magic group
		purify,   //dark+light
		pain,     //dark+light+earth
		confuse,  //dark+light+sky
		freeze,   //dark+light+ice
		sleep,    //dark+light+meteor
		
		// ultimate magic group
		void,     //all 5
		
		// Mage
		passive_MP_up,
		double_cast,
		mp_cost_down,
		mp_turbo,
		staff_up,
		book_up,
		sleep_resist,
		earth_resist,
		
		// Druid
		passive_RES_up,
		mimic,
		hp_drain,
		rest_up,
		bow_up,
		ax_up,
		confusion_resist,
		sea_resist,
		
		// Thief
		passive_SPD_up,
		steal,
		loot_up,
		gold_up,
		hammer_up,
		accessory_up,
		auto_aggro,
		pierce_resist,
		
		// Oracle
		passive_LUK_up,
		scan,
		insight,
		xp_up,
		sword_up,
		dagger_up,
		poison_resist,
		sky_resist,
		
		// Inventor
		passive_HP_up,
		machine_gun,
		potion,
		grenade,
		spear_up,
		gun_up,
		freeze_resist,
		magic_resist,
		
		// Knight
		passive_DEF_up,
		defend,
		last_stand,
		auto_revive,
		armor_up,
		shield_up,
		auto_regen,
		slash_resist,
		
		// Monk
		passive_ATK_up,
		flurry,
		counter,
		mp_drain,
		unarmored_up,
		unarmed_up,
		pain_resist,
		blunt_resist,
		
		// Monster only skills, normally non equippable
		// TODO
		length
	}
	
	// Manually sort just so we don't have to always figure this out
	global.job_skills_by_type[jobs.monk] = [
		skills.passive_ATK_up,
		skills.flurry,
		skills.counter,
		skills.mp_drain,
		skills.unarmored_up,
		skills.unarmed_up,
		skills.pain_resist,
		skills.blunt_resist

	];
	global.job_skills_by_type[jobs.knight] = [
		skills.passive_DEF_up,
		skills.defend,
		skills.last_stand,
		skills.auto_revive,
		skills.armor_up,
		skills.shield_up,
		skills.auto_regen,
		skills.slash_resist

	];
	global.job_skills_by_type[jobs.inventor] = [
		skills.passive_HP_up,
		skills.machine_gun,
		skills.potion,
		skills.grenade,
		skills.spear_up,
		skills.gun_up,
		skills.freeze_resist,
		skills.magic_resist
	];
	global.job_skills_by_type[jobs.oracle] = [
		skills.passive_LUK_up,
		skills.scan,
		skills.insight,
		skills.xp_up,
		skills.sword_up,
		skills.dagger_up,
		skills.poison_resist,
		skills.sky_resist
	];
	global.job_skills_by_type[jobs.thief] = [
		skills.passive_SPD_up,
		skills.steal,
		skills.loot_up,
		skills.gold_up,
		skills.hammer_up,
		skills.accessory_up,
		skills.auto_aggro,
		skills.pierce_resist
	];
	global.job_skills_by_type[jobs.druid] = [
		skills.passive_RES_up,
		skills.mimic,
		skills.hp_drain,
		skills.rest_up,
		skills.bow_up,
		skills.ax_up,
		skills.confusion_resist,
		skills.sea_resist
	];
	global.job_skills_by_type[jobs.mage] = [
		skills.passive_MP_up,
		skills.double_cast,
		skills.mp_cost_down,
		skills.mp_turbo,
		skills.staff_up,
		skills.book_up,
		skills.sleep_resist,
		skills.earth_resist
	];

	// 
	enum skill_target_types {
		passive,
		attack,
		defense,
		aoe_attack,
		aoe_defense
	}

	// The skill
	global.skill_targets_by_type[skills.length] = skill_target_types.passive;
	global.skill_targets_by_type[skills.flurry] = skill_target_types.attack;
	global.skill_targets_by_type[skills.counter] = skill_target_types.passive;
	global.skill_targets_by_type[skills.mp_drain] = skill_target_types.passive;
	global.skill_targets_by_type[skills.unarmored_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.unarmed_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.pain_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.blunt_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.passive_DEF_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.defend] = skill_target_types.defense;
	global.skill_targets_by_type[skills.last_stand] = skill_target_types.passive;
	global.skill_targets_by_type[skills.auto_revive] = skill_target_types.passive;
	global.skill_targets_by_type[skills.armor_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.shield_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.auto_regen] = skill_target_types.passive;
	global.skill_targets_by_type[skills.slash_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.passive_HP_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.machine_gun] = skill_target_types.attack;
	global.skill_targets_by_type[skills.potion] = skill_target_types.defense;
	global.skill_targets_by_type[skills.grenade] = skill_target_types.aoe_attack;
	global.skill_targets_by_type[skills.spear_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.gun_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.freeze_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.magic_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.passive_LUK_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.scan] = skill_target_types.attack;
	global.skill_targets_by_type[skills.insight] = skill_target_types.passive;
	global.skill_targets_by_type[skills.xp_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.sword_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.dagger_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.poison_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.sky_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.passive_SPD_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.steal] = skill_target_types.attack;
	global.skill_targets_by_type[skills.loot_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.gold_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.hammer_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.accessory_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.auto_aggro] = skill_target_types.passive;
	global.skill_targets_by_type[skills.pierce_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.passive_RES_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.mimic] = skill_target_types.attack;
	global.skill_targets_by_type[skills.hp_drain] = skill_target_types.passive;
	global.skill_targets_by_type[skills.rest_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.bow_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.ax_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.confusion_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.sea_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.passive_MP_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.double_cast] = skill_target_types.attack; // sort of, this one is weird
	global.skill_targets_by_type[skills.mp_cost_down] = skill_target_types.passive;
	global.skill_targets_by_type[skills.mp_turbo] = skill_target_types.passive;
	global.skill_targets_by_type[skills.staff_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.book_up] = skill_target_types.passive;
	global.skill_targets_by_type[skills.sleep_resist] = skill_target_types.passive;
	global.skill_targets_by_type[skills.earth_resist] = skill_target_types.passive;
	
	global.skill_targets_by_type[skills.void] = skill_target_types.attack;
	
	global.skill_targets_by_type[skills.sleep] = skill_target_types.attack;
	global.skill_targets_by_type[skills.freeze] = skill_target_types.attack;
	global.skill_targets_by_type[skills.confuse] = skill_target_types.attack;
	global.skill_targets_by_type[skills.pain] = skill_target_types.attack;
	global.skill_targets_by_type[skills.purify] = skill_target_types.attack;
	
	global.skill_targets_by_type[skills.flash] = skill_target_types.attack;
	global.skill_targets_by_type[skills.plague] = skill_target_types.attack;
	global.skill_targets_by_type[skills.ATK_down] = skill_target_types.attack;
	global.skill_targets_by_type[skills.LUK_down] = skill_target_types.attack;
	global.skill_targets_by_type[skills.SPD_down] = skill_target_types.attack;
	global.skill_targets_by_type[skills.aggro] = skill_target_types.defense;
	global.skill_targets_by_type[skills.RES_down] = skill_target_types.attack;
	global.skill_targets_by_type[skills.DEF_down] = skill_target_types.attack;
	
	global.skill_targets_by_type[skills.mp_regen] = skill_target_types.defense;
	global.skill_targets_by_type[skills.revive] = skill_target_types.defense;
	global.skill_targets_by_type[skills.ATK_up] = skill_target_types.defense;
	global.skill_targets_by_type[skills.LUK_up] = skill_target_types.defense;
	global.skill_targets_by_type[skills.SPD_up] = skill_target_types.defense;
	global.skill_targets_by_type[skills.regen] = skill_target_types.defense;
	global.skill_targets_by_type[skills.RES_up] = skill_target_types.defense;
	global.skill_targets_by_type[skills.DEF_up] = skill_target_types.defense;
	
	global.skill_targets_by_type[skills.smite] = skill_target_types.attack;
	global.skill_targets_by_type[skills.meteor] = skill_target_types.attack;
	global.skill_targets_by_type[skills.ice] = skill_target_types.attack;
	global.skill_targets_by_type[skills.thunder] = skill_target_types.attack;
	global.skill_targets_by_type[skills.flood] = skill_target_types.attack;
	global.skill_targets_by_type[skills.tornado] = skill_target_types.attack;
	global.skill_targets_by_type[skills.quake] = skill_target_types.attack;
	global.skill_targets_by_type[skills.poison] = skill_target_types.attack;
	global.skill_targets_by_type[skills.heal] = skill_target_types.defense;
	
	global.skill_targets_by_type[skills.swap] = skill_target_types.defense;
	global.skill_targets_by_type[skills.attack] = skill_target_types.attack;
	global.skill_targets_by_type[skills.noskill] = skill_target_types.passive;
	
	// Just the base MP cost, will be multiplied each level
	global.magic_base_mp_cost[skills.void] = 15;
	
	global.magic_base_mp_cost[skills.sleep] = 3;
	global.magic_base_mp_cost[skills.freeze] = 3;
	global.magic_base_mp_cost[skills.confuse] = 3;
	global.magic_base_mp_cost[skills.pain] = 3;
	global.magic_base_mp_cost[skills.purify] = 4;
	
	global.magic_base_mp_cost[skills.flash] = 5;
	global.magic_base_mp_cost[skills.plague] = 8;
	global.magic_base_mp_cost[skills.ATK_down] = 4;
	global.magic_base_mp_cost[skills.LUK_down] = 4;
	global.magic_base_mp_cost[skills.SPD_down] = 4;
	global.magic_base_mp_cost[skills.aggro] = 3;
	global.magic_base_mp_cost[skills.RES_down] = 4;
	global.magic_base_mp_cost[skills.DEF_down] = 4;
	
	global.magic_base_mp_cost[skills.mp_regen] = 8;
	global.magic_base_mp_cost[skills.revive] = 8;
	global.magic_base_mp_cost[skills.ATK_up] = 4;
	global.magic_base_mp_cost[skills.LUK_up] = 4;
	global.magic_base_mp_cost[skills.SPD_up] = 4;
	global.magic_base_mp_cost[skills.regen] = 5;
	global.magic_base_mp_cost[skills.RES_up] = 4;
	global.magic_base_mp_cost[skills.DEF_up] = 4;
	
	global.magic_base_mp_cost[skills.smite] = 12;
	global.magic_base_mp_cost[skills.meteor] = 8;
	global.magic_base_mp_cost[skills.ice] = 8;
	global.magic_base_mp_cost[skills.thunder] = 8;
	global.magic_base_mp_cost[skills.flood] = 5;
	global.magic_base_mp_cost[skills.tornado] = 5;
	global.magic_base_mp_cost[skills.quake] = 5;
	global.magic_base_mp_cost[skills.poison] = 3;
	global.magic_base_mp_cost[skills.heal] = 5;
	
	// The elemental magic skill tree
	// 0 - node_level - how much the skill is worth in calculating next node
	// 1 - base_prerequisite_nodes array - the basic spell components of this level
	// insight flips the level (5-level) for all calculations
	global.magic_learning_tree[skills.void]     = [5, [skills.heal, skills.poison, skills.quake, skills.flood, skills.tornado]];
	
	global.magic_learning_tree[skills.sleep]    = [4, [skills.heal, skills.poison, skills.quake, skills.tornado]];
	global.magic_learning_tree[skills.freeze]   = [4, [skills.heal, skills.poison, skills.quake, skills.flood]];
	global.magic_learning_tree[skills.confuse]  = [3, [skills.heal, skills.poison, skills.tornado]];
	global.magic_learning_tree[skills.pain]     = [3, [skills.heal, skills.poison, skills.quake]];
	global.magic_learning_tree[skills.purify]   = [2, [skills.heal, skills.poison]];
	
	global.magic_learning_tree[skills.flash]    = [4, [skills.heal, skills.poison, skills.flood, skills.tornado]];
	global.magic_learning_tree[skills.plague]   = [4, [skills.poison, skills.flood, skills.quake, skills.tornado]];
	global.magic_learning_tree[skills.ATK_down] = [3, [skills.poison, skills.quake, skills.tornado]];
	global.magic_learning_tree[skills.LUK_down] = [3, [skills.poison, skills.flood, skills.quake]];
	global.magic_learning_tree[skills.SPD_down] = [3, [skills.poison, skills.flood, skills.tornado]];
	global.magic_learning_tree[skills.aggro]    = [2, [skills.poison, skills.tornado]];
	global.magic_learning_tree[skills.RES_down] = [2, [skills.poison, skills.flood]];
	global.magic_learning_tree[skills.DEF_down] = [2, [skills.poison, skills.quake]];
	
	global.magic_learning_tree[skills.mp_regen] = [3, [skills.heal, skills.poison, skills.flood]];
	global.magic_learning_tree[skills.revive]   = [4, [skills.heal, skills.quake, skills.flood, skills.tornado]];
	global.magic_learning_tree[skills.ATK_up]   = [3, [skills.heal, skills.quake, skills.tornado]];
	global.magic_learning_tree[skills.LUK_up]   = [3, [skills.heal, skills.quake, skills.flood]];
	global.magic_learning_tree[skills.SPD_up]   = [3, [skills.heal, skills.flood, skills.tornado]];
	global.magic_learning_tree[skills.regen]    = [2, [skills.heal, skills.tornado]];
	global.magic_learning_tree[skills.RES_up]   = [2, [skills.heal, skills.flood]];
	global.magic_learning_tree[skills.DEF_up]   = [3, [skills.heal, skills.quake]];
	
	global.magic_learning_tree[skills.smite]    = [3, [skills.quake, skills.flood, skills.tornado]];
	global.magic_learning_tree[skills.meteor]   = [2, [skills.quake, skills.tornado]];
	global.magic_learning_tree[skills.ice]      = [2, [skills.quake, skills.flood]];
	global.magic_learning_tree[skills.thunder]  = [2, [skills.flood, skills.tornado]];
	global.magic_learning_tree[skills.flood]    = [1, [skills.flood]];
	global.magic_learning_tree[skills.tornado]  = [1, [skills.tornado]];
	global.magic_learning_tree[skills.quake]    = [1, [skills.quake]];
	global.magic_learning_tree[skills.poison]   = [1, [skills.poison]];
	global.magic_learning_tree[skills.heal]     = [1, [skills.heal]];
	
	// Node level thresholds for learning new skill
	#macro MAGIC_LEARN_THRESHOLD_2 4
	#macro MAGIC_LEARN_THRESHOLD_3 10
	#macro MAGIC_LEARN_THRESHOLD_4 20
	#macro MAGIC_LAERN_THRESHOLD_5 35

	//Used for in battle status effects (power+duration) AND for item and monster bonus/resists (perminent levels)
	// status effect attr are NEVER used for bonuses so these are just the status or resists
	enum attr {
		none,
		sleep,
        freeze,
        confuse,
        pain,
        aggro,
        poison,
        regen,
		MP_regen,
		earth_resist,
		sea_resist,
		sky_resist,
		slash_resist,
		pierce_resist,
		blunt_resist,
		magic_resist,
		earth_weak,
		sea_weak,
		sky_weak,
		slash_weak,
		pierce_weak,
		blunt_weak,
		magic_weak,
		HP_up,
		MP_up,
        ATK_up,
        DEF_up,
        RES_up,
        SPD_up,
        LUK_up,
		HP_down,
		MP_down,
		ATK_down,
        DEF_down,
        RES_down,
        SPD_down,
        LUK_down,
		length
	}

	enum equipment_slots {
		main_hand,
		off_hand,
		two_hand,
		armor,
		ring
	}
	
	enum equipment_types {
		unarmed,
		pistol,
		dagger,
		short_sword, //counts as a "sword" for bonus
		book,
		crossbow, //counts as a "bow"
		rifle,
		sword,
		mace, //counts as a "hammer" for bonus
		spear,
		bow,
		staff,
		axe,
		hammer,
		shield,
		unarmored,
		light_armor, // all robes
		medium_armor, // all leather
		heavy_armor, // all steel plate
		ring,
		empty, // For no ring-situations
	}
	
	global.equipment_slot_by_type[equipment_types.ring] = equipment_slots.ring;
	global.equipment_slot_by_type[equipment_types.heavy_armor] = equipment_slots.armor;
	global.equipment_slot_by_type[equipment_types.medium_armor] = equipment_slots.armor;
	global.equipment_slot_by_type[equipment_types.light_armor] = equipment_slots.armor;
	global.equipment_slot_by_type[equipment_types.unarmored] = equipment_slots.armor;
	global.equipment_slot_by_type[equipment_types.shield] = equipment_slots.off_hand;
	global.equipment_slot_by_type[equipment_types.hammer] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.axe] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.bow] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.spear] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.mace] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.sword] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.rifle] = equipment_slots.two_hand;
	global.equipment_slot_by_type[equipment_types.crossbow] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.book] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.short_sword] = equipment_slots.off_hand;
	global.equipment_slot_by_type[equipment_types.dagger] = equipment_slots.off_hand;
	global.equipment_slot_by_type[equipment_types.pistol] = equipment_slots.main_hand;
	global.equipment_slot_by_type[equipment_types.unarmed] = equipment_slots.off_hand;
	
	// Monster attack pattern types
	enum attack_pattern {
		random,
		linear
	}
	
	//game state enums
	enum battle_phase {
		init,				// Set up objects/create events and animations
		waiting_for_input,  // Objects available for input
		execute_turn,       // Play battle animations in order
		backend_rest,       // Heal backend characters, move the dead to the backend
		check_win,          // Check for win
		check_lose,         // Check for lose (if not go back to waiting_for_input)
		clean_up            // Destroy Battle
	}
	
	// the menus in battle, enum used for determining focus/active while entering input
	enum battle_focus {
		no_focus,
		player_select,
		monster_select,
		action_select,
		target_player_select,
		target_monster_select,
		pause_button,
		pause_menu,
		execute_button
	}
	
	enum name_types {
		player,
		boss,
		npc_male,
		npc_female
	}
	
	enum player_list {
		alfred,
		ashley,
		catherine,
		earnest,
		isabelle,
		mary,
		thomas
	}

	enum monster_layout_types {
		five,        // die-5 layout
		four,        // die-4 layout
		three_right, //triangle pointing right
		three_left,  //triangle pointing left
		two_right,   //top-right closest
		two_left,    //bottom-right closest
		single,      //one enemy
	}
	
	enum monster_list {
		no_monster,
		
		// Forest Monsters
		blue_mushroom,
		red_mushroom
	}
	
	enum location_list {
	}

}

///@function fill_array
///@desc Creates a new array filled with a default value. Gamemaker doesn't make it easy to copy arrays, so I need to make sure that when I make arrays they are distinct variables. Particularly when I am initializing the characters
///@param {int} array_length
///@param {mixed} daga - the thing you are populating the array with.
function fill_array( array_length, data ){
	var new_array = [];
	for (i = array_length -1; i >=0 ; i--){
		new_array[i] = data;
	}
	return new_array;
}