@ Uppgift 2.3

	@c = 'A'
	LDR	R5,=c
	LDRB	R0,='A'
	STRB	R0, [R5]

	@s = 1000
	LDR	R5,=s
	LDRH	R0,=1000
	STRH	R0, [R5]

	@i = 100000
	LDR	R5,=i
	LDR	R0,=100000
	STR	R0,[R5]

	@Skulle kunna deklarerat i den ordningen som det är (c,s,i) men då
	@Skulle jag behöva lägga till massa .ALIGN som rättningsvillkor
	.ALIGN
i:	.SPACE	4
s:	.SPACE	2
c:	.SPACE	1