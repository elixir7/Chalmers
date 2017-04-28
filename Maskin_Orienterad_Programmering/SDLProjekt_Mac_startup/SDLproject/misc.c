#include "misc.h"

void close(){
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    for(int i = 0; i < nGameObjects; i++){
        freeGfxObject(&(gameObjects[i]->gfxObject));
    }
    
    
    closeRenderer(); //Free resources and close SDL
}  

//Printing functions
void printToWindow(char* str, int x, int y){
   renderText(str, 300, 150);
}
void printToConsole(char* str, int x, int y){
    printf("%s\n", str);
}
