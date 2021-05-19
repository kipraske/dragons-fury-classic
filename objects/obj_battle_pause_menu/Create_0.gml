/// @description Insert description here
// You can write your code in this editor

// Positioning Variables
menu_spacing = 18;
sprite_up_adjust = 4;
padding = 8

// Functionality Variables
menu_items = [
	"Continue",
	"Save State",
	"Options",
	"Abandon Battle"
];
menu_length = array_length(menu_items);
selected_index = -1;
xx = xstart;
yy = ystart;

// Dyanmic Positioning
box_offset_width = 64;
box_offset_height = padding + 0.5*(menu_spacing * (menu_length-1)); // offset is from center so up AND down