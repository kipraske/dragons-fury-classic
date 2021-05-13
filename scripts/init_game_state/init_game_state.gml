/// @function init_game_state
//  @desc Loads Save Data if it exists, otherwise creates global initial values. Note saving happens piecemeal during transitions
function init_game_state(){

	global.history = load_json_file("history.json");
	
	// Debugging line to reinitialize every time
	global.history = false;

	if ( global.history ){
		global.player = {
			alfred: load_json_file("character/alfred.json"),
			ashley: load_json_file("character/ashley.json"),
			catherine: load_json_file("character/catherine.json"),
			earnest: load_json_file("character/earnest.json"),
			isabelle: load_json_file("character/isabelle.json"),
			mary: load_json_file("character/mary.json"),
			thomas: load_json_file("character/thomas.json")
		}
		
		global.battle = load_json_file("battle_state.json");
		global.game_tree = load_json_file("game_tree.json");
		global.inventory = load_json_file("inventory.json");
		global.settings = load_json_file("settings.json");	
	}
	else { // A new Game, create save file with initial values
	
		is_new_game = true;

		global.history = {
		    mobs: [],
		    bosses: [],
			map_aras: [],
		    game_time: 0,
		    ng_plus: 0
		}
		save_json_file(global.history, "history.json");
	
		global.player = {
			alfred: alfred_init(),
			ashley: ashley_init(),
			catherine: catherine_init(),
			earnest: earnest_init(),
			isabelle: isabelle_init(),
			mary: mary_init(),
			thomas: thomas_init()
		}
		
		// Add starting skill levels
		alfred_available_skills_init();
		ashley_available_skills_init();
		catherine_available_skills_init();
		earnest_available_skills_init();
		isabelle_available_skills_init();
		mary_available_skills_init();
		thomas_available_skills_init();
		
		// Populate stats based on equipment/skills
		calculate_player_stats_and_attr( "alfred" );
		calculate_player_stats_and_attr( "ashley" );
		calculate_player_stats_and_attr( "catherine" );
		calculate_player_stats_and_attr( "earnest" );
		calculate_player_stats_and_attr( "isabelle" );
		calculate_player_stats_and_attr( "mary" );
		calculate_player_stats_and_attr( "thomas" );
		
		save_json_file(global.player.alfred,    "character/alfred.json");
		save_json_file(global.player.ashley,    "character/ashley.json");
		save_json_file(global.player.catherine, "character/catherine.json");
		save_json_file(global.player.earnest,   "character/earnest.json");
		save_json_file(global.player.isabelle,  "character/isabelle.json");
		save_json_file(global.player.mary,      "character/mary.json");
		save_json_file(global.player.thomas,    "character/thomas.json");
		
		// Battle state outside the individual players/monsters. Mostly what turn and what order
		global.battle = {
			is_battle: false,
			phase: battle_phase.init,
			player_frontline: [],
			player_backline: [],
			monster_units: [],
			menu_focus: battle_focus.no_focus,
		}
		save_json_file(global.battle,    "battle_state.json");
		
		// game tree - the flags which determine all content
		global.game_tree = {
		    primary_character: {},
		    secondary_character: {},
		    bad_character_1: {},
		    bad_character_2: {},
		    act: 0,
		    branch: 0,
		    focus_character: noone,
		    branch_phase: 0,
		    epilogue_available: false,
		    city_government: "monarchy"
		}
		save_json_file(global.game_tree,    "game_tree.json");
		
		global.inventory = [];
		save_json_file(global.inventory,        "inventory.json");
		
		global.settings = {
			difficulty_level: 1, //Multiplier for enemy level
		}
		save_json_file(global.settings,        "settings.json");
	}
}