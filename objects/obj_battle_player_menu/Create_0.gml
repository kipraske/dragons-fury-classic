/// @description Insert description here
// You can write your code in this editor

// Positioning Variables
menu_height = 0.7*room_height;
menu_width = room_width / 3;
menu_item_spacing = menu_height / 5;
sub_menu_spacing = menu_item_spacing / 12; // quarter what we need actually but we will use the top and bottom as spacing
hp_pos = 5*sub_menu_spacing;
mp_pos = 8*sub_menu_spacing;
menu_sprite_gap = 18; // 16 px sprite + gap
menu_left_padding = 4;
menu_bottom_padding = 4; // oops I am a bit off - subtract this from the lower area

// Functionality Variables
menu_length = array_length(global.battle.player_frontline) + array_length(global.battle.player_backline);
selected_index = -1;
xx = xstart;
yy = ystart;