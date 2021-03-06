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
sprite_up_adjust = 4;
grab_hand_y_adjust = 0;
grab_hand_x_adjust = 0;
action_arrow_width = 10;
action_text_spacing = 18;
action_top_padding = 12

// Functionality Variables
menu_length = array_length(global.battle.player_frontline) + array_length(global.battle.player_backline);
selected_index = -1; // The menu target selection
xx = xstart;
yy = ystart;
hand_x = x;
hand_y = y;
hand_sprite = spr_hand_grab_left;
selected_actor_index = -1; // Selected previously, this is just used for targeting

// Scale Sprite Mask
is_clicked = false;
image_xscale = menu_width;
image_yscale = menu_height;