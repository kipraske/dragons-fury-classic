// Initializes the names for everyone. In datafiles for localization
// This didn't need to be it's own file, but I thought it would be more complicated for some reason.
function init_names(){
	global.names = load_json_file("names.json");
}