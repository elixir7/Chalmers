#include "background.h"

GameObject background; 
void createBackground(){
    //Create background
    background.gfxObject = createGfxObject("../background.jpg");
    background.angle = 0;
    background.angleSpeed = 0.2;
    background.scale = 1.8f;
    background.scaleSpeed = 0.0005;
    background.gfxObject.outputWidth = 800;
    background.gfxObject. outputHeight = 600;
    background.pos.x = 400;
    background.pos.y = 300;
    background.frame = 0;
    background.frameSpeed = 1;
    background.numFrames = 1;
    background.update = updateBackground;
    background.render = render;
    //Clever way of increment nGameObjects and sending the parameter
    /* This is how the call works
     * int original = i;
     * i = original + 1;
     * doStuff(original);
     */
    gameObjects[nGameObjects++] = &background;
}
void updateBackground(GameObject* this){
    //Updates background zooming and rotation
    this->angle = fmod(this->angle + this->angleSpeed, 360);
    this->scale += this->scaleSpeed;
}