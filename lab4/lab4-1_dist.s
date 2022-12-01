LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00





DIST macro x1,y1,x2,y2,F1,F2
    MOVLW x1 ;load
    MOVWF 0x02 ;load x1 to 0x02
    MOVLW x2 ;load
    MOVWF 0x03 ;load x2 to 0x03
    MOVLW y1 ;load
    MOVWF 0x04 ;load y1 to 0x04
    MOVLW y2 ;load
    MOVWF 0x05 ;load y2 to 0x05

    ;sub
    MOVF 0x03, 0 ;load x1 to wreg
    SUBWF 0x02   ;x2-x1 store back to 0x03
    MOVF 0x05, 0 ;load y1 to wreg
    SUBWF 0x04   ;y2-y1 store back to 0x05
    
    ;square
    MOVF 0x02, 0 ;load sub result to wreg
    MULWF 0x02   ;(x2-x1)^2 store back to 0x03
    MOVFF PRODL , 0x07
    MOVFF PRODH , 0x06
    
    MOVF 0x04, 0 ;load sub result to wreg
    MULWF 0x04   ;(x2-x1)^2 store back to 0x03
    MOVFF PRODL , 0x09
    MOVFF PRODH , 0x08
    MOVF 0x09 , 0 ;load 0x09
    ADDWF 0x07 ;
    MOVF 0x08 ,0
    ADDWFC 0x06;
    MOVFF 0x07, 0x01
    MOVFF 0x06, 0x00
    
    ;your macro code
    endm

DIST 0x05, 0x07, 0x02, 0x03, 0x00, 0x01

;MOVLW 0x05 ;load
;MOVWF 0x02 ;load x1 to 0x02
;MOVLW 0x02 ;load
;MOVWF 0x03 ;load x2 to 0x03
;MOVLW 0x07 ;load
;MOVWF 0x04 ;load y1 to 0x04
;MOVLW 0x03 ;load
;MOVWF 0x05 ;load y2 to 0x05
;;sub
;MOVF 0x03, 0 ;load x1 to wreg
;SUBWF 0x02   ;x2-x1 store back to 0x03
;MOVF 0x05, 0 ;load y1 to wreg
;SUBWF 0x04   ;y2-y1 store back to 0x05
;
;;square
;MOVF 0x02, 0 ;load sub result to wreg
;MULWF 0x02   ;(x2-x1)^2 store back to 0x03
;MOVFF PRODL , 0x07
;MOVFF PRODH , 0x06
;	
;MOVF 0x04, 0 ;load sub result to wreg
;MULWF 0x04   ;(x2-x1)^2 store back to 0x03
;MOVFF PRODL , 0x09
;MOVFF PRODH , 0x08
;MOVF 0x09 , 0 ;load 0x09
;ADDWF 0x07 ;
;MOVF 0x08 ,0
;ADDWFC 0x06;
;MOVFF 0x07, 0x01
;MOVFF 0x06, 0x00
nop
end