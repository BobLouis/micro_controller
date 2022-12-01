#include "xc.inc"

GLOBAL _divide_signed

PSECT mytext, local, class=CODE, reloc=2

_divide_signed:
    CLRF 0x02
    CLRF 0x04
    MOVLW 0x7F
    CPFSGT 0x01 ;skip if f>W
    INCF 0x04   ;if dividend is positive 0x04 =>1

    MOVLW 0xF
    CPFSGT 0x03 ;skip if f>W
    INCF 0x05   ;if divisor is positive 0x05 =>1


    MOVF 0x04 ,0 
    CPFSEQ 0x05 ;skip if 4==5
    goto diff_signed
    goto same_signed
    
    

diff_signed:
MOVLW 0x7F
CPFSGT 0x01 ;skip if f>W
goto pos_minus
goto minus_pos


same_signed:
MOVLW 0x7F
CPFSGT 0x01 ;skip if f>W
goto pos_pos
goto minus_minus





minus_minus:
INCF 0x06  ;quo
MOVF 0x03 ,0 ; load divisor
SUBWF 0x01
BNN finish
goto minus_minus


pos_pos:
INCF 0x06  ;quo
MOVF 0x03 ,0 ; load divisor
SUBWF 0x01

BN end_pos_pos
goto pos_pos


end_pos_pos:
MOVF 0x03 ,0
ADDWF 0x01
DECF 0x06
goto finish


minus_pos:
DECF 0x06 ;
MOVF 0x03,0
ADDWF 0x01
BNN finish
goto minus_pos

pos_minus:
DECF 0x06 ;
MOVF 0x03,0
ADDWF 0x01
BN end_pos_minus
goto pos_minus

end_pos_minus:
MOVF 0x03,0
SUBWF 0x01
INCF 0x06
goto finish



finish:
RETURN