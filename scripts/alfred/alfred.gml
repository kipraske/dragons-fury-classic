/// @desc get the gamemaker sprite references to associate with this character
// Since the sprites data may change as the game changes we want to be able to refresh these values separately
function alfred_get_sprites() {
	return {
		face: spr_alfred_face,
		up: spr_alfred_up,
		right: spr_alfred_right,
		down: spr_alfred_left,
		nod: spr_alfred_nod,
		smh: spr_alfred_smh,
		laugh: spr_alfred_laugh,
		surprise: spr_alfred_surprise
	}
}

///@desc the level 1 definition of each character
///These objects match the schema of the save files so you can use this as a reference
function alfred_init(){
	return {
		name: "Alfred",
		level: 1,
		job: jobs.mage,
		battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		battle_stats: fill_array( stats.length, 0),     // stats adjusted from battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		total_xp: 0,
		xp_skill_pool: 0,
		equipment: {
			hand1: {
				item_name: "Magic Staff",
				item_type: equipment_types.staff,
				item_level: 1,
				item_bonus: [attr.MP_up, attr.RES_up]
			},
			hand2: {},
			body: {
				item_name: "Magic Robe",
				item_type: equipment_types.light_armor,
				item_level: 1,
				item_bonus: [attr.MP_up]
			},
			accessory: {
				item_name: "Magic Ring",
				item_type: equipment_types.ring,
				item_level: 1,
				item_bonus: [attr.MP_up, attr.RES_up]
			}
		},
		equipped_skills: [
			skills.attack,
			skills.double_cast,
			skills.quake,
			skills.heal,
			skills.mp_cost_down
		],
		swap_skill: skills.tornado,
		available_skills: fill_array(skills.length, 0), // Value is level of skill
		sprites: alfred_get_sprites()
	};
}

///@desc add the level 1 skills for initialization. This should be called immediately after setting the globals with above function 
function alfred_available_skills_init(){
	global.player.alfred.available_skills[skills.double_cast] = 1;
	global.player.alfred.available_skills[skills.quake] = 1;
	global.player.alfred.available_skills[skills.tornado] = 1;
	global.player.alfred.available_skills[skills.heal] = 1;
}
