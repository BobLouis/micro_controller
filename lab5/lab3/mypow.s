#include "xc.inc"
    GLOBAL _mypow

    PSECT mytext, local, class=CODE, reloc=2

    _mypow:

	MOVLW 0x01  ;initial value
	MOVWF 0x05  ;answer
	MOVLW 0x00  ;load 0 to wreg
	CPFSEQ 0x03 ;if power = 0 => finish
	GOTO iter
	GOTO finish


    iter:
	MOVF 0x01, 0   ;load base
	MULWF 0x05     ;mul LOW
	MOVFF PRODL, 0x05;load result 
    MOVFF PRODH, 0x06; carry tmp

    MOVF 0x01, 0     ;load base
	MULWF 0x04       ;MUL HI
	MOVFF PRODL, 0x04;load result 

    MOVF 0x06, 0; load tmp 
    ADDWF 0x04  ;add to hi
	DECFSZ 0x03    ;decrease one and check if eq 0 
	GOTO iter
	GOTO finish

    finish:
	MOVFF 0x05, 0x02
	MOVFF 0x04, 0x01

	RETURN