#include "xc.h"
    
extern unsigned char divide_signed(unsigned char a, unsigned char b);
    
void main(void){
    volatile unsigned int res = divide_signed(-20,-4);
    volatile unsigned char quotient = res & 0xFF
    volatile unsigned char remainder = res & 0xFF00
    while(1)
        ;
    return;
}