/// @desc get the gamemaker sprite references to associate with this character
// Since the sprites data may change as the game changes we want to be able to refresh these values separately
function mary_get_sprites() {
	return {
		face: spr_mary_face,
		up: spr_mary_up,
		right: spr_mary_right,
		down: spr_mary_down,
		left: spr_mary_left,
		nod: spr_mary_nod,
		smh: spr_mary_smh,
		laugh: spr_mary_laugh,
		surprise: spr_mary_surprise
	}
}

///@desc the level 1 definition of each character
///These objects match the schema of the save files so you can use this as a reference
function mary_init(){
	return {
		name: "Mary",
		unit_type: unit_types.player,
		level: 1,
		job: jobs.knight,
		_battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		_battle_stats: fill_array( stats.length, 0),     // stats adjusted from _battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		_selected_action: skills.noskill,
		_selected_target: noone,
		_menu_position: 0,
		_unit_position: 0,
		total_xp: 0,
		xp_pool: 0,
		equipment: {
			hand1: {
			    item_name: "Sturdy Sword",
			    item_type: equipment_types.sword,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.DEF_up]
			},
			hand2: {
			    item_name: "Robust Shield",
			    item_type: equipment_types.shield,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.HP_up]
			},
			body: {
			    item_name: "Heavy Steel Plate",
			    item_type: equipment_types.heavy_armor,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.RES_up, attr.ATK_down]
			},
			accessory: {
			    item_name: "Sturdy Bracers",
			    item_type: equipment_types.bracers,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.DEF_up]
			}
		},
		equipped_skills: [
			skills.attack,
			skills.defend,
			skills.quake,
			skills.heal,
			skills.last_stand
		],
		swap_skill: skills.flood,
		available_skills: fill_array(skills.length, 0), // Value is level of skill
		_sprites: mary_get_sprites()
	};
}

///@desc add the level 1 skills for initialization. This should be called immediately after setting the globals with above function 
function mary_available_skills_init() {
	global.player.mary.available_skills[skills.defend] = 1;
	global.player.mary.available_skills[skills.quake] = 1;
	global.player.mary.available_skills[skills.flood] = 1;
	global.player.mary.available_skills[skills.heal] = 1;
}