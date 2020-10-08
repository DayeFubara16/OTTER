#version 410

layout(location = 0) in vec3 inPos;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec3 inNormal;

uniform vec3 LightPos;

out vec4 frag_color;


void main() {

    //Lecture 5
    vec3 lightColor = vec3(1.0, 1.0, 1.0);

    float ambientStrength = 0.1;
    vec3 ambient = ambientStrength * lightColor * inColor;

    //Diffuse
    vec3 N = normalize(inNormal);
    vec3 lightDir = normalize(LightPos - inPos);

    float dif = max(dot(N, lightDir), 0.0);
    vec3 diffuse = dif * inColor;

    //Attenuation
    float dist = length(LightPos - inPos);
    diffuse = diffuse / dist; // (dist*dist)


    //Specular 
    //Phong Lighting Model(or Modified Phong)
    /*
    vec3 camPos = vec3(0.0, 0.0, 3.0); //Pass this as a uniform from your C++ code 
    float specularStrength = 1.0;
    vec3 CamDir = normalize(camPos - inPos);

    vec3 reflectDir = reflect(-lightDir, N);
    float spec = pow(max(dot(CamDir, reflectDir),0.0),128);//Shininess coefficient (Can be uniform)
    vec3 specular = specularStrength * spec * lightColor; //Can also use a specular color 
    */

    //Blinn-Phong Lighting Model(or Modified Phong)
    
    vec3 camPos = vec3(0.0, 0.0, 3.0);
    float specularStrength = 1.0;
    vec3 camDir = normalize(camPos - N);
   
    vec3 halfway = (camDir + (-lightDir));
   
    float blinnAngle = dot(halfway, -inPos);
   
    vec3 specular = specularStrength * blinnAngle * lightColor;

    vec3 result = (ambient + diffuse + specular);

    frag_color = vec4(result, 1.0);
}
