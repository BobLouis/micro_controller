LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00


setup:
    LFSR 0, 0x100 ; FSR0 point to 0x100 first array
    LFSR 1, 0x110 ; FSR1 point to 0x101 second array
    LFSR 2, 0x120 ; FSR1 point to 0x102 final array
    MOVLB 0x01    ; BSR  = 1

    MOVLW 0xA1    ; wreg 
    MOVWF 0x00 ,1 ; 

    MOVLW 0xB2    ; wreg 
    MOVWF 0x01 ,1 ; 

    MOVLW 0xC3    ; wreg 
    MOVWF 0x02 ,1 ; 

    MOVLW 0xD4    ; wreg 
    MOVWF 0x03 ,1 ; 

    MOVLW 0xE5    ; wreg 
    MOVWF 0x04 ,1 ; 


    MOVLW 0xA7    ; wreg 
    MOVWF 0x10 ,1 ; 

    MOVLW 0xB3    ; wreg 
    MOVWF 0x11 ,1 ; 

    MOVLW 0xC9    ; wreg 
    MOVWF 0x12 ,1 ; 

    MOVLW 0xF6    ; wreg 
    MOVWF 0x13 ,1 ; 

start:
    MOVFF INDF0, INDF2 ; move first to answer
    MOVF  INDF0,0        ; wreg <= index0
    CPFSGT INDF1         ; skip if f > W
    MOVFF INDF1, INDF2   ; move second to answer

    CPFSGT INDF1         ; skip if f > W
    goto second_inc
    goto first_inc

second_inc:
    MOVF POSTINC1        ; second index ++
    INCF 0x2A,1,1        ; 2A ++
    goto next

first_inc:
    MOVF POSTINC0        ; first index ++
    INCF 0x29,1,1        ; 29 ++
    
next:
    MOVLW 0x05
    CPFSLT 0x29         ;skip if f < W
    goto first_empty


    MOVLW 0x04
    CPFSLT 0x2A         ;skip if f < W
    goto second_empty

    MOVF POSTINC2        ; final index ++
    goto start

first_empty: 
    MOVFF INDF1, INDF2 ;
    MOVF POSTINC1      ; second index ++
    MOVF POSTINC2        ; final index ++
    MOVLW 0x04
    CPFSLT 0x2A         ;skip if f < W
    goto finish
    goto first_empty


second_empty: 
    MOVFF INDF0, INDF2 ;
    MOVF POSTINC0      ; second index ++
    MOVF POSTINC2        ; final index ++
    MOVLW 0x05
    CPFSLT 0x29         ;skip if f < W
    goto finish
    goto second_empty

finish:
nop
end