/// @function init_game_state
//  @desc Loads Save Data if it exists, otherwise creates global initial values. Note saving happens piecemeal during transitions
function init_game_state(){
	// Things that we just want to do at the beginning of the game
	randomize();
	init_gamepad_axis_pressed_as_button();
	gamepad_set_axis_deadzone(0, 0.7);

	// Start loading globals
	global.history = load_json_file("history.json");
	
	// Debugging line to reinitialize every time
	global.history = false;

	if ( global.history ){
		
		// Note in these player saves the _underscore variables denote those that will be overwritten by me or the engine. So changing them in the save makes no difference.
		global.player = {
			alfred: load_json_file("character/alfred.json"),
			ashley: load_json_file("character/ashley.json"),
			catherine: load_json_file("character/catherine.json"),
			earnest: load_json_file("character/earnest.json"),
			isabelle: load_json_file("character/isabelle.json"),
			mary: load_json_file("character/mary.json"),
			thomas: load_json_file("character/thomas.json")
		}
		
		// Reset player sprites, these may drift on new versions
		global.player.alfred.sprites    = alfred_get_sprites();
		global.player.ashley.sprites    = ashley_get_sprites();
		global.player.catherine.sprites = catherine_get_sprites();
		global.player.earnest.sprites   = earnest_get_sprites();
		global.player.isabelle.sprites  = isabelle_get_sprites();
		global.player.mary.sprites      = mary_get_sprites();
		global.player.thomas.sprites    = thomas_get_sprites();
		
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
		calculate_player_stats_and_attr( global.player.alfred );
		calculate_player_stats_and_attr( global.player.ashley );
		calculate_player_stats_and_attr( global.player.catherine );
		calculate_player_stats_and_attr( global.player.earnest );
		calculate_player_stats_and_attr( global.player.isabelle );
		calculate_player_stats_and_attr( global.player.mary );
		calculate_player_stats_and_attr( global.player.thomas );
		
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
			player_frontline: [], // up to MAX_FRONTEND_UNITS
			player_backline: [],  // up to MAX_TOTAL_UNITS - 1
			monster_units: [],    // Up to 5 at the moment
			monster_layout: 0,
			menu_focus: battle_focus.no_focus,
			next_menu_focus: battle_focus.no_focus,
			combo: 0,
			last_unit_type: unit_types.player
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
		    city_government: government_types.monarchy
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