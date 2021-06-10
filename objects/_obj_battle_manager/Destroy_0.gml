/// @description Clean up all objects for battle only

with(obj_battle_action_menu){
	instance_destroy();
}

with(obj_battle_execute_button){
	instance_destroy();
}

with(obj_battle_monster_menu){
	instance_destroy();
}

with(obj_battle_monster_unit){
	instance_destroy();
}

with(obj_battle_pause_button){
	instance_destroy();
}

with(obj_battle_pause_menu){
	instance_destroy();
}

with(obj_battle_player_menu){
	instance_destroy();
}

with(obj_battle_player_unit){
	instance_destroy();
}

with(obj_battle_status){
	instance_destroy();
}

delete global.battle_obj_instances;
ds_priority_destroy(turn_order);