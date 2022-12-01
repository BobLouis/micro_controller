LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00



MOVLW 0x1D ;
MOVWF 0x01 ; load 29 to 0x01 ;
 
