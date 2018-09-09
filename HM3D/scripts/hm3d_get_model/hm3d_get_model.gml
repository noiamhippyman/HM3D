/// @desc hm3d_get_model(name);
/// @arg name
var name = string(argument0);
if (!ds_map_exists(global._hm3d_model_map,name)) {
	hm3d_show_error(eHM3DERR.WARNING,"MODEL MANAGER : No model found with the name " + name);
	return -1;
}

return global._hm3d_model_map[? name ];