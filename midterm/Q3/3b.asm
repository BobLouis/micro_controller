LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00


MOVLW 0xFF
MOVWF 0x01

BTFSC 0x01 , 0
BSF   0x10 , 0
BTFSC 0x01 , 1
BSF   0x11 , 0
BTFSC 0x01 , 2
BSF   0x12 , 0
BTFSC 0x01 , 3
BSF   0x13 , 0

BTFSC 0x01 , 4
BSF   0x14 , 0
BTFSC 0x01 , 5
BSF   0x15 , 0
BTFSC 0x01 , 6
BSF   0x16 , 0
BTFSC 0x01 , 7
BSF   0x17 , 0

MOVF 0x10
CPFSEQ 0x17; skip if eq
goto NOT

MOVF 0x11
CPFSEQ 0x16; skip if eq
goto NOT

MOVF 0x12
CPFSEQ 0x15; skip if eq
goto NOT

MOVF 0x13
CPFSEQ 0x14; skip if eq
goto NOT

goto YES



NOT:
MOVLW 0xFF
MOVWF 0x0
goto finish

YES:
MOVLW 0x01
MOVWF 0x0


finish:

nop
end
