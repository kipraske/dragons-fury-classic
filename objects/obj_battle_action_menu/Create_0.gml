/// @description Insert description here
// You can write your code in this editor

// Drawing Variables
menu_height = 0.3*room_height - 4; // the -4 is taken by player menu above
menu_width = room_width / 3 -2;    // the -2 is the extra two borders
button_height = menu_height / 3 - 1; // the -1 is to account for border space
padding = 8;
sprite_up_adjust = 4;

// Functionality Variables
menu_length = MAX_EQUIPPED_SKILLS + 1; // plus one for "swap" skill
selected_player = global.battle.player_frontline[0];
selected_index = -1;
selected_player_index = -1;
selected_player_is_frontend = false;
selected_player_is_backend = false;
sprite_grid_x = 0; // Calculate sprite location independent of index above
sprite_grid_y = 0;
sprite_grid_min_x = 0;
sprite_grid_min_y = 0;
sprite_grid_max_x = 1; // two columns
sprite_grid_max_y = ceil(menu_length / 2) - 1; // num rows
xx = xstart;
yy = ystart;