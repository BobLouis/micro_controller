#include "xc.inc"

GLOBAL _isprime

PSECT mytext, local, class=CODE, reloc=2

_isprime:
    MOVFF 0x01, 0x11
    MOVLW 0x02
    MOVWF 0x02
    MOVLW 0x02
    CPFSEQ 0x01 ;skip if n == 2
    goto loop
    goto True

loop:
MOVFF 0x01, 0x11
goto RECUR
RET:
MOVLW 0x0
CPFSEQ 0x11 ;skip if ==0
goto iter
goto False
iter:
INCF 0x02 ;
MOVF 0x01 ,0
CPFSEQ 0x02
goto loop
goto True



RECUR:
    MOVF 0x02, 0
    SUBWF 0x11
    MOVF 0x11,0
    CPFSGT 0x02; skip if 0x02>0x11
    goto RECUR
    goto RET


    
True:
MOVLW 0x01 ;
MOVWF 0x01;
goto finish
False:

MOVLW 0xFF ;
MOVWF 0x01 ;


finish:
nop
RETURN
