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
  19              		.section	.rodata
  20              		.align	2
  21              	.LC0:
  22 0000 41676520 		.ascii	"Age %i\000"
  22      256900
  23              		.text
  24              		.align	2
  25              		.global	main
  26              		.code	16
  27              		.thumb_func
  29              	main:
  30              	.LFB1:
  31              		.file 1 "/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/Testing/
   1:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/Testing/startup.c **** #include <stdio.h>
   2:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/Testing/startup.c **** 
   3:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/Testing/startup.c **** void main(void){
  32              		.loc 1 3 0
  33              		.cfi_startproc
  34              		@ args = 0, pretend = 0, frame = 0
  35              		@ frame_needed = 1, uses_anonymous_args = 0
  36 0000 80B5     		push	{r7, lr}
  37              		.cfi_def_cfa_offset 8
  38              		.cfi_offset 7, -8
  39              		.cfi_offset 14, -4
  40 0002 00AF     		add	r7, sp, #0
  41              		.cfi_def_cfa_register 7
   4:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/Testing/startup.c ****     printf("Age %i",15);
  42              		.loc 1 4 0
  43 0004 034B     		ldr	r3, .L2
  44 0006 0F21     		movs	r1, #15
  45 0008 1800     		movs	r0, r3
  46 000a FFF7FEFF 		bl	printf
   5:/Users/isak/code/Chalmers/Maskin_Orienterad_Programmering/SDLProjekt_Mac_startup/Testing/startup.c **** }
  47              		.loc 1 5 0
  48 000e C046     		nop
  49 0010 BD46     		mov	sp, r7
  50              		@ sp needed
  51 0012 80BD     		pop	{r7, pc}
  52              	.L3:
  53              		.align	2
  54              	.L2:
  55 0014 00000000 		.word	.LC0
  56              		.cfi_endproc
  57              	.LFE1:
  59              	.Letext0:
