LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00


MERGE_LIST macro addr,n1,n2,n3,n4,n5
    LFSR 0, addr ; FSR0 point to addr
    MOVLW n1
    MOVWF POSTINC0
    MOVLW n2
    MOVWF POSTINC0
    MOVLW n3
    MOVWF POSTINC0
    MOVLW n4
    MOVWF POSTINC0
    MOVLW n5
    MOVWF POSTINC0
    endm

LIST_INIT 0x1,0x3,0x6,0xB,0xF
nop
end
