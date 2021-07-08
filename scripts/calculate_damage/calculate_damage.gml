///
// So because all of our damage is keyed by type I need to pass out the info about the damage AND the info about the type of numbers to show
// @returns array of arrays 0 - damage amount per attack, 1- damage types
function calculate_damage_data( actor, which_hand ){
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
	
	// TODO - damage formula goes here then
	
	// TODO - remember we just need the actor since the target is placed on them 
	// TODO - Redo this so we don't return an array of damage. We calculate damage ONC
	
	return [99, damage_types.normal, actor];
}

function apply_next_damage_data( damage_queue, queue_index ) {

	// Multipler is applied AFTER calculations so we can time it properly
	if ( actor.unit_type == global.battle.last_unit_type ) {
		global.battle.combo++;
	} else {
		global.battle.combo = 1;
	}
	
	//The other status box globals go here then too
	//global.battle.weak_display = 0;
	//global.battle.crit_display = 0;

	// We may as well just go through the array rather than trying to make a complex data structure.
	// damage_queue_index -> and we move down the queue.
	

	// TODO - use the actor variable in the damage data to figure out who to apply the damage to.
	// TODO - remove damage
	// Push damage into a damage animation, however we are doing that.
	// Could technically be the same damage queue with a shifting index:
	// Show __, __ (+sec), __(+more sec) ...
	
	

}