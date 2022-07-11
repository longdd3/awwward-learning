create zoom effect, with wave 

playing with wave function 
float waves = sine*0.1*sin(5.*length(uv) + 15. *uProgress);

with sin function 
 float sine = sin(PI*uProgress);
 
 merging html with three.js webgl 
 
 for images 
 
 set scale of mesh to the siez of image 
  this.mesh.scale.set(300, 300,1);
  loacte all images 
 this.images = [...document.querySelectorAll('.js-image')];
 this.materials = [];
 
 also get bound of images 
 let bounds = img.getBoundingClientRect();
 
 clone material,and push material to in an array named materials.
  let m = this.material.clone();
  this.materials.push(m);
  return as an object
   return {
     img: img,
                mesh: mesh,
                width: bounds.width,
                height: bounds.height,
                top: bounds.top,
                left: bounds.left,
   
   }
   final code. /
    this.imageStore = this.images.map(img =>{
            let bounds = img.getBoundingClientRect();
            let m = this.material.clone();
            this.materials.push(m);

            let image = new Image();
            image.src = img.src;
            let texture = new THREE.Texture(image);
           
            texture.needsUpdate = true;
        

            m.uniforms.uTexture.value = texture;

            let mesh  =  new THREE.Mesh(this.geometry, m);
            this.scene.add(mesh);
            mesh.scale.set(bounds.width, bounds.height, 1)
            
            return {
                img: img,
                mesh: mesh,
                width: bounds.width,
                height: bounds.height,
                top: bounds.top,
                left: bounds.left,
            }   
        })
   
