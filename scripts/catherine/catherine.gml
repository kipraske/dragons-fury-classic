/// @desc get the gamemaker sprite references to associate with this character
// Since the sprites data may change as the game changes we want to be able to refresh these values separately
function catherine_get_sprites() {
	return {
		face: spr_catherine_face,
		up: spr_catherine_up,
		right: spr_catherine_right,
		down: spr_catherine_down,
		left: spr_catherine_left,
		nod: spr_catherine_nod,
		smh: spr_catherine_smh,
		laugh: spr_catherine_laugh,
		surprise: spr_catherine_surprise
	}
}

///@desc the level 1 definition of each character
///These objects match the schema of the save files so you can use this as a reference
function catherine_init(){
	return {
		name: "Catherine",
		unit_type: unit_types.player,
		level: 1,
		job: jobs.thief,
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
			    item_name: "Lucky Hammer",
			    item_type: equipment_types.hammer,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.LUK_up,attr.HP_up]
			},
			hand2: {},
			body: {
			    item_name: "Agile Leather Armor",
			    item_type: equipment_types.medium_armor,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.SPD_up]
			},
			accessory: {
			    item_name: "Lucky Necklace",
			    item_type: equipment_types.necklace,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.LUK_up]
			}
		},
		equipped_skills: [
			skills.attack,
			skills.steal,
			skills.tornado,
			skills.heal,
			skills.gold_up
		],
		swap_skill: skills.flood,
		available_skills: fill_array(skills.length, 0), // Value is level of skill
		_sprites: catherine_get_sprites()
	};
}

///@desc add the level 1 skills for initialization. This should be called immediately after setting the globals with above function 
function catherine_available_skills_init(){
	global.player.catherine.available_skills[skills.steal] = 1;
	global.player.catherine.available_skills[skills.tornado] = 1;
	global.player.catherine.available_skills[skills.flood] = 1;
	global.player.catherine.available_skills[skills.heal] = 1;
}
