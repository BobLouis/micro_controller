LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00

	

initial:

MOVLW b'00001111'  ; load  to wreg
MOVWF 0x00         ; wreg to 0x00

MOVLW b'00110011'  ; load  to wreg
MOVWF 0x01         ; wreg to 0x01

MOVFF 0x00,0x03    ;complement of 0x00
COMF  0x03,1    

MOVFF 0x01,0x04    ;complement of 0x01
COMF  0x04,1  

MOVLW 0x00		 ; AND 0x00 0x04
ANDWF 0x04, 1    ; AND 0x00 and 0x04 and put result back to origin


MOVLW 0x01		 ; AND 0x01 0x03
ANDWF 0x03, 1    ; AND 0x00 and 0x03 and put result back to origin

MOVLW 0x04		 ; OR 0x04 0x03
IORWF 0x03, 1    ; OR 0x03 and 0x04 and put result back to origin

MOVFF 0x03, 0x02 ; move 0x03 to 0x02





