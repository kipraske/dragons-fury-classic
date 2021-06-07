/// @description manage the battle state

// TODO - the pause button should work regardless of which phase you are on!
// so going to have to add if "waiting for input" on all these object steps!

switch (global.battle.phase) {
	case battle_phase.init:
		// Set up objects/create events and animations
		break;
	case battle_phase.waiting_for_input:
		// This is what we have now. Menus are active and you can input stuff.
		break;
	case battle_phase.execute_turn:
		// When you hit the "go" button this is what happens
		// Create a priority queue based on unit speed and execute in order
		// Check for Win/Lose happens after EVERY attack so we don't play the whole animation sequence
		break;
	case battle_phase.backend_rest:
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
