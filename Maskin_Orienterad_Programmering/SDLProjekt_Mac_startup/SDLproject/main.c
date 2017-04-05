#include "renderer.h"
#include <stdio.h>
#include <math.h>

GfxObject ship, background;

void close(); 

int main( int argc, char* args[] )
{
    // If you want the program to not launch the terminal, then go to 
    // Project->Settings->General->"This program is a GUI application" and uncheck that flag.
    
	// Start up SDL and create window of width=800, height = 600
	initRenderer(800, 600); 
    
    //Init frame counter (is not used atm)
    long frame = 0;
    
    //Init of angle and angle to rotate each frame
    double angle = 0;
    double angleMod = 0.2;
    
    //Init zoom and zoom modification ratio
    float zoom = 1.8f;
    double zoomMod = 0.0005;
    
    
    //Create background
    background = createGfxObject("../background.jpg");
    background.outputWidth = 800;
    background.outputHeight = 600;
    
    // Create an ship
    int xPos = 400;
    int yPos = 300;
    ship = createGfxObject(  "../ship.png" );
    ship.outputWidth  = 200;
    ship.outputHeight  = 200;
    
    // Init pointer to key states
    const Uint8 *state = SDL_GetKeyboardState(NULL);
    
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
        }
        
        //Updates background zooming and rotation
        angle = fmod(angle + angleMod, 360);
        zoom += zoomMod;
        
        if (state[SDL_SCANCODE_UP]) {
            yPos -= 5;
        }
        if (state[SDL_SCANCODE_RIGHT]) {
            xPos += 5;
        }
        if (state[SDL_SCANCODE_DOWN]) {
            yPos += 5;
        }
        if (state[SDL_SCANCODE_LEFT]) {
            xPos -= 5;
        }
        
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );

        // Render our object(s) - background objects first, and then forward objects (like a painter)
        renderGfxObject(&background,400, 300, angle, zoom);
        renderGfxObject(&ship, xPos, yPos, 0, 0.5f);
        renderText("Hello World!", 300, 150);
         
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );
        
        //update frame count 
        frame++;
    }

	close(); //Free allocated resources
	return 0;
}

void close()
{
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&ship);
    
    closeRenderer(); //Free resources and close SDL
}