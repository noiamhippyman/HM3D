hm3d_init();

camera = hm3d_add_object_to_world(HM3D_Camera);
hm3d_object_set_position(camera,0,-5,0);
hm3d_object_set_rotation(camera,-90,0,0);
hm3d_set_camera(camera);


// TO DO: Tinker with 3D export to export model tree hiearchy so I don't need 3 HM3D_Object instances 
// TO DO: Assign multiple textures to single HM3D_Object 
skin = hm3d_add_object_to_world(HM3D_Object);
hm3d_object_set_mesh(skin,"rex-skin");
hm3d_object_set_texture(skin,texture_trex_skin);

eyes = hm3d_add_object_to_world(HM3D_Object);
hm3d_object_set_mesh(eyes,"rex-eyes");
hm3d_object_set_texture(eyes,texture_trex_eye);

keratin = hm3d_add_object_to_world(HM3D_Object);
hm3d_object_set_mesh(keratin,"rex-teethclaws");
hm3d_object_set_texture(keratin,texture_trex_toothclaw);


firstMouse = false;
mouseCenterX = window_get_width()/2;
mouseCenterY = window_get_height()/2;