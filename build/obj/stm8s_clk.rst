                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.0.0 #11528 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CLKPrescTable
                                     12 	.globl _HSIDivFactor
                                     13 	.globl _CLK_DeInit
                                     14 	.globl _CLK_FastHaltWakeUpCmd
                                     15 	.globl _CLK_HSECmd
                                     16 	.globl _CLK_HSICmd
                                     17 	.globl _CLK_LSICmd
                                     18 	.globl _CLK_CCOCmd
                                     19 	.globl _CLK_ClockSwitchCmd
                                     20 	.globl _CLK_SlowActiveHaltWakeUpCmd
                                     21 	.globl _CLK_PeripheralClockConfig
                                     22 	.globl _CLK_ClockSwitchConfig
                                     23 	.globl _CLK_HSIPrescalerConfig
                                     24 	.globl _CLK_CCOConfig
                                     25 	.globl _CLK_ITConfig
                                     26 	.globl _CLK_SYSCLKConfig
                                     27 	.globl _CLK_SWIMConfig
                                     28 	.globl _CLK_ClockSecuritySystemEnable
                                     29 	.globl _CLK_GetSYSCLKSource
                                     30 	.globl _CLK_GetClockFreq
                                     31 	.globl _CLK_AdjustHSICalibrationValue
                                     32 	.globl _CLK_SYSCLKEmergencyClear
                                     33 	.globl _CLK_GetFlagStatus
                                     34 	.globl _CLK_GetITStatus
                                     35 	.globl _CLK_ClearITPendingBit
                                     36 ;--------------------------------------------------------
                                     37 ; ram data
                                     38 ;--------------------------------------------------------
                                     39 	.area DATA
                                     40 ;--------------------------------------------------------
                                     41 ; ram data
                                     42 ;--------------------------------------------------------
                                     43 	.area INITIALIZED
                                     44 ;--------------------------------------------------------
                                     45 ; absolute external ram data
                                     46 ;--------------------------------------------------------
                                     47 	.area DABS (ABS)
                                     48 
                                     49 ; default segment ordering for linker
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area CONST
                                     54 	.area INITIALIZER
                                     55 	.area CODE
                                     56 
                                     57 ;--------------------------------------------------------
                                     58 ; global & static initialisations
                                     59 ;--------------------------------------------------------
                                     60 	.area HOME
                                     61 	.area GSINIT
                                     62 	.area GSFINAL
                                     63 	.area GSINIT
                                     64 ;--------------------------------------------------------
                                     65 ; Home
                                     66 ;--------------------------------------------------------
                                     67 	.area HOME
                                     68 	.area HOME
                                     69 ;--------------------------------------------------------
                                     70 ; code
                                     71 ;--------------------------------------------------------
                                     72 	.area CODE
                                     73 ;	core/source/stm8s_clk.c: 72: void CLK_DeInit(void)
                                     74 ;	-----------------------------------------
                                     75 ;	 function CLK_DeInit
                                     76 ;	-----------------------------------------
      008031                         77 _CLK_DeInit:
                                     78 ;	core/source/stm8s_clk.c: 74: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008031 35 01 50 C0      [ 1]   79 	mov	0x50c0+0, #0x01
                                     80 ;	core/source/stm8s_clk.c: 75: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008035 35 00 50 C1      [ 1]   81 	mov	0x50c1+0, #0x00
                                     82 ;	core/source/stm8s_clk.c: 76: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008039 35 E1 50 C4      [ 1]   83 	mov	0x50c4+0, #0xe1
                                     84 ;	core/source/stm8s_clk.c: 77: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      00803D 35 00 50 C5      [ 1]   85 	mov	0x50c5+0, #0x00
                                     86 ;	core/source/stm8s_clk.c: 78: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008041 35 18 50 C6      [ 1]   87 	mov	0x50c6+0, #0x18
                                     88 ;	core/source/stm8s_clk.c: 79: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008045 35 FF 50 C7      [ 1]   89 	mov	0x50c7+0, #0xff
                                     90 ;	core/source/stm8s_clk.c: 80: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008049 35 FF 50 CA      [ 1]   91 	mov	0x50ca+0, #0xff
                                     92 ;	core/source/stm8s_clk.c: 81: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      00804D 35 00 50 C8      [ 1]   93 	mov	0x50c8+0, #0x00
                                     94 ;	core/source/stm8s_clk.c: 82: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008051 35 00 50 C9      [ 1]   95 	mov	0x50c9+0, #0x00
                                     96 ;	core/source/stm8s_clk.c: 83: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008055                         97 00101$:
      008055 C6 50 C9         [ 1]   98 	ld	a, 0x50c9
      008058 44               [ 1]   99 	srl	a
      008059 25 FA            [ 1]  100 	jrc	00101$
                                    101 ;	core/source/stm8s_clk.c: 85: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      00805B 35 00 50 C9      [ 1]  102 	mov	0x50c9+0, #0x00
                                    103 ;	core/source/stm8s_clk.c: 86: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      00805F 35 00 50 CC      [ 1]  104 	mov	0x50cc+0, #0x00
                                    105 ;	core/source/stm8s_clk.c: 87: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008063 35 00 50 CD      [ 1]  106 	mov	0x50cd+0, #0x00
                                    107 ;	core/source/stm8s_clk.c: 88: }
      008067 81               [ 4]  108 	ret
                                    109 ;	core/source/stm8s_clk.c: 99: void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
                                    110 ;	-----------------------------------------
                                    111 ;	 function CLK_FastHaltWakeUpCmd
                                    112 ;	-----------------------------------------
      008068                        113 _CLK_FastHaltWakeUpCmd:
                                    114 ;	core/source/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      008068 C6 50 C0         [ 1]  115 	ld	a, 0x50c0
                                    116 ;	core/source/stm8s_clk.c: 104: if (NewState != DISABLE)
      00806B 0D 03            [ 1]  117 	tnz	(0x03, sp)
      00806D 27 06            [ 1]  118 	jreq	00102$
                                    119 ;	core/source/stm8s_clk.c: 107: CLK->ICKR |= CLK_ICKR_FHWU;
      00806F AA 04            [ 1]  120 	or	a, #0x04
      008071 C7 50 C0         [ 1]  121 	ld	0x50c0, a
      008074 81               [ 4]  122 	ret
      008075                        123 00102$:
                                    124 ;	core/source/stm8s_clk.c: 112: CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
      008075 A4 FB            [ 1]  125 	and	a, #0xfb
      008077 C7 50 C0         [ 1]  126 	ld	0x50c0, a
                                    127 ;	core/source/stm8s_clk.c: 114: }
      00807A 81               [ 4]  128 	ret
                                    129 ;	core/source/stm8s_clk.c: 121: void CLK_HSECmd(FunctionalState NewState)
                                    130 ;	-----------------------------------------
                                    131 ;	 function CLK_HSECmd
                                    132 ;	-----------------------------------------
      00807B                        133 _CLK_HSECmd:
                                    134 ;	core/source/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      00807B C6 50 C1         [ 1]  135 	ld	a, 0x50c1
                                    136 ;	core/source/stm8s_clk.c: 126: if (NewState != DISABLE)
      00807E 0D 03            [ 1]  137 	tnz	(0x03, sp)
      008080 27 06            [ 1]  138 	jreq	00102$
                                    139 ;	core/source/stm8s_clk.c: 129: CLK->ECKR |= CLK_ECKR_HSEEN;
      008082 AA 01            [ 1]  140 	or	a, #0x01
      008084 C7 50 C1         [ 1]  141 	ld	0x50c1, a
      008087 81               [ 4]  142 	ret
      008088                        143 00102$:
                                    144 ;	core/source/stm8s_clk.c: 134: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      008088 A4 FE            [ 1]  145 	and	a, #0xfe
      00808A C7 50 C1         [ 1]  146 	ld	0x50c1, a
                                    147 ;	core/source/stm8s_clk.c: 136: }
      00808D 81               [ 4]  148 	ret
                                    149 ;	core/source/stm8s_clk.c: 143: void CLK_HSICmd(FunctionalState NewState)
                                    150 ;	-----------------------------------------
                                    151 ;	 function CLK_HSICmd
                                    152 ;	-----------------------------------------
      00808E                        153 _CLK_HSICmd:
                                    154 ;	core/source/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      00808E C6 50 C0         [ 1]  155 	ld	a, 0x50c0
                                    156 ;	core/source/stm8s_clk.c: 148: if (NewState != DISABLE)
      008091 0D 03            [ 1]  157 	tnz	(0x03, sp)
      008093 27 06            [ 1]  158 	jreq	00102$
                                    159 ;	core/source/stm8s_clk.c: 151: CLK->ICKR |= CLK_ICKR_HSIEN;
      008095 AA 01            [ 1]  160 	or	a, #0x01
      008097 C7 50 C0         [ 1]  161 	ld	0x50c0, a
      00809A 81               [ 4]  162 	ret
      00809B                        163 00102$:
                                    164 ;	core/source/stm8s_clk.c: 156: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      00809B A4 FE            [ 1]  165 	and	a, #0xfe
      00809D C7 50 C0         [ 1]  166 	ld	0x50c0, a
                                    167 ;	core/source/stm8s_clk.c: 158: }
      0080A0 81               [ 4]  168 	ret
                                    169 ;	core/source/stm8s_clk.c: 166: void CLK_LSICmd(FunctionalState NewState)
                                    170 ;	-----------------------------------------
                                    171 ;	 function CLK_LSICmd
                                    172 ;	-----------------------------------------
      0080A1                        173 _CLK_LSICmd:
                                    174 ;	core/source/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0080A1 C6 50 C0         [ 1]  175 	ld	a, 0x50c0
                                    176 ;	core/source/stm8s_clk.c: 171: if (NewState != DISABLE)
      0080A4 0D 03            [ 1]  177 	tnz	(0x03, sp)
      0080A6 27 06            [ 1]  178 	jreq	00102$
                                    179 ;	core/source/stm8s_clk.c: 174: CLK->ICKR |= CLK_ICKR_LSIEN;
      0080A8 AA 08            [ 1]  180 	or	a, #0x08
      0080AA C7 50 C0         [ 1]  181 	ld	0x50c0, a
      0080AD 81               [ 4]  182 	ret
      0080AE                        183 00102$:
                                    184 ;	core/source/stm8s_clk.c: 179: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0080AE A4 F7            [ 1]  185 	and	a, #0xf7
      0080B0 C7 50 C0         [ 1]  186 	ld	0x50c0, a
                                    187 ;	core/source/stm8s_clk.c: 181: }
      0080B3 81               [ 4]  188 	ret
                                    189 ;	core/source/stm8s_clk.c: 189: void CLK_CCOCmd(FunctionalState NewState)
                                    190 ;	-----------------------------------------
                                    191 ;	 function CLK_CCOCmd
                                    192 ;	-----------------------------------------
      0080B4                        193 _CLK_CCOCmd:
                                    194 ;	core/source/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0080B4 C6 50 C9         [ 1]  195 	ld	a, 0x50c9
                                    196 ;	core/source/stm8s_clk.c: 194: if (NewState != DISABLE)
      0080B7 0D 03            [ 1]  197 	tnz	(0x03, sp)
      0080B9 27 06            [ 1]  198 	jreq	00102$
                                    199 ;	core/source/stm8s_clk.c: 197: CLK->CCOR |= CLK_CCOR_CCOEN;
      0080BB AA 01            [ 1]  200 	or	a, #0x01
      0080BD C7 50 C9         [ 1]  201 	ld	0x50c9, a
      0080C0 81               [ 4]  202 	ret
      0080C1                        203 00102$:
                                    204 ;	core/source/stm8s_clk.c: 202: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
      0080C1 A4 FE            [ 1]  205 	and	a, #0xfe
      0080C3 C7 50 C9         [ 1]  206 	ld	0x50c9, a
                                    207 ;	core/source/stm8s_clk.c: 204: }
      0080C6 81               [ 4]  208 	ret
                                    209 ;	core/source/stm8s_clk.c: 213: void CLK_ClockSwitchCmd(FunctionalState NewState)
                                    210 ;	-----------------------------------------
                                    211 ;	 function CLK_ClockSwitchCmd
                                    212 ;	-----------------------------------------
      0080C7                        213 _CLK_ClockSwitchCmd:
                                    214 ;	core/source/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0080C7 C6 50 C5         [ 1]  215 	ld	a, 0x50c5
                                    216 ;	core/source/stm8s_clk.c: 218: if (NewState != DISABLE )
      0080CA 0D 03            [ 1]  217 	tnz	(0x03, sp)
      0080CC 27 06            [ 1]  218 	jreq	00102$
                                    219 ;	core/source/stm8s_clk.c: 221: CLK->SWCR |= CLK_SWCR_SWEN;
      0080CE AA 02            [ 1]  220 	or	a, #0x02
      0080D0 C7 50 C5         [ 1]  221 	ld	0x50c5, a
      0080D3 81               [ 4]  222 	ret
      0080D4                        223 00102$:
                                    224 ;	core/source/stm8s_clk.c: 226: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
      0080D4 A4 FD            [ 1]  225 	and	a, #0xfd
      0080D6 C7 50 C5         [ 1]  226 	ld	0x50c5, a
                                    227 ;	core/source/stm8s_clk.c: 228: }
      0080D9 81               [ 4]  228 	ret
                                    229 ;	core/source/stm8s_clk.c: 238: void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
                                    230 ;	-----------------------------------------
                                    231 ;	 function CLK_SlowActiveHaltWakeUpCmd
                                    232 ;	-----------------------------------------
      0080DA                        233 _CLK_SlowActiveHaltWakeUpCmd:
                                    234 ;	core/source/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      0080DA C6 50 C0         [ 1]  235 	ld	a, 0x50c0
                                    236 ;	core/source/stm8s_clk.c: 243: if (NewState != DISABLE)
      0080DD 0D 03            [ 1]  237 	tnz	(0x03, sp)
      0080DF 27 06            [ 1]  238 	jreq	00102$
                                    239 ;	core/source/stm8s_clk.c: 246: CLK->ICKR |= CLK_ICKR_SWUAH;
      0080E1 AA 20            [ 1]  240 	or	a, #0x20
      0080E3 C7 50 C0         [ 1]  241 	ld	0x50c0, a
      0080E6 81               [ 4]  242 	ret
      0080E7                        243 00102$:
                                    244 ;	core/source/stm8s_clk.c: 251: CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
      0080E7 A4 DF            [ 1]  245 	and	a, #0xdf
      0080E9 C7 50 C0         [ 1]  246 	ld	0x50c0, a
                                    247 ;	core/source/stm8s_clk.c: 253: }
      0080EC 81               [ 4]  248 	ret
                                    249 ;	core/source/stm8s_clk.c: 263: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                    250 ;	-----------------------------------------
                                    251 ;	 function CLK_PeripheralClockConfig
                                    252 ;	-----------------------------------------
      0080ED                        253 _CLK_PeripheralClockConfig:
      0080ED 88               [ 1]  254 	push	a
                                    255 ;	core/source/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      0080EE 7B 04            [ 1]  256 	ld	a, (0x04, sp)
      0080F0 A4 0F            [ 1]  257 	and	a, #0x0f
      0080F2 88               [ 1]  258 	push	a
      0080F3 A6 01            [ 1]  259 	ld	a, #0x01
      0080F5 6B 02            [ 1]  260 	ld	(0x02, sp), a
      0080F7 84               [ 1]  261 	pop	a
      0080F8 4D               [ 1]  262 	tnz	a
      0080F9 27 05            [ 1]  263 	jreq	00128$
      0080FB                        264 00127$:
      0080FB 08 01            [ 1]  265 	sll	(0x01, sp)
      0080FD 4A               [ 1]  266 	dec	a
      0080FE 26 FB            [ 1]  267 	jrne	00127$
      008100                        268 00128$:
                                    269 ;	core/source/stm8s_clk.c: 269: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008100 7B 04            [ 1]  270 	ld	a, (0x04, sp)
      008102 A5 10            [ 1]  271 	bcp	a, #0x10
      008104 26 17            [ 1]  272 	jrne	00108$
                                    273 ;	core/source/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008106 C6 50 C7         [ 1]  274 	ld	a, 0x50c7
                                    275 ;	core/source/stm8s_clk.c: 271: if (NewState != DISABLE)
      008109 0D 05            [ 1]  276 	tnz	(0x05, sp)
      00810B 27 07            [ 1]  277 	jreq	00102$
                                    278 ;	core/source/stm8s_clk.c: 274: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00810D 1A 01            [ 1]  279 	or	a, (0x01, sp)
      00810F C7 50 C7         [ 1]  280 	ld	0x50c7, a
      008112 20 1E            [ 2]  281 	jra	00110$
      008114                        282 00102$:
                                    283 ;	core/source/stm8s_clk.c: 279: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008114 03 01            [ 1]  284 	cpl	(0x01, sp)
      008116 14 01            [ 1]  285 	and	a, (0x01, sp)
      008118 C7 50 C7         [ 1]  286 	ld	0x50c7, a
      00811B 20 15            [ 2]  287 	jra	00110$
      00811D                        288 00108$:
                                    289 ;	core/source/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      00811D C6 50 CA         [ 1]  290 	ld	a, 0x50ca
                                    291 ;	core/source/stm8s_clk.c: 284: if (NewState != DISABLE)
      008120 0D 05            [ 1]  292 	tnz	(0x05, sp)
      008122 27 07            [ 1]  293 	jreq	00105$
                                    294 ;	core/source/stm8s_clk.c: 287: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008124 1A 01            [ 1]  295 	or	a, (0x01, sp)
      008126 C7 50 CA         [ 1]  296 	ld	0x50ca, a
      008129 20 07            [ 2]  297 	jra	00110$
      00812B                        298 00105$:
                                    299 ;	core/source/stm8s_clk.c: 292: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      00812B 03 01            [ 1]  300 	cpl	(0x01, sp)
      00812D 14 01            [ 1]  301 	and	a, (0x01, sp)
      00812F C7 50 CA         [ 1]  302 	ld	0x50ca, a
      008132                        303 00110$:
                                    304 ;	core/source/stm8s_clk.c: 295: }
      008132 84               [ 1]  305 	pop	a
      008133 81               [ 4]  306 	ret
                                    307 ;	core/source/stm8s_clk.c: 309: ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
                                    308 ;	-----------------------------------------
                                    309 ;	 function CLK_ClockSwitchConfig
                                    310 ;	-----------------------------------------
      008134                        311 _CLK_ClockSwitchConfig:
                                    312 ;	core/source/stm8s_clk.c: 322: clock_master = (CLK_Source_TypeDef)CLK->CMSR;
      008134 C6 50 C3         [ 1]  313 	ld	a, 0x50c3
      008137 90 97            [ 1]  314 	ld	yl, a
                                    315 ;	core/source/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      008139 C6 50 C5         [ 1]  316 	ld	a, 0x50c5
                                    317 ;	core/source/stm8s_clk.c: 325: if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
      00813C 88               [ 1]  318 	push	a
      00813D 7B 04            [ 1]  319 	ld	a, (0x04, sp)
      00813F 4A               [ 1]  320 	dec	a
      008140 84               [ 1]  321 	pop	a
      008141 26 37            [ 1]  322 	jrne	00122$
                                    323 ;	core/source/stm8s_clk.c: 328: CLK->SWCR |= CLK_SWCR_SWEN;
      008143 AA 02            [ 1]  324 	or	a, #0x02
      008145 C7 50 C5         [ 1]  325 	ld	0x50c5, a
      008148 C6 50 C5         [ 1]  326 	ld	a, 0x50c5
                                    327 ;	core/source/stm8s_clk.c: 331: if (ITState != DISABLE)
      00814B 0D 05            [ 1]  328 	tnz	(0x05, sp)
      00814D 27 07            [ 1]  329 	jreq	00102$
                                    330 ;	core/source/stm8s_clk.c: 333: CLK->SWCR |= CLK_SWCR_SWIEN;
      00814F AA 04            [ 1]  331 	or	a, #0x04
      008151 C7 50 C5         [ 1]  332 	ld	0x50c5, a
      008154 20 05            [ 2]  333 	jra	00103$
      008156                        334 00102$:
                                    335 ;	core/source/stm8s_clk.c: 337: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008156 A4 FB            [ 1]  336 	and	a, #0xfb
      008158 C7 50 C5         [ 1]  337 	ld	0x50c5, a
      00815B                        338 00103$:
                                    339 ;	core/source/stm8s_clk.c: 341: CLK->SWR = (uint8_t)CLK_NewClock;
      00815B AE 50 C4         [ 2]  340 	ldw	x, #0x50c4
      00815E 7B 04            [ 1]  341 	ld	a, (0x04, sp)
      008160 F7               [ 1]  342 	ld	(x), a
                                    343 ;	core/source/stm8s_clk.c: 344: while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
      008161 5F               [ 1]  344 	clrw	x
      008162 5A               [ 2]  345 	decw	x
      008163                        346 00105$:
      008163 C6 50 C5         [ 1]  347 	ld	a, 0x50c5
      008166 44               [ 1]  348 	srl	a
      008167 24 06            [ 1]  349 	jrnc	00107$
      008169 5D               [ 2]  350 	tnzw	x
      00816A 27 03            [ 1]  351 	jreq	00107$
                                    352 ;	core/source/stm8s_clk.c: 346: DownCounter--;
      00816C 5A               [ 2]  353 	decw	x
      00816D 20 F4            [ 2]  354 	jra	00105$
      00816F                        355 00107$:
                                    356 ;	core/source/stm8s_clk.c: 349: if(DownCounter != 0)
      00816F 5D               [ 2]  357 	tnzw	x
      008170 27 05            [ 1]  358 	jreq	00109$
                                    359 ;	core/source/stm8s_clk.c: 351: Swif = SUCCESS;
      008172 A6 01            [ 1]  360 	ld	a, #0x01
      008174 97               [ 1]  361 	ld	xl, a
      008175 20 34            [ 2]  362 	jra	00123$
      008177                        363 00109$:
                                    364 ;	core/source/stm8s_clk.c: 355: Swif = ERROR;
      008177 5F               [ 1]  365 	clrw	x
      008178 20 31            [ 2]  366 	jra	00123$
      00817A                        367 00122$:
                                    368 ;	core/source/stm8s_clk.c: 361: if (ITState != DISABLE)
      00817A 0D 05            [ 1]  369 	tnz	(0x05, sp)
      00817C 27 07            [ 1]  370 	jreq	00112$
                                    371 ;	core/source/stm8s_clk.c: 363: CLK->SWCR |= CLK_SWCR_SWIEN;
      00817E AA 04            [ 1]  372 	or	a, #0x04
      008180 C7 50 C5         [ 1]  373 	ld	0x50c5, a
      008183 20 05            [ 2]  374 	jra	00113$
      008185                        375 00112$:
                                    376 ;	core/source/stm8s_clk.c: 367: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
      008185 A4 FB            [ 1]  377 	and	a, #0xfb
      008187 C7 50 C5         [ 1]  378 	ld	0x50c5, a
      00818A                        379 00113$:
                                    380 ;	core/source/stm8s_clk.c: 371: CLK->SWR = (uint8_t)CLK_NewClock;
      00818A AE 50 C4         [ 2]  381 	ldw	x, #0x50c4
      00818D 7B 04            [ 1]  382 	ld	a, (0x04, sp)
      00818F F7               [ 1]  383 	ld	(x), a
                                    384 ;	core/source/stm8s_clk.c: 374: while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
      008190 5F               [ 1]  385 	clrw	x
      008191 5A               [ 2]  386 	decw	x
      008192                        387 00115$:
      008192 C6 50 C5         [ 1]  388 	ld	a, 0x50c5
      008195 A5 08            [ 1]  389 	bcp	a, #0x08
      008197 27 06            [ 1]  390 	jreq	00117$
      008199 5D               [ 2]  391 	tnzw	x
      00819A 27 03            [ 1]  392 	jreq	00117$
                                    393 ;	core/source/stm8s_clk.c: 376: DownCounter--;
      00819C 5A               [ 2]  394 	decw	x
      00819D 20 F3            [ 2]  395 	jra	00115$
      00819F                        396 00117$:
                                    397 ;	core/source/stm8s_clk.c: 379: if(DownCounter != 0)
      00819F 5D               [ 2]  398 	tnzw	x
      0081A0 27 08            [ 1]  399 	jreq	00119$
                                    400 ;	core/source/stm8s_clk.c: 382: CLK->SWCR |= CLK_SWCR_SWEN;
      0081A2 72 12 50 C5      [ 1]  401 	bset	20677, #1
                                    402 ;	core/source/stm8s_clk.c: 383: Swif = SUCCESS;
      0081A6 A6 01            [ 1]  403 	ld	a, #0x01
      0081A8 97               [ 1]  404 	ld	xl, a
                                    405 ;	core/source/stm8s_clk.c: 387: Swif = ERROR;
      0081A9 21                     406 	.byte 0x21
      0081AA                        407 00119$:
      0081AA 5F               [ 1]  408 	clrw	x
      0081AB                        409 00123$:
                                    410 ;	core/source/stm8s_clk.c: 390: if(Swif != ERROR)
      0081AB 9F               [ 1]  411 	ld	a, xl
      0081AC 4D               [ 1]  412 	tnz	a
      0081AD 27 2E            [ 1]  413 	jreq	00136$
                                    414 ;	core/source/stm8s_clk.c: 393: if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
      0081AF 0D 06            [ 1]  415 	tnz	(0x06, sp)
      0081B1 26 0C            [ 1]  416 	jrne	00132$
      0081B3 90 9F            [ 1]  417 	ld	a, yl
      0081B5 A1 E1            [ 1]  418 	cp	a, #0xe1
      0081B7 26 06            [ 1]  419 	jrne	00132$
                                    420 ;	core/source/stm8s_clk.c: 395: CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
      0081B9 72 11 50 C0      [ 1]  421 	bres	20672, #0
      0081BD 20 1E            [ 2]  422 	jra	00136$
      0081BF                        423 00132$:
                                    424 ;	core/source/stm8s_clk.c: 397: else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
      0081BF 0D 06            [ 1]  425 	tnz	(0x06, sp)
      0081C1 26 0C            [ 1]  426 	jrne	00128$
      0081C3 90 9F            [ 1]  427 	ld	a, yl
      0081C5 A1 D2            [ 1]  428 	cp	a, #0xd2
      0081C7 26 06            [ 1]  429 	jrne	00128$
                                    430 ;	core/source/stm8s_clk.c: 399: CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
      0081C9 72 17 50 C0      [ 1]  431 	bres	20672, #3
      0081CD 20 0E            [ 2]  432 	jra	00136$
      0081CF                        433 00128$:
                                    434 ;	core/source/stm8s_clk.c: 401: else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
      0081CF 0D 06            [ 1]  435 	tnz	(0x06, sp)
      0081D1 26 0A            [ 1]  436 	jrne	00136$
      0081D3 90 9F            [ 1]  437 	ld	a, yl
      0081D5 A1 B4            [ 1]  438 	cp	a, #0xb4
      0081D7 26 04            [ 1]  439 	jrne	00136$
                                    440 ;	core/source/stm8s_clk.c: 403: CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
      0081D9 72 11 50 C1      [ 1]  441 	bres	20673, #0
      0081DD                        442 00136$:
                                    443 ;	core/source/stm8s_clk.c: 406: return(Swif);
      0081DD 9F               [ 1]  444 	ld	a, xl
                                    445 ;	core/source/stm8s_clk.c: 407: }
      0081DE 81               [ 4]  446 	ret
                                    447 ;	core/source/stm8s_clk.c: 415: void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
                                    448 ;	-----------------------------------------
                                    449 ;	 function CLK_HSIPrescalerConfig
                                    450 ;	-----------------------------------------
      0081DF                        451 _CLK_HSIPrescalerConfig:
                                    452 ;	core/source/stm8s_clk.c: 421: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      0081DF C6 50 C6         [ 1]  453 	ld	a, 0x50c6
      0081E2 A4 E7            [ 1]  454 	and	a, #0xe7
      0081E4 C7 50 C6         [ 1]  455 	ld	0x50c6, a
                                    456 ;	core/source/stm8s_clk.c: 424: CLK->CKDIVR |= (uint8_t)HSIPrescaler;
      0081E7 C6 50 C6         [ 1]  457 	ld	a, 0x50c6
      0081EA 1A 03            [ 1]  458 	or	a, (0x03, sp)
      0081EC C7 50 C6         [ 1]  459 	ld	0x50c6, a
                                    460 ;	core/source/stm8s_clk.c: 425: }
      0081EF 81               [ 4]  461 	ret
                                    462 ;	core/source/stm8s_clk.c: 436: void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
                                    463 ;	-----------------------------------------
                                    464 ;	 function CLK_CCOConfig
                                    465 ;	-----------------------------------------
      0081F0                        466 _CLK_CCOConfig:
                                    467 ;	core/source/stm8s_clk.c: 442: CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
      0081F0 C6 50 C9         [ 1]  468 	ld	a, 0x50c9
      0081F3 A4 E1            [ 1]  469 	and	a, #0xe1
      0081F5 C7 50 C9         [ 1]  470 	ld	0x50c9, a
                                    471 ;	core/source/stm8s_clk.c: 445: CLK->CCOR |= (uint8_t)CLK_CCO;
      0081F8 C6 50 C9         [ 1]  472 	ld	a, 0x50c9
      0081FB 1A 03            [ 1]  473 	or	a, (0x03, sp)
      0081FD C7 50 C9         [ 1]  474 	ld	0x50c9, a
                                    475 ;	core/source/stm8s_clk.c: 448: CLK->CCOR |= CLK_CCOR_CCOEN;
      008200 72 10 50 C9      [ 1]  476 	bset	20681, #0
                                    477 ;	core/source/stm8s_clk.c: 449: }
      008204 81               [ 4]  478 	ret
                                    479 ;	core/source/stm8s_clk.c: 459: void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
                                    480 ;	-----------------------------------------
                                    481 ;	 function CLK_ITConfig
                                    482 ;	-----------------------------------------
      008205                        483 _CLK_ITConfig:
                                    484 ;	core/source/stm8s_clk.c: 467: switch (CLK_IT)
      008205 7B 03            [ 1]  485 	ld	a, (0x03, sp)
      008207 A0 0C            [ 1]  486 	sub	a, #0x0c
      008209 26 02            [ 1]  487 	jrne	00140$
      00820B 4C               [ 1]  488 	inc	a
      00820C 21                     489 	.byte 0x21
      00820D                        490 00140$:
      00820D 4F               [ 1]  491 	clr	a
      00820E                        492 00141$:
                                    493 ;	core/source/stm8s_clk.c: 465: if (NewState != DISABLE)
      00820E 0D 04            [ 1]  494 	tnz	(0x04, sp)
      008210 27 14            [ 1]  495 	jreq	00110$
                                    496 ;	core/source/stm8s_clk.c: 467: switch (CLK_IT)
      008212 4D               [ 1]  497 	tnz	a
      008213 26 0C            [ 1]  498 	jrne	00102$
      008215 7B 03            [ 1]  499 	ld	a, (0x03, sp)
      008217 A1 1C            [ 1]  500 	cp	a, #0x1c
      008219 27 01            [ 1]  501 	jreq	00146$
      00821B 81               [ 4]  502 	ret
      00821C                        503 00146$:
                                    504 ;	core/source/stm8s_clk.c: 470: CLK->SWCR |= CLK_SWCR_SWIEN;
      00821C 72 14 50 C5      [ 1]  505 	bset	20677, #2
                                    506 ;	core/source/stm8s_clk.c: 471: break;
      008220 81               [ 4]  507 	ret
                                    508 ;	core/source/stm8s_clk.c: 472: case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
      008221                        509 00102$:
                                    510 ;	core/source/stm8s_clk.c: 473: CLK->CSSR |= CLK_CSSR_CSSDIE;
      008221 72 14 50 C8      [ 1]  511 	bset	20680, #2
                                    512 ;	core/source/stm8s_clk.c: 474: break;
      008225 81               [ 4]  513 	ret
                                    514 ;	core/source/stm8s_clk.c: 477: }
      008226                        515 00110$:
                                    516 ;	core/source/stm8s_clk.c: 481: switch (CLK_IT)
      008226 4D               [ 1]  517 	tnz	a
      008227 26 0C            [ 1]  518 	jrne	00106$
      008229 7B 03            [ 1]  519 	ld	a, (0x03, sp)
      00822B A1 1C            [ 1]  520 	cp	a, #0x1c
      00822D 27 01            [ 1]  521 	jreq	00150$
      00822F 81               [ 4]  522 	ret
      008230                        523 00150$:
                                    524 ;	core/source/stm8s_clk.c: 484: CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
      008230 72 15 50 C5      [ 1]  525 	bres	20677, #2
                                    526 ;	core/source/stm8s_clk.c: 485: break;
      008234 81               [ 4]  527 	ret
                                    528 ;	core/source/stm8s_clk.c: 486: case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
      008235                        529 00106$:
                                    530 ;	core/source/stm8s_clk.c: 487: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
      008235 72 15 50 C8      [ 1]  531 	bres	20680, #2
                                    532 ;	core/source/stm8s_clk.c: 491: }
                                    533 ;	core/source/stm8s_clk.c: 493: }
      008239 81               [ 4]  534 	ret
                                    535 ;	core/source/stm8s_clk.c: 500: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    536 ;	-----------------------------------------
                                    537 ;	 function CLK_SYSCLKConfig
                                    538 ;	-----------------------------------------
      00823A                        539 _CLK_SYSCLKConfig:
      00823A 88               [ 1]  540 	push	a
                                    541 ;	core/source/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      00823B C6 50 C6         [ 1]  542 	ld	a, 0x50c6
                                    543 ;	core/source/stm8s_clk.c: 505: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      00823E 0D 04            [ 1]  544 	tnz	(0x04, sp)
      008240 2B 15            [ 1]  545 	jrmi	00102$
                                    546 ;	core/source/stm8s_clk.c: 507: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008242 A4 E7            [ 1]  547 	and	a, #0xe7
      008244 C7 50 C6         [ 1]  548 	ld	0x50c6, a
                                    549 ;	core/source/stm8s_clk.c: 508: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008247 C6 50 C6         [ 1]  550 	ld	a, 0x50c6
      00824A 6B 01            [ 1]  551 	ld	(0x01, sp), a
      00824C 7B 04            [ 1]  552 	ld	a, (0x04, sp)
      00824E A4 18            [ 1]  553 	and	a, #0x18
      008250 1A 01            [ 1]  554 	or	a, (0x01, sp)
      008252 C7 50 C6         [ 1]  555 	ld	0x50c6, a
      008255 20 13            [ 2]  556 	jra	00104$
      008257                        557 00102$:
                                    558 ;	core/source/stm8s_clk.c: 512: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008257 A4 F8            [ 1]  559 	and	a, #0xf8
      008259 C7 50 C6         [ 1]  560 	ld	0x50c6, a
                                    561 ;	core/source/stm8s_clk.c: 513: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      00825C C6 50 C6         [ 1]  562 	ld	a, 0x50c6
      00825F 6B 01            [ 1]  563 	ld	(0x01, sp), a
      008261 7B 04            [ 1]  564 	ld	a, (0x04, sp)
      008263 A4 07            [ 1]  565 	and	a, #0x07
      008265 1A 01            [ 1]  566 	or	a, (0x01, sp)
      008267 C7 50 C6         [ 1]  567 	ld	0x50c6, a
      00826A                        568 00104$:
                                    569 ;	core/source/stm8s_clk.c: 515: }
      00826A 84               [ 1]  570 	pop	a
      00826B 81               [ 4]  571 	ret
                                    572 ;	core/source/stm8s_clk.c: 523: void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
                                    573 ;	-----------------------------------------
                                    574 ;	 function CLK_SWIMConfig
                                    575 ;	-----------------------------------------
      00826C                        576 _CLK_SWIMConfig:
                                    577 ;	core/source/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      00826C C6 50 CD         [ 1]  578 	ld	a, 0x50cd
                                    579 ;	core/source/stm8s_clk.c: 528: if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
      00826F 0D 03            [ 1]  580 	tnz	(0x03, sp)
      008271 27 06            [ 1]  581 	jreq	00102$
                                    582 ;	core/source/stm8s_clk.c: 531: CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
      008273 AA 01            [ 1]  583 	or	a, #0x01
      008275 C7 50 CD         [ 1]  584 	ld	0x50cd, a
      008278 81               [ 4]  585 	ret
      008279                        586 00102$:
                                    587 ;	core/source/stm8s_clk.c: 536: CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
      008279 A4 FE            [ 1]  588 	and	a, #0xfe
      00827B C7 50 CD         [ 1]  589 	ld	0x50cd, a
                                    590 ;	core/source/stm8s_clk.c: 538: }
      00827E 81               [ 4]  591 	ret
                                    592 ;	core/source/stm8s_clk.c: 547: void CLK_ClockSecuritySystemEnable(void)
                                    593 ;	-----------------------------------------
                                    594 ;	 function CLK_ClockSecuritySystemEnable
                                    595 ;	-----------------------------------------
      00827F                        596 _CLK_ClockSecuritySystemEnable:
                                    597 ;	core/source/stm8s_clk.c: 550: CLK->CSSR |= CLK_CSSR_CSSEN;
      00827F 72 10 50 C8      [ 1]  598 	bset	20680, #0
                                    599 ;	core/source/stm8s_clk.c: 551: }
      008283 81               [ 4]  600 	ret
                                    601 ;	core/source/stm8s_clk.c: 559: CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
                                    602 ;	-----------------------------------------
                                    603 ;	 function CLK_GetSYSCLKSource
                                    604 ;	-----------------------------------------
      008284                        605 _CLK_GetSYSCLKSource:
                                    606 ;	core/source/stm8s_clk.c: 561: return((CLK_Source_TypeDef)CLK->CMSR);
      008284 C6 50 C3         [ 1]  607 	ld	a, 0x50c3
                                    608 ;	core/source/stm8s_clk.c: 562: }
      008287 81               [ 4]  609 	ret
                                    610 ;	core/source/stm8s_clk.c: 569: uint32_t CLK_GetClockFreq(void)
                                    611 ;	-----------------------------------------
                                    612 ;	 function CLK_GetClockFreq
                                    613 ;	-----------------------------------------
      008288                        614 _CLK_GetClockFreq:
      008288 52 04            [ 2]  615 	sub	sp, #4
                                    616 ;	core/source/stm8s_clk.c: 576: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      00828A C6 50 C3         [ 1]  617 	ld	a, 0x50c3
                                    618 ;	core/source/stm8s_clk.c: 578: if (clocksource == CLK_SOURCE_HSI)
      00828D 6B 04            [ 1]  619 	ld	(0x04, sp), a
      00828F A1 E1            [ 1]  620 	cp	a, #0xe1
      008291 26 26            [ 1]  621 	jrne	00105$
                                    622 ;	core/source/stm8s_clk.c: 580: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008293 C6 50 C6         [ 1]  623 	ld	a, 0x50c6
      008296 A4 18            [ 1]  624 	and	a, #0x18
                                    625 ;	core/source/stm8s_clk.c: 581: tmp = (uint8_t)(tmp >> 3);
      008298 44               [ 1]  626 	srl	a
      008299 44               [ 1]  627 	srl	a
      00829A 44               [ 1]  628 	srl	a
                                    629 ;	core/source/stm8s_clk.c: 582: presc = HSIDivFactor[tmp];
      00829B 5F               [ 1]  630 	clrw	x
      00829C 97               [ 1]  631 	ld	xl, a
      00829D 1C 80 24         [ 2]  632 	addw	x, #(_HSIDivFactor + 0)
      0082A0 F6               [ 1]  633 	ld	a, (x)
                                    634 ;	core/source/stm8s_clk.c: 583: clockfrequency = HSI_VALUE / presc;
      0082A1 5F               [ 1]  635 	clrw	x
      0082A2 97               [ 1]  636 	ld	xl, a
      0082A3 90 5F            [ 1]  637 	clrw	y
      0082A5 89               [ 2]  638 	pushw	x
      0082A6 90 89            [ 2]  639 	pushw	y
      0082A8 4B 00            [ 1]  640 	push	#0x00
      0082AA 4B 24            [ 1]  641 	push	#0x24
      0082AC 4B F4            [ 1]  642 	push	#0xf4
      0082AE 4B 00            [ 1]  643 	push	#0x00
      0082B0 CD 8A 07         [ 4]  644 	call	__divulong
      0082B3 5B 08            [ 2]  645 	addw	sp, #8
      0082B5 1F 03            [ 2]  646 	ldw	(0x03, sp), x
      0082B7 20 1A            [ 2]  647 	jra	00106$
      0082B9                        648 00105$:
                                    649 ;	core/source/stm8s_clk.c: 585: else if ( clocksource == CLK_SOURCE_LSI)
      0082B9 7B 04            [ 1]  650 	ld	a, (0x04, sp)
      0082BB A1 D2            [ 1]  651 	cp	a, #0xd2
      0082BD 26 0B            [ 1]  652 	jrne	00102$
                                    653 ;	core/source/stm8s_clk.c: 587: clockfrequency = LSI_VALUE;
      0082BF AE F4 00         [ 2]  654 	ldw	x, #0xf400
      0082C2 1F 03            [ 2]  655 	ldw	(0x03, sp), x
      0082C4 90 AE 00 01      [ 2]  656 	ldw	y, #0x0001
      0082C8 20 09            [ 2]  657 	jra	00106$
      0082CA                        658 00102$:
                                    659 ;	core/source/stm8s_clk.c: 591: clockfrequency = HSE_VALUE;
      0082CA AE 24 00         [ 2]  660 	ldw	x, #0x2400
      0082CD 1F 03            [ 2]  661 	ldw	(0x03, sp), x
      0082CF 90 AE 00 F4      [ 2]  662 	ldw	y, #0x00f4
      0082D3                        663 00106$:
                                    664 ;	core/source/stm8s_clk.c: 594: return((uint32_t)clockfrequency);
      0082D3 1E 03            [ 2]  665 	ldw	x, (0x03, sp)
                                    666 ;	core/source/stm8s_clk.c: 595: }
      0082D5 5B 04            [ 2]  667 	addw	sp, #4
      0082D7 81               [ 4]  668 	ret
                                    669 ;	core/source/stm8s_clk.c: 604: void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
                                    670 ;	-----------------------------------------
                                    671 ;	 function CLK_AdjustHSICalibrationValue
                                    672 ;	-----------------------------------------
      0082D8                        673 _CLK_AdjustHSICalibrationValue:
                                    674 ;	core/source/stm8s_clk.c: 610: CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
      0082D8 C6 50 CC         [ 1]  675 	ld	a, 0x50cc
      0082DB A4 F8            [ 1]  676 	and	a, #0xf8
      0082DD 1A 03            [ 1]  677 	or	a, (0x03, sp)
      0082DF C7 50 CC         [ 1]  678 	ld	0x50cc, a
                                    679 ;	core/source/stm8s_clk.c: 611: }
      0082E2 81               [ 4]  680 	ret
                                    681 ;	core/source/stm8s_clk.c: 622: void CLK_SYSCLKEmergencyClear(void)
                                    682 ;	-----------------------------------------
                                    683 ;	 function CLK_SYSCLKEmergencyClear
                                    684 ;	-----------------------------------------
      0082E3                        685 _CLK_SYSCLKEmergencyClear:
                                    686 ;	core/source/stm8s_clk.c: 624: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
      0082E3 72 11 50 C5      [ 1]  687 	bres	20677, #0
                                    688 ;	core/source/stm8s_clk.c: 625: }
      0082E7 81               [ 4]  689 	ret
                                    690 ;	core/source/stm8s_clk.c: 634: FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
                                    691 ;	-----------------------------------------
                                    692 ;	 function CLK_GetFlagStatus
                                    693 ;	-----------------------------------------
      0082E8                        694 _CLK_GetFlagStatus:
      0082E8 52 02            [ 2]  695 	sub	sp, #2
                                    696 ;	core/source/stm8s_clk.c: 644: statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
      0082EA 1E 05            [ 2]  697 	ldw	x, (0x05, sp)
      0082EC 4F               [ 1]  698 	clr	a
      0082ED 97               [ 1]  699 	ld	xl, a
                                    700 ;	core/source/stm8s_clk.c: 647: if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
      0082EE 1F 01            [ 2]  701 	ldw	(0x01, sp), x
      0082F0 A3 01 00         [ 2]  702 	cpw	x, #0x0100
      0082F3 26 05            [ 1]  703 	jrne	00111$
                                    704 ;	core/source/stm8s_clk.c: 649: tmpreg = CLK->ICKR;
      0082F5 C6 50 C0         [ 1]  705 	ld	a, 0x50c0
      0082F8 20 27            [ 2]  706 	jra	00112$
      0082FA                        707 00111$:
                                    708 ;	core/source/stm8s_clk.c: 651: else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
      0082FA 1E 01            [ 2]  709 	ldw	x, (0x01, sp)
      0082FC A3 02 00         [ 2]  710 	cpw	x, #0x0200
      0082FF 26 05            [ 1]  711 	jrne	00108$
                                    712 ;	core/source/stm8s_clk.c: 653: tmpreg = CLK->ECKR;
      008301 C6 50 C1         [ 1]  713 	ld	a, 0x50c1
      008304 20 1B            [ 2]  714 	jra	00112$
      008306                        715 00108$:
                                    716 ;	core/source/stm8s_clk.c: 655: else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
      008306 1E 01            [ 2]  717 	ldw	x, (0x01, sp)
      008308 A3 03 00         [ 2]  718 	cpw	x, #0x0300
      00830B 26 05            [ 1]  719 	jrne	00105$
                                    720 ;	core/source/stm8s_clk.c: 657: tmpreg = CLK->SWCR;
      00830D C6 50 C5         [ 1]  721 	ld	a, 0x50c5
      008310 20 0F            [ 2]  722 	jra	00112$
      008312                        723 00105$:
                                    724 ;	core/source/stm8s_clk.c: 659: else if (statusreg == 0x0400) /* The flag to check is in CSS register */
      008312 1E 01            [ 2]  725 	ldw	x, (0x01, sp)
      008314 A3 04 00         [ 2]  726 	cpw	x, #0x0400
      008317 26 05            [ 1]  727 	jrne	00102$
                                    728 ;	core/source/stm8s_clk.c: 661: tmpreg = CLK->CSSR;
      008319 C6 50 C8         [ 1]  729 	ld	a, 0x50c8
      00831C 20 03            [ 2]  730 	jra	00112$
      00831E                        731 00102$:
                                    732 ;	core/source/stm8s_clk.c: 665: tmpreg = CLK->CCOR;
      00831E C6 50 C9         [ 1]  733 	ld	a, 0x50c9
      008321                        734 00112$:
                                    735 ;	core/source/stm8s_clk.c: 668: if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
      008321 88               [ 1]  736 	push	a
      008322 7B 07            [ 1]  737 	ld	a, (0x07, sp)
      008324 6B 03            [ 1]  738 	ld	(0x03, sp), a
      008326 84               [ 1]  739 	pop	a
      008327 14 02            [ 1]  740 	and	a, (0x02, sp)
      008329 27 03            [ 1]  741 	jreq	00114$
                                    742 ;	core/source/stm8s_clk.c: 670: bitstatus = SET;
      00832B A6 01            [ 1]  743 	ld	a, #0x01
                                    744 ;	core/source/stm8s_clk.c: 674: bitstatus = RESET;
      00832D 21                     745 	.byte 0x21
      00832E                        746 00114$:
      00832E 4F               [ 1]  747 	clr	a
      00832F                        748 00115$:
                                    749 ;	core/source/stm8s_clk.c: 678: return((FlagStatus)bitstatus);
                                    750 ;	core/source/stm8s_clk.c: 679: }
      00832F 5B 02            [ 2]  751 	addw	sp, #2
      008331 81               [ 4]  752 	ret
                                    753 ;	core/source/stm8s_clk.c: 687: ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
                                    754 ;	-----------------------------------------
                                    755 ;	 function CLK_GetITStatus
                                    756 ;	-----------------------------------------
      008332                        757 _CLK_GetITStatus:
                                    758 ;	core/source/stm8s_clk.c: 694: if (CLK_IT == CLK_IT_SWIF)
      008332 7B 03            [ 1]  759 	ld	a, (0x03, sp)
      008334 A1 1C            [ 1]  760 	cp	a, #0x1c
      008336 26 0D            [ 1]  761 	jrne	00108$
                                    762 ;	core/source/stm8s_clk.c: 697: if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008338 C6 50 C5         [ 1]  763 	ld	a, 0x50c5
      00833B 14 03            [ 1]  764 	and	a, (0x03, sp)
                                    765 ;	core/source/stm8s_clk.c: 699: bitstatus = SET;
      00833D A0 0C            [ 1]  766 	sub	a, #0x0c
      00833F 26 02            [ 1]  767 	jrne	00102$
      008341 4C               [ 1]  768 	inc	a
      008342 81               [ 4]  769 	ret
      008343                        770 00102$:
                                    771 ;	core/source/stm8s_clk.c: 703: bitstatus = RESET;
      008343 4F               [ 1]  772 	clr	a
      008344 81               [ 4]  773 	ret
      008345                        774 00108$:
                                    775 ;	core/source/stm8s_clk.c: 709: if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
      008345 C6 50 C8         [ 1]  776 	ld	a, 0x50c8
      008348 14 03            [ 1]  777 	and	a, (0x03, sp)
                                    778 ;	core/source/stm8s_clk.c: 711: bitstatus = SET;
      00834A A0 0C            [ 1]  779 	sub	a, #0x0c
      00834C 26 02            [ 1]  780 	jrne	00105$
      00834E 4C               [ 1]  781 	inc	a
      00834F 81               [ 4]  782 	ret
      008350                        783 00105$:
                                    784 ;	core/source/stm8s_clk.c: 715: bitstatus = RESET;
      008350 4F               [ 1]  785 	clr	a
                                    786 ;	core/source/stm8s_clk.c: 720: return bitstatus;
                                    787 ;	core/source/stm8s_clk.c: 721: }
      008351 81               [ 4]  788 	ret
                                    789 ;	core/source/stm8s_clk.c: 729: void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
                                    790 ;	-----------------------------------------
                                    791 ;	 function CLK_ClearITPendingBit
                                    792 ;	-----------------------------------------
      008352                        793 _CLK_ClearITPendingBit:
                                    794 ;	core/source/stm8s_clk.c: 734: if (CLK_IT == (uint8_t)CLK_IT_CSSD)
      008352 7B 03            [ 1]  795 	ld	a, (0x03, sp)
      008354 A1 0C            [ 1]  796 	cp	a, #0x0c
      008356 26 05            [ 1]  797 	jrne	00102$
                                    798 ;	core/source/stm8s_clk.c: 737: CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
      008358 72 17 50 C8      [ 1]  799 	bres	20680, #3
      00835C 81               [ 4]  800 	ret
      00835D                        801 00102$:
                                    802 ;	core/source/stm8s_clk.c: 742: CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
      00835D 72 17 50 C5      [ 1]  803 	bres	20677, #3
                                    804 ;	core/source/stm8s_clk.c: 745: }
      008361 81               [ 4]  805 	ret
                                    806 	.area CODE
                                    807 	.area CONST
      008024                        808 _HSIDivFactor:
      008024 01                     809 	.db #0x01	; 1
      008025 02                     810 	.db #0x02	; 2
      008026 04                     811 	.db #0x04	; 4
      008027 08                     812 	.db #0x08	; 8
      008028                        813 _CLKPrescTable:
      008028 01                     814 	.db #0x01	; 1
      008029 02                     815 	.db #0x02	; 2
      00802A 04                     816 	.db #0x04	; 4
      00802B 08                     817 	.db #0x08	; 8
      00802C 0A                     818 	.db #0x0a	; 10
      00802D 10                     819 	.db #0x10	; 16
      00802E 14                     820 	.db #0x14	; 20
      00802F 28                     821 	.db #0x28	; 40
                                    822 	.area INITIALIZER
                                    823 	.area CABS (ABS)
