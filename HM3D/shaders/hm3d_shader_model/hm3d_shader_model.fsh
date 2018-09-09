//
// Simple passthrough fragment shader
//
//varying vec2 v_vTexcoord;
//varying vec4 v_vColour;
varying vec3 FragPos;
varying vec3 Normal;
varying vec2 TexCoords;

uniform vec3 ViewPos;

uniform sampler2D MatDiffuse;
uniform sampler2D MatSpecular;
uniform float MatShininess;

uniform vec3 DirLightDirection;
uniform vec3 DirLightAmbient;
uniform vec3 DirLightDiffuse;
uniform vec3 DirLightSpecular;

#define NR_POINT_LIGHTS 4
uniform vec3 PointLightPosition[NR_POINT_LIGHTS];
uniform vec3 PointLightAmbient[NR_POINT_LIGHTS];
uniform vec3 PointLightDiffuse[NR_POINT_LIGHTS];
uniform vec3 PointLightSpecular[NR_POINT_LIGHTS];
uniform float PointLightConstant[NR_POINT_LIGHTS];
uniform float PointLightLinear[NR_POINT_LIGHTS];
uniform float PointLightQuadratic[NR_POINT_LIGHTS];

uniform vec3 SpotLightPosition;
uniform vec3 SpotLightDirection;
uniform vec3 SpotLightAmbient;
uniform vec3 SpotLightDiffuse;
uniform vec3 SpotLightSpecular;
uniform float SpotLightCutoff;
uniform float SpotLightOuterCutoff;
uniform float SpotLightConstant;
uniform float SpotLightLinear;
uniform float SpotLightQuadratic;

vec3 CalcDirLight(vec3 lightDir, vec3 lightAmbient, vec3 lightDiffuse, vec3 lightSpecular, vec3 normal, vec3 viewDir);
vec3 CalcPointLight(vec3 lightPos, vec3 lightAmbient, vec3 lightDiffuse, vec3 lightSpecular, float lightConst, float lightLin, float lightQuad, vec3 normal, vec3 fragPos, vec3 viewDir);
vec3 CalcSpotLight(vec3 lightPos, vec3 lightDir, vec3 lightAmbient, vec3 lightDiffuse, vec3 lightSpecular, float lightCutoff, float lightOuterCutoff, float lightConst, float lightLin, float lightQuad, vec3 normal, vec3 fragPos, vec3 viewDir);

void main()
{
	vec3 norm = normalize(Normal);
	vec3 viewDir = normalize(ViewPos - FragPos);
	
	//vec3 result;
	
	vec3 result = CalcDirLight( DirLightDirection, DirLightAmbient, DirLightDiffuse, DirLightSpecular, norm, viewDir);
	for (int i = 0; i < NR_POINT_LIGHTS; i++) {
		result += CalcPointLight(PointLightPosition[i],
								 PointLightAmbient[i],
								 PointLightDiffuse[i],
								 PointLightSpecular[i],
								 PointLightConstant[i],
								 PointLightLinear[i],
								 PointLightQuadratic[i], 
								 norm, 
								 FragPos, 
								 viewDir);
	}
	result += CalcSpotLight(SpotLightPosition,SpotLightDirection,SpotLightAmbient,SpotLightDiffuse,SpotLightSpecular,SpotLightCutoff,SpotLightOuterCutoff,SpotLightConstant,SpotLightLinear,SpotLightQuadratic,norm,FragPos,viewDir);
    gl_FragColor = vec4(result,1.0);
}

vec3 CalcDirLight(vec3 lightDir, vec3 lightAmbient, vec3 lightDiffuse, vec3 lightSpecular, vec3 normal, vec3 viewDir) {
	vec3 ltDir = normalize(-lightDir);
	float diff = max(dot(normal,ltDir),0.0);
	vec3 reflectDir = reflect(-ltDir,normal);
	float spec = pow(max(dot(viewDir,reflectDir),0.0),MatShininess);
	vec3 ambient = lightAmbient * vec3(texture2D(MatDiffuse,TexCoords));
	vec3 diffuse = lightDiffuse * diff * vec3(texture2D(MatDiffuse,TexCoords));
	vec3 specular = lightSpecular * spec * vec3(texture2D(MatSpecular,TexCoords));
	return ambient + diffuse + specular;
}

vec3 CalcPointLight(vec3 lightPos, vec3 lightAmbient, vec3 lightDiffuse, vec3 lightSpecular, float lightConst, float lightLin, float lightQuad, vec3 normal, vec3 fragPos, vec3 viewDir) {
	vec3 lightDir = normalize(lightPos - fragPos);
	float diff = max(dot(normal,lightDir),0.0);
	vec3 reflectDir = reflect(-lightDir,normal);
	float spec = pow(max(dot(viewDir,reflectDir),0.0),MatShininess);
	float lightDist = length(lightPos - FragPos);
	float lightAtten = 1.0 / (lightConst + lightLin + lightDist + lightQuad * (lightDist * lightDist));
	vec3 ambient = lightAmbient * vec3(texture2D(MatDiffuse, TexCoords));
	vec3 diffuse = lightDiffuse * diff * vec3(texture2D(MatDiffuse,TexCoords));
	vec3 specular = lightSpecular * spec * vec3(texture2D(MatSpecular,TexCoords));
	ambient *= lightAtten;
	diffuse *= lightAtten;
	specular *= lightAtten;
	return ambient + diffuse + specular;
}

vec3 CalcSpotLight(vec3 lightPos, vec3 lightDir, vec3 lightAmbient, vec3 lightDiffuse, vec3 lightSpecular, float lightCutoff, float lightOuterCutoff, float lightConst, float lightLin, float lightQuad, vec3 normal, vec3 fragPos, vec3 viewDir) {
	vec3 ltDir = normalize(lightPos - fragPos);
	float diff = max(dot(normal,ltDir),0.0);
	vec3 reflectDir = reflect(-ltDir,normal);
	float spec = pow(max(dot(viewDir,reflectDir),0.0),MatShininess);
	float lightDist = length(lightPos - fragPos);
	float lightAtten = 1.0 / (lightConst + lightLin * lightDist + lightQuad * (lightDist * lightDist));
	float theta = dot(ltDir, normalize(-lightDir));
	float epsilon = lightCutoff - lightOuterCutoff;
	float intensity = clamp((theta - lightOuterCutoff) / epsilon, 0.0,1.0);
	vec3 ambient = lightAmbient * vec3(texture2D(MatDiffuse,TexCoords));
	vec3 diffuse = lightDiffuse * diff * vec3(texture2D(MatDiffuse,TexCoords));
	vec3 specular = lightDiffuse * spec * vec3(texture2D(MatSpecular,TexCoords));
	ambient *= lightAtten * intensity;
	diffuse *= lightAtten * intensity;
	specular *= lightAtten * intensity;
	return ambient + diffuse + specular;
	
}