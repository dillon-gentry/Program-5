; Main.asm
; Name: Dillon Gentry
; UTEid: djg2975
; Continuously reads from x4600 making sure its not reading duplicate
; symbols. Processes the symbol based on the program description
; of mRNA processing.

;1st incr: Write and test Main.asm with setup steps and ISR.asm is empty (Good)
;Test: Set bkpt in ISR
;2nd incr: Write validation steps in ISR.asm and put validated char in x4600
;Test: Strike a key and watch x4600 to see if it shows char typed
;3rd incr: In Main.asm you have continous loop, but modify it to where mem[x4600] holds 0 before entering loop
; and get the contents of x4600 before going into the loop
;loop	LDI R0, Buffer
;	BRz loop
;	TRAP x21
;	AND R1,R1,0
;	STI R1, Buffer
;	;Process R0
;	;FSM code goes here
;Buffer .FILL x4600
;4th incr: Check for Start Codon 
;When you see AUG print a pipe to the console
;5th incr: Skip until Stop Codon
;When you see UAA,UAG,UGA halt machine
;Code for possibilities that lead to a solution rather than all possibilities


;Notes:
;Reading character from a buffer (global variable)
;Setup (3 step)
;Write 0 to x4600
;Read i/p from x4600 (Loop if 0)
;New char
;Write 0 to x4600
;Processing (FSM from doc)

               .ORIG x4000
; initialize the stack pointer
	LD R6, Stack


; enable keyboard interrupts
	LD R0, KBIEN
	STI R0, KBSR

; set up the keyboard interrupt vector table entry
	LD R0, ISR
	STI R0, KBIVE
loop	BRnzp loop


; start of actual program



	TRAP x25

Stack	.FILL x4000
ISR	.FILL x2600
KBIVE	.FILL x0180
KBSR	.FILL xFE00
KBIEN	.FILL x4000
		.END
