LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00


unsigned_16_add macro oper1_H, oper1_L,oper2_H, oper2_L
    MOVF oper2_L ,0
    ADDWF oper1_L , F
    MOVF oper2_H , 0 
    ADDWFC oper1_H , F
    endm

LIST_INIT 0x1,0x3,0x6,0xB,0xF

MOVLW 0x5
MOVWF 0x00 ; load num

MOVFF 0x00, 0x10 ; 
DECF 0x10; multy num
MOVFF 0x00, 0x02

fac:
MOVF 0x10, 0
MULWF 0x02
MOVFF PRODL, 0x02 ; load the mul low byte
MOVFF PRODH , 0x11 ; tmp for PRODH
MOVF 0x10, 0
MULWF 0x01 
MOVFF PRODL, 0x01
unsigned_16_add 0x01, 0x02, 0x11, 0x12 ; add the tmp
DECF 0x10
BNZ fac

finish:


nop
end
