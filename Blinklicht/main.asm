;
; Blinklicht.asm
;
; Created: 29.01.2020 10:49:32
; Author : rene
;


; Replace with your application code
.def aus = r16
.def an = r17
.def aussen = r18
.def innen = r19

init:
	ldi aus, 0
	ldi an, 0xFF

	out PORTB, an
	out DDRB, aus

	out DDRA, an

endlos:
	// Warte 200ms
	in aussen, PINA
	aussen1:
		ldi innen, 0xFF
		innen1:
			dec innen
			brbc SREG_Z, innen1
			dec aussen
			brbc SREG_Z, aussen1

	out PORTB, aus

	// Warte 200ms
	in aussen, PINA
	aussen2:
		ldi innen, 0xFF
		innen2:
			dec innen
			brbc SREG_Z, innen2
			dec aussen
			brbc SREG_Z, aussen2
	out PORTB, an
jmp endlos
