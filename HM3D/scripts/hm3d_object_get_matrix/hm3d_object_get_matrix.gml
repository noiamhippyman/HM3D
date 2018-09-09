/// @desc hm3d_object_get_matrix(id);
/// @arg id
var _id = argument0;
return matrix_build(_id.position[0],_id.position[1],_id.position[2],
					_id.rotation[0],_id.rotation[1],_id.rotation[2],
					_id.scale[0],	_id.scale[1],	_id.scale[2]);