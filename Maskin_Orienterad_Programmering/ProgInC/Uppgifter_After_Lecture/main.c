#include <stdio.h>
#include <string.h>
#include <math.h>
#include <unistd.h>

#define byteLength 8
#define true 1
#define false 0
#define shortLength 16

void printBinary8(unsigned char byte){
	for(int i = 7; i >= 0; i--){
		int bit = (byte >> i ) & 0x01;
		printf("%i", bit);
	}
	printf("\n");
}

void printBinary16(unsigned short byte){
	for(int i = 15; i >= 0; i--){
		int bit = (byte >> i ) & 0x01;
		printf("%i", bit);
	}
}

void printBinary32(unsigned int byte){
	for(int i = 31; i >= 0; i--){
		int bit = (byte >> i ) & 0x01;
		printf("%i", bit);
	}
	printf("\n");
}

void printDecimal(char str[]){
	if(strlen(str) == 8){
		int result = 0;
		for(int i = 7; i >= 0; i--){
			int bit = str[i] & 0x01;
			result += bit *  pow(2,(7-i));
		}
		printf("%i\n", result);
	}else{
		printf("Input was not 8-bit");
	}
}

void binaryToDecimal(char str[]){
	unsigned char byte = 0;
	if(strlen(str) == byteLength){
		for(int i = 0; i < byteLength; i++){
			if(str[i] == '1'){
				byte |= (1<<(7-i));
			}
		}
	}else{
		printf("Input was not 8-bit!");
	}
}

void clrScr(){
	//Don't ask why...
    for(int i = 0; i < 23; i++){
        printf("\n");
    }
}

unsigned short rotateRight(unsigned short a) {
	return (((a & 0b0000000000000001) << (shortLength-1)) + (a >> 1));
}

unsigned short rotateLeft(unsigned short a) {
	return (((a & 0b1000000000000000) >> (shortLength-1)) + (a << 1));
}

void printSpaces(int x){
	while(x > 0){
		printf(" ");
		x--;
	}
}

void printRows(int x){
	while(x > 0){
		printf("\n");
		x--;
	}
}

void animateBitsV1(){
	while(1){
		unsigned short a = 0x8000;
		unsigned short b = 0x0001;
		 for(int i = 0; i < 15; i++){
			a = a>>1;
			b = b<<1;
			clrScr();
			printBinary16(a | b);
			usleep(500000);
		 }
		 
	 }
}

void animateBitsV2(){
	while(1){
		unsigned short a = 0x8000;
		 for(int i = 0; i < 15; i++){
			a = a>>1;
			clrScr();
			printBinary16(a);
			usleep(200000);
			
			a = a>>1;
			clrScr();
			printBinary16(a);
			usleep(200000);
			
			a = a<<1;
			clrScr();
			printBinary16(a);
			usleep(200000);
		 }
		 
	 }
}


void animateBitsV3() {
	unsigned short a = 0b1000000000000000, b = 0000000000000001;
    int scrollWidth = 50; //moving distance,horizontal
    int scrollHeight = 15;
    int loopIter = 0;
    int startingPosX = 10; //distance to the left wall
    int startingPosY = 5;
    while (true)
    {
        clrScr();
        
        // Hantera horisontell bouncing scroll
        // låt scrolliter loopa runt från 0 t.om. 99; 
        int scrollIterX = loopIter % (2*scrollWidth); 
        int scrollIterY = loopIter % (2*scrollHeight);
        int xPos = startingPosX + scrollWidth - abs(scrollWidth - scrollIterX); 
        int yPos = startingPosY + scrollHeight  - abs(scrollHeight - scrollIterY);
        printSpaces(xPos);
        
        // hantera bit-scroll
        if((loopIter % 2) != 0) { // uppdatera bitmönstret endast varannan iteration.
            a = rotateRight(a);
            b = rotateLeft(b);
        }
        
        printBinary16(a | b); 
        
        printRows(yPos);   
        usleep(33333);
        loopIter++;
    }
}


int main(void){
    animateBitsV3();
	/*
	unsigned char byte = 200;
	unsigned char binNumb[] = "00001001";
	unsigned char c = 128;
	 */
	 
    /*	
		printBinary(byte);
		printDecimal(binNumb);
	*/ 
	
	/*
	//Alternative version: c |= 0b00101010
	printBinary8(c);
	//Bit 1 is worth "00000010 = 2" so OR with 2, sets bit 1 to 1. 
	c |= 0x02;
	printBinary8(c);
	
	//Bit 4 is worth "00001000 = 8" so OR with 8=0x08(in hex), sets bit 3 to 1. 
	c |= 0x08;
	// this is identical to the row above --> c |= 32;
	printBinary8(c);
	
	//Bit 5 is worth "00100000 = 32" so OR with 32=0x20(in hex), sets bit 5 to 1. 
	c |= 0x20;
	// this is identical to the row above --> c |= 32;
	printBinary8(c);
	
	printf("%d", c);
	 */
	
	/*
	signed char x = 27;
	x = ~x + 1;
	// eller x ^= 0xFF 0ch x++;
	printf("%i", (x));
	*/ 
	 
	//animateBitsV1();
	 
	 /*
	 unsigned short numb1 = 30345;
	 unsigned int numb2 = 65987;
	 
	 printBinary16(numb1);
	 printBinary32(numb2);
	  */

	return 0;
}

