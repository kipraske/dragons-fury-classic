/// @desc get the gamemaker sprite references to associate with this character
// Since the sprites data may change as the game changes we want to be able to refresh these values separately
function earnest_get_sprites() {
	return {
		face: spr_earnest_face,
		up: spr_earnest_up,
		right: spr_earnest_right,
		down: spr_earnest_down,
		left: spr_earnest_left,
		nod: spr_earnest_nod,
		smh: spr_earnest_smh,
		laugh: spr_earnest_laugh,
		surprise: spr_earnest_surprise
	}
}

///@desc the level 1 definition of each character
///These objects match the schema of the save files so you can use this as a reference
function earnest_init(){
	return {
		name: "Earnest",
		unit_type: unit_types.player,
		level: 1,
		job: jobs.oracle,
		_battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		_battle_stats: fill_array( stats.length, 0),     // stats adjusted from _battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		_selected_action: skills.noskill,
		_selected_target: noone,
		_menu_position: 0,
		_unit_position: 0,
		total_xp: 0,
		total_xp: 0,
		xp_pool: 0,
		equipment: {
			hand1: {
			    item_name: "Magic Sword",
			    item_type: equipment_types.sword,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.MP_up]
			},
			hand2: {
			    item_name: "Robust Dagger",
			    item_type: equipment_types.dagger,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.HP_up]
			},
			body: {
			    item_name: "Heavy Leather Armor",
			    item_type: equipment_types.medium_armor,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.RES_up]
			},
			accessory: {
			    item_name: "Lucky Cloak",
			    item_type: equipment_types.cloak,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.LUK_up]
			}
		},
		equipped_skills: [
			skills.attack,
			skills.scan,
			skills.sleep,
			skills.revive,
			skills.insight
		],
		swap_skill: skills.poison,
		available_skills: fill_array(skills.length, 0), // Value is level of skill
		_sprites: earnest_get_sprites()
	};
}

///@desc add the level 1 skills for initialization. This should be called immediately after setting the globals with above function 
function earnest_available_skills_init() {
	global.player.earnest.available_skills[skills.scan] = 1;
	global.player.earnest.available_skills[skills.poison] = 1;
	global.player.earnest.available_skills[skills.revive] = 1;
	global.player.earnest.available_skills[skills.sleep] = 1;
}


