/// @desc vec3_normalize(vec3);
/// @arg vec3
var v = argument0;
var dist = point_distance_3d(0,0,0,v[eVec3.x],v[eVec3.y],v[eVec3.z]);
for (var i = 0; i < 3; ++i) {
	v[i] /= dist;
}
return v;