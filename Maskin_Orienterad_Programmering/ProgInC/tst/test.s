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
  27              		.file 1 "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c"
   1:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** /*
   2:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c ****  * 	startup.c
   3:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c ****  *
   4:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c ****  */
   5:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** 
   7:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** void startup ( void )
   8:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** 	" MOV SP,R0\n"
  12:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** 	) ;
  15:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** }
  42              		.loc 1 15 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.text
  50              		.align	2
  51              		.global	main
  52              		.code	16
  53              		.thumb_func
  55              	main:
  56              	.LFB1:
  16:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** 
  17:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** void main(void)
  18:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** {
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
  19:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/ProgInC/tst/startup.c **** }
  67              		.loc 1 19 0
  68 0004 C046     		nop
  69 0006 BD46     		mov	sp, r7
  70              		@ sp needed
  71 0008 80BD     		pop	{r7, pc}
  72              		.cfi_endproc
  73              	.LFE1:
  75              	.Letext0:
