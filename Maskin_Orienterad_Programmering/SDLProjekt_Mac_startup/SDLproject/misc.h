#ifndef MISC_H
#define MISC_H

#include "gameobject.h"

extern GameObject* gameObjects[];
extern int nGameObjects;


void close(); 
void printToWindow(char* str, int x, int y);
void printToConsole(char* str, int x, int y);

#endif //MISC_H

