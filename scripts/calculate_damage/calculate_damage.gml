
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro crit_variance 0.2
#macro crit_bonus_per 25
#macro max_crit_num 25

function calculate_crit_mult( actor, target, action, weapon ){
	var crit_mult = 0;
	
	var actor_base_luck = actor._battle_stats[stats.LUK];
	var target_base_luck = target._battle_stats[stats.LUK];
	var actor_luck = random_range(actor_base_luck - actor_base_luck * crit_variance, actor_base_luck + actor_base_luck * crit_variance);
	var target_luck = random_range(target_base_luck - target_base_luck * crit_variance, target_base_luck + target_base_luck * crit_variance);
	
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

#macro max_resist_mult 25

function calculate_skill_resist_mult( actor, target, action, weapon) {
	
	var resist_mult = 0;

	// Earth
	if ( action == skills.quake || action == skills.ice || action == skills.meteor || action == skills.smite ) {
		resist_mult += target.perm_attr[attr.earth_resist];
		resist_mult -= target.perm_attr[attr.earth_weak];
	}
	
	// Sky
	if ( action == skills.tornado || action == skills.thunder || action == skills.meteor || action == skills.smite ) {
		resist_mult += target.perm_attr[attr.sky_resist];
		resist_mult -= target.perm_attr[attr.sky_weak];
	}
	
	// Sea
	if ( action == skills.flood || action == skills.ice || action == skills.thunder || action == skills.smite ) {
		resist_mult += target.perm_attr[attr.sea_resist];
		resist_mult -= target.perm_attr[attr.sea_weak];
	}
	
	// Blunt
	if ( ! variable_struct_get( weapon, "item_type") // if empty it is unarmed or monster smash
		|| weapon.item_type == equipment_types.unarmed
		|| weapon.item_type == equipment_types.mace
		|| weapon.item_type == equipment_types.hammer ) {
		resist_mult += target.perm_attr[attr.blunt_resist];
		resist_mult -= target.perm_attr[attr.blunt_weak];
	}
	
	// Pierce
	if ( weapon.item_type == equipment_types.pistol
		|| weapon.item_type == equipment_types.rifle
		|| weapon.item_type == equipment_types.dagger
		|| weapon.item_type == equipment_types.crossbow
		|| weapon.item_type == equipment_types.bow
		|| weapon.item_type == equipment_types.spear 
		|| weapon.item_type == equipment_types.bite ) {
		resist_mult += target.perm_attr[attr.pierce_resist];
		resist_mult -= target.perm_attr[attr.pierce_weak];
	}
	
	// Slashing
	if ( weapon.item_type == equipment_types.short_sword
		|| weapon.item_type == equipment_types.sword
		|| weapon.item_type == equipment_types.axe 
		|| weapon.item_type == equipment_types.claw ) {
		resist_mult += target.perm_attr[attr.slash_resist];
		resist_mult -= target.perm_attr[attr.slash_weak];
	}
	
	// Magic
	if ( weapon.item_type == equipment_types.book
		|| weapon.item_type == equipment_types.staff ) {
		resist_mult += target.perm_attr[attr.magic_resist];
		resist_mult -= target.perm_attr[attr.magic_weak];
	}
	
	return min(resist_mult, max_resist_mult);
}

// Returns if the skill is an AOE or not based on the skill used and the actor
// unit_types.none is NO AOE
// unit_types.player is targeting all players (frontline)
// The other two (monster/boss) will target the monsters
function is_skill_used_aoe( actor ) {
	return unit_types.none;
}

#macro damage_variance 0.2
#macro player_damage_multiplier 3
#macro monster_damage_multipler 2

// So because all of our damage is keyed by type I need to pass out the info about the damage AND the info about the type of numbers to show
// @returns array of arrays 0 - damage amount per attack, 1- damage types
// TODO - this is totallyw wrong now lol
function calculate_damage_data( actor, target, which_hand, hits_divisor, is_aoe ){
	// Actually figure this out based on skill elementals etc.
	
	var action = actor._selected_action;
	
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
	
	var crit_mult = calculate_crit_mult(actor, target, action, weapon);
	var resist_mult = calculate_skill_resist_mult(actor, target, action, weapon);
	var is_mp = false;
	
	if ( is_aoe ) {
		var def_stat = stats.RES;
		var aoe_mult = 0.5;
	} else {
		var def_stat = stats.DEF;
		var aoe_mult = 1;
	}
	
	if ( crit_mult > 0 ) {
		var crit_mult_apply = crit_mult + 1;
	} else {
		var crit_mult_apply = 1;
	}
	
	if ( resist_mult < 0 ) { // weak
		var resist_mult_apply = resist_mult + 1;
	} else if ( crit_mult > 0 ) { // resist
		var resist_mult_apply = 1/(resist_mult + 1);
	} else {
		var resist_mult_apply = 1;
	}
	
	if ( actor.unit_type = unit_types.player ) {
		var type_mult = player_damage_multiplier;
	} else {
		var type_mult = monster_damage_multipler;
	}
	
	// TODO - next hey the weapon needs stats, we need to do that based on the level when it is leveled up or created or whatever
	// We also need the armor of the target not the weapon, weapon is the attacker's thing
	weapon.stats[stats.ATK] = 8
	weapon.stats[stats.DEF] = 5
	weapon.stats[stats.RES] =3
	
	// TODO - guns ignore defense, so that is a thing here too
	
	var base_damage = (actor._battle_stats[stats.ATK] + weapon.stats[stats.ATK]) - 0.5*(target._battle_stats[def_stat] + weapon.stats[def_stat]);
	var gross_damage = aoe_mult * crit_mult_apply * resist_mult_apply * type_mult * base_damage;
	var damage = floor( random_range(gross_damage - gross_damage * damage_variance, gross_damage + gross_damage * damage_variance) );
	// TODO - AOE have a flat 0.5 multiplier here Also we don't stop until they are all dead
	
	// TODO - damage formula goes here then (rem divide by # of hits and apply weak/resist)
	
	// TODO - remember we just need the actor since the target is placed on them 
	// TODO - Redo this so we don't return an array of damage. We calculate damage ONC
	
	// TODO - damage type based on weapon/skill, figure out the multiplier here etc.
	
	return [damage, crit_mult, resist_mult, is_mp];
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
		var this_target = targets[i];
		var damage_data = calculate_damage_data( actor, this_target, which_hand, num_attacks, is_aoe);
		
		var damage = damage_data[0];
		var crit_mult = damage_data[1];
		var resist_mult = damage_data[2];
		
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