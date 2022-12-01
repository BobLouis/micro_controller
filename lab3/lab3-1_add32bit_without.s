LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00
setup:
    ;first number
    MOVLW 0x10    ; wreg 
    MOVWF 0x00    ; 
    MOVLW 0x11    ; wreg 
    MOVWF 0x01    ;
    MOVLW 0x12    ; wreg 
    MOVWF 0x02    ;
    MOVLW 0xFF    ; wreg 
    MOVWF 0x03    ;

    ;second number
    MOVLW 0x20    ; wreg 
    MOVWF 0x10    ; 
    MOVLW 0x21    ; wreg 
    MOVWF 0x11    ;
    MOVLW 0x22    ; wreg 
    MOVWF 0x12    ;
    MOVLW 0xFF    ; wreg 
    MOVWF 0x13    ;

    MOVFF 0x10, 0x20 ;move second to answer
    MOVFF 0x11, 0x21 ;move second to answer
    MOVFF 0x12, 0x22 ;move second to answer
    MOVFF 0x13, 0x23 ;move second to answer
    
    MOVF  0x03, 0 ; 
    ADDWF 0x23    ;

    BC C1 
B1:
    
    MOVF  0x02, 0 ; move 0x02 to reg
    ADDWF 0x22    ;

    BC C2 
B2:    
    
    MOVF  0x01, 0 ; 
    ADDWF 0x21    ;

    BC C3 

B3:    
    MOVF  0x00, 0 ; 
    ADDWF 0x20    ;
    
    
    
    
    
goto Finish
C1:
    INCF 0x22   ;increase next number 
    goto B1     ;proceed add
    
C2:
    INCF 0x21
    goto B2
C3:
    INCF 0x20
    goto B3
    
Finish:
nop
end



