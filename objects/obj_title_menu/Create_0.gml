/// @description Insert description here
// You can write your code in this editor

menu_spacing = 18;
sprite_up_adjust = 4;
selected_index = 0;
hand_width = 32;

hand_x = xstart;
hand_y = ystart;

menu_items = [
	"Start Game",
	"Options",
	"Exit Game",
	"Debug Battle 1",
	"Debug Battle 2"
]

// Scale Sprite Mask
draw_set_font(ft_default);
image_xscale = hand_width + 4 + string_width("Debug Battle 2");
image_yscale = menu_spacing*array_length(menu_items);