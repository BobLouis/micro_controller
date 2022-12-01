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
    BTG LATA, 0
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process2

check_process2:
   BTFSC PORTB, 0
   BRA check_process2
   BRA lightup2

lightup2:
    BTG LATA, 1
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process3

check_process3:
   BTFSC PORTB, 0
   BRA check_process3
   BRA lightup3

lightup3:
    BTG LATA, 2
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process4

check_process4:
   BTFSC PORTB, 0
   BRA check_process4
   BRA lightup4

lightup4:
    BTG LATA, 3
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process5

check_process5:
   BTFSC PORTB, 0
   BRA check_process5
   BRA lightoff
   
lightoff:
    CLRF LATA
    DELAY d'200', d'180' ;delay 0.25s
    BRA check_process1
end


