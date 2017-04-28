#ifndef GAMEOBJECT_H
#define GAMEOBJECT_H

#include "renderer.h"
#include "vecmath.h"

typedef struct tGameObject{
    GfxObject gfxObject;
    vec2f pos;
    float speed;
    double angle, angleSpeed;
    float scale, scaleSpeed;
    vec2f direction;
    
    float       frame;
    float       frameSpeed;
    int         numFrames;
    
    void (*update) (struct tGameObject* gameobj);
    void (*render) (struct tGameObject* gameobj);
    
} GameObject;

void render(GameObject* this);

extern GameObject* gameObjects[];
extern int nGameObjects;


#endif 