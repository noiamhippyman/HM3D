var camID = hm3d_get_camera();
if (!instance_exists(camID)) {
	hm3d_show_error(eHM3DError.Warning,"No active camera found");
	exit;
}

camID.forward = vec3_normalize([
	lengthdir_x(1,camID.rotation[0])*lengthdir_x(1,camID.rotation[1]),
	lengthdir_y(1,camID.rotation[0])*lengthdir_x(1,camID.rotation[1]),
	lengthdir_y(1,camID.rotation[1])
]);

var from = camID.position;
var to = vec3_add(camID.position,camID.forward);

var diff = vec3_subtract(to,from);
var dx = lengthdir_x(1,camID.rotation[2])/sqrt((diff[0]*diff[0])+(diff[1]*diff[1])+(diff[2]*diff[2]));
var dy = lengthdir_y(1,camID.rotation[2]);
camID.up = vec3_normalize([
	-(dx * diff[0] * diff[2]) - (dy * diff[1]),
	(dy * diff[0]) - (dx * diff[1] * diff[2]),
	dx * ((diff[0] * diff[0]) + (diff[1] * diff[1]))
]);

var up = camID.up;

camera_set_view_mat(view_camera[0], matrix_build_lookat(from[0],from[1],from[2],to[0],to[1],to[2],up[0],up[1],up[2]));