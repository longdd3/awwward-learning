I create animation with GSAP 3 and also using barba to make smooth page transition

Find out the barbar on this : 
- https://barba.js.org/

Some new things about barba that I learned: 
--disableRaf
--horizontalScroll
--transition {
leave()
enter()
}
--markup 
-- <body data-barba="wrapper">
  <!-- put here content that will not change
  between your pages, like <header> or <nav> -->

  <main data-barba="container" data-barba-namespace="home">
--
create eventlistener when mouse over the image, animate ucorners from uniform
--
img.addEventListener("mouseover",()=>{
                this.tl = gsap.timeline();
                this.tl.to(m.uniforms.uCorners.value, {
                    x: 1,
                    duration: 0.4
                })
                .to(m.uniforms.uCorners.value, {
                    y: 1,
                    duration: 0.4
                }, 0.1)
                .to(m.uniforms.uCorners.value, {
                    z: 1,
                    duration: 0.4
                }, 0.2)
                .to(m.uniforms.uCorners.value, {
                    w: 1,
                    duration: 0.4
                }, 0.4)
            })
    --
    
   similiar to mouse out 
   --
    img.addEventListener("mouseout",()=>{
                this.tl = gsap.timeline();
                this.tl.to(m.uniforms.uCorners.value, {
                    x: 0,
                    duration: 0.4
                })
                .to(m.uniforms.uCorners.value, {
                    y: 0,
                    duration: 0.4
                }, 0.1)
                .to(m.uniforms.uCorners.value, {
                    z: 0,
                    duration: 0.4
                }, 0.2)
                .to(m.uniforms.uCorners.value, {
                    w: 0,
                    duration: 0.4
                }, 0.4)
            })
            --
            
            also resize the uresolution and texturesize 
            this.materials.forEach(m => {
            m.uniforms.uResolution.value.x = this.width;
            m.uniforms.uResolution.value.y = this.height;

        })
        this.imageStore.forEach(i=> {
            let bounds = i.img.getBoundingClientRect();
            i.mesh.scale.set(bounds.width, bounds.height, 1);
            i.top = bounds.top;
            i.left= bounds.left + this.asscroll.currentPos;
            i.width = bounds.width;
            i.height = bounds.height;

            i.mesh.material.uniforms.uQuadSize.value.x =bounds.width;
            i.mesh.material.uniforms.uQuadSize.value.y =bounds.height;

            i.mesh.material.uniforms.uTextureSize.value.x =bounds.width;
            i.mesh.material.uniforms.uTextureSize.value.y =bounds.height;

        })
        
   create barba function 
   --
     barba() {
        let that= this;
        barba.init({
            transitions: [
                {
              name: 'from-home-transition',
              from: {
                namespace: ["home"]
              },
              leave(data) {
                // alert('from home')
                that.asscroll.disable();
                return gsap.timeline()
                .to(data.current.container, {
                    opacity: 0,
                    duration: 0.5
                })
                // create your stunning leave animation here
              },
              enter(data) {
                that.asscroll = new ASScroll({
                    disableRaf: true,
                    containerElement: data.next.container.querySelector("[asscroll-container]")
                })
                that.asscroll.enable({
                    newScrollElements: data.next.container.querySelector(".scroll-wrap")
                })
                return gsap.timeline()
                .from(data.next.container, {
                    opacity: 0.,
                    onComplete: ()=>{
                        that.container.style.display = "none"
                    }
                })
              }
            },
            {
                name: 'from-inside-page-transition',
                from: {
                  namespace: ["inside"]
                },
                leave(data) {
                    // alert('from inside')
                    that.asscroll.disable();

                  return gsap.timeline()
                  .to('.cartoon', {
                    duration: 0.3,
                    y: 0,
                  })
                  .to(data.current.container, {
                      opacity: 0.
                  })
                  // create your stunning leave animation here
                },
                enter(data) {
                    that.asscroll = new ASScroll({
                        disableRaf: true,
                        containerElement: data.next.container.querySelector("[asscroll-container]")
                    })
                    that.asscroll.enable({
                         horizontalScroll: true,
                        newScrollElements: data.next.container.querySelector('.scroll-wrap')
                    })
                    // cleeaning old arrays
                    that.addObjects();
                    that.resize();
                    
    
                    return gsap.timeline()
                    .to('.cartoon',{
                        duration: 0.3,
                        y: "-100%"
                    })
                    .from(data.next.container,{
                        opacity: 0.
                        
                    })
                }
              }
        ]
          });
    }
     --
