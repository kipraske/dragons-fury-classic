// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_display_ratio(){

	var ideal_width = 0; // 480 would be 16x9
	var ideal_height = 360;

	var aspect_radio = display_get_width()/display_get_height();
	ideal_width = round( ideal_height * aspect_radio );
	
	// Ensure width is an even number (no monitor has odd pixels)
	if (ideal_width & 1){
		ideal_width++;
	}
	
	camera_set_view_size(view_camera[0],ideal_width, ideal_height);
	surface_resize(application_surface,ideal_width,ideal_height);

}