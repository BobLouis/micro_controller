#include <xc.h>
#include <pic18f4520.h>

#pragma config OSC = INTIO67    // Oscillator Selection bits
#pragma config WDT = OFF        // Watchdog Timer Enable bit 
#pragma config PWRT = OFF       // Power-up Enable bit
#pragma config BOREN = ON       // Brown-out Reset Enable bit
#pragma config PBADEN = OFF     // Watchdog Timer Enable bit 
#pragma config LVP = OFF        // Low Voltage (single -supply) In-Circute Serial Pragramming Enable bit
#pragma config CPD = OFF        // Data EEPROM　Memory Code Protection bit (Data EEPROM code protection off)
int pos = -1;
int dir = 0; //0 => ccw 1 => cw
void Delay(unsigned int time){
    unsigned int i,j;
    for(i=0;i<time;++i)
        for(j=0;j<255;++j);
}
void main(void)
{

    RCONbits.IPEN = 1;
    INTCONbits.GIE = 1;
    INTCONbits.PEIE = 1;
    INTCONbits.INT0IE = 1;
    INTCON2bits.RBPU = 0;
    INTCON2bits.INTEDG0 = 1;

    // Timer2 -> On, prescaler -> 4
    //timer2 control reg T2CON  0b00000101
    T2CONbits.TMR2ON = 0b1; //2
    T2CONbits.T2CKPS = 0b01;//10
    
    // Internal Oscillator Frequency, Fosc = 125 kHz, Tosc = 8 µs
    OSCCONbits.IRCF = 0b001;
    
    // PWM mode, P1A, P1C active-high; P1B, P1D active-high
    CCP1CONbits.CCP1M = 0b1100;
    
    // CCP1/RC2 -> Output
    TRISC = 0;
    LATC = 0;
    
    // Set up PR2, CCP to decide PWM period and Duty Cycle
    /** 
     * PWM period
     * = (PR2 + 1) * 4 * Tosc * (TMR2 prescaler)
     * = (0x9b + 1) * 4 * 8µs * 4
     * = 0.019968s ~= 20ms
     */
    PR2 = 0x9b;
    
    /**
     * Duty cycle
     * = (CCPR1L:CCP1CON<5:4>) * Tosc * (TMR2 prescaler)
     * = (0x0b*4 + 0b01) * 8µs * 4
     * = 0.00144s ~= 1450µs
     */
    CCPR1L = 0x03;
    CCP1CONbits.DC1B = 0b11;
    
    while(1);
    return;
}

void __interrupt() ISR(){

    while(1){
        CCPR1L = 0x12;
        Delay(6);
        CCPR1L = 0x03;
        Delay(6);

    }
    
    
    INTCONbits.INT0IF = 0;
}