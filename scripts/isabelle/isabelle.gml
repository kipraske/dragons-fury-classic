/// @desc get the gamemaker sprite references to associate with this character
// Since the sprites data may change as the game changes we want to be able to refresh these values separately
function isabelle_get_sprites() {
	return {
		face: spr_isabelle_face,
		up: spr_isabelle_up,
		right: spr_isabelle_right,
		down: spr_isabelle_down,
		left: spr_isabelle_left,
		nod: spr_isabelle_nod,
		smh: spr_isabelle_smh,
		laugh: spr_isabelle_laugh,
		surprise: spr_isabelle_surprise
	}
}

///@desc the level 1 definition of each character
///These objects match the schema of the save files so you can use this as a reference
function isabelle_init(){
	return {
		name: "Isabelle",
		level: 1,
		job: jobs.inventor,
		battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
		perm_attr: fill_array( attr.length, 0 ),        // perminent effects: level
		battle_stats: fill_array( stats.length, 0),     // stats adjusted from battle_attr
		perm_stats: fill_array( stats.length, 0 ),      // calculated stats
		total_xp: 0,
		xp_pool: 0,
		equipment: {
			hand1: {
			    item_name: "Quick Rifle",
			    item_type: equipment_types.rifle,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.SPD_up]
			},
			hand2: {},
			body: {
			    item_name: "Sturdy Leather Armor",
			    item_type: equipment_types.medium_armor,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.DEF_up]
			},
			accessory: {
			    item_name: "Robust Shoes",
			    item_type: equipment_types.shoes,
				item_tier: equipment_tiers.common,
			    item_level: 1,
			    item_bonus: [attr.HP_up]
			}
		},
		equipped_skills: [
			skills.attack,
			skills.machine_gun,
			skills.potion,
			skills.grenade,
			skills.noskill,
		],
		swap_skill: skills.flood,
		available_skills: fill_array(skills.length, 0), // Value is level of skill
		sprites: isabelle_get_sprites()
	};
}

///@desc add the level 1 skills for initialization. This should be called immediately after setting the globals with above function 
function isabelle_available_skills_init() {
	global.player.isabelle.available_skills[skills.machine_gun] = 1;
	global.player.isabelle.available_skills[skills.potion] = 1;
	global.player.isabelle.available_skills[skills.grenade] = 1;
	global.player.isabelle.available_skills[skills.flood] = 1;
}