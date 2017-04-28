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
  27              		.file 1 "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startu
   1:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** /*
   2:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****  * 	startup.c
   3:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****  *
   4:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****  */
   5:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** 
   7:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** void startup ( void )
   8:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c" 
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** 	" MOV SP,R0\n"
  12:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** 	) ;
  15:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** }
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
  16:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** 
  17:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** void appInit(void){
  57              		.loc 1 17 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  18:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****     * ( (unsigned long *) 0x40020C00) = 0x00005555;
  67              		.loc 1 18 0
  68 0004 024B     		ldr	r3, .L3
  69 0006 034A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  19:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** }
  71              		.loc 1 19 0
  72 000a C046     		nop
  73 000c BD46     		mov	sp, r7
  74              		@ sp needed
  75 000e 80BD     		pop	{r7, pc}
  76              	.L4:
  77              		.align	2
  78              	.L3:
  79 0010 000C0240 		.word	1073875968
  80 0014 55550000 		.word	21845
  81              		.cfi_endproc
  82              	.LFE1:
  84              		.align	2
  85              		.global	main
  86              		.code	16
  87              		.thumb_func
  89              	main:
  90              	.LFB2:
  20:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** 
  21:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c **** int main(void){
  91              		.loc 1 21 0
  92              		.cfi_startproc
  93              		@ args = 0, pretend = 0, frame = 8
  94              		@ frame_needed = 1, uses_anonymous_args = 0
  95 0018 80B5     		push	{r7, lr}
  96              		.cfi_def_cfa_offset 8
  97              		.cfi_offset 7, -8
  98              		.cfi_offset 14, -4
  99 001a 82B0     		sub	sp, sp, #8
 100              		.cfi_def_cfa_offset 16
 101 001c 00AF     		add	r7, sp, #0
 102              		.cfi_def_cfa_register 7
  22:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****     unsigned char c;
  23:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****     appInit();
 103              		.loc 1 23 0
 104 001e FFF7FEFF 		bl	appInit
 105              	.L6:
  24:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****     while(1){
  25:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****         c = (unsigned char) * ( (unsigned short *) 0x40021010);
 106              		.loc 1 25 0 discriminator 1
 107 0022 044B     		ldr	r3, .L7
 108 0024 1A88     		ldrh	r2, [r3]
 109 0026 FB1D     		adds	r3, r7, #7
 110 0028 1A70     		strb	r2, [r3]
  26:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****         * ( (unsigned char *) 0x40020C14) = c;
 111              		.loc 1 26 0 discriminator 1
 112 002a 034A     		ldr	r2, .L7+4
 113 002c FB1D     		adds	r3, r7, #7
 114 002e 1B78     		ldrb	r3, [r3]
 115 0030 1370     		strb	r3, [r2]
  27:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****         
  28:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/Moplaborationer/basic_io/startup.c ****     }
 116              		.loc 1 28 0 discriminator 1
 117 0032 F6E7     		b	.L6
 118              	.L8:
 119              		.align	2
 120              	.L7:
 121 0034 10100240 		.word	1073877008
 122 0038 140C0240 		.word	1073875988
 123              		.cfi_endproc
 124              	.LFE2:
 126              	.Letext0:
