#include "xc.h"
    
extern unsigned char isprime(unsigned int a);
    
void main(void){
    volatile unsigned char res = isprime(28);
    while(1)
        ;
    return;
}