///
// So because all of our damage is keyed by type I need to pass out the info about the damage AND the info about the type of numbers to show
// @returns array of arrays 0 - damage amount per attack, 1- damage types
function calculate_damage_data( actor, which_hand, hits_divisor ){
	// Actually figure this out based on skill elementals etc.
	
	var action = actor._selected_action;
	var target = actor._selected_target;
	
	if ( which_hand = 1 && variable_struct_get(unit.equipment.hand1, "item_type")) {
		var weapon = actor.equipment.hand1;
	} else if (which_hand = 2 && variable_struct_get(unit.equipment.hand2, "item_type")) {
		var weapon = actor.equipment.hand2;
	} else {
		var weapon = {
			item_type: equipment_types.unarmed,
			item_tier: equipment_tiers.common,
			level: actor.level,
		}
	}
	
	var crit_mult = 0;
	var resist_mult = 0;
	
	// TODO - damage formula goes here then (rem divide by # of hits and apply weak/resist)
	
	// TODO - remember we just need the actor since the target is placed on them 
	// TODO - Redo this so we don't return an array of damage. We calculate damage ONC
	
	// TODO - damage type based on weapon/skill, figure out the multiplier here etc.
	
	return [99, crit_mult, resist_mult, actor];
}

function apply_damage_data( actor, damage_queue, queue_index ) {

	show_debug_message(queue_index);

	// Multipler is applied AFTER calculations so we can time it properly
	if ( actor.unit_type == global.battle.last_unit_type ) {
		global.battle.combo++;
	} else {
		global.battle.last_unit_type = actor.unit_type;
		global.battle.combo = 1;
	}
	
	//The other status box globals go here then too
	global.battle.crit_display = damage_queue[queue_index][1];
	global.battle.weak_display = damage_queue[queue_index][2];
	
	var target_hp = actor._selected_target._battle_stats[stats.current_HP];
	var new_hp = target_hp - damage_queue[queue_index][0]
	
	actor._selected_target._battle_stats[stats.current_HP] = new_hp;
}