/// @description Insert description here
// You can write your code in this editor

draw_set_alpha(0.5);
draw_circle_color(x + button_radius, y + button_radius, button_radius, $00ff00, c_green, false);
draw_set_alpha(1);
draw_circle(x + button_radius, y + button_radius, button_radius, true);
draw_set_halign(fa_center);
draw_text_shadow(x + button_radius, y+button_radius - 6, "Go!"); //-6 is half the font height
draw_set_halign(fa_left);