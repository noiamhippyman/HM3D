/// @desc vec3_cross(vec3,vec3);
/// @arg vec3,vec3
var v1 = argument0;
var v2 = argument1;

var ax = v1[eVec3.x];
var ay = v1[eVec3.y];
var az = v1[eVec3.z];
var bx = v2[eVec3.x];
var by = v2[eVec3.y];
var bz = v2[eVec3.z];

return [ay * bz - az * by, az * bx - ax * bz, ax * by - ay * bx];