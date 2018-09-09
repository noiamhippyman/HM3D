/// @desc hm3d_load_model(name,filepath);
/// @arg name,filepath
var name = string(argument0);
var filepath = argument1;

if (!file_exists(filepath)) {
	hm3d_show_error(eHM3DError.Warning,"MODEL MANAGER : " + filepath + " does not exist.");
	exit;
}

var model = model_load(filepath,global._hm3d_model_vertex_format);
if (model == -1) {
	hm3d_show_error(eHM3DError.Warning,"MODEL MANAGER : " + filepath + " failed to load.");
	exit;
}

global._hm3d_model_map[? name ] = model;