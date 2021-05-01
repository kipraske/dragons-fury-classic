/// @description draw menu title and effects for main title screen

draw_set_color(c_white);
draw_rectangle_colour(1, 1, room_width-1, room_height-1, c_blue, c_blue, c_black, c_black, false);
draw_rectangle(1, 1, room_width-2, room_height-2, true);

draw_set_font(title_highwind);
draw_set_halign(fa_center)
draw_set_color(c_black);
draw_text(room_width/2 + 3,43, "Dragon's Fury");
draw_set_color(c_white);
draw_text_color(room_width/2,40, "Dragon's Fury", $ffffff, $ffffff, $00cccc, $00cccc, 1);

draw_set_font(dialog);
draw_set_color(c_white);
draw_text_shadow(room_width/2, 150, "Start Game");
draw_text_shadow(room_width/2, 165, "The quick brown Fox jumps over the LAZY dog");