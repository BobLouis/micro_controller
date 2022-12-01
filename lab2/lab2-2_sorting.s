LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00

setup:
    LFSR 0, 0x010 ; FSR0 point to 0x100
    LFSR 1, 0x011 ; FSR1 point to 0x101
    LFSR 2, 0x102 ; FSR1 point to 0x102
    MOVLW 0x0B    ; wreg = 0B
    MOVWF 0x10    ; wreg => 0x10

	MOVLW 0x05    ; wreg = 05
    MOVWF 0x11    ; wreg => 0x11

	MOVLW 0x40    ; wreg = 40
    MOVWF 0x12    ; wreg => 0x12

	MOVLW 0x07    ; wreg = 07
    MOVWF 0x13    ; wreg => 0x13

	MOVLW 0x0D    ; wreg = 0D
    MOVWF 0x14    ; wreg => 0x14

	MOVLW 0x7F    ; wreg = 7F
    MOVWF 0x15    ; wreg => 0x15

	MOVLW 0x0A    ; wreg = 0A
    MOVWF 0x16    ; wreg => 0x16

	MOVLW 0x01    ; wreg = 01
    MOVWF 0x17    ; wreg => 0x17

	MOVLW 0xFE    ; wreg = FE
    MOVWF 0x18    ; wreg => 0x18






inner_loop:	
	INCF 0x19 ,1
	MOVLW 0x09
	CPFSLT 0x19   ;skip if f < W
	goto outer_loop
	MOVFF INDF1    ,WREG ; 
	CPFSLT INDF0  ;skip if f < W
	goto swap
	MOVF POSTINC1
	goto inner_loop

outer_loop:
	INCF 0x1A
	MOVLW 0x08
	CPFSLT 0x1A   ;skip if f < W
	goto finish
	
	MOVF POSTINC0   ;index 0 ++

	LFSR 1, 0x011   ; FSR1 point to 0x101

	MOVLW 0x00 ;
	MOVWF 0x1B ;set 1B to 0
inc_loop:
	MOVF POSTINC1   ;index 0 ++
	INCF 0x1B ,1
	MOVF 0x1B ,0
	CPFSEQ 0x1A ;
	goto inc_loop

	
	MOVFF 0x1A , 0x19 ; j = i
	goto inner_loop



swap:
	MOVF INDF1,0 ; file reg to wreg
	MOVFF INDF0 , INDF1 ; INDF0 => INDF1
	MOVWF INDF0 
	MOVF POSTINC1
	goto inner_loop
;    
	
finish:
nop
end