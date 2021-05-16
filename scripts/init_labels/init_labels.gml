///@desc creates the maps for menu output and help text. Will use this later for localization
function init_labels(){

	// TODO as new langugages are created, point to different labels.json files
	// For now we will just use the internal labels definitions below which is generated if no labels are found
	// global.labels = load_json_file("labels.json");
	
	//if (global.labels){
	//	return;
	//}
	
	// 0- label
	// 1- help text
	global.labels = {
		stats: [
			["HP",  "Health Points are how much damage you can take until you die"],
			["MP",  "Mana Points are used to cast magical skills"],
			["ATK", "Attack determines damage for all skills"],
			["DEF", "Defense reduces single target attacks"],
			["RES", "Resistance reduces area target attacks"],
			["SPD", "Speed determines turn order. High speed may give bonus attacks"],
			["LUK", "Luck determines critical rate as well as status success rate"],
			["Current HP", 0],
			["Current MP", 0],
			["Level", "Level increases all of your stats"],
			["XP", "Experience Points are used to gain levels"],
		],

		jobs: [
			["Mage", "Casts magic more effectively"],
			["Druid", "Mimics the skills of enemies"],
			["Theif", "Steals items and finds better equipment"],
			["Oracle", "Learns skills differently by seeing the future"],
			["Inventor", "Uses science and tools for all situations"],
			["Knight", "Protects and defends with heavy armor and shields"],
			["Monk", "Fights with bare fists to hit many times"]
		],
		
		skills: [
			["noskill", 0]
			["Attack", "Use your weapon and deal damage"],
			["Swap", "Change party member between front and back lines"],
		
			["Heal", "Restores HP"],
			["Poison", "Deals damage over time"],
			["Quake", "Deals earth damage"],
			["Tornado", "Deals sky damage"],
			["Flood", "Deals sea damage"],
			
			["Storm", "Deals sea and sky damage"],
			["Ice", "Deals sea and earth damage"],
			["Meteor", "Deals sky and earth damage"],
			["Smite", "Deals earth, sea, and sky damage"],
			
			["DEF+", "Increases DEF stat"],
			["RES+", "Increases RES stat"],
			["Regen", "Restores HP over time"],
			["SPD+", "Increases SPD stat"],
			["LUK+", "Increases LUK stat"],
			["ATK+", "Increases ATK stat"],
			["Revive", "Recover from death status"],
			["MP Regen", "Recover MP over time"],
		
			["DEF-", "Decreases DEF stat"],
			["RES-", "Decreases RES stat"],
			["Taunt", "This character must be targeted for single target attacks"],
			["SPD-", "Decreases SPD stat"],
			["LUK-", "Decreases LUK stat"],
			["ATK-", "Decreases ATK stat"],
			["Plague", "Inflicts random bad status effects and stat penalties"],
			["Flash", "Removes all stat bonueses and penalties"],
		
			["Purify", "Removes all bad status effects"],
			["Pain", "Target is damaged for each attack they do"],
			["Confuse", "Target will use random skills against random targets"],
			["Freeze", "Target loses access to some skills"],
			["Sleep", "Target cannot act. Ends if target takes damage"],

			["Void", "Damage based on the current HP of the target"],
		
		// Mage
		passive_MP_up,
		double_cast,
		mp_cost_down,
		mp_turbo,
		staff_up,
		book_up,
		sleep_resist,
		earth_resist,
		
		// Druid
		passive_RES_up,
		mimic,
		hp_drain,
		rest_up,
		bow_up,
		ax_up,
		confusion_resist,
		sea_resist,
		
		// Thief
		passive_SPD_up,
		steal,
		loot_up,
		gold_up,
		hammer_up,
		accessory_up,
		aggro_resist,
		pierce_resist,
		
		// Oracle
		passive_LUK_up,
		scan,
		insight,
		xp_up,
		sword_up,
		dagger_up,
		poison_resist,
		sky_resist,
		
		// Inventor
		passive_HP_up,
		machine_gun,
		potion,
		grenade,
		spear_up,
		gun_up,
		freeze_resist,
		magic_resist,
		
		// Knight
		passive_DEF_up,
		defend,
		last_stand,
		auto_revive,
		heavy_armor_up,
		shield_up,
		auto_regen,
		slash_resist,
		
		// Monk
		passive_ATK_up,
		flurry,
		counter,
		mp_drain,
		unarmored_up,
		unarmed_up,
		pain_resist,
		blunt_resist,
		],
		
		//attr and equipment slots will have icons not text defined elsewhere
		
		// Equipment types have fancier names than "medium" or whatever, these are used for creating item names
		equipment_types: [],
		attr_adjectives: [],
	}

	if ( ! file_exists("labels.json") ) {
		save_json_file(global.labels, "labels.json");
	}

}