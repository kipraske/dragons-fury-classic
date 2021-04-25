
/// @function get_input();
/// @desc get keyboard input for scripts
function get_input(){
// TODO
}

/// @function load_json_file
/// @param {string} filepath path to json file
/// @return {struct}
function load_json_file(filepath){
	if (file_exists(filepath)){
		var _buffer = buffer_load(filepath);
		var _string = buffer_read(_buffer, buffer_string);
		buffer_delete( _buffer);
		return json_parse(_string);
	}
}

/// @function save_json_file
/// @param {struct} data to parse and save
/// @param {string} filepath path to json file
function save_json_file(data, filepath){
	var _string = json_stringify(data);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, filepath);
	buffer_delete(_buffer);
}

