                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module led_control
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_UPD_OVF_IRQHandler
                                     12 	.globl _TIM4_ClearFlag
                                     13 	.globl _TIM4_ITConfig
                                     14 	.globl _TIM4_Cmd
                                     15 	.globl _TIM4_TimeBaseInit
                                     16 	.globl _GPIO_Init
                                     17 	.globl _ledBrightness
                                     18 	.globl _LedControl_Init
                                     19 	.globl _LedControl_GetLedBuffer
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area DATA
      000001                         24 _ledBrightness::
      000001                         25 	.ds 28
                                     26 ;--------------------------------------------------------
                                     27 ; ram data
                                     28 ;--------------------------------------------------------
                                     29 	.area INITIALIZED
      00001D                         30 _timeCount:
      00001D                         31 	.ds 1
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
                                     46 ; global & static initialisations
                                     47 ;--------------------------------------------------------
                                     48 	.area HOME
                                     49 	.area GSINIT
                                     50 	.area GSFINAL
                                     51 	.area GSINIT
                                     52 ;--------------------------------------------------------
                                     53 ; Home
                                     54 ;--------------------------------------------------------
                                     55 	.area HOME
                                     56 	.area HOME
                                     57 ;--------------------------------------------------------
                                     58 ; code
                                     59 ;--------------------------------------------------------
                                     60 	.area CODE
                                     61 ;	source/led_control/led_control.c: 27: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23) {
                                     62 ;	-----------------------------------------
                                     63 ;	 function TIM4_UPD_OVF_IRQHandler
                                     64 ;	-----------------------------------------
      0085BC                         65 _TIM4_UPD_OVF_IRQHandler:
                                     66 ;	source/led_control/led_control.c: 38: TIM4->SR1 = (uint8_t)(~TIM4_IT_UPDATE);
      0085BC 35 FE 53 44      [ 1]   67 	mov	0x5344+0, #0xfe
                                     68 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0085C0 C6 00 19         [ 1]   69 	ld	a, _ledBrightness+24
      0085C3 97               [ 1]   70 	ld	xl, a
      0085C4 C6 50 0A         [ 1]   71 	ld	a, 0x500a
      0085C7 88               [ 1]   72 	push	a
      0085C8 9F               [ 1]   73 	ld	a, xl
      0085C9 C1 00 1D         [ 1]   74 	cp	a, _timeCount+0
      0085CC 84               [ 1]   75 	pop	a
      0085CD 23 07            [ 2]   76 	jrule	00102$
      0085CF AA 40            [ 1]   77 	or	a, #0x40
      0085D1 C7 50 0A         [ 1]   78 	ld	0x500a, a
      0085D4 20 05            [ 2]   79 	jra	00103$
      0085D6                         80 00102$:
      0085D6 A4 BF            [ 1]   81 	and	a, #0xbf
      0085D8 C7 50 0A         [ 1]   82 	ld	0x500a, a
      0085DB                         83 00103$:
      0085DB 72 14 50 0F      [ 1]   84 	bset	20495, #2
      0085DF 72 15 50 0F      [ 1]   85 	bres	20495, #2
      0085E3 C6 00 1A         [ 1]   86 	ld	a, _ledBrightness+25
      0085E6 97               [ 1]   87 	ld	xl, a
      0085E7 C6 50 0A         [ 1]   88 	ld	a, 0x500a
      0085EA 88               [ 1]   89 	push	a
      0085EB 9F               [ 1]   90 	ld	a, xl
      0085EC C1 00 1D         [ 1]   91 	cp	a, _timeCount+0
      0085EF 84               [ 1]   92 	pop	a
      0085F0 23 07            [ 2]   93 	jrule	00105$
      0085F2 AA 40            [ 1]   94 	or	a, #0x40
      0085F4 C7 50 0A         [ 1]   95 	ld	0x500a, a
      0085F7 20 05            [ 2]   96 	jra	00106$
      0085F9                         97 00105$:
      0085F9 A4 BF            [ 1]   98 	and	a, #0xbf
      0085FB C7 50 0A         [ 1]   99 	ld	0x500a, a
      0085FE                        100 00106$:
      0085FE 72 14 50 0F      [ 1]  101 	bset	20495, #2
      008602 72 15 50 0F      [ 1]  102 	bres	20495, #2
      008606 C6 00 1B         [ 1]  103 	ld	a, _ledBrightness+26
      008609 97               [ 1]  104 	ld	xl, a
      00860A C6 50 0A         [ 1]  105 	ld	a, 0x500a
      00860D 88               [ 1]  106 	push	a
      00860E 9F               [ 1]  107 	ld	a, xl
      00860F C1 00 1D         [ 1]  108 	cp	a, _timeCount+0
      008612 84               [ 1]  109 	pop	a
      008613 23 07            [ 2]  110 	jrule	00108$
      008615 AA 40            [ 1]  111 	or	a, #0x40
      008617 C7 50 0A         [ 1]  112 	ld	0x500a, a
      00861A 20 05            [ 2]  113 	jra	00109$
      00861C                        114 00108$:
      00861C A4 BF            [ 1]  115 	and	a, #0xbf
      00861E C7 50 0A         [ 1]  116 	ld	0x500a, a
      008621                        117 00109$:
      008621 72 14 50 0F      [ 1]  118 	bset	20495, #2
      008625 72 15 50 0F      [ 1]  119 	bres	20495, #2
      008629 C6 00 1C         [ 1]  120 	ld	a, _ledBrightness+27
      00862C 97               [ 1]  121 	ld	xl, a
      00862D C6 50 0A         [ 1]  122 	ld	a, 0x500a
      008630 88               [ 1]  123 	push	a
      008631 9F               [ 1]  124 	ld	a, xl
      008632 C1 00 1D         [ 1]  125 	cp	a, _timeCount+0
      008635 84               [ 1]  126 	pop	a
      008636 23 07            [ 2]  127 	jrule	00111$
      008638 AA 40            [ 1]  128 	or	a, #0x40
      00863A C7 50 0A         [ 1]  129 	ld	0x500a, a
      00863D 20 05            [ 2]  130 	jra	00112$
      00863F                        131 00111$:
      00863F A4 BF            [ 1]  132 	and	a, #0xbf
      008641 C7 50 0A         [ 1]  133 	ld	0x500a, a
      008644                        134 00112$:
      008644 72 14 50 0F      [ 1]  135 	bset	20495, #2
      008648 72 15 50 0F      [ 1]  136 	bres	20495, #2
                                    137 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      00864C C6 00 11         [ 1]  138 	ld	a, _ledBrightness+16
      00864F 97               [ 1]  139 	ld	xl, a
                                    140 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008650 C6 50 0A         [ 1]  141 	ld	a, 0x500a
                                    142 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      008653 88               [ 1]  143 	push	a
      008654 9F               [ 1]  144 	ld	a, xl
      008655 C1 00 1D         [ 1]  145 	cp	a, _timeCount+0
      008658 84               [ 1]  146 	pop	a
      008659 23 07            [ 2]  147 	jrule	00114$
      00865B AA 40            [ 1]  148 	or	a, #0x40
      00865D C7 50 0A         [ 1]  149 	ld	0x500a, a
      008660 20 05            [ 2]  150 	jra	00115$
      008662                        151 00114$:
      008662 A4 BF            [ 1]  152 	and	a, #0xbf
      008664 C7 50 0A         [ 1]  153 	ld	0x500a, a
      008667                        154 00115$:
      008667 72 14 50 0F      [ 1]  155 	bset	20495, #2
      00866B 72 15 50 0F      [ 1]  156 	bres	20495, #2
      00866F C6 00 12         [ 1]  157 	ld	a, _ledBrightness+17
      008672 97               [ 1]  158 	ld	xl, a
                                    159 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008673 C6 50 0A         [ 1]  160 	ld	a, 0x500a
                                    161 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      008676 88               [ 1]  162 	push	a
      008677 9F               [ 1]  163 	ld	a, xl
      008678 C1 00 1D         [ 1]  164 	cp	a, _timeCount+0
      00867B 84               [ 1]  165 	pop	a
      00867C 23 07            [ 2]  166 	jrule	00117$
      00867E AA 40            [ 1]  167 	or	a, #0x40
      008680 C7 50 0A         [ 1]  168 	ld	0x500a, a
      008683 20 05            [ 2]  169 	jra	00118$
      008685                        170 00117$:
      008685 A4 BF            [ 1]  171 	and	a, #0xbf
      008687 C7 50 0A         [ 1]  172 	ld	0x500a, a
      00868A                        173 00118$:
      00868A 72 14 50 0F      [ 1]  174 	bset	20495, #2
      00868E 72 15 50 0F      [ 1]  175 	bres	20495, #2
      008692 C6 00 13         [ 1]  176 	ld	a, _ledBrightness+18
      008695 97               [ 1]  177 	ld	xl, a
                                    178 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008696 C6 50 0A         [ 1]  179 	ld	a, 0x500a
                                    180 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      008699 88               [ 1]  181 	push	a
      00869A 9F               [ 1]  182 	ld	a, xl
      00869B C1 00 1D         [ 1]  183 	cp	a, _timeCount+0
      00869E 84               [ 1]  184 	pop	a
      00869F 23 07            [ 2]  185 	jrule	00120$
      0086A1 AA 40            [ 1]  186 	or	a, #0x40
      0086A3 C7 50 0A         [ 1]  187 	ld	0x500a, a
      0086A6 20 05            [ 2]  188 	jra	00121$
      0086A8                        189 00120$:
      0086A8 A4 BF            [ 1]  190 	and	a, #0xbf
      0086AA C7 50 0A         [ 1]  191 	ld	0x500a, a
      0086AD                        192 00121$:
      0086AD 72 14 50 0F      [ 1]  193 	bset	20495, #2
      0086B1 72 15 50 0F      [ 1]  194 	bres	20495, #2
      0086B5 C6 00 14         [ 1]  195 	ld	a, _ledBrightness+19
      0086B8 97               [ 1]  196 	ld	xl, a
                                    197 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0086B9 C6 50 0A         [ 1]  198 	ld	a, 0x500a
                                    199 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      0086BC 88               [ 1]  200 	push	a
      0086BD 9F               [ 1]  201 	ld	a, xl
      0086BE C1 00 1D         [ 1]  202 	cp	a, _timeCount+0
      0086C1 84               [ 1]  203 	pop	a
      0086C2 23 07            [ 2]  204 	jrule	00123$
      0086C4 AA 40            [ 1]  205 	or	a, #0x40
      0086C6 C7 50 0A         [ 1]  206 	ld	0x500a, a
      0086C9 20 05            [ 2]  207 	jra	00124$
      0086CB                        208 00123$:
      0086CB A4 BF            [ 1]  209 	and	a, #0xbf
      0086CD C7 50 0A         [ 1]  210 	ld	0x500a, a
      0086D0                        211 00124$:
      0086D0 72 14 50 0F      [ 1]  212 	bset	20495, #2
      0086D4 72 15 50 0F      [ 1]  213 	bres	20495, #2
      0086D8 C6 00 15         [ 1]  214 	ld	a, _ledBrightness+20
      0086DB 97               [ 1]  215 	ld	xl, a
                                    216 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0086DC C6 50 0A         [ 1]  217 	ld	a, 0x500a
                                    218 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      0086DF 88               [ 1]  219 	push	a
      0086E0 9F               [ 1]  220 	ld	a, xl
      0086E1 C1 00 1D         [ 1]  221 	cp	a, _timeCount+0
      0086E4 84               [ 1]  222 	pop	a
      0086E5 23 07            [ 2]  223 	jrule	00126$
      0086E7 AA 40            [ 1]  224 	or	a, #0x40
      0086E9 C7 50 0A         [ 1]  225 	ld	0x500a, a
      0086EC 20 05            [ 2]  226 	jra	00127$
      0086EE                        227 00126$:
      0086EE A4 BF            [ 1]  228 	and	a, #0xbf
      0086F0 C7 50 0A         [ 1]  229 	ld	0x500a, a
      0086F3                        230 00127$:
      0086F3 72 14 50 0F      [ 1]  231 	bset	20495, #2
      0086F7 72 15 50 0F      [ 1]  232 	bres	20495, #2
      0086FB C6 00 16         [ 1]  233 	ld	a, _ledBrightness+21
      0086FE 97               [ 1]  234 	ld	xl, a
                                    235 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0086FF C6 50 0A         [ 1]  236 	ld	a, 0x500a
                                    237 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      008702 88               [ 1]  238 	push	a
      008703 9F               [ 1]  239 	ld	a, xl
      008704 C1 00 1D         [ 1]  240 	cp	a, _timeCount+0
      008707 84               [ 1]  241 	pop	a
      008708 23 07            [ 2]  242 	jrule	00129$
      00870A AA 40            [ 1]  243 	or	a, #0x40
      00870C C7 50 0A         [ 1]  244 	ld	0x500a, a
      00870F 20 05            [ 2]  245 	jra	00130$
      008711                        246 00129$:
      008711 A4 BF            [ 1]  247 	and	a, #0xbf
      008713 C7 50 0A         [ 1]  248 	ld	0x500a, a
      008716                        249 00130$:
      008716 72 14 50 0F      [ 1]  250 	bset	20495, #2
      00871A 72 15 50 0F      [ 1]  251 	bres	20495, #2
      00871E C6 00 17         [ 1]  252 	ld	a, _ledBrightness+22
      008721 97               [ 1]  253 	ld	xl, a
                                    254 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008722 C6 50 0A         [ 1]  255 	ld	a, 0x500a
                                    256 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      008725 88               [ 1]  257 	push	a
      008726 9F               [ 1]  258 	ld	a, xl
      008727 C1 00 1D         [ 1]  259 	cp	a, _timeCount+0
      00872A 84               [ 1]  260 	pop	a
      00872B 23 07            [ 2]  261 	jrule	00132$
      00872D AA 40            [ 1]  262 	or	a, #0x40
      00872F C7 50 0A         [ 1]  263 	ld	0x500a, a
      008732 20 05            [ 2]  264 	jra	00133$
      008734                        265 00132$:
      008734 A4 BF            [ 1]  266 	and	a, #0xbf
      008736 C7 50 0A         [ 1]  267 	ld	0x500a, a
      008739                        268 00133$:
      008739 72 14 50 0F      [ 1]  269 	bset	20495, #2
      00873D 72 15 50 0F      [ 1]  270 	bres	20495, #2
      008741 C6 00 18         [ 1]  271 	ld	a, _ledBrightness+23
      008744 97               [ 1]  272 	ld	xl, a
                                    273 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008745 C6 50 0A         [ 1]  274 	ld	a, 0x500a
                                    275 ;	source/led_control/led_control.c: 41: SHIFT_BIT(16); SHIFT_BIT(17); SHIFT_BIT(18); SHIFT_BIT(19); SHIFT_BIT(20); SHIFT_BIT(21); SHIFT_BIT(22); SHIFT_BIT(23);
      008748 88               [ 1]  276 	push	a
      008749 9F               [ 1]  277 	ld	a, xl
      00874A C1 00 1D         [ 1]  278 	cp	a, _timeCount+0
      00874D 84               [ 1]  279 	pop	a
      00874E 23 07            [ 2]  280 	jrule	00135$
      008750 AA 40            [ 1]  281 	or	a, #0x40
      008752 C7 50 0A         [ 1]  282 	ld	0x500a, a
      008755 20 05            [ 2]  283 	jra	00136$
      008757                        284 00135$:
      008757 A4 BF            [ 1]  285 	and	a, #0xbf
      008759 C7 50 0A         [ 1]  286 	ld	0x500a, a
      00875C                        287 00136$:
      00875C 72 14 50 0F      [ 1]  288 	bset	20495, #2
      008760 72 15 50 0F      [ 1]  289 	bres	20495, #2
                                    290 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      008764 C6 00 09         [ 1]  291 	ld	a, _ledBrightness+8
      008767 97               [ 1]  292 	ld	xl, a
                                    293 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008768 C6 50 0A         [ 1]  294 	ld	a, 0x500a
                                    295 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      00876B 88               [ 1]  296 	push	a
      00876C 9F               [ 1]  297 	ld	a, xl
      00876D C1 00 1D         [ 1]  298 	cp	a, _timeCount+0
      008770 84               [ 1]  299 	pop	a
      008771 23 07            [ 2]  300 	jrule	00138$
      008773 AA 40            [ 1]  301 	or	a, #0x40
      008775 C7 50 0A         [ 1]  302 	ld	0x500a, a
      008778 20 05            [ 2]  303 	jra	00139$
      00877A                        304 00138$:
      00877A A4 BF            [ 1]  305 	and	a, #0xbf
      00877C C7 50 0A         [ 1]  306 	ld	0x500a, a
      00877F                        307 00139$:
      00877F 72 14 50 0F      [ 1]  308 	bset	20495, #2
      008783 72 15 50 0F      [ 1]  309 	bres	20495, #2
      008787 C6 00 0A         [ 1]  310 	ld	a, _ledBrightness+9
      00878A 97               [ 1]  311 	ld	xl, a
                                    312 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      00878B C6 50 0A         [ 1]  313 	ld	a, 0x500a
                                    314 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      00878E 88               [ 1]  315 	push	a
      00878F 9F               [ 1]  316 	ld	a, xl
      008790 C1 00 1D         [ 1]  317 	cp	a, _timeCount+0
      008793 84               [ 1]  318 	pop	a
      008794 23 07            [ 2]  319 	jrule	00141$
      008796 AA 40            [ 1]  320 	or	a, #0x40
      008798 C7 50 0A         [ 1]  321 	ld	0x500a, a
      00879B 20 05            [ 2]  322 	jra	00142$
      00879D                        323 00141$:
      00879D A4 BF            [ 1]  324 	and	a, #0xbf
      00879F C7 50 0A         [ 1]  325 	ld	0x500a, a
      0087A2                        326 00142$:
      0087A2 72 14 50 0F      [ 1]  327 	bset	20495, #2
      0087A6 72 15 50 0F      [ 1]  328 	bres	20495, #2
      0087AA C6 00 0B         [ 1]  329 	ld	a, _ledBrightness+10
      0087AD 97               [ 1]  330 	ld	xl, a
                                    331 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0087AE C6 50 0A         [ 1]  332 	ld	a, 0x500a
                                    333 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      0087B1 88               [ 1]  334 	push	a
      0087B2 9F               [ 1]  335 	ld	a, xl
      0087B3 C1 00 1D         [ 1]  336 	cp	a, _timeCount+0
      0087B6 84               [ 1]  337 	pop	a
      0087B7 23 07            [ 2]  338 	jrule	00144$
      0087B9 AA 40            [ 1]  339 	or	a, #0x40
      0087BB C7 50 0A         [ 1]  340 	ld	0x500a, a
      0087BE 20 05            [ 2]  341 	jra	00145$
      0087C0                        342 00144$:
      0087C0 A4 BF            [ 1]  343 	and	a, #0xbf
      0087C2 C7 50 0A         [ 1]  344 	ld	0x500a, a
      0087C5                        345 00145$:
      0087C5 72 14 50 0F      [ 1]  346 	bset	20495, #2
      0087C9 72 15 50 0F      [ 1]  347 	bres	20495, #2
      0087CD C6 00 0C         [ 1]  348 	ld	a, _ledBrightness+11
      0087D0 97               [ 1]  349 	ld	xl, a
                                    350 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0087D1 C6 50 0A         [ 1]  351 	ld	a, 0x500a
                                    352 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      0087D4 88               [ 1]  353 	push	a
      0087D5 9F               [ 1]  354 	ld	a, xl
      0087D6 C1 00 1D         [ 1]  355 	cp	a, _timeCount+0
      0087D9 84               [ 1]  356 	pop	a
      0087DA 23 07            [ 2]  357 	jrule	00147$
      0087DC AA 40            [ 1]  358 	or	a, #0x40
      0087DE C7 50 0A         [ 1]  359 	ld	0x500a, a
      0087E1 20 05            [ 2]  360 	jra	00148$
      0087E3                        361 00147$:
      0087E3 A4 BF            [ 1]  362 	and	a, #0xbf
      0087E5 C7 50 0A         [ 1]  363 	ld	0x500a, a
      0087E8                        364 00148$:
      0087E8 72 14 50 0F      [ 1]  365 	bset	20495, #2
      0087EC 72 15 50 0F      [ 1]  366 	bres	20495, #2
      0087F0 C6 00 0D         [ 1]  367 	ld	a, _ledBrightness+12
      0087F3 97               [ 1]  368 	ld	xl, a
                                    369 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0087F4 C6 50 0A         [ 1]  370 	ld	a, 0x500a
                                    371 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      0087F7 88               [ 1]  372 	push	a
      0087F8 9F               [ 1]  373 	ld	a, xl
      0087F9 C1 00 1D         [ 1]  374 	cp	a, _timeCount+0
      0087FC 84               [ 1]  375 	pop	a
      0087FD 23 07            [ 2]  376 	jrule	00150$
      0087FF AA 40            [ 1]  377 	or	a, #0x40
      008801 C7 50 0A         [ 1]  378 	ld	0x500a, a
      008804 20 05            [ 2]  379 	jra	00151$
      008806                        380 00150$:
      008806 A4 BF            [ 1]  381 	and	a, #0xbf
      008808 C7 50 0A         [ 1]  382 	ld	0x500a, a
      00880B                        383 00151$:
      00880B 72 14 50 0F      [ 1]  384 	bset	20495, #2
      00880F 72 15 50 0F      [ 1]  385 	bres	20495, #2
      008813 C6 00 0E         [ 1]  386 	ld	a, _ledBrightness+13
      008816 97               [ 1]  387 	ld	xl, a
                                    388 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008817 C6 50 0A         [ 1]  389 	ld	a, 0x500a
                                    390 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      00881A 88               [ 1]  391 	push	a
      00881B 9F               [ 1]  392 	ld	a, xl
      00881C C1 00 1D         [ 1]  393 	cp	a, _timeCount+0
      00881F 84               [ 1]  394 	pop	a
      008820 23 07            [ 2]  395 	jrule	00153$
      008822 AA 40            [ 1]  396 	or	a, #0x40
      008824 C7 50 0A         [ 1]  397 	ld	0x500a, a
      008827 20 05            [ 2]  398 	jra	00154$
      008829                        399 00153$:
      008829 A4 BF            [ 1]  400 	and	a, #0xbf
      00882B C7 50 0A         [ 1]  401 	ld	0x500a, a
      00882E                        402 00154$:
      00882E 72 14 50 0F      [ 1]  403 	bset	20495, #2
      008832 72 15 50 0F      [ 1]  404 	bres	20495, #2
      008836 C6 00 0F         [ 1]  405 	ld	a, _ledBrightness+14
      008839 97               [ 1]  406 	ld	xl, a
                                    407 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      00883A C6 50 0A         [ 1]  408 	ld	a, 0x500a
                                    409 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      00883D 88               [ 1]  410 	push	a
      00883E 9F               [ 1]  411 	ld	a, xl
      00883F C1 00 1D         [ 1]  412 	cp	a, _timeCount+0
      008842 84               [ 1]  413 	pop	a
      008843 23 07            [ 2]  414 	jrule	00156$
      008845 AA 40            [ 1]  415 	or	a, #0x40
      008847 C7 50 0A         [ 1]  416 	ld	0x500a, a
      00884A 20 05            [ 2]  417 	jra	00157$
      00884C                        418 00156$:
      00884C A4 BF            [ 1]  419 	and	a, #0xbf
      00884E C7 50 0A         [ 1]  420 	ld	0x500a, a
      008851                        421 00157$:
      008851 72 14 50 0F      [ 1]  422 	bset	20495, #2
      008855 72 15 50 0F      [ 1]  423 	bres	20495, #2
      008859 C6 00 10         [ 1]  424 	ld	a, _ledBrightness+15
      00885C 97               [ 1]  425 	ld	xl, a
                                    426 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      00885D C6 50 0A         [ 1]  427 	ld	a, 0x500a
                                    428 ;	source/led_control/led_control.c: 42: SHIFT_BIT(8); SHIFT_BIT(9); SHIFT_BIT(10); SHIFT_BIT(11); SHIFT_BIT(12); SHIFT_BIT(13); SHIFT_BIT(14); SHIFT_BIT(15); 
      008860 88               [ 1]  429 	push	a
      008861 9F               [ 1]  430 	ld	a, xl
      008862 C1 00 1D         [ 1]  431 	cp	a, _timeCount+0
      008865 84               [ 1]  432 	pop	a
      008866 23 07            [ 2]  433 	jrule	00159$
      008868 AA 40            [ 1]  434 	or	a, #0x40
      00886A C7 50 0A         [ 1]  435 	ld	0x500a, a
      00886D 20 05            [ 2]  436 	jra	00160$
      00886F                        437 00159$:
      00886F A4 BF            [ 1]  438 	and	a, #0xbf
      008871 C7 50 0A         [ 1]  439 	ld	0x500a, a
      008874                        440 00160$:
      008874 72 14 50 0F      [ 1]  441 	bset	20495, #2
      008878 72 15 50 0F      [ 1]  442 	bres	20495, #2
                                    443 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      00887C C6 00 01         [ 1]  444 	ld	a, _ledBrightness+0
      00887F 97               [ 1]  445 	ld	xl, a
                                    446 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008880 C6 50 0A         [ 1]  447 	ld	a, 0x500a
                                    448 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      008883 88               [ 1]  449 	push	a
      008884 9F               [ 1]  450 	ld	a, xl
      008885 C1 00 1D         [ 1]  451 	cp	a, _timeCount+0
      008888 84               [ 1]  452 	pop	a
      008889 23 07            [ 2]  453 	jrule	00162$
      00888B AA 40            [ 1]  454 	or	a, #0x40
      00888D C7 50 0A         [ 1]  455 	ld	0x500a, a
      008890 20 05            [ 2]  456 	jra	00163$
      008892                        457 00162$:
      008892 A4 BF            [ 1]  458 	and	a, #0xbf
      008894 C7 50 0A         [ 1]  459 	ld	0x500a, a
      008897                        460 00163$:
      008897 72 14 50 0F      [ 1]  461 	bset	20495, #2
      00889B 72 15 50 0F      [ 1]  462 	bres	20495, #2
      00889F C6 00 02         [ 1]  463 	ld	a, _ledBrightness+1
      0088A2 97               [ 1]  464 	ld	xl, a
                                    465 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0088A3 C6 50 0A         [ 1]  466 	ld	a, 0x500a
                                    467 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      0088A6 88               [ 1]  468 	push	a
      0088A7 9F               [ 1]  469 	ld	a, xl
      0088A8 C1 00 1D         [ 1]  470 	cp	a, _timeCount+0
      0088AB 84               [ 1]  471 	pop	a
      0088AC 23 07            [ 2]  472 	jrule	00165$
      0088AE AA 40            [ 1]  473 	or	a, #0x40
      0088B0 C7 50 0A         [ 1]  474 	ld	0x500a, a
      0088B3 20 05            [ 2]  475 	jra	00166$
      0088B5                        476 00165$:
      0088B5 A4 BF            [ 1]  477 	and	a, #0xbf
      0088B7 C7 50 0A         [ 1]  478 	ld	0x500a, a
      0088BA                        479 00166$:
      0088BA 72 14 50 0F      [ 1]  480 	bset	20495, #2
      0088BE 72 15 50 0F      [ 1]  481 	bres	20495, #2
      0088C2 C6 00 03         [ 1]  482 	ld	a, _ledBrightness+2
      0088C5 97               [ 1]  483 	ld	xl, a
                                    484 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0088C6 C6 50 0A         [ 1]  485 	ld	a, 0x500a
                                    486 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      0088C9 88               [ 1]  487 	push	a
      0088CA 9F               [ 1]  488 	ld	a, xl
      0088CB C1 00 1D         [ 1]  489 	cp	a, _timeCount+0
      0088CE 84               [ 1]  490 	pop	a
      0088CF 23 07            [ 2]  491 	jrule	00168$
      0088D1 AA 40            [ 1]  492 	or	a, #0x40
      0088D3 C7 50 0A         [ 1]  493 	ld	0x500a, a
      0088D6 20 05            [ 2]  494 	jra	00169$
      0088D8                        495 00168$:
      0088D8 A4 BF            [ 1]  496 	and	a, #0xbf
      0088DA C7 50 0A         [ 1]  497 	ld	0x500a, a
      0088DD                        498 00169$:
      0088DD 72 14 50 0F      [ 1]  499 	bset	20495, #2
      0088E1 72 15 50 0F      [ 1]  500 	bres	20495, #2
      0088E5 C6 00 04         [ 1]  501 	ld	a, _ledBrightness+3
      0088E8 97               [ 1]  502 	ld	xl, a
                                    503 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      0088E9 C6 50 0A         [ 1]  504 	ld	a, 0x500a
                                    505 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      0088EC 88               [ 1]  506 	push	a
      0088ED 9F               [ 1]  507 	ld	a, xl
      0088EE C1 00 1D         [ 1]  508 	cp	a, _timeCount+0
      0088F1 84               [ 1]  509 	pop	a
      0088F2 23 07            [ 2]  510 	jrule	00171$
      0088F4 AA 40            [ 1]  511 	or	a, #0x40
      0088F6 C7 50 0A         [ 1]  512 	ld	0x500a, a
      0088F9 20 05            [ 2]  513 	jra	00172$
      0088FB                        514 00171$:
      0088FB A4 BF            [ 1]  515 	and	a, #0xbf
      0088FD C7 50 0A         [ 1]  516 	ld	0x500a, a
      008900                        517 00172$:
      008900 72 14 50 0F      [ 1]  518 	bset	20495, #2
      008904 72 15 50 0F      [ 1]  519 	bres	20495, #2
      008908 C6 00 05         [ 1]  520 	ld	a, _ledBrightness+4
      00890B 97               [ 1]  521 	ld	xl, a
                                    522 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      00890C C6 50 0A         [ 1]  523 	ld	a, 0x500a
                                    524 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      00890F 88               [ 1]  525 	push	a
      008910 9F               [ 1]  526 	ld	a, xl
      008911 C1 00 1D         [ 1]  527 	cp	a, _timeCount+0
      008914 84               [ 1]  528 	pop	a
      008915 23 07            [ 2]  529 	jrule	00174$
      008917 AA 40            [ 1]  530 	or	a, #0x40
      008919 C7 50 0A         [ 1]  531 	ld	0x500a, a
      00891C 20 05            [ 2]  532 	jra	00175$
      00891E                        533 00174$:
      00891E A4 BF            [ 1]  534 	and	a, #0xbf
      008920 C7 50 0A         [ 1]  535 	ld	0x500a, a
      008923                        536 00175$:
      008923 72 14 50 0F      [ 1]  537 	bset	20495, #2
      008927 72 15 50 0F      [ 1]  538 	bres	20495, #2
      00892B C6 00 06         [ 1]  539 	ld	a, _ledBrightness+5
      00892E 97               [ 1]  540 	ld	xl, a
                                    541 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      00892F C6 50 0A         [ 1]  542 	ld	a, 0x500a
                                    543 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      008932 88               [ 1]  544 	push	a
      008933 9F               [ 1]  545 	ld	a, xl
      008934 C1 00 1D         [ 1]  546 	cp	a, _timeCount+0
      008937 84               [ 1]  547 	pop	a
      008938 23 07            [ 2]  548 	jrule	00177$
      00893A AA 40            [ 1]  549 	or	a, #0x40
      00893C C7 50 0A         [ 1]  550 	ld	0x500a, a
      00893F 20 05            [ 2]  551 	jra	00178$
      008941                        552 00177$:
      008941 A4 BF            [ 1]  553 	and	a, #0xbf
      008943 C7 50 0A         [ 1]  554 	ld	0x500a, a
      008946                        555 00178$:
      008946 72 14 50 0F      [ 1]  556 	bset	20495, #2
      00894A 72 15 50 0F      [ 1]  557 	bres	20495, #2
      00894E C6 00 07         [ 1]  558 	ld	a, _ledBrightness+6
      008951 97               [ 1]  559 	ld	xl, a
                                    560 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008952 C6 50 0A         [ 1]  561 	ld	a, 0x500a
                                    562 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      008955 88               [ 1]  563 	push	a
      008956 9F               [ 1]  564 	ld	a, xl
      008957 C1 00 1D         [ 1]  565 	cp	a, _timeCount+0
      00895A 84               [ 1]  566 	pop	a
      00895B 23 07            [ 2]  567 	jrule	00180$
      00895D AA 40            [ 1]  568 	or	a, #0x40
      00895F C7 50 0A         [ 1]  569 	ld	0x500a, a
      008962 20 05            [ 2]  570 	jra	00181$
      008964                        571 00180$:
      008964 A4 BF            [ 1]  572 	and	a, #0xbf
      008966 C7 50 0A         [ 1]  573 	ld	0x500a, a
      008969                        574 00181$:
      008969 72 14 50 0F      [ 1]  575 	bset	20495, #2
      00896D 72 15 50 0F      [ 1]  576 	bres	20495, #2
      008971 C6 00 08         [ 1]  577 	ld	a, _ledBrightness+7
      008974 97               [ 1]  578 	ld	xl, a
                                    579 ;	source/led_control/led_control.c: 40: SHIFT_BIT(24); SHIFT_BIT(25); SHIFT_BIT(26); SHIFT_BIT(27);
      008975 C6 50 0A         [ 1]  580 	ld	a, 0x500a
                                    581 ;	source/led_control/led_control.c: 43: SHIFT_BIT(0); SHIFT_BIT(1); SHIFT_BIT(2); SHIFT_BIT(3); SHIFT_BIT(4); SHIFT_BIT(5); SHIFT_BIT(6); SHIFT_BIT(7);
      008978 88               [ 1]  582 	push	a
      008979 9F               [ 1]  583 	ld	a, xl
      00897A C1 00 1D         [ 1]  584 	cp	a, _timeCount+0
      00897D 84               [ 1]  585 	pop	a
      00897E 23 07            [ 2]  586 	jrule	00183$
      008980 AA 40            [ 1]  587 	or	a, #0x40
      008982 C7 50 0A         [ 1]  588 	ld	0x500a, a
      008985 20 05            [ 2]  589 	jra	00184$
      008987                        590 00183$:
      008987 A4 BF            [ 1]  591 	and	a, #0xbf
      008989 C7 50 0A         [ 1]  592 	ld	0x500a, a
      00898C                        593 00184$:
      00898C 72 14 50 0F      [ 1]  594 	bset	20495, #2
      008990 72 15 50 0F      [ 1]  595 	bres	20495, #2
                                    596 ;	source/led_control/led_control.c: 45: timeCount++;
      008994 72 5C 00 1D      [ 1]  597 	inc	_timeCount+0
                                    598 ;	source/led_control/led_control.c: 46: if(timeCount >= LED_BRIGHTNESS_RES) {
      008998 C6 00 1D         [ 1]  599 	ld	a, _timeCount+0
      00899B A1 32            [ 1]  600 	cp	a, #0x32
      00899D 25 04            [ 1]  601 	jrc	00186$
                                    602 ;	source/led_control/led_control.c: 47: timeCount = 0;
      00899F 72 5F 00 1D      [ 1]  603 	clr	_timeCount+0
      0089A3                        604 00186$:
                                    605 ;	source/led_control/led_control.c: 49: IO_HC595_LAT_SET_LOW;
      0089A3 72 1F 50 0A      [ 1]  606 	bres	20490, #7
                                    607 ;	source/led_control/led_control.c: 50: IO_HC595_LAT_SET_HIGH;
      0089A7 72 1E 50 0A      [ 1]  608 	bset	20490, #7
                                    609 ;	source/led_control/led_control.c: 51: }
      0089AB 80               [11]  610 	iret
                                    611 ;	source/led_control/led_control.c: 53: void LedControl_Init(void) {
                                    612 ;	-----------------------------------------
                                    613 ;	 function LedControl_Init
                                    614 ;	-----------------------------------------
      0089AC                        615 _LedControl_Init:
                                    616 ;	source/led_control/led_control.c: 54: GPIO_Init(IO_HC595_OE_PORT, IO_HC595_OE_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      0089AC 4B F0            [ 1]  617 	push	#0xf0
      0089AE 4B 08            [ 1]  618 	push	#0x08
      0089B0 4B 0F            [ 1]  619 	push	#0x0f
      0089B2 4B 50            [ 1]  620 	push	#0x50
      0089B4 CD 83 71         [ 4]  621 	call	_GPIO_Init
      0089B7 5B 04            [ 2]  622 	addw	sp, #4
                                    623 ;	source/led_control/led_control.c: 55: GPIO_Init(IO_HC595_CLK_PORT, IO_HC595_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      0089B9 4B F0            [ 1]  624 	push	#0xf0
      0089BB 4B 04            [ 1]  625 	push	#0x04
      0089BD 4B 0F            [ 1]  626 	push	#0x0f
      0089BF 4B 50            [ 1]  627 	push	#0x50
      0089C1 CD 83 71         [ 4]  628 	call	_GPIO_Init
      0089C4 5B 04            [ 2]  629 	addw	sp, #4
                                    630 ;	source/led_control/led_control.c: 56: GPIO_Init(IO_HC595_LAT_PORT, IO_HC595_LAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      0089C6 4B F0            [ 1]  631 	push	#0xf0
      0089C8 4B 80            [ 1]  632 	push	#0x80
      0089CA 4B 0A            [ 1]  633 	push	#0x0a
      0089CC 4B 50            [ 1]  634 	push	#0x50
      0089CE CD 83 71         [ 4]  635 	call	_GPIO_Init
      0089D1 5B 04            [ 2]  636 	addw	sp, #4
                                    637 ;	source/led_control/led_control.c: 57: GPIO_Init(IO_HC595_DAT_PORT, IO_HC595_DAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
      0089D3 4B F0            [ 1]  638 	push	#0xf0
      0089D5 4B 40            [ 1]  639 	push	#0x40
      0089D7 4B 0A            [ 1]  640 	push	#0x0a
      0089D9 4B 50            [ 1]  641 	push	#0x50
      0089DB CD 83 71         [ 4]  642 	call	_GPIO_Init
      0089DE 5B 04            [ 2]  643 	addw	sp, #4
                                    644 ;	source/led_control/led_control.c: 58: IO_HC595_OE_SET_LOW;
      0089E0 72 17 50 0F      [ 1]  645 	bres	20495, #3
                                    646 ;	source/led_control/led_control.c: 60: TIM4_TimeBaseInit(TIM4_PRESCALER_16, 124);
      0089E4 4B 7C            [ 1]  647 	push	#0x7c
      0089E6 4B 04            [ 1]  648 	push	#0x04
      0089E8 CD 84 4D         [ 4]  649 	call	_TIM4_TimeBaseInit
      0089EB 5B 02            [ 2]  650 	addw	sp, #2
                                    651 ;	source/led_control/led_control.c: 62: TIM4_ClearFlag(TIM4_FLAG_UPDATE);
      0089ED 4B 01            [ 1]  652 	push	#0x01
      0089EF CD 85 0C         [ 4]  653 	call	_TIM4_ClearFlag
      0089F2 84               [ 1]  654 	pop	a
                                    655 ;	source/led_control/led_control.c: 64: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      0089F3 4B 01            [ 1]  656 	push	#0x01
      0089F5 4B 01            [ 1]  657 	push	#0x01
      0089F7 CD 84 6D         [ 4]  658 	call	_TIM4_ITConfig
      0089FA 5B 02            [ 2]  659 	addw	sp, #2
                                    660 ;	source/led_control/led_control.c: 66: TIM4_Cmd(ENABLE);
      0089FC 4B 01            [ 1]  661 	push	#0x01
      0089FE CD 84 5A         [ 4]  662 	call	_TIM4_Cmd
      008A01 84               [ 1]  663 	pop	a
                                    664 ;	source/led_control/led_control.c: 67: }
      008A02 81               [ 4]  665 	ret
                                    666 ;	source/led_control/led_control.c: 69: uint8_t *LedControl_GetLedBuffer(void) {
                                    667 ;	-----------------------------------------
                                    668 ;	 function LedControl_GetLedBuffer
                                    669 ;	-----------------------------------------
      008A03                        670 _LedControl_GetLedBuffer:
                                    671 ;	source/led_control/led_control.c: 70: return ledBrightness;
      008A03 AE 00 01         [ 2]  672 	ldw	x, #(_ledBrightness + 0)
                                    673 ;	source/led_control/led_control.c: 71: }
      008A06 81               [ 4]  674 	ret
                                    675 	.area CODE
                                    676 	.area CONST
                                    677 	.area INITIALIZER
      008030                        678 __xinit__timeCount:
      008030 00                     679 	.db #0x00	; 0
                                    680 	.area CABS (ABS)
