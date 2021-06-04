/// @description Insert description here
// You can write your code in this editor

// Positioning Variables
menu_spacing = 18;
sprite_up_adjust = 4;
padding = 8
hand_width = 32;

// Functionality Variables
menu_items = [
	"Continue",
	"Save State",
	"Options",
	"Abandon Battle"
];
menu_length = array_length(menu_items);
selected_index = -1;

// Dyanmic Positioning
box_offset_width = 64;
box_offset_height = padding + 0.5*(menu_spacing * (menu_length-1)); // offset is from center so up AND down

// Move the sprite object to this dynamic value
x = room_width/2 - box_offset_width; // box coordinates
y = room_height/2 - box_offset_height - padding;

// Mouse variables
is_clicked = false;
image_xscale = box_offset_width * 2;
image_yscale = (box_offset_height + padding)* 2;