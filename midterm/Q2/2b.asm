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



LIST_INIT 0x00,0x01,0x03,0x02,0x06,0x05,0x04
LFSR 0, 0x400 ;
MOVFF POSTINC0 , 0x00
MOVFF POSTINC0 , 0x01
MOVFF POSTINC0 , 0x02
MOVFF POSTINC0 , 0x03
MOVFF POSTINC0 , 0x04
MOVFF POSTINC0 , 0x05
MOVFF POSTINC0 , 0x06
    
MOVF 0x0,0
CPFSGT 0x01 ; skip if F > W
goto NotMount
    
MOVLW 0x7
MOVWF 0x12 ;cnt
LFSR 0 ,0x00
rcall mountain
BTFSC 0x11 ,0
goto IsMount
goto NotMount


mountain:
DECF 0x12
MOVLW 0x0 
CPFSGT 0x12 ; skip if 0x12 <=0
RETURN
BTFSC 0x11 , 0
goto down
goto up


up:
MOVF POSTINC0 , 0
CPFSLT INDF0 ;skip if F < W
goto mountain
INCF 0x11 ;
goto mountain

down: 
MOVF POSTINC0 , 0
CPFSGT INDF0 ;skip if F > W
goto mountain
goto NotMount





IsMount:
MOVLW 0x1
MOVWF 0x10
MOVLB 0x4
LFSR 1 , 0x410
MOVLW 0x1
MOVWF INDF1
goto finish

NotMount:
MOVLW 0xFF
MOVWF 0x10
MOVLB 0x4
LFSR 1 , 0x410
MOVLW 0xFF
MOVWF INDF1
goto finish


finish:

nop
end
