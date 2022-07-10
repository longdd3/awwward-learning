Creating the Zoom effect

including 
- measure fullscreen size which has 
- defaultState  and fullScreenState 
  + defaultState = modelMatrix * vec4(position, 1.0);
  + fullScreenState = vec4(position. 1.0);
  + set fullScreenState.x *= uResolution.x / uQuadSize.x ;
        fullScreenState.y *= uResolution.y / uQuadSize.y ;
        
- measure quadsize and screensize with 2 uniform { uQuadSize, uResolution }, both take vec2 
- measure uTextureSize, which call in uniform which size vec2(100, 100);
- create function that calculate UV in every frame that texture changed
- usign this function 
- vec2 getUV(vec2 uv, vec2 textureSize, vec2 quadSize) {
     vec2 tempUV = uv - vec2(0.5);
     float quadAspect = quadSize.x / quadSize.y;
     float texturedAspect = textureSize.x / textureSize.y;
     if(quadAspect < texturedAspect)
     {
            tempUV = tempUV *vec2(quadAspect / texturedAspect,1.);
     }
     else {
            tempUV = tempUV *vec2(1.,texturedAspect / quadAspect);    
     }
     tempUV += vec2(0.5);
     return tempUV;
}
- create timeline for gsap and playing with uCorners size, 
-    float cornersProgress = mix(
       mix(uCorners.z, uCorners.w, uv.x),
    mix(uCorners.x, uCorners.y, uv.x),
    uv.y
    );
