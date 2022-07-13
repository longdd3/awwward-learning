Fix some bugs and create some some functions

for click event 
--
 addClickEvents(){
        this.imageStore.forEach(i=>{
            i.img.addEventListener('click',()=>{
                let tl = gsap.timeline()
                .to(i.mesh.material.uniforms.uCorners.value,{
                    x:1,
                    duration: 0.4
                })
                .to(i.mesh.material.uniforms.uCorners.value,{
                    y:1,
                    duration: 0.4
                },0.1)
                .to(i.mesh.material.uniforms.uCorners.value,{
                    z:1,
                    duration: 0.4
                },0.2)
                .to(i.mesh.material.uniforms.uCorners.value,{
                    w:1,
                    duration: 0.4
                },0.3)
            })
        })
    }
    --
    cleaning old arrays 
    --
      that.imageStore.forEach(m=>{
                        that.scene.remove(m.mesh)
                    })
                    that.imageStore = []
                    that.materials = []
                    that.addObjects();
                    that.resize();
                    that.addClickEvents()
                    that.container.style.visibility = "visible";
                    
                    
     --
