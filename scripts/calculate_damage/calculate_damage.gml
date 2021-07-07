///
// So because all of our damage is keyed by type I need to pass out the info about the damage AND the info about the type of numbers to show
// @returns array of arrays 0 - damage amount per attack, 1- damage types
function calculate_damage_data( actor, weapon, skill ){
	// Actually figure this out based on skill elementals etc.
	
	// TODO - remember we just need the actor since the target is placed on them 
	// TODO - Redo this so we don't return an array of damage. We calculate damage ONC
	
	// We need these things
	// Actually the combo needs to happen when the damage is applied, but we still need to use it as a multipler here!
	//global.battle.combo++
	//global.battle.weak_display = 0;
	//global.battle.crit_display = 0;
	
	return [99, damage_types.normal];
}