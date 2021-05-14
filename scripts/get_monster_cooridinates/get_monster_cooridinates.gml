
///@desc based on layout type returns the list of positions for the monsters
///@param {enum} layout_type
///@return {array} of arrays with two elements: first element is x and second is y
function get_monster_cooridinates( layout_type ){
	var left_offset = 20;
	var top_offset = 20;

	switch (layout_type){
		case monster_layout_type.five:
			return [
				[room_width/3 + left_offset, top_offset],
				[2*room_width/3 - left_offset, top_offset],
				[room_width/2, 2*room_height/9], // middlish
				[room_width/3 + left_offset, 4*room_height/9 - top_offset],
				[2*room_width/3 - left_offset, 4*room_height/9 - top_offset],
			];
		case monster_layout_type.four:
			return 0;
		case monster_layout_type.three_right:
			return 0;
		case monster_layout_type.three_left:
			return 0;
		case monster_layout_type.two_right:
			return 0;
		case monster_layout_type.two_left:
			return 0;
		case monster_layout_type.single:
			return 0;
	}
}