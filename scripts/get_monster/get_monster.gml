// @desc get the monster definition for the battle
// This may end up not being used, why not just call the functions directly?
function get_monster( monster, label ){

	switch (monster) {
		case monster_list.blue_mushroom:
			return get_blue_mushroom( label );
		case monster_list.red_mushroom:
			return get_red_mushroom( label );
		default:
			return 0;
	}

}