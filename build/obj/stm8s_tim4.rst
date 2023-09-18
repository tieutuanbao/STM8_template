                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_tim4
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_DeInit
                                     12 	.globl _TIM4_TimeBaseInit
                                     13 	.globl _TIM4_Cmd
                                     14 	.globl _TIM4_ITConfig
                                     15 	.globl _TIM4_UpdateDisableConfig
                                     16 	.globl _TIM4_UpdateRequestConfig
                                     17 	.globl _TIM4_SelectOnePulseMode
                                     18 	.globl _TIM4_PrescalerConfig
                                     19 	.globl _TIM4_ARRPreloadConfig
                                     20 	.globl _TIM4_GenerateEvent
                                     21 	.globl _TIM4_SetCounter
                                     22 	.globl _TIM4_SetAutoreload
                                     23 	.globl _TIM4_GetCounter
                                     24 	.globl _TIM4_GetPrescaler
                                     25 	.globl _TIM4_GetFlagStatus
                                     26 	.globl _TIM4_ClearFlag
                                     27 	.globl _TIM4_GetITStatus
                                     28 	.globl _TIM4_ClearITPendingBit
                                     29 ;--------------------------------------------------------
                                     30 ; ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DATA
                                     33 ;--------------------------------------------------------
                                     34 ; ram data
                                     35 ;--------------------------------------------------------
                                     36 	.area INITIALIZED
                                     37 ;--------------------------------------------------------
                                     38 ; absolute external ram data
                                     39 ;--------------------------------------------------------
                                     40 	.area DABS (ABS)
                                     41 
                                     42 ; default segment ordering for linker
                                     43 	.area HOME
                                     44 	.area GSINIT
                                     45 	.area GSFINAL
                                     46 	.area CONST
                                     47 	.area INITIALIZER
                                     48 	.area CODE
                                     49 
                                     50 ;--------------------------------------------------------
                                     51 ; global & static initialisations
                                     52 ;--------------------------------------------------------
                                     53 	.area HOME
                                     54 	.area GSINIT
                                     55 	.area GSFINAL
                                     56 	.area GSINIT
                                     57 ;--------------------------------------------------------
                                     58 ; Home
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area HOME
                                     62 ;--------------------------------------------------------
                                     63 ; code
                                     64 ;--------------------------------------------------------
                                     65 	.area CODE
                                     66 ;	core/source/stm8s_tim4.c: 49: void TIM4_DeInit(void)
                                     67 ;	-----------------------------------------
                                     68 ;	 function TIM4_DeInit
                                     69 ;	-----------------------------------------
      008434                         70 _TIM4_DeInit:
                                     71 ;	core/source/stm8s_tim4.c: 51: TIM4->CR1 = TIM4_CR1_RESET_VALUE;
      008434 35 00 53 40      [ 1]   72 	mov	0x5340+0, #0x00
                                     73 ;	core/source/stm8s_tim4.c: 52: TIM4->IER = TIM4_IER_RESET_VALUE;
      008438 35 00 53 43      [ 1]   74 	mov	0x5343+0, #0x00
                                     75 ;	core/source/stm8s_tim4.c: 53: TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
      00843C 35 00 53 46      [ 1]   76 	mov	0x5346+0, #0x00
                                     77 ;	core/source/stm8s_tim4.c: 54: TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
      008440 35 00 53 47      [ 1]   78 	mov	0x5347+0, #0x00
                                     79 ;	core/source/stm8s_tim4.c: 55: TIM4->ARR = TIM4_ARR_RESET_VALUE;
      008444 35 FF 53 48      [ 1]   80 	mov	0x5348+0, #0xff
                                     81 ;	core/source/stm8s_tim4.c: 56: TIM4->SR1 = TIM4_SR1_RESET_VALUE;
      008448 35 00 53 44      [ 1]   82 	mov	0x5344+0, #0x00
                                     83 ;	core/source/stm8s_tim4.c: 57: }
      00844C 81               [ 4]   84 	ret
                                     85 ;	core/source/stm8s_tim4.c: 65: void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
                                     86 ;	-----------------------------------------
                                     87 ;	 function TIM4_TimeBaseInit
                                     88 ;	-----------------------------------------
      00844D                         89 _TIM4_TimeBaseInit:
                                     90 ;	core/source/stm8s_tim4.c: 70: TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
      00844D AE 53 47         [ 2]   91 	ldw	x, #0x5347
      008450 7B 03            [ 1]   92 	ld	a, (0x03, sp)
      008452 F7               [ 1]   93 	ld	(x), a
                                     94 ;	core/source/stm8s_tim4.c: 72: TIM4->ARR = (uint8_t)(TIM4_Period);
      008453 AE 53 48         [ 2]   95 	ldw	x, #0x5348
      008456 7B 04            [ 1]   96 	ld	a, (0x04, sp)
      008458 F7               [ 1]   97 	ld	(x), a
                                     98 ;	core/source/stm8s_tim4.c: 73: }
      008459 81               [ 4]   99 	ret
                                    100 ;	core/source/stm8s_tim4.c: 81: void TIM4_Cmd(FunctionalState NewState)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIM4_Cmd
                                    103 ;	-----------------------------------------
      00845A                        104 _TIM4_Cmd:
                                    105 ;	core/source/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
      00845A C6 53 40         [ 1]  106 	ld	a, 0x5340
                                    107 ;	core/source/stm8s_tim4.c: 87: if (NewState != DISABLE)
      00845D 0D 03            [ 1]  108 	tnz	(0x03, sp)
      00845F 27 06            [ 1]  109 	jreq	00102$
                                    110 ;	core/source/stm8s_tim4.c: 89: TIM4->CR1 |= TIM4_CR1_CEN;
      008461 AA 01            [ 1]  111 	or	a, #0x01
      008463 C7 53 40         [ 1]  112 	ld	0x5340, a
      008466 81               [ 4]  113 	ret
      008467                        114 00102$:
                                    115 ;	core/source/stm8s_tim4.c: 93: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
      008467 A4 FE            [ 1]  116 	and	a, #0xfe
      008469 C7 53 40         [ 1]  117 	ld	0x5340, a
                                    118 ;	core/source/stm8s_tim4.c: 95: }
      00846C 81               [ 4]  119 	ret
                                    120 ;	core/source/stm8s_tim4.c: 107: void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
                                    121 ;	-----------------------------------------
                                    122 ;	 function TIM4_ITConfig
                                    123 ;	-----------------------------------------
      00846D                        124 _TIM4_ITConfig:
      00846D 88               [ 1]  125 	push	a
                                    126 ;	core/source/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
      00846E C6 53 43         [ 1]  127 	ld	a, 0x5343
                                    128 ;	core/source/stm8s_tim4.c: 113: if (NewState != DISABLE)
      008471 0D 05            [ 1]  129 	tnz	(0x05, sp)
      008473 27 07            [ 1]  130 	jreq	00102$
                                    131 ;	core/source/stm8s_tim4.c: 116: TIM4->IER |= (uint8_t)TIM4_IT;
      008475 1A 04            [ 1]  132 	or	a, (0x04, sp)
      008477 C7 53 43         [ 1]  133 	ld	0x5343, a
      00847A 20 0C            [ 2]  134 	jra	00104$
      00847C                        135 00102$:
                                    136 ;	core/source/stm8s_tim4.c: 121: TIM4->IER &= (uint8_t)(~TIM4_IT);
      00847C 88               [ 1]  137 	push	a
      00847D 7B 05            [ 1]  138 	ld	a, (0x05, sp)
      00847F 43               [ 1]  139 	cpl	a
      008480 6B 02            [ 1]  140 	ld	(0x02, sp), a
      008482 84               [ 1]  141 	pop	a
      008483 14 01            [ 1]  142 	and	a, (0x01, sp)
      008485 C7 53 43         [ 1]  143 	ld	0x5343, a
      008488                        144 00104$:
                                    145 ;	core/source/stm8s_tim4.c: 123: }
      008488 84               [ 1]  146 	pop	a
      008489 81               [ 4]  147 	ret
                                    148 ;	core/source/stm8s_tim4.c: 131: void TIM4_UpdateDisableConfig(FunctionalState NewState)
                                    149 ;	-----------------------------------------
                                    150 ;	 function TIM4_UpdateDisableConfig
                                    151 ;	-----------------------------------------
      00848A                        152 _TIM4_UpdateDisableConfig:
                                    153 ;	core/source/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
      00848A C6 53 40         [ 1]  154 	ld	a, 0x5340
                                    155 ;	core/source/stm8s_tim4.c: 137: if (NewState != DISABLE)
      00848D 0D 03            [ 1]  156 	tnz	(0x03, sp)
      00848F 27 06            [ 1]  157 	jreq	00102$
                                    158 ;	core/source/stm8s_tim4.c: 139: TIM4->CR1 |= TIM4_CR1_UDIS;
      008491 AA 02            [ 1]  159 	or	a, #0x02
      008493 C7 53 40         [ 1]  160 	ld	0x5340, a
      008496 81               [ 4]  161 	ret
      008497                        162 00102$:
                                    163 ;	core/source/stm8s_tim4.c: 143: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
      008497 A4 FD            [ 1]  164 	and	a, #0xfd
      008499 C7 53 40         [ 1]  165 	ld	0x5340, a
                                    166 ;	core/source/stm8s_tim4.c: 145: }
      00849C 81               [ 4]  167 	ret
                                    168 ;	core/source/stm8s_tim4.c: 155: void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
                                    169 ;	-----------------------------------------
                                    170 ;	 function TIM4_UpdateRequestConfig
                                    171 ;	-----------------------------------------
      00849D                        172 _TIM4_UpdateRequestConfig:
                                    173 ;	core/source/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
      00849D C6 53 40         [ 1]  174 	ld	a, 0x5340
                                    175 ;	core/source/stm8s_tim4.c: 161: if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
      0084A0 0D 03            [ 1]  176 	tnz	(0x03, sp)
      0084A2 27 06            [ 1]  177 	jreq	00102$
                                    178 ;	core/source/stm8s_tim4.c: 163: TIM4->CR1 |= TIM4_CR1_URS;
      0084A4 AA 04            [ 1]  179 	or	a, #0x04
      0084A6 C7 53 40         [ 1]  180 	ld	0x5340, a
      0084A9 81               [ 4]  181 	ret
      0084AA                        182 00102$:
                                    183 ;	core/source/stm8s_tim4.c: 167: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
      0084AA A4 FB            [ 1]  184 	and	a, #0xfb
      0084AC C7 53 40         [ 1]  185 	ld	0x5340, a
                                    186 ;	core/source/stm8s_tim4.c: 169: }
      0084AF 81               [ 4]  187 	ret
                                    188 ;	core/source/stm8s_tim4.c: 179: void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
                                    189 ;	-----------------------------------------
                                    190 ;	 function TIM4_SelectOnePulseMode
                                    191 ;	-----------------------------------------
      0084B0                        192 _TIM4_SelectOnePulseMode:
                                    193 ;	core/source/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
      0084B0 C6 53 40         [ 1]  194 	ld	a, 0x5340
                                    195 ;	core/source/stm8s_tim4.c: 185: if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
      0084B3 0D 03            [ 1]  196 	tnz	(0x03, sp)
      0084B5 27 06            [ 1]  197 	jreq	00102$
                                    198 ;	core/source/stm8s_tim4.c: 187: TIM4->CR1 |= TIM4_CR1_OPM;
      0084B7 AA 08            [ 1]  199 	or	a, #0x08
      0084B9 C7 53 40         [ 1]  200 	ld	0x5340, a
      0084BC 81               [ 4]  201 	ret
      0084BD                        202 00102$:
                                    203 ;	core/source/stm8s_tim4.c: 191: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
      0084BD A4 F7            [ 1]  204 	and	a, #0xf7
      0084BF C7 53 40         [ 1]  205 	ld	0x5340, a
                                    206 ;	core/source/stm8s_tim4.c: 193: }
      0084C2 81               [ 4]  207 	ret
                                    208 ;	core/source/stm8s_tim4.c: 215: void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
                                    209 ;	-----------------------------------------
                                    210 ;	 function TIM4_PrescalerConfig
                                    211 ;	-----------------------------------------
      0084C3                        212 _TIM4_PrescalerConfig:
                                    213 ;	core/source/stm8s_tim4.c: 222: TIM4->PSCR = (uint8_t)Prescaler;
      0084C3 AE 53 47         [ 2]  214 	ldw	x, #0x5347
      0084C6 7B 03            [ 1]  215 	ld	a, (0x03, sp)
      0084C8 F7               [ 1]  216 	ld	(x), a
                                    217 ;	core/source/stm8s_tim4.c: 225: TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
      0084C9 AE 53 45         [ 2]  218 	ldw	x, #0x5345
      0084CC 7B 04            [ 1]  219 	ld	a, (0x04, sp)
      0084CE F7               [ 1]  220 	ld	(x), a
                                    221 ;	core/source/stm8s_tim4.c: 226: }
      0084CF 81               [ 4]  222 	ret
                                    223 ;	core/source/stm8s_tim4.c: 234: void TIM4_ARRPreloadConfig(FunctionalState NewState)
                                    224 ;	-----------------------------------------
                                    225 ;	 function TIM4_ARRPreloadConfig
                                    226 ;	-----------------------------------------
      0084D0                        227 _TIM4_ARRPreloadConfig:
                                    228 ;	core/source/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
      0084D0 C6 53 40         [ 1]  229 	ld	a, 0x5340
                                    230 ;	core/source/stm8s_tim4.c: 240: if (NewState != DISABLE)
      0084D3 0D 03            [ 1]  231 	tnz	(0x03, sp)
      0084D5 27 06            [ 1]  232 	jreq	00102$
                                    233 ;	core/source/stm8s_tim4.c: 242: TIM4->CR1 |= TIM4_CR1_ARPE;
      0084D7 AA 80            [ 1]  234 	or	a, #0x80
      0084D9 C7 53 40         [ 1]  235 	ld	0x5340, a
      0084DC 81               [ 4]  236 	ret
      0084DD                        237 00102$:
                                    238 ;	core/source/stm8s_tim4.c: 246: TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
      0084DD A4 7F            [ 1]  239 	and	a, #0x7f
      0084DF C7 53 40         [ 1]  240 	ld	0x5340, a
                                    241 ;	core/source/stm8s_tim4.c: 248: }
      0084E2 81               [ 4]  242 	ret
                                    243 ;	core/source/stm8s_tim4.c: 257: void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
                                    244 ;	-----------------------------------------
                                    245 ;	 function TIM4_GenerateEvent
                                    246 ;	-----------------------------------------
      0084E3                        247 _TIM4_GenerateEvent:
                                    248 ;	core/source/stm8s_tim4.c: 263: TIM4->EGR = (uint8_t)(TIM4_EventSource);
      0084E3 AE 53 45         [ 2]  249 	ldw	x, #0x5345
      0084E6 7B 03            [ 1]  250 	ld	a, (0x03, sp)
      0084E8 F7               [ 1]  251 	ld	(x), a
                                    252 ;	core/source/stm8s_tim4.c: 264: }
      0084E9 81               [ 4]  253 	ret
                                    254 ;	core/source/stm8s_tim4.c: 272: void TIM4_SetCounter(uint8_t Counter)
                                    255 ;	-----------------------------------------
                                    256 ;	 function TIM4_SetCounter
                                    257 ;	-----------------------------------------
      0084EA                        258 _TIM4_SetCounter:
                                    259 ;	core/source/stm8s_tim4.c: 275: TIM4->CNTR = (uint8_t)(Counter);
      0084EA AE 53 46         [ 2]  260 	ldw	x, #0x5346
      0084ED 7B 03            [ 1]  261 	ld	a, (0x03, sp)
      0084EF F7               [ 1]  262 	ld	(x), a
                                    263 ;	core/source/stm8s_tim4.c: 276: }
      0084F0 81               [ 4]  264 	ret
                                    265 ;	core/source/stm8s_tim4.c: 284: void TIM4_SetAutoreload(uint8_t Autoreload)
                                    266 ;	-----------------------------------------
                                    267 ;	 function TIM4_SetAutoreload
                                    268 ;	-----------------------------------------
      0084F1                        269 _TIM4_SetAutoreload:
                                    270 ;	core/source/stm8s_tim4.c: 287: TIM4->ARR = (uint8_t)(Autoreload);
      0084F1 AE 53 48         [ 2]  271 	ldw	x, #0x5348
      0084F4 7B 03            [ 1]  272 	ld	a, (0x03, sp)
      0084F6 F7               [ 1]  273 	ld	(x), a
                                    274 ;	core/source/stm8s_tim4.c: 288: }
      0084F7 81               [ 4]  275 	ret
                                    276 ;	core/source/stm8s_tim4.c: 295: uint8_t TIM4_GetCounter(void)
                                    277 ;	-----------------------------------------
                                    278 ;	 function TIM4_GetCounter
                                    279 ;	-----------------------------------------
      0084F8                        280 _TIM4_GetCounter:
                                    281 ;	core/source/stm8s_tim4.c: 298: return (uint8_t)(TIM4->CNTR);
      0084F8 C6 53 46         [ 1]  282 	ld	a, 0x5346
                                    283 ;	core/source/stm8s_tim4.c: 299: }
      0084FB 81               [ 4]  284 	ret
                                    285 ;	core/source/stm8s_tim4.c: 306: TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
                                    286 ;	-----------------------------------------
                                    287 ;	 function TIM4_GetPrescaler
                                    288 ;	-----------------------------------------
      0084FC                        289 _TIM4_GetPrescaler:
                                    290 ;	core/source/stm8s_tim4.c: 309: return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
      0084FC C6 53 47         [ 1]  291 	ld	a, 0x5347
                                    292 ;	core/source/stm8s_tim4.c: 310: }
      0084FF 81               [ 4]  293 	ret
                                    294 ;	core/source/stm8s_tim4.c: 319: FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    295 ;	-----------------------------------------
                                    296 ;	 function TIM4_GetFlagStatus
                                    297 ;	-----------------------------------------
      008500                        298 _TIM4_GetFlagStatus:
                                    299 ;	core/source/stm8s_tim4.c: 326: if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
      008500 C6 53 44         [ 1]  300 	ld	a, 0x5344
      008503 14 03            [ 1]  301 	and	a, (0x03, sp)
      008505 27 03            [ 1]  302 	jreq	00102$
                                    303 ;	core/source/stm8s_tim4.c: 328: bitstatus = SET;
      008507 A6 01            [ 1]  304 	ld	a, #0x01
      008509 81               [ 4]  305 	ret
      00850A                        306 00102$:
                                    307 ;	core/source/stm8s_tim4.c: 332: bitstatus = RESET;
      00850A 4F               [ 1]  308 	clr	a
                                    309 ;	core/source/stm8s_tim4.c: 334: return ((FlagStatus)bitstatus);
                                    310 ;	core/source/stm8s_tim4.c: 335: }
      00850B 81               [ 4]  311 	ret
                                    312 ;	core/source/stm8s_tim4.c: 344: void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
                                    313 ;	-----------------------------------------
                                    314 ;	 function TIM4_ClearFlag
                                    315 ;	-----------------------------------------
      00850C                        316 _TIM4_ClearFlag:
                                    317 ;	core/source/stm8s_tim4.c: 350: TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
      00850C 7B 03            [ 1]  318 	ld	a, (0x03, sp)
      00850E 43               [ 1]  319 	cpl	a
      00850F C7 53 44         [ 1]  320 	ld	0x5344, a
                                    321 ;	core/source/stm8s_tim4.c: 351: }
      008512 81               [ 4]  322 	ret
                                    323 ;	core/source/stm8s_tim4.c: 360: ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
                                    324 ;	-----------------------------------------
                                    325 ;	 function TIM4_GetITStatus
                                    326 ;	-----------------------------------------
      008513                        327 _TIM4_GetITStatus:
      008513 88               [ 1]  328 	push	a
                                    329 ;	core/source/stm8s_tim4.c: 369: itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
      008514 C6 53 44         [ 1]  330 	ld	a, 0x5344
      008517 14 04            [ 1]  331 	and	a, (0x04, sp)
      008519 6B 01            [ 1]  332 	ld	(0x01, sp), a
                                    333 ;	core/source/stm8s_tim4.c: 371: itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
      00851B C6 53 43         [ 1]  334 	ld	a, 0x5343
      00851E 14 04            [ 1]  335 	and	a, (0x04, sp)
                                    336 ;	core/source/stm8s_tim4.c: 373: if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
      008520 0D 01            [ 1]  337 	tnz	(0x01, sp)
      008522 27 06            [ 1]  338 	jreq	00102$
      008524 4D               [ 1]  339 	tnz	a
      008525 27 03            [ 1]  340 	jreq	00102$
                                    341 ;	core/source/stm8s_tim4.c: 375: bitstatus = (ITStatus)SET;
      008527 A6 01            [ 1]  342 	ld	a, #0x01
                                    343 ;	core/source/stm8s_tim4.c: 379: bitstatus = (ITStatus)RESET;
      008529 21                     344 	.byte 0x21
      00852A                        345 00102$:
      00852A 4F               [ 1]  346 	clr	a
      00852B                        347 00103$:
                                    348 ;	core/source/stm8s_tim4.c: 381: return ((ITStatus)bitstatus);
                                    349 ;	core/source/stm8s_tim4.c: 382: }
      00852B 5B 01            [ 2]  350 	addw	sp, #1
      00852D 81               [ 4]  351 	ret
                                    352 ;	core/source/stm8s_tim4.c: 391: void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
                                    353 ;	-----------------------------------------
                                    354 ;	 function TIM4_ClearITPendingBit
                                    355 ;	-----------------------------------------
      00852E                        356 _TIM4_ClearITPendingBit:
                                    357 ;	core/source/stm8s_tim4.c: 397: TIM4->SR1 = (uint8_t)(~TIM4_IT);
      00852E 7B 03            [ 1]  358 	ld	a, (0x03, sp)
      008530 43               [ 1]  359 	cpl	a
      008531 C7 53 44         [ 1]  360 	ld	0x5344, a
                                    361 ;	core/source/stm8s_tim4.c: 398: }
      008534 81               [ 4]  362 	ret
                                    363 	.area CODE
                                    364 	.area CONST
                                    365 	.area INITIALIZER
                                    366 	.area CABS (ABS)
