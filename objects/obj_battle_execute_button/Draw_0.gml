/// @description Insert description here
// You can write your code in this editor

draw_dialog_box(x, y, x + button_width, y + button_width, c_green);
draw_text_shadow(x + button_radius - 10, y + button_radius - 8, "Go"); // -6 is half the font size

draw_sprite( spr_play_icon, 0, x + button_radius - 4, y + 0.5*button_radius - 4);