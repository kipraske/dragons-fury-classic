/// @description Coordinates the menus and sprites in battle

global.battle.is_battle = true;
global.battle.phase = battle_phase.init;
global.battle.menu_focus = battle_focus.no_focus;

// Note that monster_units/player_units are tied to the menus directly if you select one then you select the other
// instance_create_depth(x, y, depth, obj);
// All battle objects, IDs so we can modify them freely
global.battle_obj_instances = {
		player_units: [],
		monster_units: [],
		player_menu: 0,
		monster_menu: 0,
		action_menu: 0,
		pause_button: 0,
		pause_menu:0,
		execute_button:0
}