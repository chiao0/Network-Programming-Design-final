const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');
canvas.width = innerWidth;
canvas.height = innerHeight;

const imageElement = document.getElementById('imageId');
const spriteSheet = new Image();
spriteSheet.src = imageElement.src;
spriteSheet.onload = loadimg;

let cols = 7;
let rows = 1;
let spriteWidth =  spriteSheet.width/ cols; 
let spriteHeight = spriteSheet.height / rows; 

let totalFrames = 7;
let currentFrame = 0;
let frameDrawn =0;

let srcX =0;
let srcY =0;

function animate() {
    ctx.clearRect(0,0,canvas.width, canvas.height);
    requestAnimationFrame(animate);

    currentFrame = currentFrame % totalFrames;
    srcX = currentFrame * spriteWidth;

    // ctx.save();
    // resizeimg();
    ctx.drawImage(spriteSheet, srcX, srcY,spriteWidth, spriteHeight,
        0,0 ,spriteWidth, spriteHeight);
    // ctx.restore();

    frameDrawn++;
    if(frameDrawn>=10){
        currentFrame++;
        frameDrawn=0;
      }
}
// function resizeimg(){
//     let scalefactor =0.5;
//     let midxpods = innerWidth / 2 - (spriteWidth * scalefactor) / 2;
//     let midypods = innerHeight / 2 - (spriteHeight * scalefactor) / 2;

//     ctx.translate(midxpods,midypods);
//     ctx.scale(scalefactor,scalefactor);
// }

let numofimg = 1;
function loadimg(){
    if(--numofimg > 0) return;
    animate();
}
