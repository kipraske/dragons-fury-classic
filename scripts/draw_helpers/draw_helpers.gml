// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// @desc draws the classic box that I am using everywhere. Color on top fades to black on the bottom
function draw_dialog_box( x_start, y_start, x_end, y_end, color ){
	var _original_color = draw_get_color();
	
	draw_set_color(c_white);
	draw_set_alpha(0.5);
	draw_rectangle_colour(x_start, y_start, x_end, y_end, color, color, c_black, c_black, false);
	draw_set_alpha(1);
	draw_rectangle(x_start, y_start, x_end, y_end, true);
	draw_set_color(_original_color);
}