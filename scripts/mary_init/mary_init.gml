/// @desc get the gamemaker sprite references to associate with this character
// Since the sprites data may change as the game changes we want to be able to refresh these values separately
function mary_get_sprites() {
	return {
		face: spr_mary_face,
		up: spr_mary_up,
		right: spr_mary_right,
		down: spr_mary_left,
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
		level: 1,
		job: jobs.knight,
		battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		battle_stats: fill_array( stats.length, 0),     // stats adjusted from battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		total_xp: 0,
		xp_pool: 0,
		equipment: {
			hand1: {
			    item_name: "Sturdy Sword",
			    item_type: equipment_types.sword,
			    item_level: 1,
			    item_bonus: [attr.DEF_up]
			},
			hand2: {
			    item_name: "Robust Shield",
			    item_type: equipment_types.shield,
			    item_level: 1,
			    item_bonus: [attr.HP_up]
			},
			body: {
			    item_name: "Heavy Steel Plate",
			    item_type: equipment_types.heavy_armor,
			    item_level: 1,
			    item_bonus: [attr.RES_up, attr.ATK_down]
			},
			accessory: {
			    item_name: "Sturdy Ring",
			    item_type: equipment_types.ring,
			    item_level: 1,
			    item_bonus: [attr.DEF_up, attr.HP_up]
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
		sprites: mary_get_sprites()
	};
}

