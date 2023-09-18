;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _delay
	.globl _delayMicroseconds
	.globl _Clk_Init
	.globl _LedControl_Init
	.globl _CLK_HSIPrescalerConfig
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)

; default segment ordering for linker
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area CONST
	.area INITIALIZER
	.area CODE

;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ; reset
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	source/main.c: 6: void Clk_Init() {
;	-----------------------------------------
;	 function Clk_Init
;	-----------------------------------------
_Clk_Init:
;	source/main.c: 7: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	push	#0x00
	call	_CLK_HSIPrescalerConfig
	pop	a
;	source/main.c: 8: }
	ret
;	source/main.c: 10: void delayMicroseconds(uint32_t us) {
;	-----------------------------------------
;	 function delayMicroseconds
;	-----------------------------------------
_delayMicroseconds:
	sub	sp, #8
;	source/main.c: 11: while(us--) {
	ldw	y, (0x0d, sp)
	ldw	(0x07, sp), y
	ldw	x, (0x0b, sp)
00101$:
	ldw	(0x01, sp), x
	ld	a, (0x07, sp)
	ld	(0x03, sp), a
	ld	a, (0x08, sp)
	ldw	y, (0x07, sp)
	subw	y, #0x0001
	ldw	(0x07, sp), y
	jrnc	00117$
	decw	x
00117$:
	tnz	a
	jrne	00118$
	ldw	y, (0x02, sp)
	jrne	00118$
	tnz	(0x01, sp)
	jreq	00104$
00118$:
;	source/main.c: 12: nop();
	nop
;	source/main.c: 13: nop();
	nop
;	source/main.c: 14: nop();
	nop
;	source/main.c: 15: nop();
	nop
	jra	00101$
00104$:
;	source/main.c: 17: }
	addw	sp, #8
	ret
;	source/main.c: 19: void delay(uint32_t ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #8
;	source/main.c: 20: while(ms--) {
	ldw	y, (0x0d, sp)
	ldw	(0x07, sp), y
	ldw	x, (0x0b, sp)
00101$:
	ldw	(0x01, sp), x
	ldw	y, (0x07, sp)
	ldw	(0x03, sp), y
	ldw	y, (0x07, sp)
	subw	y, #0x0001
	ldw	(0x07, sp), y
	jrnc	00117$
	decw	x
00117$:
	ldw	y, (0x03, sp)
	jrne	00118$
	ldw	y, (0x01, sp)
	jreq	00104$
00118$:
;	source/main.c: 21: delayMicroseconds(1000);
	pushw	x
	push	#0xe8
	push	#0x03
	push	#0x00
	push	#0x00
	call	_delayMicroseconds
	addw	sp, #4
	popw	x
	jra	00101$
00104$:
;	source/main.c: 23: }
	addw	sp, #8
	ret
;	source/main.c: 25: int main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	source/main.c: 26: Clk_Init();
	call	_Clk_Init
;	source/main.c: 27: LedControl_Init();
	call	_LedControl_Init
;	source/main.c: 28: enableInterrupts();
	rim
;	source/main.c: 30: for(uint8_t indexLed = 0; indexLed < 28; indexLed++) {
	clr	a
00106$:
	cp	a, #0x1c
	jrnc	00103$
;	source/main.c: 31: ledBrightness[indexLed] = 10;
	clrw	x
	ld	xl, a
	addw	x, #(_ledBrightness + 0)
	push	a
	ld	a, #0x0a
	ld	(x), a
	pop	a
;	source/main.c: 30: for(uint8_t indexLed = 0; indexLed < 28; indexLed++) {
	inc	a
	jra	00106$
;	source/main.c: 33: while(1) {
00103$:
	jra	00103$
;	source/main.c: 35: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
	.area CABS (ABS)
