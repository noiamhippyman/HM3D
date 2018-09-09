u_ViewPos = shader_get_uniform(shader,"ViewPos");

// TO DO: Setup global light manager to centralize all light data

#region Material
u_MatDiffuse = shader_get_sampler_index(shader,"MatDiffuse");
u_MatSpecular = shader_get_sampler_index(shader,"MatSpecular");
u_MatShininess = shader_get_uniform(shader,"MatShininess");
#endregion

#region Directional Light
u_DirLightDirection = shader_get_uniform(shader,"DirLightDirection");
u_DirLightAmbient = shader_get_uniform(shader,"DirLightAmbient");
u_DirLightDiffuse = shader_get_uniform(shader,"DirLightDiffuse");
u_DirLightSpecular = shader_get_uniform(shader,"DirLightSpecular");
#endregion

#region Point Lights
u_PointLightPosition = shader_get_uniform(shader,"PointLightPosition");
u_PointLightAmbient = shader_get_uniform(shader,"PointLightAmbient");
u_PointLightDiffuse = shader_get_uniform(shader,"PointLightDiffuse");
u_PointLightSpecular = shader_get_uniform(shader,"PointLightSpecular");
u_PointLightConstant = shader_get_uniform(shader,"PointLightConstant");
u_PointLightLinear = shader_get_uniform(shader,"PointLightLinear");
u_PointLightQuadratic = shader_get_uniform(shader,"PointLightQuadratic");

pointLight0 = [
	-5.0,0.2,2.0,
	0.05,0.05,0.05,
	0.8,0.8,0.8,
	1.0,1.0,1.0,
	1.0,0.09,0.032
];

pointLight1 = [
	2.3,-3.3,-4.0,
	0.05,0.05,0.05,
	0.8,0.8,0.8,
	1.0,1.0,1.0,
	1.0,0.09,0.032
];

pointLight2 = [
	-4.0,2.0,-12.0,
	0.05,0.05,0.05,
	0.8,0.8,0.8,
	1.0,1.0,1.0,
	1.0,0.09,0.032
];

pointLight3 = [
	0.0,0.0,3.0,
	0.05,0.05,0.05,
	0.8,0.8,0.8,
	1.0,1.0,1.0,
	1.0,0.09,0.032
];


pointLightPositions = [
	pointLight0[0],pointLight0[1],pointLight0[2],
	pointLight1[0],pointLight1[1],pointLight1[2],
	pointLight2[0],pointLight2[1],pointLight2[2],
	pointLight3[0],pointLight3[1],pointLight3[2]
];
pointLightAmbients = [
	pointLight0[3],pointLight0[4],pointLight0[5],
	pointLight1[3],pointLight1[4],pointLight1[5],
	pointLight2[3],pointLight2[4],pointLight2[5],
	pointLight3[3],pointLight3[4],pointLight3[5]
];
pointLightDiffuses = [
	pointLight0[6],pointLight0[7],pointLight0[8],
	pointLight1[6],pointLight1[7],pointLight1[8],
	pointLight2[6],pointLight2[7],pointLight2[8],
	pointLight3[6],pointLight3[7],pointLight3[8]
];
pointLightSpeculars = [
	pointLight0[9],pointLight0[10],pointLight0[11],
	pointLight1[9],pointLight1[10],pointLight1[11],
	pointLight2[9],pointLight2[10],pointLight2[11],
	pointLight3[9],pointLight3[10],pointLight3[11]
];
pointLightConstants = [
	pointLight0[12],
	pointLight1[12],
	pointLight2[12],
	pointLight3[12]
];
pointLightLinears = [
	pointLight0[13],
	pointLight1[13],
	pointLight2[13],
	pointLight3[13]
];
pointLightQuadratics = [
	pointLight0[14],
	pointLight1[14],
	pointLight2[14],
	pointLight3[14]
];
#endregion

#region Spot Light
u_SpotLightPosition = shader_get_uniform(shader,"SpotLightPosition");
u_SpotLightDirection = shader_get_uniform(shader,"SpotLightDirection");
u_SpotLightAmbient = shader_get_uniform(shader,"SpotLightAmbient");
u_SpotLightDiffuse = shader_get_uniform(shader,"SpotLightDiffuse");
u_SpotLightSpecular = shader_get_uniform(shader,"SpotLightSpecular");
u_SpotLightCutoff = shader_get_uniform(shader,"SpotLightCutoff");
u_SpotLightOuterCutoff = shader_get_uniform(shader,"SpotLightOuterCutoff");
u_SpotLightConstant = shader_get_uniform(shader,"SpotLightConstant");
u_SpotLightLinear = shader_get_uniform(shader,"SpotLightLinear");
u_SpotLightQuadratic = shader_get_uniform(shader,"SpotLightQuadratic");

spotLight = [
	[0,0,0],
	[0,0,0],
	[0,0,0],
	[1,1,1],
	[1,1,1],
	1,0.09,0.032,
	cos(degtorad(12.5)),
	cos(degtorad(15))
];
#endregion
