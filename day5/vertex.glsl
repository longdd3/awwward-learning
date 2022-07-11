uniform float time;
uniform float uProgress;
 uniform vec2 uResolution;
 uniform vec2 uQuadSize;
 uniform vec4 uCorners;
 //	Simplex 4D Noise 
//	by Ian McEwan, Ashima Arts
//
varying vec2 vUv; 
varying vec2 vSize; 
 
 void main (){
 float PI = 3.1415926;

    vUv = uv;
    float sine = sin(PI*uProgress);
    float waves = sine*sin(5.*length(uv) + 15. *uProgress);
    vec4 defaultState = modelMatrix * vec4(position, 1.0);
    vec4 fullScreenState = vec4(position, 1.);
    fullScreenState.x *= uResolution.x ;
    fullScreenState.y *= uResolution.y;
    float cornersProgress = mix(
       mix(uCorners.z, uCorners.w, uv.x),
        mix(uCorners.x, uCorners.y, uv.x),
        uv.y
    );
    vec4 finalState = mix(defaultState, fullScreenState,cornersProgress);

    vSize = mix(uQuadSize, uResolution, cornersProgress);
    gl_Position = projectionMatrix * viewMatrix * finalState;
}