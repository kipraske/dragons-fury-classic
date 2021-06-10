/// @desc get the gamemaker sprite references to associate with this character
// Since the sprites data may change as the game changes we want to be able to refresh these values separately
function ashley_get_sprites() {
	return {
		face: spr_ashley_face,
		up: spr_ashley_up,
		right: spr_ashley_right,
		down: spr_ashley_down,
		left: spr_ashley_left,
		nod: spr_ashley_nod,
		smh: spr_ashley_smh,
		laugh: spr_ashley_laugh,
		surprise: spr_ashley_surprise
	}
}

///@desc the level 1 definition of each character
///These objects match the schema of the save files so you can use this as a reference
function ashley_init(){
	return {
		name: "Ashley",
		unit_type: unit_types.player,
		level: 1,
		job: jobs.druid,
		battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		battle_stats: fill_array( stats.length, 0),     // stats adjusted from battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		selected_action: skills.noskill,
		selected_target: noone,
		total_xp: 0,
		xp_pool: 0,
		equipment: {
			hand1: {
			    item_name: "Robust Bow",
			    item_type: equipment_types.bow,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.HP_up, attr.DEF_up]
			},
			hand2: {},
			body: {
			    item_name: "Lucky Leather Armor",
			    item_type: equipment_types.medium_armor,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.LUK_up]
			},
			accessory: {
			    item_name: "Heavy Shoes",
			    item_type: equipment_types.shoes,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.RES_up]
			}
		},
		equipped_skills: [
			skills.attack,
			skills.mimic,
			skills.flood,
			skills.heal,
			skills.hp_drain
		],
		swap_skill: skills.quake,
		available_skills: fill_array(skills.length, 0), // Value is level of skill
		sprites: ashley_get_sprites()
	};
}

///@desc add the level 1 skills for initialization. This should be called immediately after setting the globals with above function 
function ashley_available_skills_init() {
	global.player.ashley.available_skills[skills.mimic] = 1;
	global.player.ashley.available_skills[skills.flood] = 1;
	global.player.ashley.available_skills[skills.quake] = 1;
	global.player.ashley.available_skills[skills.heal] = 1;
}