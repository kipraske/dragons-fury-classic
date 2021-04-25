/// @description Loads Save Data, populates application globals
// You can write your code in this editor

var _is_continue_game = load_json_file("save/history.json");

if ( _is_continue_game){
	global.player = {
		alfred: load_json_file("save/character/alfred.json"),
		ashley: load_json_file("save/character/ashley.json"),
		catherine: load_json_file("save/character/catherine.json"),
		earnest: load_json_file("save/character/earnest.json"),
		isabelle: load_json_file("save/character/isabelle.json"),
		mary: load_json_file("save/character/mary.json"),
		thomas: load_json_file("save/character/thomas.json")
	}
} else { // A new Game
	global.player = {
		alfred: load_json_file("init/character/alfred.json"),
		ashley: load_json_file("init/character/ashley.json"),
		catherine: load_json_file("init/character/catherine.json"),
		earnest: load_json_file("init/character/earnest.json"),
		isabelle: load_json_file("init/character/isabelle.json"),
		mary: load_json_file("init/character/mary.json"),
		thomas: load_json_file("init/character/thomas.json")
	}
}



