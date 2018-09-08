/// @desc vec3_add(vec3,vec3_or_real);
/// @arg vec3,vec3_or_real
var v1 = argument0;
var v2 = argument1;
for (var i = 0; i < 3; ++i) {
	v1[i] += is_array(v2) ? v2[i] : v2;
}
return v1;