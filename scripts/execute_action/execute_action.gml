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
	
	switch ( skill ) {
		case skills.attack:
			var attack_damage_data = calculate_damage_data(actor, target, skill);
			// This is a stupid way to pass variables in, but whatever it works
			actor_unit.start_attack_animation = true;
			actor_unit.attack_damage_data = attack_damage_data;
			break;
		case skills.swap: 
			break;
		default:
			// For now attack?
		
		//// basic magic group
		//heal,
		//poison,
		//quake,
		//tornado,
		//flood,
		
		//// combo damage magic group
		//thunder, //sea+sky
		//ice,	 //sea+earth
		//meteor,  //earth+sky
		//smite,   //earth+sea+sky
		
		//// healing/buff magic group
		//DEF_up,  //light+earth
		//RES_up,  //light+sea
		//regen,   //light+sky
		//SPD_up, //light+thunder
		//LUK_up,  //light+ice
		//ATK_up,  //light+meteor
		//revive,  //light+smite
		//mp_regen,//dark+light+sea
		
		//// debuff magic group
		//DEF_down, //dark+earth
		//RES_down, //dark+sea
		//aggro,    //dark+sky
		//SPD_down,  //dark+thunder
		//LUK_down, //dark+ice
		//ATK_down, //dark+meteor
		//plague,   //dark+smite
		//flash,    //dark+light+lightning
		
		//// status magic group
		//purify,   //dark+light
		//pain,     //dark+light+earth
		//confuse,  //dark+light+sky
		//freeze,   //dark+light+ice
		//sleep,    //dark+light+meteor
		
		//// ultimate magic group
		//void,     //all 5
		
		//// Mage
		//passive_MP_up,
		//double_cast,
		//mp_cost_down,
		//mp_turbo,
		//staff_up,
		//book_up,
		//sleep_resist,
		//earth_resist,
		
		//// Druid
		//passive_RES_up,
		//mimic,
		//hp_drain,
		//rest_up,
		//bow_up,
		//ax_up,
		//confusion_resist,
		//sea_resist,
		
		//// Thief
		//passive_SPD_up,
		//steal,
		//loot_up,
		//gold_up,
		//hammer_up,
		//accessory_up,
		//auto_aggro,
		//pierce_resist,
		
		//// Oracle
		//passive_LUK_up,
		//scan,
		//insight,
		//xp_up,
		//sword_up,
		//dagger_up,
		//poison_resist,
		//sky_resist,
		
		//// Inventor
		//passive_HP_up,
		//machine_gun,
		//potion,
		//grenade,
		//spear_up,
		//gun_up,
		//freeze_resist,
		//magic_resist,
		
		//// Knight
		//passive_DEF_up,
		//defend,
		//last_stand,
		//auto_revive,
		//armor_up,
		//shield_up,
		//auto_regen,
		//slash_resist,
		
		//// Monk
		//passive_ATK_up,
		//flurry,
		//counter,
		//mp_drain,
		//unarmored_up,
		//unarmed_up,
		//pain_resist,
		//blunt_resist,
		
		//// Monster only skills, normally non equippable
		//// TODO
		//length
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