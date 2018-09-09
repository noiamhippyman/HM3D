view_enabled = true;
view_set_visible(0,true);

camera_set_proj_mat(camera,matrix_build_projection_perspective_fov(fov,aspect,clip_near,clip_far));
camera_set_update_script(camera,update_script);

view_set_camera(0,camera);