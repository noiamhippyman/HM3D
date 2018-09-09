//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;		// (x,y,z)
attribute vec3 in_Normal;		// (x,y,z)
//attribute vec4 in_Color;		// (r,g,b,a)
attribute vec2 in_TexCoords;	// (u,v)

varying vec3 FragPos;
varying vec3 Normal;
varying vec2 TexCoords;
//varying vec4 Color;

mat4 transpose(mat4 inMatrix);
mat4 inverse(mat4 inMatrix);

void main()
{
	vec4 objectPos = vec4(in_Position,1.0);
	
	FragPos = vec3(gm_Matrices[MATRIX_WORLD] * objectPos);
	Normal = mat3(transpose(inverse(gm_Matrices[MATRIX_WORLD]))) * in_Normal;
	TexCoords = in_TexCoords;
	
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * objectPos;
}


mat4 transpose(mat4 inMatrix) {
    vec4 i0 = inMatrix[0];
    vec4 i1 = inMatrix[1];
    vec4 i2 = inMatrix[2];
    vec4 i3 = inMatrix[3];

    mat4 outMatrix = mat4(
                 vec4(i0.x, i1.x, i2.x, i3.x),
                 vec4(i0.y, i1.y, i2.y, i3.y),
                 vec4(i0.z, i1.z, i2.z, i3.z),
                 vec4(i0.w, i1.w, i2.w, i3.w)
                 );

    return outMatrix;
}

mat4 inverse(mat4 inMatrix) {//ported from gm-linear made by Dickson Law
	vec4 a0 = inMatrix[0];
	vec4 a1 = inMatrix[1];
	vec4 a2 = inMatrix[2];
	vec4 a3 = inMatrix[3];
	
	float det =  a0.x*a1.y*a2.z*a3.w+a0.x*a1.z*a2.w*a3.y+a0.x*a1.w*a2.y*a3.z
				+a0.y*a1.x*a2.w*a3.z+a0.y*a1.z*a2.x*a3.w+a0.y*a1.w*a2.z*a3.x
				+a0.z*a1.x*a2.y*a3.w+a0.z*a1.y*a2.w*a3.x+a0.z*a1.w*a2.x*a3.y
				+a0.w*a1.x*a2.z*a3.y+a0.w*a1.y*a2.x*a3.z+a0.w*a1.z*a2.y*a3.x
				-a0.x*a1.y*a2.w*a3.z-a0.x*a1.z*a2.y*a3.w-a0.x*a1.w*a2.z*a3.y
				-a0.y*a1.x*a2.z*a3.w-a0.y*a1.z*a2.w*a3.x-a0.y*a1.w*a2.x*a3.z
				-a0.z*a1.x*a2.w*a3.y-a0.z*a1.y*a2.x*a3.w-a0.z*a1.w*a2.y*a3.x
				-a0.w*a1.x*a2.y*a3.z-a0.w*a1.y*a2.z*a3.x-a0.w*a1.z*a2.x*a3.y;
	if (det == 0.0) {
		return inMatrix;
	} else {
		mat4 result;
		
		result[0] =	vec4(	
							(a1.y*a2.z*a3.w+a1.z*a2.w*a3.y+a1.w*a2.y*a3.z-a1.y*a2.w*a3.z-a1.z*a2.y*a3.w-a1.w*a2.z*a3.y)/det,
							(a0.y*a2.w*a3.z+a0.z*a2.y*a3.w+a0.w*a2.z*a3.y-a0.y*a2.z*a3.w-a0.z*a2.w*a3.y-a0.w*a2.y*a3.z)/det,
							(a0.y*a1.z*a3.w+a0.z*a1.w*a3.y+a0.w*a1.y*a3.z-a0.y*a1.w*a3.z-a0.z*a1.y*a3.w-a0.w*a1.z*a3.y)/det,
							(a0.y*a1.w*a2.z+a0.z*a1.y*a2.w+a0.w*a1.z*a2.y-a0.y*a1.z*a2.w-a0.z*a1.w*a2.y-a0.w*a1.y*a2.z)/det
						);

		result[1] =	vec4(
							(a1.x*a2.w*a3.z+a1.z*a2.x*a3.w+a1.w*a2.z*a3.x-a1.x*a2.z*a3.w-a1.z*a2.w*a3.x-a1.w*a2.x*a3.z)/det,
							(a0.x*a2.z*a3.w+a0.z*a2.w*a3.x+a0.w*a2.x*a3.z-a0.x*a2.w*a3.z-a0.z*a2.x*a3.w-a0.w*a2.z*a3.x)/det,
							(a0.x*a1.w*a3.z+a0.z*a1.x*a3.w+a0.w*a1.z*a3.x-a0.x*a1.z*a3.w-a0.z*a1.w*a3.x-a0.w*a1.x*a3.z)/det,
							(a0.x*a1.z*a2.w+a0.z*a1.w*a2.x+a0.w*a1.x*a2.z-a0.x*a1.w*a2.z-a0.z*a1.x*a2.w-a0.w*a1.z*a2.x)/det
						);
						
		result[2] =	vec4(
							(a1.x*a2.y*a3.w+a1.y*a2.w*a3.x+a1.w*a2.x*a3.y-a1.x*a2.w*a3.y-a1.y*a2.x*a3.w-a1.w*a2.y*a3.x)/det,
							(a0.x*a2.w*a3.y+a0.y*a2.x*a3.w+a0.w*a2.y*a3.x-a0.x*a2.y*a3.w-a0.y*a2.w*a3.x-a0.w*a2.x*a3.y)/det,
							(a0.x*a1.y*a3.w+a0.y*a1.w*a3.x+a0.w*a1.x*a3.y-a0.x*a1.w*a3.y-a0.y*a1.x*a3.w-a0.w*a1.y*a3.x)/det,
							(a0.x*a1.w*a2.y+a0.y*a1.x*a2.w+a0.w*a1.y*a2.x-a0.x*a1.y*a2.w-a0.y*a1.w*a2.x-a0.w*a1.x*a2.y)/det
						);
		
		result[3] =	vec4(
							(a1.x*a2.z*a3.y+a1.y*a2.x*a3.z+a1.z*a2.y*a3.x-a1.x*a2.y*a3.z-a1.y*a2.z*a3.x-a1.z*a2.x*a3.y)/det,
							(a0.x*a2.y*a3.z+a0.y*a2.z*a3.x+a0.z*a2.x*a3.y-a0.x*a2.z*a3.y-a0.y*a2.x*a3.z-a0.z*a2.y*a3.x)/det,
							(a0.x*a1.z*a3.y+a0.y*a1.x*a3.z+a0.z*a1.y*a3.x-a0.x*a1.y*a3.z-a0.y*a1.z*a3.x-a0.z*a1.x*a3.y)/det,
							(a0.x*a1.y*a2.z+a0.y*a1.z*a2.x+a0.z*a1.x*a2.y-a0.x*a1.z*a2.y-a0.y*a1.x*a2.z-a0.z*a1.y*a2.x)/det
						);
		
		return result;
	}
}