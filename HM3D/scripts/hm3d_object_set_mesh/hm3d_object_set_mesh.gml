/// @desc hm3d_object_set_mesh(id,name);
/// @arg id,name
var _id = argument0;
var name = argument1;

_id.mesh = hm3d_get_model(name);