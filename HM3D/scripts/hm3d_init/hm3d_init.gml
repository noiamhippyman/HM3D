/// @desc hm3d_init();
enum eHM3DError {
	Warning,Error
}

enum eHM3DTexture {
	Diffuse,Specular
}

global._hm3d_model_vertex_format = vertex_format_create_simple(true,true,true,false);
global._hm3d_model_map = ds_map_create();
hm3d_load_model("cube","HM3D/Models/cube.dat");
hm3d_load_model("rex-skin","HM3D/Models/TrexByJoel3d-Skin.dat");
hm3d_load_model("rex-eyes","HM3D/Models/TrexByJoel3d-Eyes.dat");
hm3d_load_model("rex-teethclaws","HM3D/Models/TrexByJoel3d-TeethClaws.dat");

global._hm3d_active_camera_ref = noone;

gpu_set_zwriteenable(true);//Enables writing to the z-buffer
gpu_set_ztestenable(true);//Enables the depth testing, so far away things are drawn beind closer things
gpu_set_cullmode(cull_clockwise);//Set culling