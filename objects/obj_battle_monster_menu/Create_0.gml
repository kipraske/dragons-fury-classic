/// @description Insert description here
// You can write your code in this editor

// Position Variables
menu_height = 0.3*room_height - 4; // the -4 is taken by player menu above
menu_width = room_width / 3 -2;    // the -2 is the extra two borders
padding = 8;
menu_spacing = 18;
sprite_up_adjust = 4;

// Functionality Variables
menu_length = array_length(global.battle.monster_units);
selected_index = -1;
selected_actor_index = -1;
xx = xstart;
yy = ystart;
hand_x = x;
hand_y = y;

// Scale Sprite Mask (shift a bit down so we don't go off the edge too)
is_clicked = false;
image_xscale = menu_width;
image_yscale = menu_height - padding;
y = y + 0.5*padding;