
///@desc based on layout type returns the list of positions for the monsters
///@param {enum} layout_type
///@return {array} of arrays with two elements: first element is x and second is y. Note we will always use the parent array of 5 elements so the game doesn't crash if we made a mistake
function get_monster_cooridinates( layout_type ){
	var left_offset = 20;
	var top_offset = 20;

	switch (layout_type){
		case monster_layout_types.five:
			return [
				[room_width/3 + left_offset, top_offset],
				[2*room_width/3 - left_offset, top_offset],
				[room_width/2, 2*room_height/9], // middlish
				[room_width/3 + left_offset, 4*room_height/9 - top_offset],
				[2*room_width/3 - left_offset, 4*room_height/9 - top_offset],
			];
		case monster_layout_types.four:
			return [
				[room_width/3 + left_offset, top_offset],
				[2*room_width/3 - left_offset, top_offset],
				[room_width/3 + left_offset, 4*room_height/9 - top_offset],
				[2*room_width/3 - left_offset, 4*room_height/9 - top_offset],
				[0, 0],
			];
		case monster_layout_types.three_right:
			return [
				[room_width/3 + left_offset, top_offset],
				[2*room_width/3 - left_offset, 2*room_height/9],
				[room_width/3 + left_offset, 4*room_height/9 - top_offset],
				[0, 0],
				[0, 0],
			];
		case monster_layout_types.three_left:
			return [
				[room_width/3 + left_offset, 2*room_height/9],
				[2*room_width/3 - left_offset, top_offset],
				[2*room_width/3 - left_offset, 4*room_height/9 - top_offset],
				[0, 0],
				[0, 0],
			];
		case monster_layout_types.two_right:
			return [
				[2*room_width/3 - left_offset, top_offset],
				[room_width/3 + left_offset, 4*room_height/9 - top_offset],
				[0, 0],
				[0, 0],
				[0, 0],
			];
		case monster_layout_types.two_left:
			return [
				[room_width/3 + left_offset, top_offset],
				[2*room_width/3 - left_offset, 4*room_height/9 - top_offset],
				[0, 0],
				[0, 0],
				[0, 0],
			];
		case monster_layout_types.single:
			return [
				[room_width/2, 2*room_height/9], // middlish
				[0, 0],
				[0, 0],
				[0, 0],
				[0, 0],
			];
	}
}