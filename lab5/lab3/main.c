#include <xc.h>

extern unsigned int mypow(unsigned a, unsigned b);

void main(void) {
    volatile unsigned int res = mypow(2, 0);
    while(1);
    return;
}