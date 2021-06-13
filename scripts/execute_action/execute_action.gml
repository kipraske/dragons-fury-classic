// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function apply_skill( actor, target, skill ) {

	show_debug_message( actor.name );
	
	// If we don't have everything we need skip em!
	if (target == noone || actor == noone || skill == skills.noskill ) {
		show_debug_message ("skipped");
		global.battle.phase = battle_phase.execute_turn;
		return;
	}
	
	show_debug_message (target.name);
	show_debug_message( skill );
	
	if ( actor.unit_type = unit_types.player ) {
		var actor_unit = global.battle_obj_instances.player_units[actor._unit_position];
	} else { // monster or boss
		var actor_unit = global.battle_obj_instances.monster_units[actor._unit_position];
	}

	// Pass everything to the instance just so we have it.
	actor_unit.animation_actor = actor;
	actor_unit.animation_target = target;
	actor_unit.animation_skill = skill;
	
	// TODO - we may want to juse do the skill types attacks are pretty similar after all
	
	if (skill == skills.swap ) {
		// Swap is pretty unique here
		
		
		// TODO - some skills that are technically "attacks" probably need thier own thing too
		// thinking abourt steal, scan etc. Maybe mimic
	} else if ( global.skill_targets_by_type[skill] == skill_target_types.attack ||
		global.skill_targets_by_type[skill] == skill_target_types.attack_only ||
		global.skill_targets_by_type[skill] == skill_target_types.aoe_attack ) {
			
		var attack_damage_data = calculate_damage_data(actor, target, skill);
		
		// This is a stupid way to pass variables in, but whatever it works
		actor_unit.start_attack_animation = true;
		actor_unit.attack_damage_data = attack_damage_data;
		actor_unit.equipment = actor.equipment;
	} else if ( global.skill_targets_by_type[skill] == skill_target_types.defense ||
		global.skill_targets_by_type[skill] == skill_target_types.defense_only ||
		global.skill_targets_by_type[skill] == skill_target_types.aoe_defense ) {
	
	}
}


function execute_unit_action( unit ){
	show_debug_message("moving to unit");
	global.battle.phase = battle_phase.execute_unit_action; // passing flow control to unit
	
	if ( unit.unit_type == unit_types.player ) {
		apply_skill( unit, unit._selected_target, unit._selected_action);
	} else { // monster and boss
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