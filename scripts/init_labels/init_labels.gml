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
			["ATK", "Attack determines damage for all skills"],
			["DEF", "Defense reduces single target attacks"],
			["RES", "Resistance reduces area target attacks"],
			["SPD", "Speed determines turn order. High speed may give bonus attacks"],
			["LUK", "Luck determines critical rate as well as status success rate"]
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