LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00
setup:
    LFSR 0, 0x100 ; FSR0 point to 0x100
    LFSR 1, 0x101 ; FSR1 point to 0x101
    LFSR 2, 0x102 ; FSR1 point to 0x102
    MOVLW 0x00    ; wreg = 0
    MOVLB 0x01    ; BSR  = 1
    MOVWF 0x09 ,1 ; set 0x000 to 0 as cnt  

start:
    MOVLW 0x01  ; wreg = 0x01
    MOVLB 0x01  ; bank select 1
    MOVWF 0x00,1; 1 => bank select as BSR ; move 0x01 => 0x100
    
    MOVLW 0x01  ; wreg = 0x01
    MOVLB 0x01  ; bank select 1
    MOVWF 0x01,1; 1 => bank select as BSR ; move 0x01 => 0x101


loop:
    MOVFF POSTINC0 ,WREG ; move index0 data to reg
    ADDWF INDF2       ; add index 0 to  index 2
    MOVFF POSTINC1 ,WREG ; move index1 data to reg
    ADDWF POSTINC2       ; add index 0 to  index 2
    INCF 0x09,1,1   
    MOVLW 0x02   ;7 times
    CPFSGT 0x09
    ;goto loop
    
    MOVFF POSTINC0 ,WREG ; move index0 data to reg
    ADDWF INDF2       ; add index 0 to  index 2
    MOVFF POSTINC1 ,WREG ; move index1 data to reg
    ADDWF POSTINC2       ; add index 0 to  index 2
    INCF 0x09,1,1   
    
    
    MOVFF POSTINC0 ,WREG ; move index0 data to reg
    ADDWF INDF2       ; add index 0 to  index 2
    MOVFF POSTINC1 ,WREG ; move index1 data to reg
    ADDWF POSTINC2       ; add index 0 to  index 2
    INCF 0x09,1,1  
    
    MOVFF POSTINC0 ,WREG ; move index0 data to reg
    ADDWF INDF2       ; add index 0 to  index 2
    MOVFF POSTINC1 ,WREG ; move index1 data to reg
    ADDWF POSTINC2       ; add index 0 to  index 2
    INCF 0x09,1,1
    
    MOVFF POSTINC0 ,WREG ; move index0 data to reg
    ADDWF INDF2       ; add index 0 to  index 2
    MOVFF POSTINC1 ,WREG ; move index1 data to reg
    ADDWF POSTINC2       ; add index 0 to  index 2
    INCF 0x09,1,1
    
    MOVFF POSTINC0 ,WREG ; move index0 data to reg
    ADDWF INDF2       ; add index 0 to  index 2
    MOVFF POSTINC1 ,WREG ; move index1 data to reg
    ADDWF POSTINC2       ; add index 0 to  index 2
    INCF 0x09,1,1
    
    MOVFF POSTINC0 ,WREG ; move index0 data to reg
    ADDWF INDF2       ; add index 0 to  index 2
    MOVFF POSTINC1 ,WREG ; move index1 data to reg
    ADDWF POSTINC2       ; add index 0 to  index 2
    INCF 0x09,1,1

nop 
end