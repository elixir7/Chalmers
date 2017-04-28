#include "alien.h"
#include <math.h>
GameObject alien;

void createAlien(int x, int y){
    alien.gfxObject = createGfxObject(  "../aliens.png" );
    alien.gfxObject.outputWidth  = 96;
    alien.gfxObject.outputHeight  = 90;
    alien.speed = 3;
    alien.pos.x = x;
    alien.pos.y = y;
    alien.angle = 0;               // unused
    alien.angleSpeed = 7; // unused
    alien.scale = 1.0f;
    alien.scaleSpeed = 0; 
    alien.frame = 0;
    alien.frameSpeed = 0.3f;
    alien.numFrames = 13;
    alien.update = updateAlien;
    alien.render = render;
    //1 is right, 0 is left;
    alien.direction.x = 1;
    //1 is down, 0 is up;
    alien.direction.y = 1;
    //Clever way of increment nGameObjects and sending the parameter
    /* This is how the call works
     * int original = i;
     * i = original + 1;
     * doStuff(original);
     */
    gameObjects[nGameObjects++] = &alien;
}
void updateAlien(GameObject * this){
    this->frame = fmod( (this->frame+this->frameSpeed), this->numFrames );
    
    if(this->pos.x >= (800 - this->gfxObject.outputWidth/2)){
        this->pos.x = this->pos.x - this->speed;
        this->direction.x = 0;
    }else if(this->pos.x <= this->gfxObject.outputWidth/2){
        this->pos.x = this->pos.x + this->speed;
        this->direction.x = 1;
    }
    this->pos.x = this->direction.x ? this->pos.x + this->speed : this->pos.x - this->speed;
    
    if(this->pos.y >= (600 - this->gfxObject.outputHeight/2)){
        this->pos.y = this->pos.y - this->speed;
        this->direction.y = 0;
    }else if(this->pos.y <= this->gfxObject.outputHeight/2){
        this->pos.y = this->pos.y + this->speed;
        this->direction.y = 1;
    }
    this->pos.y = this->direction.y ? this->pos.y + this->speed : this->pos.y - this->speed;
}