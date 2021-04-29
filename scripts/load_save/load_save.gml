/// @function load_save
//  @desc Loads Save Data if it exists, otherwise creates initial values. Note saving happens piecemeal during transitions
function load_save(){

	var _is_continue_game = load_json_file("history.json");
	// TODO - for debugging fix to false
	_is_continue_game = false;

	if ( _is_continue_game){
		global.player = {
			alfred: load_json_file("character/alfred.json"),
			ashley: load_json_file("character/ashley.json"),
			catherine: load_json_file("character/catherine.json"),
			earnest: load_json_file("character/earnest.json"),
			isabelle: load_json_file("character/isabelle.json"),
			mary: load_json_file("character/mary.json"),
			thomas: load_json_file("character/thomas.json")
		}
	}
	else { // A new Game, create save file with initial values
	
		is_new_game = true;

		global.history = {
		    mobs: [],
		    bosses: [],
		    game_time: 0,
		    ng_plus: 0
		}
		save_json_file(global.history, "history.json");
	
		global.player = {
			alfred: {
			    name: "Alfred",
			    level: 1,
			    job: jobs.mage,
				battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
				player_attr: fill_array( attr.length, 0 ),      // perminent effects: level
				battle_stat: {
					current_hp: 1,
					current_mp: 1,
					current_level: 1,
					xp_gained: 0,
				},
			    total_xp: 0,
			    xp_skill_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Magic Staff",
			            item_type: equipment_types.staff,
			            item_level: 1,
			            item_bonus: [attr.MP_up, attr.MP_up]
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
			    job_skills: [
			        [ skills.double_cast, 1 ]
			    ],
			    magic_skills: [
					[ skills.quake, 1 ],
					[ skills.tornado, 1],
					[ skills.heal, 1 ],
			    ]
			},
			ashley: {
			    name: "Ashley",
			    level: 1,
			    job: jobs.druid,
				battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
				player_attr: fill_array( attr.length, 0 ),      // perminent effects: level
				battle_stat: {
					current_hp: 1,
					current_mp: 1,
					current_level: 1,
					xp_gained: 0,
				},
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Robust Bow",
			            item_type: equipment_types.bow,
			            item_level: 1,
			            item_bonus: [attr.HP_up, attr.DEF_up]
			        },
			        hand2: {},
			        body: {
			            item_name: "Lucky Leather Armor",
			            item_type: equipment_types.medium_armor,
			            item_level: 1,
			            item_bonus: [attr.LUK_up]
			        },
			        accessory: {
			            item_name: "Heavy Ring",
			            item_type: equipment_types.ring,
			            item_level: 1,
			            item_bonus: [attr.RES_up, attr.SPD_up]
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
			    job_skills: [
					[ skills.mimic, 1 ],
			    ],
			    magic_skills: [
					[ skills.flood, 1 ],
					[ skills.quake, 1],
					[ skills.heal, 1 ]
			    ]
			},
			catherine: {
			    name: "Catherine",
			    level: 1,
			    job: jobs.thief,
				battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
				player_attr: fill_array( attr.length, 0 ),      // perminent effects: level
				battle_stat: {
					current_hp: 1,
					current_mp: 1,
					current_level: 1,
					xp_gained: 0,
				},
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Lucky Hammer",
			            item_type: equipment_types.hammer,
			            item_level: 1,
			            item_bonus: [attr.LUK_up,attr.HP_up]
			        },
			        hand2: {},
			        body: {
			            item_name: "Agile Leather Armor",
			            item_type: equipment_types.medium_armor,
			            item_level: 1,
			            item_bonus: [attr.SPD_up]
			        },
			        accessory: {
			            item_name: "Lucky Ring",
			            item_type: equipment_types.ring,
			            item_level: 1,
			            item_bonus: [attr.LUK_up, attr.SPD_up]
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
			    job_skills: [
					[ skills.steal, 1 ]
			    ],
			    magic_skills: [
					[ skills.tornado, 1 ],
					[ skills.flood, 1 ],
					[ skills.heal, 1 ]
			    ]
			},
			earnest: {
			    name: "Earnest",
			    level: 1,
			    job: jobs.oracle,
				battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
				player_attr: fill_array( attr.length, 0 ),      // perminent effects: level
				battle_stat: {
					current_hp: 1,
					current_mp: 1,
					current_level: 1,
					xp_gained: 0,
				},
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Magic Sword",
			            item_type: equipment_types.sword,
			            item_level: 1,
			            item_bonus: [attr.MP_up]
			        },
			        hand2: {
			            item_name: "Robust Dagger",
			            item_type: equipment_types.short_sword,
			            item_level: 1,
			            item_bonus: [attr.HP_up]
			        },
			        body: {
			            item_name: "Heavy Leather Armor",
			            item_type: equipment_types.medium_armor,
			            item_level: 1,
			            item_bonus: [attr.RES_up]
			        },
			        accessory: {
			            item_name: "Lucky Ring",
			            item_type: equipment_types.ring,
			            item_level: 1,
			            item_bonus: [attr.LUK_up, attr.DEF_up]
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
			    job_skills: [
					[skills.scan, 1]
			    ],
			    magic_skills: [
					[skills.poison, 1],
					[skills.revive, 1],
					[skills.sleep, 1]
			    ]
			},
			isabelle: {
			    name: "Isabelle",
			    level: 1,
			    job: jobs.inventor,
				battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
				player_attr: fill_array( attr.length, 0 ),      // perminent effects: level
				battle_stat: {
					current_hp: 1,
					current_mp: 1,
					current_level: 1,
					xp_gained: 0,
				},
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Quick Rifle",
			            item_type: equipment_types.rifle,
			            item_level: 1,
			            item_bonus: [attr.SPD_up]
			        },
			        hand2: {},
			        body: {
			            item_name: "Sturdy Leather Armor",
			            item_type: equipment_types.medium_armor,
			            item_level: 1,
			            item_bonus: [attr.DEF_up]
			        },
			        accessory: {
			            item_name: "Quick Ring",
			            item_type: equipment_types.ring,
			            item_level: 1,
			            item_bonus: [attr.SPD_up, attr.HP_up]
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
			    job_skills: [
					[skills.machine_gun, 1],
					[skills.potion, 1],
					[skills.grenade, 1],
			    ],
			    magic_skills: [
					[skills.flood, 1]
			    ]
			},
			mary: {
			    name: "Mary",
			    level: 1,
			    job: jobs.knight,
				battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
				player_attr: fill_array( attr.length, 0 ),      // perminent effects: level
				battle_stat: {
					current_hp: 1,
					current_mp: 1,
					current_level: 1,
					xp_gained: 0,
				},
			    xp_till_next_level: 0,
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
			    job_skills: [
					[skills.defend, 1]
			    ],
			    magic_skills: [
					[skills.quake, 1],
					[skills.flood, 1],
					[skills.heal, 1]
			    ]
			},
			thomas: {
			    name: "Thomas",
			    level: 1,
			    job: jobs.monk,
				battle_attr: fill_array( attr.length, [0, 0] ), // status effects: 0-level, 1-duration
				player_attr: fill_array( attr.length, 0 ),      // perminent effects: level
				battle_stat: {
					current_hp: 1,
					current_mp: 1,
					current_level: 1,
					xp_gained: 0,
				},
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {},
			        hand2: {},
			        body: {},
			        accessory: {
			            item_name: "Strong Ring+",
			            item_type: equipment_types.ring,
			            item_level: 1,
			            item_bonus: [attr.ATK_up, attr.HP_up, attr.SPD_up]
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
			    job_skills: [
					[skills.flurry, 1]
			    ],
			    magic_skills: [
					[skills.tornado, 1],
					[skills.quake, 1],
					[skills.heal, 1]
				]
			}
		}
		save_json_file(global.player.alfred,    "character/alfred.json");
		save_json_file(global.player.ashley,    "character/ashley.json");
		save_json_file(global.player.catherine, "character/catherine.json");
		save_json_file(global.player.earnest,   "character/earnest.json");
		save_json_file(global.player.isabelle,  "character/isabelle.json");
		save_json_file(global.player.mary,      "character/mary.json");
		save_json_file(global.player.thomas,    "character/thomas.json");
		
		global.battle = {
			is_battle: false,
			phase: battle_phase.init,
			player_frontline: [],
			player_backline: [],
			monsters: [],
		}
	}
}