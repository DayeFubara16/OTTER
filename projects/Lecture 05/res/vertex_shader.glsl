#version 410

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;

//Lecuture 5

layout(location = 2) in vec3 inNormal;

layout(location = 0) out vec3 outPos;
layout(location = 1) out vec3 outColor;
layout(location = 2) out vec3 outNormal;

//end

uniform mat4 MVP;

//lecture 5

uniform mat4 View;
uniform mat4 Model;
uniform vec3 LightPos;

//ends

void main() {

	gl_Position = MVP * vec4(inPosition, 1.0);

	//lecture 5 
	//pass vertex position in world space to fragment shader
	outPos = (Model * vec4(inPosition, 1.0)).xyz;

	//Normals

	outNormal = (Model * vec4(inNormal, 0.0)).xyz;

	//ends

	outColor = inColor;

}
	