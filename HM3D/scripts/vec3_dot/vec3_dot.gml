/// @desc vec3_dot(vec2,vec3);
/// @arg vec3,vec3
var v1 = argument0;
var v2 = argument1;
return dot_product_3d(v1[eVec3.x],v1[eVec3.y],v1[eVec3.z],v2[eVec3.x],v2[eVec3.y],v2[eVec3.z]);