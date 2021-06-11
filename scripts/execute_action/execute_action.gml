// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function execute_unit_action( unit ){
	
	if ( unit.unit_type == unit_types.player ) {
		// apply action based on _selected_action/type
		show_debug_message( unit.name );
		show_debug_message( unit._selected_action );
		if (unit._selected_target != noone ) {
			show_debug_message (unit._selected_target.name);
		}
	} else { // monster and boss
		if (unit.pattern = attack_pattern.random ) {
			// Just pick something from list to apply
		} else {
			// Pick the next thing in the skill queue (create an index in the monster for next item).
		}
	}
}