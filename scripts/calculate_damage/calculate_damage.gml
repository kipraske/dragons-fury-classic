
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro crit_variance 0.2
#macro crit_bonus_per 25
#macro max_crit_num 25

function calculate_crit_mult( actor ){
	var crit_mult = 0;
	
	var target = actor._selected_target;
	var action = actor._selected_action;
	var actor_base_luck = actor._battle_stats[stats.LUK];
	var target_base_luck = target._battle_stats[stats.LUK];
	var actor_luck = random_range(actor_base_luck - actor_base_luck * crit_variance, actor_base_luck + actor_base_luck * speed_varience);
	var target_luck = random_range(target_base_luck - target_base_luck * crit_variance, target_base_luck + target_base_luck * speed_varience);
	
	var raw_crit_percent = actor_luck - target_luck;
	var crit_coinflips = floor(raw_crit_percent / crit_bonus_per);
	var coinflip_percent = crit_bonus_per;
	var leftover_crit_percent = raw_crit_percent % crit_bonus_per;
	
	// 0% crit chance
	if ( raw_crit_percent < 0 ) {
		return 0;
	}
	
	// For every crit_bonus_per we roll for a crit with that rate. A bit swingy, but that is fun right?
	for ( var i = 0; i < crit_coinflips; i++){
		var d100 = irandom(100);
		if ( d100 <= coinflip_percent ) {
			crit_mult++;
		}
	}
	
	// And the leftovers we just do a normal rpg crit check
	var d100 = irandom(100);
	if ( d100 < leftover_crit_percent ) {
		crit_mult++
	}
	
	return min(crit_mult, max_crit_num);
}

// Returns if the skill is an AOE or not based on the skill used and the actor
// unit_types.none is NO AOE
// unit_types.player is targeting all players (frontline)
// The other two (monster/boss) will target the monsters
function is_skill_used_aoe( actor ) {
	return unit_types.none;
}

// So because all of our damage is keyed by type I need to pass out the info about the damage AND the info about the type of numbers to show
// @returns array of arrays 0 - damage amount per attack, 1- damage types
// TODO - this is totallyw wrong now lol
function calculate_damage_data( actor, which_hand, hits_divisor, is_aoe ){
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
	
	var crit_mult = calculate_crit_mult(actor);
	// TODO - huh this is assuming single target. Need an AOE check;
	// Same with speed huh. What is the speed of an AOE?
	
	
	var resist_mult = 0;
	var is_mp = false;
	
	// TODO - AOE have a flat 0.5 multiplier here Also we don't stop until they are all dead
	
	// TODO - damage formula goes here then (rem divide by # of hits and apply weak/resist)
	
	// TODO - remember we just need the actor since the target is placed on them 
	// TODO - Redo this so we don't return an array of damage. We calculate damage ONC
	
	// TODO - damage type based on weapon/skill, figure out the multiplier here etc.
	
	return [99, crit_mult, resist_mult, is_mp, actor];
}

/// Apply damage to the unit(s), stop attack if they are dead, and spawn animation sprites
// @returns interupt. If something happens in the attack that we should stop attacking then we will return true
function apply_damage_data( actor, which_hand, num_attacks) {

	var interrupt = false;
	var is_aoe = is_skill_used_aoe(actor);

	// TODO - have to deal with mp damage cases. But not for awhile. Wait until it matters

	// Multipler is applied AFTER calculations so we can time it properly
	if ( actor.unit_type == global.battle.last_unit_type ) {
		global.battle.combo++;
	} else {
		global.battle.last_unit_type = actor.unit_type;
		global.battle.combo = 1;
	}
	
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
		var damage_data = calculate_damage_data( actor, which_hand, num_attacks, is_aoe);
		
		var damage = damage_data[0];
		var crit_mult = damage_data[1];
		var resist_mult = damage_data[2];
		
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
		
		var damage_center_x = 0.5 * target_unit_obj.sprite_width;
		var damage_start_y = target_unit_obj.sprite_height - 18; // 18 is the font size. Want it on the bottom

		var damage_animation_object = instance_create_depth(target_unit_obj.x + damage_center_x, target_unit_obj.y + damage_start_y, -2, obj_battle_damage);
		damage_animation_object.damage = damage;
		damage_animation_object.crit_mult = crit_mult;
		damage_animation_object.resist_mult = resist_mult;
		damage_animation_object.target_unit_obj = target_unit_obj;
	}

	if ( dead_targets == array_length(targets) ) {
		interrupt = true;
	}

	return interrupt;
}