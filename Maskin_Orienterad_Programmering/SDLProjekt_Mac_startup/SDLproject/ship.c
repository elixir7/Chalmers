#include "ship.h"

const uint8_t *state;
GameObject ship;
void createShip(){
    //Create a ship
    ship.gfxObject = createGfxObject(  "../ship_red.png" );
    ship.gfxObject.outputWidth  = 200;
    ship.gfxObject.outputHeight  = 200;
    ship.speed = 7;
    ship.pos.x = 400;
    ship.pos.y = 300;
    ship.angle = 0;               // unused
    ship.angleSpeed = 3; // unused
    ship.scale = 0.5f;
    ship.scaleSpeed = 0; 
    ship.frame = 0;
    ship.frameSpeed = 1;
    ship.numFrames = 1;
    ship.update = updateShip;
    ship.render = render;
    //Clever way of increment nGameObjects and sending the parameter
    /* This is how the call works
     * int original = i;
     * i = original + 1;
     * doStuff(original);
     */
    gameObjects[nGameObjects++] = &ship;
}
void updateShip(GameObject* this){
    //Keyboard input, changes ship speed
    if (state[SDL_SCANCODE_RIGHT])
        this->pos.x = (this->pos.x + this->speed >= 799) ? 799 : this->pos.x + this->speed;
    if (state[SDL_SCANCODE_LEFT])
        this->pos.x = (this->pos.x - this->speed <= 0) ? 0 : this->pos.x-this->speed; 
    if (state[SDL_SCANCODE_DOWN])
        this->pos.y = (this->pos.y + this->speed >= 599) ? 599 : this->pos.y+this->speed;           
    if (state[SDL_SCANCODE_UP])
        this->pos.y = (this->pos.y - this->speed <= 0) ? 0 : this->pos.y-this->speed;
    
    //Rotate ship
    if (state[SDL_SCANCODE_A])
        this->angle = fmod(this->angle - this->angleSpeed, 360.0);           
    if (state[SDL_SCANCODE_D])
        this->angle = fmod(this->angle + this->angleSpeed, 360.0);
}
  