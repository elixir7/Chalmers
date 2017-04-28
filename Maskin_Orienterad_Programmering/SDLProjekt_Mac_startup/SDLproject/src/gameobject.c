#include "gameobject.h"

void render(GameObject* this)
{
    // Render a sub frame to screen
    // Here, we know that the heart image is a sprite sheet with 10 frames
    // simply outlined next to each other in the x-direction.
    int w = this->gfxObject.textureWidth / this->numFrames;
    // Thus, the x-coordinate for the current frame is easy to compute:
    int x = w * (int)(this->frame);

    SDL_Rect srcRect = { x, 0, w, this->gfxObject.textureHeight }; // select the sub image
    
    renderGfxSubFrame(&this->gfxObject, this->pos.x, this->pos.y, this->angle,this->scale, srcRect );
}

GameObject* gameObjects[100];
int nGameObjects = 0;


