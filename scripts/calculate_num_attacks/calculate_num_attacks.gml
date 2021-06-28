// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro speed_variance 0.2
#macro speed_bonus_hit_per 25

function calculate_num_attacks( actor ){

	var target = actor._selected_target;
	var action = actor._selected_action;
	var actor_base_speed = actor._battle_stats[stats.SPD];
	var target_base_speed = target._battle_stats[stats.SPD];
	var actor_speed = random_range(actor_base_speed - actor_base_speed * speed_varience, actor_base_speed + actor_base_speed * speed_varience);
	var target_speed = random_range(target_base_speed - target_base_speed * speed_varience, target_base_speed + target_base_speed * speed_varience);
	
	var speed_hits = floor( ( actor_speed - target_speed ) / speed_bonus_hit_per );
	if (speed_hits < 0 ) {
		speed_hits = 0;
	}
	
	// TODO - some skills and abilities add more attacks, but for now just do the speed calc
	// machine gun
	// unarmed / unarmored
	// multihit passive

	// NOTE the "off hand" is half this number calculated in the player unit

	return 1 + speed_hits; // TODO - plus the rest of the conditions

}