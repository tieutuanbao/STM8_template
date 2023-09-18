;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module led_control
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _TIM4_ClearFlag
	.globl _TIM4_ITConfig
	.globl _TIM4_Cmd
	.globl _TIM4_TimeBaseInit
	.globl _GPIO_Init
	.globl _ledBrightness
	.globl _LedControl_Init
	.globl _LedControl_GetLedBuffer
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_ledBrightness::
	.ds 28
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_timeCount:
	.ds 1
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	source/led_control/led_control.c: 27: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) {
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
;	source/led_control/led_control.c: 38: TIM4->SR1 = (uint8_t)(~TIM4_IT_UPDATE);
	mov	0x5344+0, #0xfe
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, _ledBrightness+24
	ld	xl, a
	ld	a, 0x500a
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00102$
	or	a, #0x40
	ld	0x500a, a
	jra	00103$
00102$:
	and	a, #0xbf
	ld	0x500a, a
00103$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+25
	ld	xl, a
	ld	a, 0x500a
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00105$
	or	a, #0x40
	ld	0x500a, a
	jra	00106$
00105$:
	and	a, #0xbf
	ld	0x500a, a
00106$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+26
	ld	xl, a
	ld	a, 0x500a
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00108$
	or	a, #0x40
	ld	0x500a, a
	jra	00109$
00108$:
	and	a, #0xbf
	ld	0x500a, a
00109$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+27
	ld	xl, a
	ld	a, 0x500a
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00111$
	or	a, #0x40
	ld	0x500a, a
	jra	00112$
00111$:
	and	a, #0xbf
	ld	0x500a, a
00112$:
	bset	20495, #2
	bres	20495, #2
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	ld	a, _ledBrightness+16
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00114$
	or	a, #0x40
	ld	0x500a, a
	jra	00115$
00114$:
	and	a, #0xbf
	ld	0x500a, a
00115$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+17
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00117$
	or	a, #0x40
	ld	0x500a, a
	jra	00118$
00117$:
	and	a, #0xbf
	ld	0x500a, a
00118$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+18
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00120$
	or	a, #0x40
	ld	0x500a, a
	jra	00121$
00120$:
	and	a, #0xbf
	ld	0x500a, a
00121$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+19
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00123$
	or	a, #0x40
	ld	0x500a, a
	jra	00124$
00123$:
	and	a, #0xbf
	ld	0x500a, a
00124$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+20
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00126$
	or	a, #0x40
	ld	0x500a, a
	jra	00127$
00126$:
	and	a, #0xbf
	ld	0x500a, a
00127$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+21
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00129$
	or	a, #0x40
	ld	0x500a, a
	jra	00130$
00129$:
	and	a, #0xbf
	ld	0x500a, a
00130$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+22
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00132$
	or	a, #0x40
	ld	0x500a, a
	jra	00133$
00132$:
	and	a, #0xbf
	ld	0x500a, a
00133$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+23
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00135$
	or	a, #0x40
	ld	0x500a, a
	jra	00136$
00135$:
	and	a, #0xbf
	ld	0x500a, a
00136$:
	bset	20495, #2
	bres	20495, #2
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	ld	a, _ledBrightness+8
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00138$
	or	a, #0x40
	ld	0x500a, a
	jra	00139$
00138$:
	and	a, #0xbf
	ld	0x500a, a
00139$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+9
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00141$
	or	a, #0x40
	ld	0x500a, a
	jra	00142$
00141$:
	and	a, #0xbf
	ld	0x500a, a
00142$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+10
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00144$
	or	a, #0x40
	ld	0x500a, a
	jra	00145$
00144$:
	and	a, #0xbf
	ld	0x500a, a
00145$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+11
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00147$
	or	a, #0x40
	ld	0x500a, a
	jra	00148$
00147$:
	and	a, #0xbf
	ld	0x500a, a
00148$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+12
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00150$
	or	a, #0x40
	ld	0x500a, a
	jra	00151$
00150$:
	and	a, #0xbf
	ld	0x500a, a
00151$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+13
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00153$
	or	a, #0x40
	ld	0x500a, a
	jra	00154$
00153$:
	and	a, #0xbf
	ld	0x500a, a
00154$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+14
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00156$
	or	a, #0x40
	ld	0x500a, a
	jra	00157$
00156$:
	and	a, #0xbf
	ld	0x500a, a
00157$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+15
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00159$
	or	a, #0x40
	ld	0x500a, a
	jra	00160$
00159$:
	and	a, #0xbf
	ld	0x500a, a
00160$:
	bset	20495, #2
	bres	20495, #2
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	ld	a, _ledBrightness+0
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00162$
	or	a, #0x40
	ld	0x500a, a
	jra	00163$
00162$:
	and	a, #0xbf
	ld	0x500a, a
00163$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+1
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00165$
	or	a, #0x40
	ld	0x500a, a
	jra	00166$
00165$:
	and	a, #0xbf
	ld	0x500a, a
00166$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+2
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00168$
	or	a, #0x40
	ld	0x500a, a
	jra	00169$
00168$:
	and	a, #0xbf
	ld	0x500a, a
00169$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+3
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00171$
	or	a, #0x40
	ld	0x500a, a
	jra	00172$
00171$:
	and	a, #0xbf
	ld	0x500a, a
00172$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+4
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00174$
	or	a, #0x40
	ld	0x500a, a
	jra	00175$
00174$:
	and	a, #0xbf
	ld	0x500a, a
00175$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+5
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00177$
	or	a, #0x40
	ld	0x500a, a
	jra	00178$
00177$:
	and	a, #0xbf
	ld	0x500a, a
00178$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+6
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00180$
	or	a, #0x40
	ld	0x500a, a
	jra	00181$
00180$:
	and	a, #0xbf
	ld	0x500a, a
00181$:
	bset	20495, #2
	bres	20495, #2
	ld	a, _ledBrightness+7
	ld	xl, a
;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
	ld	a, 0x500a
;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
	push	a
	ld	a, xl
	cp	a, _timeCount+0
	pop	a
	jrule	00183$
	or	a, #0x40
	ld	0x500a, a
	jra	00184$
00183$:
	and	a, #0xbf
	ld	0x500a, a
00184$:
	bset	20495, #2
	bres	20495, #2
;	source/led_control/led_control.c: 45: timeCount++;
	inc	_timeCount+0
;	source/led_control/led_control.c: 46: if(timeCount >= LED_BRIGHTNESS_RES) {
	ld	a, _timeCount+0
	cp	a, #0x32
	jrc	00186$
;	source/led_control/led_control.c: 47: timeCount = 0;
	clr	_timeCount+0
00186$:
;	source/led_control/led_control.c: 49: IO_HC595_LAT_SET_LOW;
	bres	20490, #7
;	source/led_control/led_control.c: 50: IO_HC595_LAT_SET_HIGH;
	bset	20490, #7
;	source/led_control/led_control.c: 51: }
	iret
;	source/led_control/led_control.c: 53: void LedControl_Init(void) {
;	-----------------------------------------
;	 function LedControl_Init
;	-----------------------------------------
_LedControl_Init:
;	source/led_control/led_control.c: 54: GPIO_Init(IO_HC595_OE_PORT, IO_HC595_OE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x08
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	source/led_control/led_control.c: 55: GPIO_Init(IO_HC595_CLK_PORT, IO_HC595_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x04
	push	#0x0f
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	source/led_control/led_control.c: 56: GPIO_Init(IO_HC595_LAT_PORT, IO_HC595_LAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x80
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	source/led_control/led_control.c: 57: GPIO_Init(IO_HC595_DAT_PORT, IO_HC595_DAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	push	#0xf0
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_GPIO_Init
	addw	sp, #4
;	source/led_control/led_control.c: 58: IO_HC595_OE_SET_LOW;
	bres	20495, #3
;	source/led_control/led_control.c: 60: TIM4_TimeBaseInit(TIM4_PRESCALER_16, 124);
	push	#0x7c
	push	#0x04
	call	_TIM4_TimeBaseInit
	addw	sp, #2
;	source/led_control/led_control.c: 62: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	push	#0x01
	call	_TIM4_ClearFlag
	pop	a
;	source/led_control/led_control.c: 64: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	push	#0x01
	push	#0x01
	call	_TIM4_ITConfig
	addw	sp, #2
;	source/led_control/led_control.c: 66: TIM4_Cmd(ENABLE);
	push	#0x01
	call	_TIM4_Cmd
	pop	a
;	source/led_control/led_control.c: 67: }
	ret
;	source/led_control/led_control.c: 69: uint8_t *LedControl_GetLedBuffer(void) {
;	-----------------------------------------
;	 function LedControl_GetLedBuffer
;	-----------------------------------------
_LedControl_GetLedBuffer:
;	source/led_control/led_control.c: 70: return ledBrightness;
	ldw	x, #(_ledBrightness + 0)
;	source/led_control/led_control.c: 71: }
	ret
	.area CODE
	.area CONST
	.area INITIALIZER
__xinit__timeCount:
	.db #0x00	; 0
	.area CABS (ABS)
