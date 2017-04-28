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
    * ( (unsigned long *) 0x40020C02) = 0x5500;
}

int main(void){
    appInit();
    while(1){
        short c = 55;
        int test = 54;
        if(test == 54){
            test = 55;
        }
    }
    return 0;
}

