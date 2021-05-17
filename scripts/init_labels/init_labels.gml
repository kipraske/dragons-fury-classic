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
	// 2- adjective - used for equipment
	global.labels = {
		// TODO - we want the names to be translatable too. For chinese or whatever
		init_names: [
			"Alfred",
			"Ashley",
			"Catherine",
			"Earnest",
			"Isabelle",
			"Mary",
			"Thomas"
		],
		
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
			["XP", "Experience Points are used to gain levels"]
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
			["", ""],
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
		
			["MP+", "Increases MP stat"],
			["Double Cast", "Use magic skills multiple times"],
			["MP Cost-", "MP costs are reduced for skills"],
			["MP Boost", "MP costs and power are increased"],
			["Staff+", "Equipped Staves are more effective"],
			["Book+",  "Equipped Books are more effective"],
			["Sleep Resist", "Sleep effects are less likely to occur"],
			["Earth Resist", "Earth damage is reduced"],
		
			["RES+", "Increases RES stat"],
			["Mimic", "Copies another ally or monster this turn"],
			["HP drain", "Skills which do damage also restore HP"],
			["Rest+", "Gained HP and MP while on backline are increased"],
			["Bow+", "Equipped Bows are more effective"],
			["Axe+", "Equipped Axes are more effective"],
			["Confuse Resist", "Confuse effects are less likely to occur"],
			["Sea Resist", "Sea damage is reduced"],
		
			["SPD+", "Increases SPD stat"],
			["Steal", "Gain an item from an enemy"],
			["Loot+", "Gain better post battle loot"],
			["Gold+", "Gain more gold post battle"],
			["Hammer+", "Equipped Hammers are more effective"],
			["Taunt Resist", "Taunt effects are less likely to occur"],
			["Pierce Resist", "Pierce damage is reduced"],
			
			["LUK+", "Increases LUK stat"],
			["Scan", "Get information about an enemy"],
			["Insight", "Backwards skill learning and status effects are more effective"],
			["Sword+", "Equipped Swords are more effective"],
			["Poison Resist", "Poison effects are less powerful"],
			["Sky Resist", "Sky damage is reduced"],
		
			["HP+", "Increases HP stat"],
			["Machine Gun", "Attack random enemies multiple times"],
			["Potion", "Restores HP, gains regen, and removes bad status effects"],
			["Grenade", "Attack all enemies. Apply one random status"],
			["Spear+", "Equipped Spears are more effective"],
			["Gun+", "Equipped pistols and rifles are more effective"],
			["Freeze Resist", "Freeze effects are less likely to occur"],
			["Magic Resist", "Magic damage is reduced"],
			
			["DEF+", "Increases DEF stat"],
			["Defend", "Reduces all types of incoming damage"],
			["Last Stand", "Increses all stats when HP is below 50%"],
			["Auto-Revive", "Once per battle, will revive automatically"],
			["Armor+", "Equipped Armor is more effective"],
			["Shield+", "Equipped Shields are more effective"],
			["Auto-Regen", "Perminent Regen in battle"],
			["Slash Resist", "Slash damage is reduced"],
			
			["ATK+", "Increases ATK stat"],
			["Flurry", "Attack multiple times"],
			["Counter", "Attack when damage is taken"],
			["MP Drain", "Skills which do damage also restore MP"],
			["Unarmored+", "Better protection when wearing no armor"],
			["Unarmed+", "Better attack when wearing no weapons"],
			["Pain Resist", "Pain effects are less likely to occur"],
			["Blunt Resist", "Blunt damage is reduced"]
		],
		//attr and equipment slots will have icons not text defined elsewhere
		
		// Equipment types have fancier names than "medium" or whatever, these are used for creating item names
		equipment_types: [
			["Unarmed", "No weapon equipped. Deals minor blunt damage, but gain an extra attack"],
			["Pistol", "Single-handed gun with piercing Damage. Ignores target DEF"],
			["Dagger", "Single-handed weapon with piercing damage. Can go in off-hand"],
			["Short Sword", "Single-handed sword with slash damage. Can go in off-hand"],
			["Book", "Single-handed weapon with magic damage"],
			["Crossbow", "Single-handed bow with piercing damage"],
			["Rifle", "Two-handed gun with piercing damage. Ignores target DEF"],
			["Sword", "Single-handed sword with slash damage"],
			["Mace", "Single-handed hammer with blunt damage"],
			["Spear", "Two-handed weapon with piercing damage"],
			["Longbow", "Two-handed bow with piercing damage"],
			["Staff", "Two-handed weapon with magic damage"],
			["Axe", "Two-handed weapon with slashing damage"],
			["Hammer", "Two-handed weapon with blunt damage"],
			["Sheild", "Armor worn in the off-hand"],
			["Unarmored", "No armor equipped, but gains an extra attack"],
			["Robe", "Light armor which offers modest protection"],
			["Leather Armor", "Medium armor which offers moderate protection"],
			["Steel Plate", "Heavy armor which offers high protection"],
			["Ring", "Accessory which offers extra bonuses"],
			["Empty", "No accessory equipped. There is no bonus for this"]	
		],
		attr_adjectives: [
			"",
			"Vigilant",
			"Liberating",
			"Soothing",
			"Calm",
			"Sterile",
			"Regenerating",
			"Channeling",
			"Earth",
			"Sea",
			"Sky",
			"Solid",
			"Linked",
			"Scaled",
			"Shielding",
			"Cursed",
			"Cursed",
			"Cursed",
			"Cursed",
			"Cursed",
			"Cursed",
			"Cursed",
			"Robust",
			"Magical",
			"Heavy",
			"Sturdy",
			"Strong",
			"Lucky",
			"Quick",
			"Cursed",
			"Cursed",
			"Cursed",
			"Cursed",
			"Cursed",
			"Cursed",
			"Cursed"
		],
		monster_names: [], // TODO after enum is complete
		location_names: [] // TODO after all locations are complete
	}

	if ( ! file_exists("labels.json") ) {
		save_json_file(global.labels, "labels.json");
	}

}