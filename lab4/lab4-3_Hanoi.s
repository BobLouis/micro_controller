LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00



MOVLW 0x04 ;load N
MOVWF 0x01
MOVLW 0x02 ;load 1
MOVWF 0x00



UP:
DECF 0x01
MOVLW 0x00
CPFSEQ 0x01 ; skip if N == 0
rcall MUL
MOVLW 0x00
CPFSEQ 0x01 ; skip if N == 0
goto UP
goto finish





MUL:
    MOVLW 0x02
    MULWF 0x00
    MOVFF PRODL, 0x00
    RETURN


finish:
DECF 0x00; 2^n-1
nop
end