                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _delay
                                     13 	.globl _delayMicroseconds
                                     14 	.globl _Clk_Init
                                     15 	.globl _LedControl_Init
                                     16 	.globl _CLK_HSIPrescalerConfig
                                     17 ;--------------------------------------------------------
                                     18 ; ram data
                                     19 ;--------------------------------------------------------
                                     20 	.area DATA
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area INITIALIZED
                                     25 ;--------------------------------------------------------
                                     26 ; Stack segment in internal ram 
                                     27 ;--------------------------------------------------------
                                     28 	.area	SSEG
      FFFFFF                         29 __start__stack:
      FFFFFF                         30 	.ds	1
                                     31 
                                     32 ;--------------------------------------------------------
                                     33 ; absolute external ram data
                                     34 ;--------------------------------------------------------
                                     35 	.area DABS (ABS)
                                     36 
                                     37 ; default segment ordering for linker
                                     38 	.area HOME
                                     39 	.area GSINIT
                                     40 	.area GSFINAL
                                     41 	.area CONST
                                     42 	.area INITIALIZER
                                     43 	.area CODE
                                     44 
                                     45 ;--------------------------------------------------------
                                     46 ; interrupt vector 
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
      008000                         49 __interrupt_vect:
      008000 82 00 80 07             50 	int s_GSINIT ; reset
                                     51 ;--------------------------------------------------------
                                     52 ; global & static initialisations
                                     53 ;--------------------------------------------------------
                                     54 	.area HOME
                                     55 	.area GSINIT
                                     56 	.area GSFINAL
                                     57 	.area GSINIT
      008007                         58 __sdcc_gs_init_startup:
      008007                         59 __sdcc_init_data:
                                     60 ; stm8_genXINIT() start
      008007 AE 00 1C         [ 2]   61 	ldw x, #l_DATA
      00800A 27 07            [ 1]   62 	jreq	00002$
      00800C                         63 00001$:
      00800C 72 4F 00 00      [ 1]   64 	clr (s_DATA - 1, x)
      008010 5A               [ 2]   65 	decw x
      008011 26 F9            [ 1]   66 	jrne	00001$
      008013                         67 00002$:
      008013 AE 00 01         [ 2]   68 	ldw	x, #l_INITIALIZER
      008016 27 09            [ 1]   69 	jreq	00004$
      008018                         70 00003$:
      008018 D6 80 2F         [ 1]   71 	ld	a, (s_INITIALIZER - 1, x)
      00801B D7 00 1C         [ 1]   72 	ld	(s_INITIALIZED - 1, x), a
      00801E 5A               [ 2]   73 	decw	x
      00801F 26 F7            [ 1]   74 	jrne	00003$
      008021                         75 00004$:
                                     76 ; stm8_genXINIT() end
                                     77 	.area GSFINAL
      008021 CC 80 04         [ 2]   78 	jp	__sdcc_program_startup
                                     79 ;--------------------------------------------------------
                                     80 ; Home
                                     81 ;--------------------------------------------------------
                                     82 	.area HOME
                                     83 	.area HOME
      008004                         84 __sdcc_program_startup:
      008004 CC 85 A0         [ 2]   85 	jp	_main
                                     86 ;	return from main will return to caller
                                     87 ;--------------------------------------------------------
                                     88 ; code
                                     89 ;--------------------------------------------------------
                                     90 	.area CODE
                                     91 ;	source/main.c: 6: void Clk_Init() {
                                     92 ;	-----------------------------------------
                                     93 ;	 function Clk_Init
                                     94 ;	-----------------------------------------
      008535                         95 _Clk_Init:
                                     96 ;	source/main.c: 7: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
      008535 4B 00            [ 1]   97 	push	#0x00
      008537 CD 81 DF         [ 4]   98 	call	_CLK_HSIPrescalerConfig
      00853A 84               [ 1]   99 	pop	a
                                    100 ;	source/main.c: 8: }
      00853B 81               [ 4]  101 	ret
                                    102 ;	source/main.c: 10: void delayMicroseconds(uint32_t us) {
                                    103 ;	-----------------------------------------
                                    104 ;	 function delayMicroseconds
                                    105 ;	-----------------------------------------
      00853C                        106 _delayMicroseconds:
      00853C 52 08            [ 2]  107 	sub	sp, #8
                                    108 ;	source/main.c: 11: while(us--) {
      00853E 16 0D            [ 2]  109 	ldw	y, (0x0d, sp)
      008540 17 07            [ 2]  110 	ldw	(0x07, sp), y
      008542 1E 0B            [ 2]  111 	ldw	x, (0x0b, sp)
      008544                        112 00101$:
      008544 1F 01            [ 2]  113 	ldw	(0x01, sp), x
      008546 7B 07            [ 1]  114 	ld	a, (0x07, sp)
      008548 6B 03            [ 1]  115 	ld	(0x03, sp), a
      00854A 7B 08            [ 1]  116 	ld	a, (0x08, sp)
      00854C 16 07            [ 2]  117 	ldw	y, (0x07, sp)
      00854E 72 A2 00 01      [ 2]  118 	subw	y, #0x0001
      008552 17 07            [ 2]  119 	ldw	(0x07, sp), y
      008554 24 01            [ 1]  120 	jrnc	00117$
      008556 5A               [ 2]  121 	decw	x
      008557                        122 00117$:
      008557 4D               [ 1]  123 	tnz	a
      008558 26 08            [ 1]  124 	jrne	00118$
      00855A 16 02            [ 2]  125 	ldw	y, (0x02, sp)
      00855C 26 04            [ 1]  126 	jrne	00118$
      00855E 0D 01            [ 1]  127 	tnz	(0x01, sp)
      008560 27 06            [ 1]  128 	jreq	00104$
      008562                        129 00118$:
                                    130 ;	source/main.c: 12: nop();
      008562 9D               [ 1]  131 	nop
                                    132 ;	source/main.c: 13: nop();
      008563 9D               [ 1]  133 	nop
                                    134 ;	source/main.c: 14: nop();
      008564 9D               [ 1]  135 	nop
                                    136 ;	source/main.c: 15: nop();
      008565 9D               [ 1]  137 	nop
      008566 20 DC            [ 2]  138 	jra	00101$
      008568                        139 00104$:
                                    140 ;	source/main.c: 17: }
      008568 5B 08            [ 2]  141 	addw	sp, #8
      00856A 81               [ 4]  142 	ret
                                    143 ;	source/main.c: 19: void delay(uint32_t ms) {
                                    144 ;	-----------------------------------------
                                    145 ;	 function delay
                                    146 ;	-----------------------------------------
      00856B                        147 _delay:
      00856B 52 08            [ 2]  148 	sub	sp, #8
                                    149 ;	source/main.c: 20: while(ms--) {
      00856D 16 0D            [ 2]  150 	ldw	y, (0x0d, sp)
      00856F 17 07            [ 2]  151 	ldw	(0x07, sp), y
      008571 1E 0B            [ 2]  152 	ldw	x, (0x0b, sp)
      008573                        153 00101$:
      008573 1F 01            [ 2]  154 	ldw	(0x01, sp), x
      008575 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008577 17 03            [ 2]  156 	ldw	(0x03, sp), y
      008579 16 07            [ 2]  157 	ldw	y, (0x07, sp)
      00857B 72 A2 00 01      [ 2]  158 	subw	y, #0x0001
      00857F 17 07            [ 2]  159 	ldw	(0x07, sp), y
      008581 24 01            [ 1]  160 	jrnc	00117$
      008583 5A               [ 2]  161 	decw	x
      008584                        162 00117$:
      008584 16 03            [ 2]  163 	ldw	y, (0x03, sp)
      008586 26 04            [ 1]  164 	jrne	00118$
      008588 16 01            [ 2]  165 	ldw	y, (0x01, sp)
      00858A 27 11            [ 1]  166 	jreq	00104$
      00858C                        167 00118$:
                                    168 ;	source/main.c: 21: delayMicroseconds(1000);
      00858C 89               [ 2]  169 	pushw	x
      00858D 4B E8            [ 1]  170 	push	#0xe8
      00858F 4B 03            [ 1]  171 	push	#0x03
      008591 4B 00            [ 1]  172 	push	#0x00
      008593 4B 00            [ 1]  173 	push	#0x00
      008595 CD 85 3C         [ 4]  174 	call	_delayMicroseconds
      008598 5B 04            [ 2]  175 	addw	sp, #4
      00859A 85               [ 2]  176 	popw	x
      00859B 20 D6            [ 2]  177 	jra	00101$
      00859D                        178 00104$:
                                    179 ;	source/main.c: 23: }
      00859D 5B 08            [ 2]  180 	addw	sp, #8
      00859F 81               [ 4]  181 	ret
                                    182 ;	source/main.c: 25: int main() {
                                    183 ;	-----------------------------------------
                                    184 ;	 function main
                                    185 ;	-----------------------------------------
      0085A0                        186 _main:
                                    187 ;	source/main.c: 26: Clk_Init();
      0085A0 CD 85 35         [ 4]  188 	call	_Clk_Init
                                    189 ;	source/main.c: 27: LedControl_Init();
      0085A3 CD 89 AC         [ 4]  190 	call	_LedControl_Init
                                    191 ;	source/main.c: 28: enableInterrupts();
      0085A6 9A               [ 1]  192 	rim
                                    193 ;	source/main.c: 30: for(uint8_t indexLed = 0; indexLed < 28; indexLed++) {
      0085A7 4F               [ 1]  194 	clr	a
      0085A8                        195 00106$:
      0085A8 A1 1C            [ 1]  196 	cp	a, #0x1c
      0085AA 24 0D            [ 1]  197 	jrnc	00103$
                                    198 ;	source/main.c: 31: ledBrightness[indexLed] = 10;
      0085AC 5F               [ 1]  199 	clrw	x
      0085AD 97               [ 1]  200 	ld	xl, a
      0085AE 1C 00 01         [ 2]  201 	addw	x, #(_ledBrightness + 0)
      0085B1 88               [ 1]  202 	push	a
      0085B2 A6 0A            [ 1]  203 	ld	a, #0x0a
      0085B4 F7               [ 1]  204 	ld	(x), a
      0085B5 84               [ 1]  205 	pop	a
                                    206 ;	source/main.c: 30: for(uint8_t indexLed = 0; indexLed < 28; indexLed++) {
      0085B6 4C               [ 1]  207 	inc	a
      0085B7 20 EF            [ 2]  208 	jra	00106$
                                    209 ;	source/main.c: 33: while(1) {
      0085B9                        210 00103$:
      0085B9 20 FE            [ 2]  211 	jra	00103$
                                    212 ;	source/main.c: 35: }
      0085BB 81               [ 4]  213 	ret
                                    214 	.area CODE
                                    215 	.area CONST
                                    216 	.area INITIALIZER
                                    217 	.area CABS (ABS)
