/// @description Insert description here
// You can write your code in this editor

// Drawing Variables
menu_height = 0.3*room_height - 4; // the -4 is taken by player menu above
menu_width = room_width / 3 -2;    // the -2 is the extra two borders
button_height = menu_height / 3 - 1; // the -1 is to account for border space
padding = 8;

// Functionality Variables
menu_length = MAX_EQUIPPED_SKILLS + 1; // plus one for "swap" skill
selected_index = -1;
selected_player = global.battle.player_frontline[0];
xx = xstart;
yy = ystart;