//Order does matter
#include <stdio.h>
#include <math.h>

#include "renderer.h"
#include "vecmath.h"
#include "gameobject.h"
#include "misc.h"
#include "ship.h"
#include "background.h"
#include "alien.h"

// Init pointer to key states
const uint8_t *state;

int main( int argc, char* args[] ){
	// Start up SDL and create window of width=800, height = 600
	initRenderer(800, 600); 
    
    //Frame counter
    long frame = 0;
    
    //Print function pointer
    void (*print)(char *str, int x, int y) = printToWindow;
    
    //Order is important because index 0 is painted first then 1.
    createBackground();
    createShip();
    createAlien(80, 100);
    
    state = SDL_GetKeyboardState(NULL);
    
    while(true) // The real-time loop
    {
        // Handle events on the inqueue (e.g., mouse events)
        SDL_Event e;  //Event handler
        while( SDL_PollEvent( &e ) != 0 )
        {
            if( e.type == SDL_QUIT ) {   //User requests quit
                close(); 
                exit(0);
            }
            
            if( (e.type == SDL_KEYDOWN) && (e.key.keysym.scancode == SDL_SCANCODE_C) )
                print = (print == printToWindow) ? printToConsole : printToWindow;
        }
    
        
        // Clear screen with a grey background color.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );

        // Update Objects
        for(int i = 0; i < nGameObjects; i++)
            gameObjects[i]->update(gameObjects[i]);
        
        //Render Objects
        for(int i = 0; i < nGameObjects; i++)
            gameObjects[i]->render(gameObjects[i]);
        
        //Print text
        //print("Hello World!", 300, 150);
         
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );
        
        //Update frame count 
        frame++;
    }

	close(); //Free allocated resources
	return 0;
}






