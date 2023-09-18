                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_gpio
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _GPIO_DeInit
                                     12 	.globl _GPIO_Init
                                     13 	.globl _GPIO_Write
                                     14 	.globl _GPIO_WriteHigh
                                     15 	.globl _GPIO_WriteLow
                                     16 	.globl _GPIO_WriteReverse
                                     17 	.globl _GPIO_ReadOutputData
                                     18 	.globl _GPIO_ReadInputData
                                     19 	.globl _GPIO_ReadInputPin
                                     20 	.globl _GPIO_ExternalPullUpConfig
                                     21 ;--------------------------------------------------------
                                     22 ; ram data
                                     23 ;--------------------------------------------------------
                                     24 	.area DATA
                                     25 ;--------------------------------------------------------
                                     26 ; ram data
                                     27 ;--------------------------------------------------------
                                     28 	.area INITIALIZED
                                     29 ;--------------------------------------------------------
                                     30 ; absolute external ram data
                                     31 ;--------------------------------------------------------
                                     32 	.area DABS (ABS)
                                     33 
                                     34 ; default segment ordering for linker
                                     35 	.area HOME
                                     36 	.area GSINIT
                                     37 	.area GSFINAL
                                     38 	.area CONST
                                     39 	.area INITIALIZER
                                     40 	.area CODE
                                     41 
                                     42 ;--------------------------------------------------------
                                     43 ; global & static initialisations
                                     44 ;--------------------------------------------------------
                                     45 	.area HOME
                                     46 	.area GSINIT
                                     47 	.area GSFINAL
                                     48 	.area GSINIT
                                     49 ;--------------------------------------------------------
                                     50 ; Home
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
                                     53 	.area HOME
                                     54 ;--------------------------------------------------------
                                     55 ; code
                                     56 ;--------------------------------------------------------
                                     57 	.area CODE
                                     58 ;	core/source/stm8s_gpio.c: 53: void GPIO_DeInit(GPIO_TypeDef* GPIOx)
                                     59 ;	-----------------------------------------
                                     60 ;	 function GPIO_DeInit
                                     61 ;	-----------------------------------------
      008362                         62 _GPIO_DeInit:
                                     63 ;	core/source/stm8s_gpio.c: 55: GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
      008362 16 03            [ 2]   64 	ldw	y, (0x03, sp)
      008364 90 7F            [ 1]   65 	clr	(y)
                                     66 ;	core/source/stm8s_gpio.c: 56: GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
      008366 93               [ 1]   67 	ldw	x, y
      008367 5C               [ 1]   68 	incw	x
      008368 5C               [ 1]   69 	incw	x
      008369 7F               [ 1]   70 	clr	(x)
                                     71 ;	core/source/stm8s_gpio.c: 57: GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
      00836A 93               [ 1]   72 	ldw	x, y
      00836B 6F 03            [ 1]   73 	clr	(0x0003, x)
                                     74 ;	core/source/stm8s_gpio.c: 58: GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
      00836D 93               [ 1]   75 	ldw	x, y
      00836E 6F 04            [ 1]   76 	clr	(0x0004, x)
                                     77 ;	core/source/stm8s_gpio.c: 59: }
      008370 81               [ 4]   78 	ret
                                     79 ;	core/source/stm8s_gpio.c: 71: void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
                                     80 ;	-----------------------------------------
                                     81 ;	 function GPIO_Init
                                     82 ;	-----------------------------------------
      008371                         83 _GPIO_Init:
      008371 52 05            [ 2]   84 	sub	sp, #5
                                     85 ;	core/source/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      008373 16 08            [ 2]   86 	ldw	y, (0x08, sp)
      008375 93               [ 1]   87 	ldw	x, y
      008376 1C 00 04         [ 2]   88 	addw	x, #0x0004
      008379 1F 01            [ 2]   89 	ldw	(0x01, sp), x
      00837B F6               [ 1]   90 	ld	a, (x)
      00837C 88               [ 1]   91 	push	a
      00837D 7B 0B            [ 1]   92 	ld	a, (0x0b, sp)
      00837F 43               [ 1]   93 	cpl	a
      008380 6B 04            [ 1]   94 	ld	(0x04, sp), a
      008382 84               [ 1]   95 	pop	a
      008383 14 03            [ 1]   96 	and	a, (0x03, sp)
      008385 1E 01            [ 2]   97 	ldw	x, (0x01, sp)
      008387 F7               [ 1]   98 	ld	(x), a
                                     99 ;	core/source/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      008388 93               [ 1]  100 	ldw	x, y
      008389 5C               [ 1]  101 	incw	x
      00838A 5C               [ 1]  102 	incw	x
      00838B 1F 04            [ 2]  103 	ldw	(0x04, sp), x
                                    104 ;	core/source/stm8s_gpio.c: 87: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
      00838D 0D 0B            [ 1]  105 	tnz	(0x0b, sp)
      00838F 2A 1E            [ 1]  106 	jrpl	00105$
                                    107 ;	core/source/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      008391 90 F6            [ 1]  108 	ld	a, (y)
                                    109 ;	core/source/stm8s_gpio.c: 89: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
      008393 88               [ 1]  110 	push	a
      008394 7B 0C            [ 1]  111 	ld	a, (0x0c, sp)
      008396 A5 10            [ 1]  112 	bcp	a, #0x10
      008398 84               [ 1]  113 	pop	a
      008399 27 06            [ 1]  114 	jreq	00102$
                                    115 ;	core/source/stm8s_gpio.c: 91: GPIOx->ODR |= (uint8_t)GPIO_Pin;
      00839B 1A 0A            [ 1]  116 	or	a, (0x0a, sp)
      00839D 90 F7            [ 1]  117 	ld	(y), a
      00839F 20 04            [ 2]  118 	jra	00103$
      0083A1                        119 00102$:
                                    120 ;	core/source/stm8s_gpio.c: 95: GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
      0083A1 14 03            [ 1]  121 	and	a, (0x03, sp)
      0083A3 90 F7            [ 1]  122 	ld	(y), a
      0083A5                        123 00103$:
                                    124 ;	core/source/stm8s_gpio.c: 98: GPIOx->DDR |= (uint8_t)GPIO_Pin;
      0083A5 1E 04            [ 2]  125 	ldw	x, (0x04, sp)
      0083A7 F6               [ 1]  126 	ld	a, (x)
      0083A8 1A 0A            [ 1]  127 	or	a, (0x0a, sp)
      0083AA 1E 04            [ 2]  128 	ldw	x, (0x04, sp)
      0083AC F7               [ 1]  129 	ld	(x), a
      0083AD 20 08            [ 2]  130 	jra	00106$
      0083AF                        131 00105$:
                                    132 ;	core/source/stm8s_gpio.c: 103: GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
      0083AF 1E 04            [ 2]  133 	ldw	x, (0x04, sp)
      0083B1 F6               [ 1]  134 	ld	a, (x)
      0083B2 14 03            [ 1]  135 	and	a, (0x03, sp)
      0083B4 1E 04            [ 2]  136 	ldw	x, (0x04, sp)
      0083B6 F7               [ 1]  137 	ld	(x), a
      0083B7                        138 00106$:
                                    139 ;	core/source/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0083B7 93               [ 1]  140 	ldw	x, y
      0083B8 1C 00 03         [ 2]  141 	addw	x, #0x0003
      0083BB F6               [ 1]  142 	ld	a, (x)
                                    143 ;	core/source/stm8s_gpio.c: 110: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
      0083BC 88               [ 1]  144 	push	a
      0083BD 7B 0C            [ 1]  145 	ld	a, (0x0c, sp)
      0083BF A5 40            [ 1]  146 	bcp	a, #0x40
      0083C1 84               [ 1]  147 	pop	a
      0083C2 27 05            [ 1]  148 	jreq	00108$
                                    149 ;	core/source/stm8s_gpio.c: 112: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      0083C4 1A 0A            [ 1]  150 	or	a, (0x0a, sp)
      0083C6 F7               [ 1]  151 	ld	(x), a
      0083C7 20 03            [ 2]  152 	jra	00109$
      0083C9                        153 00108$:
                                    154 ;	core/source/stm8s_gpio.c: 116: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      0083C9 14 03            [ 1]  155 	and	a, (0x03, sp)
      0083CB F7               [ 1]  156 	ld	(x), a
      0083CC                        157 00109$:
                                    158 ;	core/source/stm8s_gpio.c: 81: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0083CC 1E 01            [ 2]  159 	ldw	x, (0x01, sp)
      0083CE F6               [ 1]  160 	ld	a, (x)
                                    161 ;	core/source/stm8s_gpio.c: 123: if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
      0083CF 88               [ 1]  162 	push	a
      0083D0 7B 0C            [ 1]  163 	ld	a, (0x0c, sp)
      0083D2 A5 20            [ 1]  164 	bcp	a, #0x20
      0083D4 84               [ 1]  165 	pop	a
      0083D5 27 07            [ 1]  166 	jreq	00111$
                                    167 ;	core/source/stm8s_gpio.c: 125: GPIOx->CR2 |= (uint8_t)GPIO_Pin;
      0083D7 1A 0A            [ 1]  168 	or	a, (0x0a, sp)
      0083D9 1E 01            [ 2]  169 	ldw	x, (0x01, sp)
      0083DB F7               [ 1]  170 	ld	(x), a
      0083DC 20 05            [ 2]  171 	jra	00113$
      0083DE                        172 00111$:
                                    173 ;	core/source/stm8s_gpio.c: 129: GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
      0083DE 14 03            [ 1]  174 	and	a, (0x03, sp)
      0083E0 1E 01            [ 2]  175 	ldw	x, (0x01, sp)
      0083E2 F7               [ 1]  176 	ld	(x), a
      0083E3                        177 00113$:
                                    178 ;	core/source/stm8s_gpio.c: 131: }
      0083E3 5B 05            [ 2]  179 	addw	sp, #5
      0083E5 81               [ 4]  180 	ret
                                    181 ;	core/source/stm8s_gpio.c: 141: void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
                                    182 ;	-----------------------------------------
                                    183 ;	 function GPIO_Write
                                    184 ;	-----------------------------------------
      0083E6                        185 _GPIO_Write:
                                    186 ;	core/source/stm8s_gpio.c: 143: GPIOx->ODR = PortVal;
      0083E6 1E 03            [ 2]  187 	ldw	x, (0x03, sp)
      0083E8 7B 05            [ 1]  188 	ld	a, (0x05, sp)
      0083EA F7               [ 1]  189 	ld	(x), a
                                    190 ;	core/source/stm8s_gpio.c: 144: }
      0083EB 81               [ 4]  191 	ret
                                    192 ;	core/source/stm8s_gpio.c: 154: void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    193 ;	-----------------------------------------
                                    194 ;	 function GPIO_WriteHigh
                                    195 ;	-----------------------------------------
      0083EC                        196 _GPIO_WriteHigh:
                                    197 ;	core/source/stm8s_gpio.c: 156: GPIOx->ODR |= (uint8_t)PortPins;
      0083EC 1E 03            [ 2]  198 	ldw	x, (0x03, sp)
      0083EE F6               [ 1]  199 	ld	a, (x)
      0083EF 1A 05            [ 1]  200 	or	a, (0x05, sp)
      0083F1 F7               [ 1]  201 	ld	(x), a
                                    202 ;	core/source/stm8s_gpio.c: 157: }
      0083F2 81               [ 4]  203 	ret
                                    204 ;	core/source/stm8s_gpio.c: 167: void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    205 ;	-----------------------------------------
                                    206 ;	 function GPIO_WriteLow
                                    207 ;	-----------------------------------------
      0083F3                        208 _GPIO_WriteLow:
      0083F3 88               [ 1]  209 	push	a
                                    210 ;	core/source/stm8s_gpio.c: 169: GPIOx->ODR &= (uint8_t)(~PortPins);
      0083F4 1E 04            [ 2]  211 	ldw	x, (0x04, sp)
      0083F6 F6               [ 1]  212 	ld	a, (x)
      0083F7 6B 01            [ 1]  213 	ld	(0x01, sp), a
      0083F9 7B 06            [ 1]  214 	ld	a, (0x06, sp)
      0083FB 43               [ 1]  215 	cpl	a
      0083FC 14 01            [ 1]  216 	and	a, (0x01, sp)
      0083FE F7               [ 1]  217 	ld	(x), a
                                    218 ;	core/source/stm8s_gpio.c: 170: }
      0083FF 84               [ 1]  219 	pop	a
      008400 81               [ 4]  220 	ret
                                    221 ;	core/source/stm8s_gpio.c: 180: void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
                                    222 ;	-----------------------------------------
                                    223 ;	 function GPIO_WriteReverse
                                    224 ;	-----------------------------------------
      008401                        225 _GPIO_WriteReverse:
                                    226 ;	core/source/stm8s_gpio.c: 182: GPIOx->ODR ^= (uint8_t)PortPins;
      008401 1E 03            [ 2]  227 	ldw	x, (0x03, sp)
      008403 F6               [ 1]  228 	ld	a, (x)
      008404 18 05            [ 1]  229 	xor	a, (0x05, sp)
      008406 F7               [ 1]  230 	ld	(x), a
                                    231 ;	core/source/stm8s_gpio.c: 183: }
      008407 81               [ 4]  232 	ret
                                    233 ;	core/source/stm8s_gpio.c: 191: uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
                                    234 ;	-----------------------------------------
                                    235 ;	 function GPIO_ReadOutputData
                                    236 ;	-----------------------------------------
      008408                        237 _GPIO_ReadOutputData:
                                    238 ;	core/source/stm8s_gpio.c: 193: return ((uint8_t)GPIOx->ODR);
      008408 1E 03            [ 2]  239 	ldw	x, (0x03, sp)
      00840A F6               [ 1]  240 	ld	a, (x)
                                    241 ;	core/source/stm8s_gpio.c: 194: }
      00840B 81               [ 4]  242 	ret
                                    243 ;	core/source/stm8s_gpio.c: 202: uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
                                    244 ;	-----------------------------------------
                                    245 ;	 function GPIO_ReadInputData
                                    246 ;	-----------------------------------------
      00840C                        247 _GPIO_ReadInputData:
                                    248 ;	core/source/stm8s_gpio.c: 204: return ((uint8_t)GPIOx->IDR);
      00840C 1E 03            [ 2]  249 	ldw	x, (0x03, sp)
      00840E E6 01            [ 1]  250 	ld	a, (0x1, x)
                                    251 ;	core/source/stm8s_gpio.c: 205: }
      008410 81               [ 4]  252 	ret
                                    253 ;	core/source/stm8s_gpio.c: 213: BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
                                    254 ;	-----------------------------------------
                                    255 ;	 function GPIO_ReadInputPin
                                    256 ;	-----------------------------------------
      008411                        257 _GPIO_ReadInputPin:
                                    258 ;	core/source/stm8s_gpio.c: 215: return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
      008411 1E 03            [ 2]  259 	ldw	x, (0x03, sp)
      008413 E6 01            [ 1]  260 	ld	a, (0x1, x)
      008415 14 05            [ 1]  261 	and	a, (0x05, sp)
                                    262 ;	core/source/stm8s_gpio.c: 216: }
      008417 81               [ 4]  263 	ret
                                    264 ;	core/source/stm8s_gpio.c: 225: void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
                                    265 ;	-----------------------------------------
                                    266 ;	 function GPIO_ExternalPullUpConfig
                                    267 ;	-----------------------------------------
      008418                        268 _GPIO_ExternalPullUpConfig:
      008418 88               [ 1]  269 	push	a
                                    270 ;	core/source/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008419 1E 04            [ 2]  271 	ldw	x, (0x04, sp)
      00841B 1C 00 03         [ 2]  272 	addw	x, #0x0003
      00841E F6               [ 1]  273 	ld	a, (x)
                                    274 ;	core/source/stm8s_gpio.c: 231: if (NewState != DISABLE) /* External Pull-Up Set*/
      00841F 0D 07            [ 1]  275 	tnz	(0x07, sp)
      008421 27 05            [ 1]  276 	jreq	00102$
                                    277 ;	core/source/stm8s_gpio.c: 233: GPIOx->CR1 |= (uint8_t)GPIO_Pin;
      008423 1A 06            [ 1]  278 	or	a, (0x06, sp)
      008425 F7               [ 1]  279 	ld	(x), a
      008426 20 0A            [ 2]  280 	jra	00104$
      008428                        281 00102$:
                                    282 ;	core/source/stm8s_gpio.c: 236: GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
      008428 88               [ 1]  283 	push	a
      008429 7B 07            [ 1]  284 	ld	a, (0x07, sp)
      00842B 43               [ 1]  285 	cpl	a
      00842C 6B 02            [ 1]  286 	ld	(0x02, sp), a
      00842E 84               [ 1]  287 	pop	a
      00842F 14 01            [ 1]  288 	and	a, (0x01, sp)
      008431 F7               [ 1]  289 	ld	(x), a
      008432                        290 00104$:
                                    291 ;	core/source/stm8s_gpio.c: 238: }
      008432 84               [ 1]  292 	pop	a
      008433 81               [ 4]  293 	ret
                                    294 	.area CODE
                                    295 	.area CONST
                                    296 	.area INITIALIZER
                                    297 	.area CABS (ABS)
