   1              		.syntax unified
   2              		.arch armv6-m
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 0
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.syntax unified
  15              		.file	"startup.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.start_section,"ax",%progbits
  20              		.align	2
  21              		.global	startup
  22              		.code	16
  23              		.thumb_func
  25              	startup:
  26              	.LFB0:
  27              		.file 1 "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.
   1:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** /*
   2:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****  * 	startup.c
   3:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****  *
   4:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****  */
   5:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
   7:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** void startup ( void )
   8:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 	" MOV SP,R0\n"
  12:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 	) ;
  15:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** }
  42              		.loc 1 15 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.text
  50              		.align	2
  51              		.global	appInit
  52              		.code	16
  53              		.thumb_func
  55              	appInit:
  56              	.LFB1:
  16:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
  17:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
  18:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** void appInit(void){
  57              		.loc 1 18 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  19:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     //b7-b4 Output from comp., b3-b0 Input from comp.
  20:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     * ( (unsigned long *) 0x40020C00) = 0x55005555;
  67              		.loc 1 20 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 064A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  21:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     //b7-b4 push-pulll
  22:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     * ( (unsigned long *) 0x40020C05) = 0xF;
  71              		.loc 1 22 0
  72 000a 064B     		ldr	r3, .L3+8
  73 000c 0F22     		movs	r2, #15
  74 000e 1A60     		str	r2, [r3]
  23:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     //b3-b0 pull-down
  24:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     * ( (unsigned long *) 0x40020C0E) = 0xAA;
  75              		.loc 1 24 0
  76 0010 054B     		ldr	r3, .L3+12
  77 0012 AA22     		movs	r2, #170
  78 0014 1A60     		str	r2, [r3]
  25:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     
  26:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** }
  79              		.loc 1 26 0
  80 0016 C046     		nop
  81 0018 BD46     		mov	sp, r7
  82              		@ sp needed
  83 001a 80BD     		pop	{r7, pc}
  84              	.L4:
  85              		.align	2
  86              	.L3:
  87 001c 000C0240 		.word	1073875968
  88 0020 55550055 		.word	1426085205
  89 0024 050C0240 		.word	1073875973
  90 0028 0E0C0240 		.word	1073875982
  91              		.cfi_endproc
  92              	.LFE1:
  94              		.align	2
  95              		.global	activateRow
  96              		.code	16
  97              		.thumb_func
  99              	activateRow:
 100              	.LFB2:
  27:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
  28:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** void activateRow(int row){
 101              		.loc 1 28 0
 102              		.cfi_startproc
 103              		@ args = 0, pretend = 0, frame = 16
 104              		@ frame_needed = 1, uses_anonymous_args = 0
 105 002c 80B5     		push	{r7, lr}
 106              		.cfi_def_cfa_offset 8
 107              		.cfi_offset 7, -8
 108              		.cfi_offset 14, -4
 109 002e 84B0     		sub	sp, sp, #16
 110              		.cfi_def_cfa_offset 24
 111 0030 00AF     		add	r7, sp, #0
 112              		.cfi_def_cfa_register 7
 113 0032 7860     		str	r0, [r7, #4]
  29:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     //b8-b15 output from comp
  30:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     unsigned long *output = 0x40020C15;
 114              		.loc 1 30 0
 115 0034 124B     		ldr	r3, .L13
 116 0036 FB60     		str	r3, [r7, #12]
  31:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     //Make only one of the pins active at the same time;
  32:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     switch(row){
 117              		.loc 1 32 0
 118 0038 7B68     		ldr	r3, [r7, #4]
 119 003a 012B     		cmp	r3, #1
 120 003c 0DD0     		beq	.L7
 121 003e 02DC     		bgt	.L8
 122 0040 002B     		cmp	r3, #0
 123 0042 05D0     		beq	.L9
  33:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 0:
  34:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             *output = 0x10000;
  35:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
  36:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             
  37:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 1:
  38:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             *output = 0x100000;
  39:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
  40:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         
  41:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 2:
  42:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             *output = 0x1000000;
  43:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
  44:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         
  45:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 3:
  46:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             *output = 0x10000000;
  47:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
  48:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }
  49:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** }
 124              		.loc 1 49 0
 125 0044 18E0     		b	.L12
 126              	.L8:
  32:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 0:
 127              		.loc 1 32 0
 128 0046 022B     		cmp	r3, #2
 129 0048 0CD0     		beq	.L10
 130 004a 032B     		cmp	r3, #3
 131 004c 0FD0     		beq	.L11
 132              		.loc 1 49 0
 133 004e 13E0     		b	.L12
 134              	.L9:
  34:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 135              		.loc 1 34 0
 136 0050 FB68     		ldr	r3, [r7, #12]
 137 0052 8022     		movs	r2, #128
 138 0054 5202     		lsls	r2, r2, #9
 139 0056 1A60     		str	r2, [r3]
  35:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             
 140              		.loc 1 35 0
 141 0058 0EE0     		b	.L6
 142              	.L7:
  38:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 143              		.loc 1 38 0
 144 005a FB68     		ldr	r3, [r7, #12]
 145 005c 8022     		movs	r2, #128
 146 005e 5203     		lsls	r2, r2, #13
 147 0060 1A60     		str	r2, [r3]
  39:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         
 148              		.loc 1 39 0
 149 0062 09E0     		b	.L6
 150              	.L10:
  42:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 151              		.loc 1 42 0
 152 0064 FB68     		ldr	r3, [r7, #12]
 153 0066 8022     		movs	r2, #128
 154 0068 5204     		lsls	r2, r2, #17
 155 006a 1A60     		str	r2, [r3]
  43:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         
 156              		.loc 1 43 0
 157 006c 04E0     		b	.L6
 158              	.L11:
  46:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 159              		.loc 1 46 0
 160 006e FB68     		ldr	r3, [r7, #12]
 161 0070 8022     		movs	r2, #128
 162 0072 5205     		lsls	r2, r2, #21
 163 0074 1A60     		str	r2, [r3]
  47:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }
 164              		.loc 1 47 0
 165 0076 C046     		nop
 166              	.L6:
 167              	.L12:
 168              		.loc 1 49 0
 169 0078 C046     		nop
 170 007a BD46     		mov	sp, r7
 171 007c 04B0     		add	sp, sp, #16
 172              		@ sp needed
 173 007e 80BD     		pop	{r7, pc}
 174              	.L14:
 175              		.align	2
 176              	.L13:
 177 0080 150C0240 		.word	1073875989
 178              		.cfi_endproc
 179              	.LFE2:
 181              		.align	2
 182              		.global	readColumn
 183              		.code	16
 184              		.thumb_func
 186              	readColumn:
 187              	.LFB3:
  50:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
  51:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** int readColumn(){
 188              		.loc 1 51 0
 189              		.cfi_startproc
 190              		@ args = 0, pretend = 0, frame = 16
 191              		@ frame_needed = 1, uses_anonymous_args = 0
 192 0084 80B5     		push	{r7, lr}
 193              		.cfi_def_cfa_offset 8
 194              		.cfi_offset 7, -8
 195              		.cfi_offset 14, -4
 196 0086 84B0     		sub	sp, sp, #16
 197              		.cfi_def_cfa_offset 24
 198 0088 00AF     		add	r7, sp, #0
 199              		.cfi_def_cfa_register 7
  52:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     //b3-b0 input from keyboard
  53:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     unsigned long *input = 0x40020C11;
 200              		.loc 1 53 0
 201 008a 134B     		ldr	r3, .L20
 202 008c 7B60     		str	r3, [r7, #4]
  54:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     unsigned short read = *input & 0b1111;
 203              		.loc 1 54 0
 204 008e 7B68     		ldr	r3, [r7, #4]
 205 0090 1B68     		ldr	r3, [r3]
 206 0092 9AB2     		uxth	r2, r3
 207 0094 0E23     		movs	r3, #14
 208 0096 FB18     		adds	r3, r7, r3
 209 0098 0F21     		movs	r1, #15
 210 009a 0A40     		ands	r2, r1
 211 009c 1A80     		strh	r2, [r3]
 212              	.LBB2:
  55:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     for(int i = 0;i < 4;i++){
 213              		.loc 1 55 0
 214 009e 0023     		movs	r3, #0
 215 00a0 BB60     		str	r3, [r7, #8]
 216 00a2 11E0     		b	.L16
 217              	.L19:
  56:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         if((read & 0b1) == 0b1){
 218              		.loc 1 56 0
 219 00a4 0E23     		movs	r3, #14
 220 00a6 FB18     		adds	r3, r7, r3
 221 00a8 1B88     		ldrh	r3, [r3]
 222 00aa 0122     		movs	r2, #1
 223 00ac 1340     		ands	r3, r2
 224 00ae 01D0     		beq	.L17
  57:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             return i;
 225              		.loc 1 57 0
 226 00b0 BB68     		ldr	r3, [r7, #8]
 227 00b2 0DE0     		b	.L18
 228              	.L17:
  58:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         }else{
  59:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****            read = read>>1; 
 229              		.loc 1 59 0 discriminator 2
 230 00b4 0E23     		movs	r3, #14
 231 00b6 FB18     		adds	r3, r7, r3
 232 00b8 0E22     		movs	r2, #14
 233 00ba BA18     		adds	r2, r7, r2
 234 00bc 1288     		ldrh	r2, [r2]
 235 00be 5208     		lsrs	r2, r2, #1
 236 00c0 1A80     		strh	r2, [r3]
  55:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         if((read & 0b1) == 0b1){
 237              		.loc 1 55 0 discriminator 2
 238 00c2 BB68     		ldr	r3, [r7, #8]
 239 00c4 0133     		adds	r3, r3, #1
 240 00c6 BB60     		str	r3, [r7, #8]
 241              	.L16:
  55:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         if((read & 0b1) == 0b1){
 242              		.loc 1 55 0 is_stmt 0 discriminator 1
 243 00c8 BB68     		ldr	r3, [r7, #8]
 244 00ca 032B     		cmp	r3, #3
 245 00cc EADD     		ble	.L19
 246              	.LBE2:
  60:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         }
  61:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }
  62:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     return 0;
 247              		.loc 1 62 0 is_stmt 1
 248 00ce 0023     		movs	r3, #0
 249              	.L18:
  63:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** }
 250              		.loc 1 63 0
 251 00d0 1800     		movs	r0, r3
 252 00d2 BD46     		mov	sp, r7
 253 00d4 04B0     		add	sp, sp, #16
 254              		@ sp needed
 255 00d6 80BD     		pop	{r7, pc}
 256              	.L21:
 257              		.align	2
 258              	.L20:
 259 00d8 110C0240 		.word	1073875985
 260              		.cfi_endproc
 261              	.LFE3:
 263              		.align	2
 264              		.global	keyValue
 265              		.code	16
 266              		.thumb_func
 268              	keyValue:
 269              	.LFB4:
  64:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
  65:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** int keyValue(int row, int column){
 270              		.loc 1 65 0
 271              		.cfi_startproc
 272              		@ args = 0, pretend = 0, frame = 16
 273              		@ frame_needed = 1, uses_anonymous_args = 0
 274 00dc 80B5     		push	{r7, lr}
 275              		.cfi_def_cfa_offset 8
 276              		.cfi_offset 7, -8
 277              		.cfi_offset 14, -4
 278 00de 84B0     		sub	sp, sp, #16
 279              		.cfi_def_cfa_offset 24
 280 00e0 00AF     		add	r7, sp, #0
 281              		.cfi_def_cfa_register 7
 282 00e2 7860     		str	r0, [r7, #4]
 283 00e4 3960     		str	r1, [r7]
  66:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     int keyValue;
  67:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     if(row == 0){
 284              		.loc 1 67 0
 285 00e6 7B68     		ldr	r3, [r7, #4]
 286 00e8 002B     		cmp	r3, #0
 287 00ea 18D1     		bne	.L23
  68:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         switch(column){
 288              		.loc 1 68 0
 289 00ec 3B68     		ldr	r3, [r7]
 290 00ee 012B     		cmp	r3, #1
 291 00f0 0BD0     		beq	.L25
 292 00f2 02DC     		bgt	.L26
 293 00f4 002B     		cmp	r3, #0
 294 00f6 05D0     		beq	.L27
 295 00f8 64E0     		b	.L30
 296              	.L26:
 297 00fa 022B     		cmp	r3, #2
 298 00fc 08D0     		beq	.L28
 299 00fe 032B     		cmp	r3, #3
 300 0100 09D0     		beq	.L29
 301 0102 5FE0     		b	.L30
 302              	.L27:
  69:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 0:
  70:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 1;
 303              		.loc 1 70 0
 304 0104 0123     		movs	r3, #1
 305 0106 FB60     		str	r3, [r7, #12]
  71:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 306              		.loc 1 71 0
 307 0108 5CE0     		b	.L30
 308              	.L25:
  72:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 1:
  73:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 2;
 309              		.loc 1 73 0
 310 010a 0223     		movs	r3, #2
 311 010c FB60     		str	r3, [r7, #12]
  74:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 312              		.loc 1 74 0
 313 010e 59E0     		b	.L30
 314              	.L28:
  75:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 2:
  76:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 3;
 315              		.loc 1 76 0
 316 0110 0323     		movs	r3, #3
 317 0112 FB60     		str	r3, [r7, #12]
  77:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 318              		.loc 1 77 0
 319 0114 56E0     		b	.L30
 320              	.L29:
  78:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 3:
  79:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 10;
 321              		.loc 1 79 0
 322 0116 0A23     		movs	r3, #10
 323 0118 FB60     		str	r3, [r7, #12]
  80:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 324              		.loc 1 80 0
 325 011a C046     		nop
 326 011c 52E0     		b	.L30
 327              	.L23:
  81:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             
  82:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         }
  83:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }else if(row == 1){
 328              		.loc 1 83 0
 329 011e 7B68     		ldr	r3, [r7, #4]
 330 0120 012B     		cmp	r3, #1
 331 0122 18D1     		bne	.L31
  84:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         switch(column){
 332              		.loc 1 84 0
 333 0124 3B68     		ldr	r3, [r7]
 334 0126 012B     		cmp	r3, #1
 335 0128 0BD0     		beq	.L33
 336 012a 02DC     		bgt	.L34
 337 012c 002B     		cmp	r3, #0
 338 012e 05D0     		beq	.L35
 339 0130 48E0     		b	.L30
 340              	.L34:
 341 0132 022B     		cmp	r3, #2
 342 0134 08D0     		beq	.L36
 343 0136 032B     		cmp	r3, #3
 344 0138 09D0     		beq	.L37
 345 013a 43E0     		b	.L30
 346              	.L35:
  85:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 0:
  86:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 4;
 347              		.loc 1 86 0
 348 013c 0423     		movs	r3, #4
 349 013e FB60     		str	r3, [r7, #12]
  87:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 350              		.loc 1 87 0
 351 0140 40E0     		b	.L30
 352              	.L33:
  88:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 1:
  89:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 5;
 353              		.loc 1 89 0
 354 0142 0523     		movs	r3, #5
 355 0144 FB60     		str	r3, [r7, #12]
  90:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 356              		.loc 1 90 0
 357 0146 3DE0     		b	.L30
 358              	.L36:
  91:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 2:
  92:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 6;
 359              		.loc 1 92 0
 360 0148 0623     		movs	r3, #6
 361 014a FB60     		str	r3, [r7, #12]
  93:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 362              		.loc 1 93 0
 363 014c 3AE0     		b	.L30
 364              	.L37:
  94:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 3:
  95:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 11;
 365              		.loc 1 95 0
 366 014e 0B23     		movs	r3, #11
 367 0150 FB60     		str	r3, [r7, #12]
  96:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 368              		.loc 1 96 0
 369 0152 C046     		nop
 370 0154 36E0     		b	.L30
 371              	.L31:
  97:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             
  98:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         }
  99:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }else if(row == 2){
 372              		.loc 1 99 0
 373 0156 7B68     		ldr	r3, [r7, #4]
 374 0158 022B     		cmp	r3, #2
 375 015a 18D1     		bne	.L38
 100:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         switch(column){
 376              		.loc 1 100 0
 377 015c 3B68     		ldr	r3, [r7]
 378 015e 012B     		cmp	r3, #1
 379 0160 0BD0     		beq	.L40
 380 0162 02DC     		bgt	.L41
 381 0164 002B     		cmp	r3, #0
 382 0166 05D0     		beq	.L42
 383 0168 2CE0     		b	.L30
 384              	.L41:
 385 016a 022B     		cmp	r3, #2
 386 016c 08D0     		beq	.L43
 387 016e 032B     		cmp	r3, #3
 388 0170 09D0     		beq	.L44
 389 0172 27E0     		b	.L30
 390              	.L42:
 101:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 0:
 102:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 7;
 391              		.loc 1 102 0
 392 0174 0723     		movs	r3, #7
 393 0176 FB60     		str	r3, [r7, #12]
 103:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 394              		.loc 1 103 0
 395 0178 24E0     		b	.L30
 396              	.L40:
 104:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 1:
 105:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 8;
 397              		.loc 1 105 0
 398 017a 0823     		movs	r3, #8
 399 017c FB60     		str	r3, [r7, #12]
 106:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 400              		.loc 1 106 0
 401 017e 21E0     		b	.L30
 402              	.L43:
 107:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 2:
 108:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 9;
 403              		.loc 1 108 0
 404 0180 0923     		movs	r3, #9
 405 0182 FB60     		str	r3, [r7, #12]
 109:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 406              		.loc 1 109 0
 407 0184 1EE0     		b	.L30
 408              	.L44:
 110:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 3:
 111:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 12;
 409              		.loc 1 111 0
 410 0186 0C23     		movs	r3, #12
 411 0188 FB60     		str	r3, [r7, #12]
 112:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 412              		.loc 1 112 0
 413 018a C046     		nop
 414 018c 1AE0     		b	.L30
 415              	.L38:
 113:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             
 114:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         }
 115:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }else if(row == 3){
 416              		.loc 1 115 0
 417 018e 7B68     		ldr	r3, [r7, #4]
 418 0190 032B     		cmp	r3, #3
 419 0192 17D1     		bne	.L30
 116:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         switch(column){
 420              		.loc 1 116 0
 421 0194 3B68     		ldr	r3, [r7]
 422 0196 012B     		cmp	r3, #1
 423 0198 0BD0     		beq	.L45
 424 019a 02DC     		bgt	.L46
 425 019c 002B     		cmp	r3, #0
 426 019e 05D0     		beq	.L47
 427 01a0 10E0     		b	.L30
 428              	.L46:
 429 01a2 022B     		cmp	r3, #2
 430 01a4 08D0     		beq	.L48
 431 01a6 032B     		cmp	r3, #3
 432 01a8 09D0     		beq	.L49
 433 01aa 0BE0     		b	.L30
 434              	.L47:
 117:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 0:
 118:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 14;
 435              		.loc 1 118 0
 436 01ac 0E23     		movs	r3, #14
 437 01ae FB60     		str	r3, [r7, #12]
 119:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 438              		.loc 1 119 0
 439 01b0 08E0     		b	.L30
 440              	.L45:
 120:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 1:
 121:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 0;
 441              		.loc 1 121 0
 442 01b2 0023     		movs	r3, #0
 443 01b4 FB60     		str	r3, [r7, #12]
 122:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 444              		.loc 1 122 0
 445 01b6 05E0     		b	.L30
 446              	.L48:
 123:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 2:
 124:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 15;
 447              		.loc 1 124 0
 448 01b8 0F23     		movs	r3, #15
 449 01ba FB60     		str	r3, [r7, #12]
 125:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 450              		.loc 1 125 0
 451 01bc 02E0     		b	.L30
 452              	.L49:
 126:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             case 3:
 127:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 keyValue = 13;
 453              		.loc 1 127 0
 454 01be 0D23     		movs	r3, #13
 455 01c0 FB60     		str	r3, [r7, #12]
 128:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****                 break;
 456              		.loc 1 128 0
 457 01c2 C046     		nop
 458              	.L30:
 129:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             
 130:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         }
 131:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }
 132:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     return keyValue;
 459              		.loc 1 132 0
 460 01c4 FB68     		ldr	r3, [r7, #12]
 133:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** }
 461              		.loc 1 133 0
 462 01c6 1800     		movs	r0, r3
 463 01c8 BD46     		mov	sp, r7
 464 01ca 04B0     		add	sp, sp, #16
 465              		@ sp needed
 466 01cc 80BD     		pop	{r7, pc}
 467              		.cfi_endproc
 468              	.LFE4:
 470 01ce C046     		.align	2
 471              		.global	keyb
 472              		.code	16
 473              		.thumb_func
 475              	keyb:
 476              	.LFB5:
 134:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
 135:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** unsigned char keyb(void){
 477              		.loc 1 135 0
 478              		.cfi_startproc
 479              		@ args = 0, pretend = 0, frame = 8
 480              		@ frame_needed = 1, uses_anonymous_args = 0
 481 01d0 80B5     		push	{r7, lr}
 482              		.cfi_def_cfa_offset 8
 483              		.cfi_offset 7, -8
 484              		.cfi_offset 14, -4
 485 01d2 82B0     		sub	sp, sp, #8
 486              		.cfi_def_cfa_offset 16
 487 01d4 00AF     		add	r7, sp, #0
 488              		.cfi_def_cfa_register 7
 489              	.LBB3:
 136:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     for(int row = 0;row < 4;row++){
 490              		.loc 1 136 0
 491 01d6 0023     		movs	r3, #0
 492 01d8 7B60     		str	r3, [r7, #4]
 493 01da 16E0     		b	.L52
 494              	.L55:
 495              	.LBB4:
 137:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         activateRow(row);
 496              		.loc 1 137 0
 497 01dc 7B68     		ldr	r3, [r7, #4]
 498 01de 1800     		movs	r0, r3
 499 01e0 FFF7FEFF 		bl	activateRow
 138:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         int column = readColumn();
 500              		.loc 1 138 0
 501 01e4 FFF7FEFF 		bl	readColumn
 502 01e8 0300     		movs	r3, r0
 503 01ea 3B60     		str	r3, [r7]
 139:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         if(column != 0){
 504              		.loc 1 139 0
 505 01ec 3B68     		ldr	r3, [r7]
 506 01ee 002B     		cmp	r3, #0
 507 01f0 08D0     		beq	.L53
 140:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             return keyValue(row,column);
 508              		.loc 1 140 0
 509 01f2 3A68     		ldr	r2, [r7]
 510 01f4 7B68     		ldr	r3, [r7, #4]
 511 01f6 1100     		movs	r1, r2
 512 01f8 1800     		movs	r0, r3
 513 01fa FFF7FEFF 		bl	keyValue
 514 01fe 0300     		movs	r3, r0
 515 0200 DBB2     		uxtb	r3, r3
 516 0202 06E0     		b	.L54
 517              	.L53:
 518              	.LBE4:
 136:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         activateRow(row);
 519              		.loc 1 136 0 discriminator 2
 520 0204 7B68     		ldr	r3, [r7, #4]
 521 0206 0133     		adds	r3, r3, #1
 522 0208 7B60     		str	r3, [r7, #4]
 523              	.L52:
 136:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         activateRow(row);
 524              		.loc 1 136 0 is_stmt 0 discriminator 1
 525 020a 7B68     		ldr	r3, [r7, #4]
 526 020c 032B     		cmp	r3, #3
 527 020e E5DD     		ble	.L55
 528              	.LBE3:
 141:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         }
 142:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }
 143:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     return 0xFF;
 529              		.loc 1 143 0 is_stmt 1
 530 0210 FF23     		movs	r3, #255
 531              	.L54:
 144:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** }
 532              		.loc 1 144 0
 533 0212 1800     		movs	r0, r3
 534 0214 BD46     		mov	sp, r7
 535 0216 02B0     		add	sp, sp, #8
 536              		@ sp needed
 537 0218 80BD     		pop	{r7, pc}
 538              		.cfi_endproc
 539              	.LFE5:
 541 021a C046     		.align	2
 542              		.global	out7seg
 543              		.code	16
 544              		.thumb_func
 546              	out7seg:
 547              	.LFB6:
 145:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
 146:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** void out7seg(unsigned char c){
 548              		.loc 1 146 0
 549              		.cfi_startproc
 550              		@ args = 0, pretend = 0, frame = 16
 551              		@ frame_needed = 1, uses_anonymous_args = 0
 552 021c 80B5     		push	{r7, lr}
 553              		.cfi_def_cfa_offset 8
 554              		.cfi_offset 7, -8
 555              		.cfi_offset 14, -4
 556 021e 84B0     		sub	sp, sp, #16
 557              		.cfi_def_cfa_offset 24
 558 0220 00AF     		add	r7, sp, #0
 559              		.cfi_def_cfa_register 7
 560 0222 0200     		movs	r2, r0
 561 0224 FB1D     		adds	r3, r7, #7
 562 0226 1A70     		strb	r2, [r3]
 147:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     //b0-b7 output from comp to hexDisplay
 148:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     unsigned long *output = 0x40020C14;
 563              		.loc 1 148 0
 564 0228 314B     		ldr	r3, .L75
 565 022a BB60     		str	r3, [r7, #8]
 149:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     unsigned short hexValue; 
 150:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     switch(c){
 566              		.loc 1 150 0
 567 022c FB1D     		adds	r3, r7, #7
 568 022e 1B78     		ldrb	r3, [r3]
 569 0230 0F2B     		cmp	r3, #15
 570 0232 54D8     		bhi	.L57
 571 0234 9A00     		lsls	r2, r3, #2
 572 0236 2F4B     		ldr	r3, .L75+4
 573 0238 D318     		adds	r3, r2, r3
 574 023a 1B68     		ldr	r3, [r3]
 575 023c 9F46     		mov	pc, r3
 576              		.section	.rodata
 577              		.align	2
 578              	.L59:
 579 0000 3E020000 		.word	.L58
 580 0004 48020000 		.word	.L60
 581 0008 52020000 		.word	.L61
 582 000c 5C020000 		.word	.L62
 583 0010 66020000 		.word	.L63
 584 0014 70020000 		.word	.L64
 585 0018 7A020000 		.word	.L65
 586 001c 84020000 		.word	.L66
 587 0020 8E020000 		.word	.L67
 588 0024 98020000 		.word	.L68
 589 0028 A2020000 		.word	.L69
 590 002c AC020000 		.word	.L70
 591 0030 B6020000 		.word	.L71
 592 0034 C0020000 		.word	.L72
 593 0038 CA020000 		.word	.L73
 594 003c D4020000 		.word	.L74
 595              		.text
 596              	.L58:
 151:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 0:
 152:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x3F;
 597              		.loc 1 152 0
 598 023e 0E23     		movs	r3, #14
 599 0240 FB18     		adds	r3, r7, r3
 600 0242 3F22     		movs	r2, #63
 601 0244 1A80     		strh	r2, [r3]
 153:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 602              		.loc 1 153 0
 603 0246 4AE0     		b	.L57
 604              	.L60:
 154:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 1:
 155:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x06;
 605              		.loc 1 155 0
 606 0248 0E23     		movs	r3, #14
 607 024a FB18     		adds	r3, r7, r3
 608 024c 0622     		movs	r2, #6
 609 024e 1A80     		strh	r2, [r3]
 156:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 610              		.loc 1 156 0
 611 0250 45E0     		b	.L57
 612              	.L61:
 157:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 2:
 158:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x5B;
 613              		.loc 1 158 0
 614 0252 0E23     		movs	r3, #14
 615 0254 FB18     		adds	r3, r7, r3
 616 0256 5B22     		movs	r2, #91
 617 0258 1A80     		strh	r2, [r3]
 159:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 618              		.loc 1 159 0
 619 025a 40E0     		b	.L57
 620              	.L62:
 160:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 3:
 161:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x8F;
 621              		.loc 1 161 0
 622 025c 0E23     		movs	r3, #14
 623 025e FB18     		adds	r3, r7, r3
 624 0260 8F22     		movs	r2, #143
 625 0262 1A80     		strh	r2, [r3]
 162:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 626              		.loc 1 162 0
 627 0264 3BE0     		b	.L57
 628              	.L63:
 163:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 4:
 164:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x66;
 629              		.loc 1 164 0
 630 0266 0E23     		movs	r3, #14
 631 0268 FB18     		adds	r3, r7, r3
 632 026a 6622     		movs	r2, #102
 633 026c 1A80     		strh	r2, [r3]
 165:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 634              		.loc 1 165 0
 635 026e 36E0     		b	.L57
 636              	.L64:
 166:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 5:
 167:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x6D;
 637              		.loc 1 167 0
 638 0270 0E23     		movs	r3, #14
 639 0272 FB18     		adds	r3, r7, r3
 640 0274 6D22     		movs	r2, #109
 641 0276 1A80     		strh	r2, [r3]
 168:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 642              		.loc 1 168 0
 643 0278 31E0     		b	.L57
 644              	.L65:
 169:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 6:
 170:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x7D;
 645              		.loc 1 170 0
 646 027a 0E23     		movs	r3, #14
 647 027c FB18     		adds	r3, r7, r3
 648 027e 7D22     		movs	r2, #125
 649 0280 1A80     		strh	r2, [r3]
 171:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 650              		.loc 1 171 0
 651 0282 2CE0     		b	.L57
 652              	.L66:
 172:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 7:
 173:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x07;
 653              		.loc 1 173 0
 654 0284 0E23     		movs	r3, #14
 655 0286 FB18     		adds	r3, r7, r3
 656 0288 0722     		movs	r2, #7
 657 028a 1A80     		strh	r2, [r3]
 174:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 658              		.loc 1 174 0
 659 028c 27E0     		b	.L57
 660              	.L67:
 175:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 8:
 176:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x7F;
 661              		.loc 1 176 0
 662 028e 0E23     		movs	r3, #14
 663 0290 FB18     		adds	r3, r7, r3
 664 0292 7F22     		movs	r2, #127
 665 0294 1A80     		strh	r2, [r3]
 177:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 666              		.loc 1 177 0
 667 0296 22E0     		b	.L57
 668              	.L68:
 178:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 9:
 179:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x67;
 669              		.loc 1 179 0
 670 0298 0E23     		movs	r3, #14
 671 029a FB18     		adds	r3, r7, r3
 672 029c 6722     		movs	r2, #103
 673 029e 1A80     		strh	r2, [r3]
 180:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 674              		.loc 1 180 0
 675 02a0 1DE0     		b	.L57
 676              	.L69:
 181:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 10:
 182:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0xF7;
 677              		.loc 1 182 0
 678 02a2 0E23     		movs	r3, #14
 679 02a4 FB18     		adds	r3, r7, r3
 680 02a6 F722     		movs	r2, #247
 681 02a8 1A80     		strh	r2, [r3]
 183:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 682              		.loc 1 183 0
 683 02aa 18E0     		b	.L57
 684              	.L70:
 184:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 11:
 185:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x7F;
 685              		.loc 1 185 0
 686 02ac 0E23     		movs	r3, #14
 687 02ae FB18     		adds	r3, r7, r3
 688 02b0 7F22     		movs	r2, #127
 689 02b2 1A80     		strh	r2, [r3]
 186:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 690              		.loc 1 186 0
 691 02b4 13E0     		b	.L57
 692              	.L71:
 187:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 12:
 188:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x39;
 693              		.loc 1 188 0
 694 02b6 0E23     		movs	r3, #14
 695 02b8 FB18     		adds	r3, r7, r3
 696 02ba 3922     		movs	r2, #57
 697 02bc 1A80     		strh	r2, [r3]
 189:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 698              		.loc 1 189 0
 699 02be 0EE0     		b	.L57
 700              	.L72:
 190:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 13:
 191:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x3F;
 701              		.loc 1 191 0
 702 02c0 0E23     		movs	r3, #14
 703 02c2 FB18     		adds	r3, r7, r3
 704 02c4 3F22     		movs	r2, #63
 705 02c6 1A80     		strh	r2, [r3]
 192:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 706              		.loc 1 192 0
 707 02c8 09E0     		b	.L57
 708              	.L73:
 193:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 14:
 194:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x79;
 709              		.loc 1 194 0
 710 02ca 0E23     		movs	r3, #14
 711 02cc FB18     		adds	r3, r7, r3
 712 02ce 7922     		movs	r2, #121
 713 02d0 1A80     		strh	r2, [r3]
 195:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 714              		.loc 1 195 0
 715 02d2 04E0     		b	.L57
 716              	.L74:
 196:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         case 15:
 197:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             hexValue = 0x71;
 717              		.loc 1 197 0
 718 02d4 0E23     		movs	r3, #14
 719 02d6 FB18     		adds	r3, r7, r3
 720 02d8 7122     		movs	r2, #113
 721 02da 1A80     		strh	r2, [r3]
 198:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****             break;
 722              		.loc 1 198 0
 723 02dc C046     		nop
 724              	.L57:
 199:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }
 200:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
 201:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     *output = hexValue;
 725              		.loc 1 201 0
 726 02de 0E23     		movs	r3, #14
 727 02e0 FB18     		adds	r3, r7, r3
 728 02e2 1A88     		ldrh	r2, [r3]
 729 02e4 BB68     		ldr	r3, [r7, #8]
 730 02e6 1A60     		str	r2, [r3]
 202:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** }
 731              		.loc 1 202 0
 732 02e8 C046     		nop
 733 02ea BD46     		mov	sp, r7
 734 02ec 04B0     		add	sp, sp, #16
 735              		@ sp needed
 736 02ee 80BD     		pop	{r7, pc}
 737              	.L76:
 738              		.align	2
 739              	.L75:
 740 02f0 140C0240 		.word	1073875988
 741 02f4 00000000 		.word	.L59
 742              		.cfi_endproc
 743              	.LFE6:
 745              		.align	2
 746              		.global	main
 747              		.code	16
 748              		.thumb_func
 750              	main:
 751              	.LFB7:
 203:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
 204:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** 
 205:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c **** int main(void){
 752              		.loc 1 205 0
 753              		.cfi_startproc
 754              		@ args = 0, pretend = 0, frame = 0
 755              		@ frame_needed = 1, uses_anonymous_args = 0
 756 02f8 80B5     		push	{r7, lr}
 757              		.cfi_def_cfa_offset 8
 758              		.cfi_offset 7, -8
 759              		.cfi_offset 14, -4
 760 02fa 00AF     		add	r7, sp, #0
 761              		.cfi_def_cfa_register 7
 206:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     appInit();
 762              		.loc 1 206 0
 763 02fc FFF7FEFF 		bl	appInit
 764              	.L78:
 207:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     while(1){
 208:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         *( (unsigned char *) 0x40020C14) = 0x3F;
 765              		.loc 1 208 0 discriminator 1
 766 0300 014B     		ldr	r3, .L79
 767 0302 3F22     		movs	r2, #63
 768 0304 1A70     		strb	r2, [r3]
 209:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****         //out7seg(keyb());
 210:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/keypad/startup.c ****     }
 769              		.loc 1 210 0 discriminator 1
 770 0306 FBE7     		b	.L78
 771              	.L80:
 772              		.align	2
 773              	.L79:
 774 0308 140C0240 		.word	1073875988
 775              		.cfi_endproc
 776              	.LFE7:
 778              	.Letext0:
