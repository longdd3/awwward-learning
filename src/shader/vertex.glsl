uniform float time;
varying float pulse;
void main (){
 
    vec3 newPosition = position;
    newPosition.z = 0.1*cos(length(position)*10. + time);
    pulse = 31.*newPosition.z;
    gl_Position = projectionMatrix * modelViewMatrix * vec4(newPosition, 1.0);
}