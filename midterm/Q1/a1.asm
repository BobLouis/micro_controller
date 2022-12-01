LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00


reverse macro N

    MOVLW N
    MOVWF 0x01

    BTFSC 0x01 , 7
    BSF 0x00 , 0
    
    BTFSC 0x01 , 6
    BSF 0x00 , 1

    BTFSC 0x01 , 5
    BSF 0x00 , 2

    BTFSC 0x01 , 4
    BSF 0x00 , 3
    
    BTFSC 0x01 , 3
    BSF 0x00 , 4

    BTFSC 0x01 , 2
    BSF 0x00 , 5

    BTFSC 0x01 , 1
    BSF 0x00 , 6

    BTFSC 0x01 , 0
    BSF 0x00 , 7
endm



reverse 0x43
nop
end
