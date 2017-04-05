#define GPIO_E  0x40021000
#define portOdrLow  ((volatile unsigned char*)(GPIO_E + 0x14))
#define portOdrHigh  ((volatile unsigned char*)(GPIO_E + 0x15))
//Bitvis väljare
#define B_E      0b01000000
#define B_SELECT 0b0100
#define B_RW     0b0010
#define B_RS     0b0001
/*
*portOdrLow |= B_SELECT;
*portOdrHigh &= ~~B_RW;
delay(tsu1);
*portOdrLow |= B_E;
*portOdrHigh = ...;
*delay("max(Tsu2,Tw)");
*portOdrLow &= ~~B_E;
*delay(500ms-240ms)

*/


// ascii_write_controller(cmd/data)
#define portIdr ((volatile unsigned int*)(GPIO_E + 0x10))
#define portIdrLow ((volatile unsigned char*)(GPIO_E + 0x10))
#define portIdrHigh ((volatile unsigned int*)(GPIO_E + 0x11))

void ascii_ctrl_bit_set(unsigned char x){
    //Ska bitar i x som är 1 ska sättas till 
    *portOdrLow |= (B_SELECT | x);
}

void ascii_ctrl_bit_clear(unsigned char x){
    //Ska bara släcka alla 1 bitar i x, dessutom fortf ha bit2 som 1 eftersom select biten alltid ska vara noll. 
    *portOdrLow &= (~x | B_SELECT);
}

void ascii_write_ctrl(unsigned char x){
    ascii_ctrl_bit_set(B_E);
    *portOdrHigh = x;
    delay_250ns()
    ascii_ctrl_bit_clear(B_E);
}

unsigned char ascii_read_ctrl(){
    ascii_ctrl_bit_set(B_E);
    delay_250ns();
    delay_250ns();
    unsigned char c = *portIdrHigh;
    ascii_ctrl_bit_clear(B_E);
    return c;
}