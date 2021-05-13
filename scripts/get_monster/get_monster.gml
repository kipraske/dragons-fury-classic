// @desc get the monster definition for the battle
function get_monster( monster ){

	switch (monster) {
		case monster_list.blue_mushroom:
			return get_blue_mushroom();
		case monster_list.red_mushroom:
			return get_red_mushroom();
		default:
			return 0;
	}

}