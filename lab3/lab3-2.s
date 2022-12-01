LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00
setup:

    MOVLW 0x00    ; quotient 
    MOVWF 0x00    ;
   
    MOVLW 0x17    ; division
    MOVWF 0x02    ; 
    MOVLW 0x06    ; divisor origin 
    MOVWF 0x03    ;
    MOVFF 0x03, 0x04; divisor for shift
    
    RLCF 0x04  ;
    RLCF 0x04  ;
    RLCF 0x04  ;
    RLCF 0x04  ;

    MOVFF 0x02, 0x01    ; remender 

start:
    ;round1
    MOVF 0x04, 0   ;load shift divisor to wreg
    SUBWF 0x01
    BN N1
    BSF 0x00, 4 ;set quotient
    goto B1
N1:
    MOVFF 0x02, 0x01

B1:
    RRCF 0x04 ;
    ;round2
    MOVF 0x04, 0   ;load shift divisor to wreg
    SUBWF 0x01
    BN N2
    BSF 0x00, 3 ;set quotient
    goto B2
N2:
    MOVFF 0x02, 0x01

B2:
    RRCF 0x04 ;
    
    ;round3
    MOVF 0x04, 0   ;load shift divisor to wreg
    SUBWF 0x01
    BN N3
    BSF 0x00, 2 ;set quotient
    goto B3
N3:
    MOVFF 0x02, 0x01

B3:
    RRCF 0x04 ;
    
    ;round4
    MOVF 0x04, 0   ;load shift divisor to wreg
    SUBWF 0x01
    BN N4
    BSF 0x00, 1 ;set quotient
    goto B4
N4:
    MOVFF 0x02, 0x01

B4:
    RRCF 0x04 ;
    MOVLW 0x7F    ;mask ro cancel first bit
    ANDWF 0x04, 1
    
    ;round5
    MOVF 0x04, 0   ;load shift divisor to wreg
    SUBWF 0x01
    BN N5
    BSF 0x00, 0 ;set quotient
    goto B5
N5:
    MOVFF 0x02, 0x01

B5:
    RRCF 0x04 ;
    MOVLW 0x7F
    ANDWF 0x04, 1
  
    
    
    
    
nop
end


    


