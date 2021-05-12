/// @description Insert description here
// You can write your code in this editor

// Will need to get the players skills in these boxes based on selected player. For now just draw the 6 boxes here

for (var i = 0; i < MAX_EQUIPPED_SKILLS + 1; i++){
	
	// Left Column
	if (i % 2 == 0) {
		var _row = i / 2;
		draw_dialog_box(x + 1, y + 1 + button_height*(_row), x + 0.5*menu_width, y + button_height*(_row+1), c_blue);
	}
	
	// Right Column
	if (i % 2 == 1) {
		var _row = (i - 1)/2
		draw_dialog_box(x + 1 + 0.5*menu_width, y + 1 + button_height*(_row), x + menu_width, y + button_height*(_row+1), c_blue);
	}

}