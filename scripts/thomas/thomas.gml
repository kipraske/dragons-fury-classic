/// @desc get the gamemaker sprite references to associate with this character
// Since the sprites data may change as the game changes we want to be able to refresh these values separately
function thomas_get_sprites() {
	return {
		face: spr_thomas_face,
		up: spr_thomas_up,
		right: spr_thomas_right,
		down: spr_thomas_down,
		left: spr_thomas_left,
		nod: spr_thomas_nod,
		smh: spr_thomas_smh,
		laugh: spr_thomas_laugh,
		surprise: spr_thomas_surprise
	}
}

///@desc the level 1 definition of each character
///These objects match the schema of the save files so you can use this as a reference
function thomas_init(){
	return {
		name: "Thomas",
		level: 1,
		job: jobs.monk,
		battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		battle_stats: fill_array( stats.length, 0),     // stats adjusted from battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		total_xp: 0,
		xp_pool: 0,
		equipment: {
			hand1: {},
			hand2: {},
			body: {},
			accessory: {
			    item_name: "Strong Belt",
			    item_type: equipment_types.belt,
				item_tier: equipment_tiers.rare,
			    item_level: 1,
			    item_bonus: [attr.ATK_up, attr.HP_up]
			}
		},
		equipped_skills: [
			skills.attack,
			skills.flurry,
			skills.heal,
			skills.unarmored_up,
			skills.unarmed_up
		],
		swap_skill: skills.tornado,
		available_skills: fill_array(skills.length, 0), // Value is level of skill
		sprites: thomas_get_sprites()
	};
}

///@desc add the level 1 skills for initialization. This should be called immediately after setting the globals with above function 
function thomas_available_skills_init(){
	global.player.thomas.available_skills[skills.flurry] = 1;
	global.player.thomas.available_skills[skills.tornado] = 1;
	global.player.thomas.available_skills[skills.quake] = 1;
	global.player.thomas.available_skills[skills.heal] = 1;
}