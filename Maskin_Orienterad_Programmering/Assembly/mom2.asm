


@Initiera port D som utport


@Adressen till port D:s ut-dataregister till R1
	LDR	R1,=0x40020C14
@Adressen till port E:s in-dataregister till R2
	LDR	R2,=0x40021010

main:	LDRH	R0,[R2]
	STRH	R0,[R1]
	B	main