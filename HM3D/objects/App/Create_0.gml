hm3d_init();

camera = hm3d_add_object_to_world(HM3D_Camera);
hm3d_object_set_position(camera,0,-5,0);
hm3d_object_set_rotation(camera,-90,0,0);
hm3d_set_camera(camera);

object = hm3d_add_object_to_world(HM3D_Object);
hm3d_object_set_mesh(object,"cube");


firstMouse = false;
mouseCenterX = window_get_width()/2;
mouseCenterY = window_get_height()/2;