LIST p=18f4520
    #include<p18f4520.inc>
	CONFIG OSC = INTIO67 ; 1 MHZ
	CONFIG WDT = OFF
	CONFIG LVP = OFF
	L1	EQU 0x14
	L2	EQU 0x15
	org 0x00

; Total 2 + (2 + 7 * nu	m1 + 2) * num2 cycles = C
; num1 = 200, num2 = 180, C = 252360
; Total delay ~= C/1M = 0.25s
DELAY macro num1, num2
    local LOOP1
    local LOOP2
    MOVLW num2
    MOVWF L2
    LOOP2:
	MOVLW num1
	MOVWF L1
    LOOP1:
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	DECFSZ L1, 1
	BRA LOOP1
	DECFSZ L2, 1
	BRA LOOP2
endm

A_lit macro 
    BSF LATA,0 
    BSF LATA,1 
    BCF LATA,2 
    BCF LATA,3 
endm

B_lit macro 
    BCF LATA,0 
    BSF LATA,1 
    BSF LATA,2 
    BCF LATA,3 
endm
C_lit macro 
    BCF LATA,0 
    BCF LATA,1 
    BSF LATA,2 
    BSF LATA,3 
endm
D_lit macro 
    BSF LATA,0 
    BCF LATA,1 
    BCF LATA,2 
    BSF LATA,3 
endm
E_lit macro 
    BCF LATA,0 
    BCF LATA,1 
    BCF LATA,2 
    BCF LATA,3 
endm

start:
int:
; let pin can receive digital signal
MOVLW 0x0f
MOVWF ADCON1
CLRF PORTB
BSF TRISB, 0 ; init 3.3v
BCF TRISA, 0
BCF TRISA, 1
BCF TRISA, 2
BCF TRISA, 3
    
    
Rst:
CLRF LATA    ; clear 0


; ckeck button
check_process1:
   BTFSC PORTB, 0
   BRA check_process1
   BRA lightup1

lightup1:
    A_lit
    DELAY d'200', d'180' ;delay 0.25s
    B_lit
    DELAY d'200', d'180' ;delay 0.25s
    C_lit
    DELAY d'200', d'180' ;delay 0.25s
    D_lit
    DELAY d'200', d'180' ;delay 0.25s
    E_lit
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process2

check_process2:
   BTFSC PORTB, 0
   BRA check_process2
   BRA lightup2

lightup2:
    B_lit
    DELAY d'200', d'180' ;delay 0.25s
    C_lit
    DELAY d'200', d'180' ;delay 0.25s
    D_lit
    DELAY d'200', d'180' ;delay 0.25s
    A_lit
    DELAY d'200', d'180' ;delay 0.25s
    E_lit
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process3

check_process3:
   BTFSC PORTB, 0
   BRA check_process3
   BRA lightup3

lightup3:
    C_lit
    DELAY d'200', d'180' ;delay 0.25s
    D_lit
    DELAY d'200', d'180' ;delay 0.25s
    A_lit
    DELAY d'200', d'180' ;delay 0.25s
    B_lit
    DELAY d'200', d'180' ;delay 0.25s
    E_lit
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process4

check_process4:
   BTFSC PORTB, 0
   BRA check_process4
   BRA lightup4

lightup4:
    D_lit
    DELAY d'200', d'180' ;delay 0.25s
    A_lit
    DELAY d'200', d'180' ;delay 0.25s
    B_lit
    DELAY d'200', d'180' ;delay 0.25s
    C_lit
    DELAY d'200', d'180' ;delay 0.25s
    E_lit
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process5

check_process5:
   BTFSC PORTB, 0
   BRA check_process5
   BRA check_process1
   

end


