/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}


void appInit(void){
    //b7-b4 Output from comp., b3-b0 Input from comp.
    * ( (unsigned long *) 0x40020C00) = 0x55005555;
    //b7-b4 push-pulll
    * ( (unsigned long *) 0x40020C05) = 0xF;
    //b3-b0 pull-down
    * ( (unsigned long *) 0x40020C0E) = 0xAA;
    
}

void activateRow(int row){
    //b8-b15 output from comp
    unsigned long *output = 0x40020C15;
    //Make only one of the pins active at the same time;
    switch(row){
        case 0:
            *output = 0x10000;
            break;
            
        case 1:
            *output = 0x100000;
            break;
        
        case 2:
            *output = 0x1000000;
            break;
        
        case 3:
            *output = 0x10000000;
            break;
    }
}

int readColumn(){
    //b3-b0 input from keyboard
    unsigned long *input = 0x40020C11;
    unsigned short read = *input & 0b1111;
    for(int i = 0;i < 4;i++){
        if((read & 0b1) == 0b1){
            return i;
        }else{
           read = read>>1; 
        }
    }
    return 0;
}

int keyValue(int row, int column){
    int keyValue;
    if(row == 0){
        switch(column){
            case 0:
                keyValue = 1;
                break;
            case 1:
                keyValue = 2;
                break;
            case 2:
                keyValue = 3;
                break;
            case 3:
                keyValue = 10;
                break;
            
        }
    }else if(row == 1){
        switch(column){
            case 0:
                keyValue = 4;
                break;
            case 1:
                keyValue = 5;
                break;
            case 2:
                keyValue = 6;
                break;
            case 3:
                keyValue = 11;
                break;
            
        }
    }else if(row == 2){
        switch(column){
            case 0:
                keyValue = 7;
                break;
            case 1:
                keyValue = 8;
                break;
            case 2:
                keyValue = 9;
                break;
            case 3:
                keyValue = 12;
                break;
            
        }
    }else if(row == 3){
        switch(column){
            case 0:
                keyValue = 14;
                break;
            case 1:
                keyValue = 0;
                break;
            case 2:
                keyValue = 15;
                break;
            case 3:
                keyValue = 13;
                break;
            
        }
    }
    return keyValue;
}

unsigned char keyb(void){
    for(int row = 0;row < 4;row++){
        activateRow(row);
        int column = readColumn();
        if(column != 0){
            return keyValue(row,column);
        }
    }
    return 0xFF;
}

void out7seg(unsigned char c){
    //b0-b7 output from comp to hexDisplay
    unsigned long *output = 0x40020C14;
    unsigned short hexValue; 
    switch(c){
        case 0:
            hexValue = 0x3F;
            break;
        case 1:
            hexValue = 0x06;
            break;
        case 2:
            hexValue = 0x5B;
            break;
        case 3:
            hexValue = 0x8F;
            break;
        case 4:
            hexValue = 0x66;
            break;
        case 5:
            hexValue = 0x6D;
            break;
        case 6:
            hexValue = 0x7D;
            break;
        case 7:
            hexValue = 0x07;
            break;
        case 8:
            hexValue = 0x7F;
            break;
        case 9:
            hexValue = 0x67;
            break;
        case 10:
            hexValue = 0xF7;
            break;
        case 11:
            hexValue = 0x7F;
            break;
        case 12:
            hexValue = 0x39;
            break;
        case 13:
            hexValue = 0x3F;
            break;
        case 14:
            hexValue = 0x79;
            break;
        case 15:
            hexValue = 0x71;
            break;
    }

    *output = hexValue;
}


int main(void){
    appInit();
    while(1){
        *( (unsigned char *) 0x40020C14) = 0x3F;
        //out7seg(keyb());
    }
    return 0;
}

