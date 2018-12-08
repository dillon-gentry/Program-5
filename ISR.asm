; ISR.asm
; Name: Dillon Gentry
; UTEid: djg2975
; Keyboard ISR runs when a key is struck
; Checks for a valid RNA symbol and places it at x4600
               
;Read i/p char
;(Do NOT call TRAP)
;validate it (A,U,G,C)
;Write it to a global location if valid (x4600)

;R0 holds char typed
	.ORIG x2600
	LDI R0, KBDR
KBDR	.FILL xFE02
	RET
	.END
