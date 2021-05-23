// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_random_npc_name( name_type ){

	if ( name_type == name_types.npc_male ) {
		var _male_key = irandom(array_length(global.names.npc_male) - 1);
		return global.names.npc_male[_male_key];
	}	
	else if (name_type == name_types.npc_female ) {
		var _female_key = irandom(array_length(global.names.npc_female) - 1);
		return global.names.npc_female[_female_key];
	} 
	else {
		var _coinflip = irandom(1);
		if (_coinflip == 0) {
			return get_random_npc_name( name_types.npc_male );
		} else {
			return get_random_npc_name( name_types.npc_female );
		}
	}
}