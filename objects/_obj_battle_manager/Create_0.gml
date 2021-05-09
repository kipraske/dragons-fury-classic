/// @description Coordinates the menus and sprites in battle

global.battle.is_battle = true;
global.battle.phase = battle_phase.init;
global.battle.menu_focus = battle_focus.player_select;

// TODO - select monster units based on location and act

// Note that monster_units/player_units are tied to the menus directly if you select one then you select the other
// instance_create_depth(x, y, depth, obj);

// TODO 0 player_units come from global not here, but for now just put em in
// TODO 1 monster_units the same, for now just get em out there.

// Place battle objects, keep ids so we can modify them later
// Also think of this as the view "slots" the objects go in, not the objects themselves (the global state)
global.battle_obj_instances = {
		player_units: [
			instance_create_depth(room_width-40, 2*room_height/9, 0, obj_battle_player_unit),
			instance_create_depth(room_width-40, 3.5*room_height/9, 0, obj_battle_player_unit),
			instance_create_depth(room_width-40, 5*room_height/9, 0, obj_battle_player_unit),
			instance_create_depth(room_width-40, 6.5*room_height/9, 0, obj_battle_player_unit)
		],
		monster_units: [
			instance_create_depth(room_width/2, room_height/2, 0, obj_battle_monster_unit)
		],
		status_bar: 0,
		player_menu: instance_create_depth(0, 0, 0, obj_battle_player_menu),
		monster_menu: instance_create_depth(0, 2* room_height/3, 0, obj_battle_monster_menu),
		action_menu: instance_create_depth(0, 2* room_height/3, 0, obj_battle_action_menu),
		pause_button: instance_create_depth(room_width-20, 0, 0, obj_battle_pause_button),
		pause_menu: instance_create_depth(0, 0, 0, obj_battle_pause_menu),
		execute_button: instance_create_depth(room_width-20, room_height-20, 0, obj_battle_execute_button)
}