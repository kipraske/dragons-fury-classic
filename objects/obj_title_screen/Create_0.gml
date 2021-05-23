/// @description Initializes Globals, Loads Game, then renders title_screen_menu
// IF you want to reload the game after tweaking the files go to the title

// TODO - we should probably create a loading screen for the initial big load. I am seeing lag spikes while the data is being processed

set_display_ratio();
init_constants();
init_game_state();
init_labels();
init_names();