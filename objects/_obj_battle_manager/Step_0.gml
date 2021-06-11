/// @description manage the battle state

// TODO - the pause button should work regardless of which phase you are on!
// so going to have to add if "waiting for input" on all these object steps!

switch (global.battle.phase) {
	case battle_phase.init:
		// Intro Animation lasts 1 second, then move to the next phase (see player_unit/monster_unit)
		// Managed here because they are all doing it at the same time, other animations are handled at the unit level
		if ( intro_animation_counter < intro_animation_end ) {
			intro_animation_counter++
		} else {
			intro_animation_counter = 0;
			global.battle.phase = battle_phase.waiting_for_input;
		}
		break;
	case battle_phase.waiting_for_input:
		if ( global.battle.menu_focus == battle_focus.no_focus ) {
			global.battle.next_menu_focus = battle_focus.player_select;
		}
	
		// This is what we have now. Menus are active and you can input stuff.
		break;
	case battle_phase.set_up_turn_order: {
		// Set up turn order
		for ( var i = 0; i < array_length(global.battle.player_frontline); i++ ) {
			var player_speed = global.battle.player_frontline[i]._battle_stats[stats.SPD];
			var player_speed_varience = random_range( -player_speed*speed_varience, player_speed*speed_varience );
			ds_priority_add( turn_order, global.battle.player_frontline[i], player_speed + player_speed_varience);
		}
		
		for ( var i = 0; i < array_length(global.battle.player_backline); i++ ) {
			var player_speed = global.battle.player_backline[i]._battle_stats[stats.SPD];
			var player_speed_varience = random_range( -player_speed*speed_varience, player_speed*speed_varience );
			ds_priority_add( turn_order, global.battle.player_backline[i], player_speed + player_speed_varience);
		}
		
		for ( var i = 0; i < array_length(global.battle.monster_units); i++ ) {
			var monster_speed = global.battle.monster_units[i]._battle_stats[stats.SPD];
			var monster_speed_varience = random_range( -monster_speed*speed_varience, monster_speed*speed_varience );
			ds_priority_add( turn_order, global.battle.monster_units[i], monster_speed + monster_speed_varience);
		}
		global.battle.phase = battle_phase.execute_turn;
		break;
	}
	case battle_phase.check_win_lose:
		// TODO - actually check for win/lose
	
		global.battle.phase = battle_phase.execute_turn;
		break;
	
	case battle_phase.execute_turn:
		if ( ds_priority_empty(turn_order) ) {
			global.battle.phase = battle_phase.backend_rest;
			break;
		}
		execute_unit_action( ds_priority_delete_max( turn_order ) );
		global.battle.phase = battle_phase.execute_unit_action; // passing flow control to unit
		break;
	case battle_phase.execute_unit_action:
		// Flow is now managed by the unit, they will pass back to execute_turn when done with animations/calculations
		break;
	case battle_phase.backend_rest:
		game_end(); // game end is async lol, ok
		// Heal backend characters, move the dead to the backend
		// But only if we didn't win/lose
		break;
	case battle_phase.win:
		// Do victory animation and display reward summary screen
		// Reward summary should probably just be it's own room
		// Clean up battle
		break;
	case battle_phase.lose:
		// Fade out to Game over room (similar to title menu)
		// Clean up battle objects
		break;
}
