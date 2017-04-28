#ifndef SHIP_H
#define SHIP_H

#include "gameobject.h"

extern GameObject ship;

extern const uint8_t *state;
void createShip();
void updateShip(GameObject * this);

#endif //SHIP_H