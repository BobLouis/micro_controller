LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00


LIST_INIT macro n1,n2,n3,n4,n5,n6,n7
    LFSR 0, 0x400 ; FSR0 point to addr
    MOVLB 0x4
    MOVLW n1
    MOVWF POSTINC0 ,0
    MOVLW n2
    MOVWF POSTINC0 ,0
    MOVLW n3
    MOVWF POSTINC0 ,0
    MOVLW n4
    MOVWF POSTINC0 ,0
    MOVLW n5
    MOVWF POSTINC0 ,0
    MOVLW n6
    MOVWF POSTINC0 ,0
    MOVLW n7
    MOVWF POSTINC0 ,0
    endm

LIST_INIT 0x1,0x3,0x5,0x07,0x06,0x4,0x2
nop
end
