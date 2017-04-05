

main:	
	LDR	R7,=i
	LDR	R6,=s
	LDR	R0,[R7]
	STRH	R0,[R6]
	B	main

	.ALIGN
i:	.SPACE	4
s:	.SPACE	2