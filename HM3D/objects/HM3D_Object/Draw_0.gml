shader_set(hm3d_shader_model);
if (mesh != -1) {
	matrix_set(matrix_world,hm3d_object_get_matrix(id));
	vertex_submit(mesh,pr_trianglelist,texture != -1 ? sprite_get_texture(texture,eHM3DTexture.Diffuse) : texture);
	matrix_set(matrix_world,matrix_build_identity());
}
shader_reset();