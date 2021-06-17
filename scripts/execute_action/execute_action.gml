// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function execute_unit_action( unit ){
	if (unit._selected_target == noone || unit == noone || unit._selected_action == skills.noskill ) {
		show_debug_message ("skipped");
		global.battle.phase = battle_phase.execute_turn;
		return;
	}
	
	show_debug_message("moving to unit");
	global.battle.phase = battle_phase.execute_unit_action; // passing flow control to unit
	
	if ( unit.unit_type == unit_types.player ) {
		var actor_unit = global.battle_obj_instances.player_units[unit._unit_position];
		// apply_skill( unit, unit._selected_target, unit._selected_action);
		actor_unit.start_attack_animation = true;
		
		// TODO we may need to move this elsewhere when we do the swap logic, here is fine now
		actor_unit.unit = unit;
	} else { // monster and boss
		var actor_unit = global.battle_obj_instances.monster_units[unit._unit_position];
		
		if (unit.pattern = attack_pattern.random ) {
			// Just pick something from list to apply
		} else {
			// Pick the next thing in the skill queue (create an index in the monster for next item).
		}
		
		// TODO - this is temporary, but for now we lose the flowunless we skip the monsters
		show_debug_message ("monster skipped");
		global.battle.phase = battle_phase.execute_turn
		return;
	}
}