///@function fill_array
///@desc Creates a new array filled with a default value. Gamemaker doesn't make it easy to copy arrays, so I need to make sure that when I make arrays they are distinct variables. Particularly when I am initializing the characters
///@param {int} array_length
///@param {mixed} daga - the thing you are populating the array with.
function fill_array( array_length, data ){
	var new_array = [];
	for (i = array_length -1; i >=0 ; i--){
		new_array[i] = data;
	}
	return new_array;
}

///@desc I often need to see if an array holds a value
///@param {array} haystack, the array to look for the value
///@param {mixed} what you are looking for
///@return {int} the index value is first fou found at
function find_array_value( haystack, needle ) {
	for(i=0; i<array_length(haystack); i++){
	    if (haystack[i]==needle) {
	        return i;
		}
	}
	return -1;
}