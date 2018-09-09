shader_set(hm3d_shader_model);

texture_set_stage(u_MatDiffuse,sprite_get_texture(texture,eHM3DTexture.Diffuse));
texture_set_stage(u_MatSpecular,sprite_get_texture(texture,eHM3DTexture.Specular));
shader_set_uniform_f(u_MatShininess,32.0);

shader_set_uniform_f_array(u_ViewPos,hm3d_get_camera().position);
shader_set_uniform_f_array(u_DirLightDirection,[-0.2,-1.0,-0.3]);
shader_set_uniform_f_array(u_DirLightAmbient,[0.05,0.05,0.05]);
shader_set_uniform_f_array(u_DirLightDiffuse,[0.4,0.4,0.4]);
shader_set_uniform_f_array(u_DirLightSpecular,[0.5,0.5,0.5]);

shader_set_uniform_f_array(u_PointLightPosition,pointLightPositions);
shader_set_uniform_f_array(u_PointLightAmbient,pointLightAmbients);
shader_set_uniform_f_array(u_PointLightDiffuse,pointLightDiffuses);
shader_set_uniform_f_array(u_PointLightSpecular,pointLightSpeculars);
shader_set_uniform_f_array(u_PointLightConstant,pointLightConstants);
shader_set_uniform_f_array(u_PointLightLinear,pointLightLinears);
shader_set_uniform_f_array(u_PointLightQuadratic,pointLightQuadratics);

shader_set_uniform_f_array(u_SpotLightPosition,spotLight[0]);
shader_set_uniform_f_array(u_SpotLightDirection,spotLight[1]);
shader_set_uniform_f_array(u_SpotLightAmbient,spotLight[2]);
shader_set_uniform_f_array(u_SpotLightDiffuse,spotLight[3]);
shader_set_uniform_f_array(u_SpotLightSpecular,spotLight[4]);
shader_set_uniform_f(u_SpotLightConstant,spotLight[5]);
shader_set_uniform_f(u_SpotLightLinear,spotLight[6]);
shader_set_uniform_f(u_SpotLightQuadratic,spotLight[7]);
shader_set_uniform_f(u_SpotLightCutoff,spotLight[8]);
shader_set_uniform_f(u_SpotLightOuterCutoff,spotLight[9]);

if (mesh != -1) {
	matrix_set(matrix_world,hm3d_object_get_matrix(id));
	vertex_submit(mesh,pr_trianglelist,texture != -1 ? sprite_get_texture(texture,eHM3DTexture.Diffuse) : texture);
	matrix_set(matrix_world,matrix_build_identity());
}
shader_reset();