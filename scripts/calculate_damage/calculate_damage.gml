///
// So because all of our damage is keyed by type I need to pass out the info about the damage AND the info about the type of numbers to show
// @returns array of arrays 0 - damage amount per attack, 1- damage types
// TODO - this is totallyw wrong now lol
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
	
	// TODO based on the skill figure out what the target is:
	// unit_types.none is NO AOE
	// unit_types.player is targeting all players (frontline)
	// The other two (monster/boss) will target the monsters
	
	var is_aoe = unit_types.none; // TODO - AOE have a flat 0.5 multiplier here Also we don't stop until they are all dead
	
	// TODO - damage formula goes here then (rem divide by # of hits and apply weak/resist)
	
	// TODO - remember we just need the actor since the target is placed on them 
	// TODO - Redo this so we don't return an array of damage. We calculate damage ONC
	
	// TODO - damage type based on weapon/skill, figure out the multiplier here etc.
	
	return [99, is_aoe, crit_mult, resist_mult, actor];
}

/// Apply damage to the unit(s), stop attack if they are dead, and spawn animation sprites
// @returns interupt. If something happens in the attack that we should stop attacking then we will return true
function apply_damage_data( actor, damage_queue, queue_index ) {

	var interrupt = false;
	var damage = damage_queue[queue_index][0];
	var is_aoe = damage_queue[queue_index][1];
	var crit_mult = damage_queue[queue_index][2];
	var resist_mult = damage_queue[queue_index][3];

	// Multipler is applied AFTER calculations so we can time it properly
	if ( actor.unit_type == global.battle.last_unit_type ) {
		global.battle.combo++;
	} else {
		global.battle.last_unit_type = actor.unit_type;
		global.battle.combo = 1;
	}
	
	//The other status box globals go here then too
	global.battle.crit_display = crit_mult;
	global.battle.weak_display = resist_mult;
	
	if ( is_aoe != unit_types.none ) {
		if ( is_aoe == unit_types.player ) {
			var targets = global.battle.player_frontline;
		} else { // boss or monster
			var targets = global.battle.monster_units;
		}
	} else {
		var targets = [ actor._selected_target ];
	}

	var dead_targets = 0;
	for (var i = 0; i < array_length(targets); i++ ) {
		var this_target = targets[i];
		var target_hp = this_target._battle_stats[stats.current_HP];
		var new_hp = target_hp - damage;
		if ( new_hp <= 0 ) {
			new_hp = 0;
			dead_targets++;
		}
		
		this_target._battle_stats[stats.current_HP] = new_hp;
		
		
		if ( this_target.unit_type == unit_types.player ) {
			var target_unit_obj = global.battle_obj_instances.player_units[actor._selected_target._unit_position];
		} else {
			var target_unit_obj = global.battle_obj_instances.monster_units[actor._selected_target._unit_position];
		}

		var damage_animation_object = instance_create_depth(target_unit_obj.x, target_unit_obj.y, 0, obj_battle_damage);
		damage_animation_object.damage = damage;
		damage_animation_object.crit_mult = crit_mult;
		damage_animation_object.resist_mult = resist_mult;
		damage_animation_object.target_unit_obj = target_unit_obj;
		

		
		// TODO - spawn the damage numbers here rather than in player unit.
	}

	if ( dead_targets == array_length(targets) ) {
		interrupt = true;
	}

	return interrupt;
}