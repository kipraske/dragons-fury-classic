/// @func draw_text_shadow
// All the text in this game will have a pretty standard black outline with extra dropshadow to the lower left
function draw_text_shadow( x, y, text_string){

var _main_text_color = draw_get_colour();

draw_set_color(c_black);  
draw_text(x+2, y+2, text_string);  
draw_text(x-1, y-1, text_string);  
draw_text(x,   y+2, text_string);  
draw_text(x+2, y,   text_string);  
draw_text(x,   y-1, text_string);  
draw_text(x-1, y,   text_string);  
draw_text(x-1, y+2, text_string);  
draw_text(x+2, y-1, text_string);  

draw_set_color(_main_text_color);
draw_text(x, y, text_string);

}