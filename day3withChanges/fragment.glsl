uniform float time;
uniform sampler2D uTexture;
varying float pulse;
 
 
varying vec2 vUv;
varying vec3 vNormal;

void main () {
    // gl_FragColor = vec4(0., 1., 0., 1.);
    vec4 myimage = texture(uTexture, vUv + 0.01*sin(vUv*10. + time));
    float sinePulse = (1. + sin(vUv.y*30. + time))*0.5;
    gl_FragColor = vec4(vUv, 0., 1.);
    // gl_FragColor = vec4(sinePulse,0., 0., 1.);
    gl_FragColor = myimage;
    gl_FragColor = vec4(0.5*(pulse + 1.),0.,pulse, 1.);

}
 