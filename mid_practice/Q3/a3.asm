LIST p=18f4520

    #include<p18f4520.inc>

	CONFIG OSC = INTIO67

	CONFIG WDT = OFF

	org 0x00
LIST_INIT macro addr,n1,n2,n3,n4,n5
    LFSR 0, addr ; FSR0 point to addr
    MOVLW n1
    MOVWF POSTINC0
    MOVLW n2
    MOVWF POSTINC0
    MOVLW n3
    MOVWF POSTINC0
    MOVLW n4
    MOVWF POSTINC0
    MOVLW n5
    MOVWF POSTINC0
    endm

MOVLW 0x2
MOVWF 0x20
LIST_INIT 0x00 , 5, 4,2,7,8

////////////////////////////////1
MOVFF 0x20, 0x21 ; dup k

LFSR 0, 0x01 ;
LFSR 1, 0x10 ;

loop1:
MOVF POSTINC0 ,0
ADDWF INDF1
DECF 0x21
BNZ loop1 

////////////////////////////////2
MOVFF 0x20, 0x21 ; dup k

LFSR 0, 0x02 ;
LFSR 1, 0x11 ;

loop2:
MOVF POSTINC0 ,0

ADDWF INDF1
DECF 0x21
BNZ loop2 
////////////////////////////////3
MOVFF 0x20, 0x21 ; dup k

LFSR 0, 0x03 ;
LFSR 1, 0x10 ;

loop1:
MOVF POSTINC0 ,0
ADDWF INDF1
DECF 0x21
BNZ loop1 
////////////////////////////////4
MOVFF 0x20, 0x21 ; dup k

LFSR 0, 0x01 ;
LFSR 1, 0x10 ;

loop1:
MOVF POSTINC0 ,0
ADDWF INDF1
DECF 0x21
BNZ loop1 
////////////////////////////////5
MOVFF 0x20, 0x21 ; dup k

LFSR 0, 0x01 ;
LFSR 1, 0x10 ;

loop1:
MOVF POSTINC0 ,0
ADDWF INDF1
DECF 0x21
BNZ loop1 





finish: 
nop

end


