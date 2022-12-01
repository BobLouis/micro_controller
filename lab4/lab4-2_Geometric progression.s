LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00



MOVLW 0x01 ;0
MOVWF 0x00 ;2

MOVLW 0x03 ;4
MOVWF 0x01 ;6

MOVFF 0x01, 0x03 ;num to add 8
MOVFF 0x01, 0x02 ;sum 10
rcall GP ;12
rcall GP ;14
MOVLW finish;
MOVWF PCL;

GP:
    MOVF 0x01, 0 ;load multiplier ;16
    MULWF 0x03   ;mul 18
    MOVFF PRODL , 0x03;
    MOVF 0x03, 0 ;
    ADDWF 0x02
    RETURN

finish:

nop 
end

