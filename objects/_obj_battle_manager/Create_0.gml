// @description Coordinates the menus and sprites in battle

// Animation timers
intro_animation_counter = 0;
intro_animation_end = game_get_speed(gamespeed_fps); // 1 sec

// Object instance set upd
unit_sprite_width = 52;

global.battle.is_battle = true;
global.battle.phase = battle_phase.init
global.battle.menu_focus = battle_focus.no_focus;
global.battle.next_menu_focus = battle_focus.no_focus;

// TODO - select monster units based on location and act
// Set background based on location. 
var background_layer_id = layer_get_id("Background");
var background_id = layer_background_get_id(background_layer_id);
layer_background_sprite(background_id, spr_background_forest);

// Note that monster_units/player_units are tied to the menus directly if you select one then you select the other

// TODO - monsters come out in various slot shapes (three in a triangle (2 shapes), two like a die etc).
// Figure that out eventually
// TODO different acts/difficulities have different modifiers, for now just do 1
var monster_level_multiplier = 1;

// Monsters are always around the average of the characters
var monster_level_avg = 0;
var monster_level_total = 0;
for (var i = 0; i < array_length(global.battle.player_frontline); i++) {
	monster_level_total += global.battle.player_frontline[i].level;
}
for (var i = 0; i < array_length(global.battle.player_backline); i++) {
	monster_level_total += global.battle.player_backline[i].level;
}
monster_level_avg = monster_level_total / (array_length(global.battle.player_frontline) + array_length(global.battle.player_backline));
monster_level_avg *= monster_level_multiplier;
monster_level_avg = round(monster_level_avg);

monster_coord = get_monster_cooridinates(global.battle.monster_layout);

// Place all of the battle objects, keep ids so we can modify them later
// Also think of this as the view "slots" the objects go in, not the objects themselves (the global state)
global.battle_obj_instances = {
		player_units: [], // assigned dynamically below
		monster_units: [],
		status_bar: 0,
		player_menu: instance_create_depth(0, 0, 0, obj_battle_player_menu),
		// player_menu needed to be 4px taller to fit, so these menus must take those 4px away
		monster_menu: instance_create_depth(0, 0.7*room_height + 4, 0, obj_battle_monster_menu),
		action_menu: instance_create_depth(0, 0.7*room_height + 4, 0, obj_battle_action_menu),
		pause_button: instance_create_depth(room_width-32, 0, 0, obj_battle_pause_button),
		pause_menu: instance_create_depth(0, 0, -1, obj_battle_pause_menu), // full screen overlay
		status_menu: instance_create_depth(0, 0, 0, obj_battle_status),
		execute_button: instance_create_depth(room_width/3 - 48 - 32, 0.7*room_height + 32, -1, obj_battle_execute_button)
}

for (var i = 0; i < array_length(global.battle.player_frontline); i++) {
	// players placed at 2/9, 4/9 and 6/9
	global.battle_obj_instances.player_units[i] = instance_create_depth(room_width - unit_sprite_width*1.5, (i+1)*2*room_height/9, 0, obj_battle_player_unit);
	global.battle_obj_instances.player_units[i].unit_index = i;
	global.battle_obj_instances.player_units[i].sprite_index = global.battle.player_frontline[i].sprites.left;
}

for (var i = 0; i < array_length(global.battle.monster_units); i++) {
	global.battle_obj_instances.monster_units[i] = instance_create_depth(monster_coord[i][0], monster_coord[i][1], 0, obj_battle_monster_unit);
	global.battle_obj_instances.monster_units[i].unit_index = i;
	global.battle_obj_instances.monster_units[i].sprite_index = global.battle.monster_units[i].sprites.right;
	global.battle.monster_units[i].level = monster_level_avg;
}

turn_order = ds_priority_create();