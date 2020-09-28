#version 410

layout(location = 1) in vec3 inColour;

out vec4 frag_colour;

void main() { 
	
	frag_colour = vec4(inColour, 1.0) * vec4(0.8, 0.1, 0.4, 1.0);
}