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