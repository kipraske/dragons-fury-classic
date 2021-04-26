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
				battle_current_hp: 1,
				battle_current_mp: 1,
				battle_current_xp_gained: 0,
			    xp_till_next_level: 0,
			    xp_skill_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Magic Staff",
			            item_type: equipment_types.staff,
			            item_level: 1,
			            item_bonus: [status_effects.mp_up, status.effects.atk_up]
			        },
			        hand2: {},
			        body: {
			            item_name: "Magic Robe",
			            item_type: equipment_types.light_armor,
			            item_level: 1,
			            item_bonus: [status_effects.mp_up]
			        },
			        accessory: {
			            item_name: "Magic Ring",
			            item_type: equipment_types.ring,
			            item_level: 1,
			            item_bonus: [status_effects.mp_up, status_effects.RES_up]
			        }
			    },
			    equipped_skills: [
					skills.attack,
					skills.double_cast,
					skills.quake,
					skills.heal,
					skills.mp_cost_down
			    ],
			    swap_skill: {},
			    job_skills: [
			        [ skills.double_cast, 1 ]
			    ],
			    magic_skills: [
					[ skills.quake, 1 ],
					[ skills.heal, 1 ]
			    ]
			},
			ashley: {
			    name: "Ashley",
			    level: 1,
			    job: "druid",
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Robust Bow",
			            item_type: "bow",
			            slot_type: "two_hands",
			            item_level: 1,
			            item_bonus: ["HP", "DEF"]
			        },
			        hand2: {},
			        body: {
			            item_name: "Lucky Leather Armor",
			            item_type: "medium",
			            slot_type: "armor",
			            item_level: 1,
			            item_bonus: ["LUK"]
			        },
			        accessory: {
			            item_name: "Heavy Ring",
			            item_type: "ring",
			            slot_type: "accessory",
			            item_level: 1,
			            item_bonus: ["RES", "SPD"]
			        }
			    },
			    equipped_skills: [
			        "Attack",
			        "Mimic",
			        "Flood",
			        "Heal",
			        "HP Drain"
			    ],
			    swap_skill: {},
			    job_skills: [
			        {
			            name: "Mimic",
			            level: 1
			        }
			    ],
			    magic_skills: [
			        {
			            name: "Flood",
			            level: 1
			        },
			        {
			            name: "Heal",
			            level: 1
			        }
			    ]
			},
			catherine: {
			    name: "Catherine",
			    level: 1,
			    job: "thief",
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Lucky Hammer",
			            item_type: "hammer",
			            slot_type: "two_hands",
			            item_level: 1,
			            item_bonus: ["LUK", "HP"]
			        },
			        hand2: {},
			        body: {
			            item_name: "Agile Leather Armor",
			            item_type: "medium",
			            slot_type: "armor",
			            item_level: 1,
			            item_bonus: ["SPD"]
			        },
			        accessory: {
			            item_name: "Lucky Ring",
			            item_type: "ring",
			            slot_type: "accessory",
			            item_level: 1,
			            item_bonus: ["SPD", "LUK"]
			        }
			    },
			    equipped_skills: [
			        "Attack",
			        "Steal",
			        "Tornado",
			        "Heal",
			        "Gold+"
			    ],
			    swap_skill: {},
			    job_skills: [
			        {
			            name: "Steal",
			            level: 1
			        }
			    ],
			    magic_skills: [
			        {
			            name: "Tornado",
			            level: 1
			        },
			        {
			            name: "Heal",
			            level: 1
			        }
			    ]
			},
			earnest: {
			    name: "Earnest",
			    level: 1,
			    job: "oracle",
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {},
			        hand2: {},
			        body: {},
			        accessory: {
			            item_name: "Strong Ring+",
			            item_type: "ring",
			            slot_type: "accessory",
			            item_level: 1,
			            item_bonus: ["ATK", "HP", "SPD"]
			        }
			    },
			    equipped_skills: [
			        "Attack",
			        "Flurry",
			        "Heal",
			        "Unarmored+",
			        "Unarmed+"
			    ],
			    swap_skill: "Tornado",
			    job_skills: [
			        {
			            name: "Flurry",
			            level: 1
			        }
			    ],
			    magic_skills: [
			        {
			            name: "Tornado",
			            level: 1
			        },
			        {
			            name: "Heal",
			            level: 1
			        }
			    ]
			},
			isabelle: {
			    name: "Isabelle",
			    level: 1,
			    job: "Inventor",
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Quick Rifle",
			            item_type: "sword",
			            slot_type: "two_hand",
			            item_level: 1,
			            item_bonus: ["SPD"]
			        },
			        hand2: {},
			        body: {
			            item_name: "Sturdy Leather Armor",
			            item_type: "medium",
			            slot_type: "armor",
			            item_level: 1,
			            item_bonus: ["DEF"]
			        },
			        accessory: {
			            item_name: "Quick Ring",
			            item_type: "ring",
			            slot_type: "accessory",
			            item_level: 1,
			            item_bonus: ["SPD", "HP"]
			        }
			    },
			    equipped_skills: [
			        "Attack",
			        "Machine Gun",
			        "Potion",
			        "Grenade",
			        "Flood"
			    ],
			    swap_skill: "",
			    job_skills: [
			        {
			            name: "Machine Gun",
			            level: 1
			        },
			        {
			            name: "Potion",
			            level: 1
			        },
			        {
			            name: "Grenade",
			            level: 1
			        }
			    ],
			    magic_skills: [
			        {
			            name: "Flood",
			            level: 1
			        }
			    ]
			},
			mary: {
			    name: "Mary",
			    level: 1,
			    job: "knight",
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Sturdy Sword",
			            item_type: "sword",
			            slot_type: "main_hand",
			            item_level: 1,
			            item_bonus: ["DEF"]
			        },
			        hand2: {
			            item_name: "Robust Shield",
			            item_type: "shield",
			            slot_type: "off_hand",
			            item_level: 1,
			            item_bonus: ["HP"]
			        },
			        body: {
			            item_name: "Heavy Steel Plate",
			            item_type: "heavy",
			            slot_type: "armor",
			            item_level: 1,
			            item_bonus: ["RES", "-ATK"]
			        },
			        accessory: {
			            item_name: "Sturdy Ring",
			            item_type: "ring",
			            slot_type: "accessory",
			            item_level: 1,
			            item_bonus: ["DEF", "HP"]
			        }
			    },
			    equipped_skills: [
			        "Attack",
			        "Defend",
			        "Quake",
			        "Heal",
			        "Stand Ground"
			    ],
			    swap_skill: "",
			    job_skills: [
			        {
			            name: "Defend",
			            level: 1
			        }
			    ],
			    magic_skills: [
			        {
			            name: "Quake",
			            level: 1
			        },
			        {
			            name: "Heal",
			            level: 1
			        }
			    ]
			},
			thomas: {
			    name: "Thomas",
			    level: 1,
			    job: "monk",
			    xp_till_next_level: 0,
			    xp_pool: 0,
			    equipment: {
			        hand1: {
			            item_name: "Magic Sword",
			            item_type: "sword",
			            slot_type: "main_hand",
			            item_level: 1,
			            item_bonus: ["MP"]
			        },
			        hand2: {
			            item_name: "Robust Dagger",
			            item_type: "short_sword",
			            slot_type: "off_hand",
			            item_level: 1,
			            item_bonus: ["HP"]
			        },
			        body: {
			            item_name: "Heavy Leather Armor",
			            item_type: "medium",
			            slot_type: "armor",
			            item_level: 1,
			            item_bonus: ["RES"]
			        },
			        accessory: {
			            item_name: "Lucky Ring",
			            item_type: "ring",
			            slot_type: "accessory",
			            item_level: 1,
			            item_bonus: ["LUK", "DEF"]
			        }
			    },
			    equipped_skills: [
			        "Attack",
			        "Scan",
			        "Sleep",
			        "Revive",
			        "Insight"
			    ],
			    swap_skill: "",
			    job_skills: [
			        {
			            name: "Flurry",
			            level: 1
			        }
			    ],
			    magic_skills: [
			        {
			            name: "Poison",
			            level: 1
			        },
			        {
			            name: "Flood",
			            level: 1
			        }
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
	}
}