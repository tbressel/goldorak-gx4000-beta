


; //////////////////////////////////////////////////////////////////
; /////////////////////////  LES SOUCOUPES  ////////////////////////
; //////////////////////////////////////////////////////////////////
SOUCOUPES_NBR_VARIABLE_TBL = 34

; les bonus après avoir tuée 1 soucoupe
	ITEM_AJOUTE_1VIE		equ		128
	ITEM_FULL_NRJ			equ		118
	ITEM_10_PTS				equ		10
	ITEM_20_PTS				equ		20
	ITEM_50_PTS				equ		50
	ITEM_100_PTS			equ		100
	ITEM_500_PTS			equ		60			; 60 a été choisit car 500 n'est pas sur 8 bits
	ITEM_BOMB				equ		70
	ITEM_POWERUP			equ		80

; Caracteristique des soucoupes ennemis
; pas utiliser de valeur avec un BIT 7 à 1, qui esttesté dans le test de débit des points de vie



	SOUCOUPE_VERTE_SPRH_ROM_ADR			equ		#D800
	PV_SOUCOUPE_VERTE					equ		0		; simple soucoupe
	TIR_SOUCOUPE_VERTE					equ		0

	SOUCOUPE_ORANGE_SPRH_ROM_ADR		equ		#D900
	PV_SOUCOUPE_ORANGE					equ		2		; simple soucoupe
	TIR_SOUCOUPE_ORANGE					equ		0
	
	SOUCOUPE_BLEUE_SPRH_ROM_ADR			equ		#DA00
	PV_SOUCOUPE_BLEUE					equ		3		; soucoupe qui tire
	TIR_SOUCOUPE_BLEUE					equ		1

	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR		equ		#DB00
	PV_SOUCOUPE_VIOLETTE				equ		4		; simple soucoupe
	TIR_SOUCOUPE_VIOLETTE				equ		0
	
	SOUCOUPE_BLEUE_RAYEE_SPRH_ROM_ADR	equ		#DC00
	PV_SOUCOUPE_BLEUE_RAYEE				equ		5		; simple soucoupe
	TIR_SOUCOUPE_BLEUE_RAYEE			equ		0

	SOUCOUPE_QUI_TOURNE_HAUT_SPRH_ROM_ADR	equ		#D400
	SOUCOUPE_QUI_TOURNE_BAS_SPRH_ROM_ADR	equ		#D400
	PV_SOUCOUPE_QUI_TOURNE					equ		6		; simple soucoupe
	TIR_SOUCOUPE_QUI_TOURNE					equ		0


	TIR_SPRH_SOUCOUPES						equ		#FD00

	VAL_DECALAGE_PNTR_TBL_ARCDECERCLE_BASDROITE	= 416

	VITESSE_TIR_SOUCOUPE_Y_HAUT			=		-4
	VITESSE_TIR_SOUCOUPE_Y_BAS			=		4
	VITESSE_TIR_SOUCOUPE_X_GAUCHE		=		-10
	VITESSE_TIR_SOUCOUPE_X_DROITE		=		10


    
VAGUE_TIME_START_SLOW			equ		#b0
VAGUE_TIME_START_NORMAL			equ		#90
VAGUE_TIME_START_QUICK			equ		#80
VAGUE_TIME_START_VERY_QUICK		equ		#70
VAGUE_TIME_END					equ		#16


vague1s = #0490
vague1e = vague1s+VAGUE_TIME_START_SLOW
vague2s = vague1e+VAGUE_TIME_END
vague2e = vague2s+VAGUE_TIME_START_SLOW
vague3s = vague2e+VAGUE_TIME_END
vague3e = vague3s+VAGUE_TIME_START_SLOW
vague4s = vague3e+VAGUE_TIME_END
vague4e = vague4s+VAGUE_TIME_START_SLOW
vague5s = vague4e+VAGUE_TIME_END
vague5e = vague5s+VAGUE_TIME_START_SLOW
vague6s = vague5e+VAGUE_TIME_END
vague6e = vague6s+VAGUE_TIME_START_SLOW
vague7s = vague6e+VAGUE_TIME_END
vague7e = vague7s+VAGUE_TIME_START_SLOW
vague8s = vague7e+VAGUE_TIME_END
vague8e = vague8s+VAGUE_TIME_START_SLOW
vague9s = vague8e+VAGUE_TIME_END
vague9e = vague9s+VAGUE_TIME_START_SLOW
vague10s = vague9e+VAGUE_TIME_END
vague10e = vague10s+VAGUE_TIME_START_NORMAL
vague11s = vague10e+VAGUE_TIME_END
vague11e = vague11s+VAGUE_TIME_START_NORMAL
vague12s = vague11e+VAGUE_TIME_END
vague12e = vague12s+VAGUE_TIME_START_NORMAL
vague13s = vague12e+VAGUE_TIME_END
vague13e = vague13s+VAGUE_TIME_START_NORMAL
vague14s = vague13e+VAGUE_TIME_END
vague14e = vague14s+VAGUE_TIME_START_NORMAL
vague15s = vague14e+VAGUE_TIME_END
vague15e = vague15s+VAGUE_TIME_START_NORMAL
vague16s = vague15e+VAGUE_TIME_END
vague16e = vague16s+VAGUE_TIME_START_NORMAL
vague17s = vague16e+VAGUE_TIME_END
vague17e = vague17s+VAGUE_TIME_START_NORMAL
vague18s = vague17e+VAGUE_TIME_END
vague18e = vague18s+VAGUE_TIME_START_NORMAL
vague19s = vague18e+VAGUE_TIME_END
vague19e = vague19s+VAGUE_TIME_START_NORMAL
vague20s = vague19e+VAGUE_TIME_END
vague20e = vague20s+VAGUE_TIME_START_NORMAL
vague21s = vague20e+VAGUE_TIME_END
vague21e = vague21s+VAGUE_TIME_START_QUICK
vague22s = vague21e+VAGUE_TIME_END
vague22e = vague22s+VAGUE_TIME_START_QUICK
vague23s = vague22e+VAGUE_TIME_END
vague23e = vague23s+VAGUE_TIME_START_QUICK
vague24s = vague23e+VAGUE_TIME_END
vague24e = vague24s+VAGUE_TIME_START_QUICK
vague25s = vague24e+VAGUE_TIME_END
vague25e = vague25s+VAGUE_TIME_START_QUICK
vague26s = vague25e+VAGUE_TIME_END
vague26e = vague26s+VAGUE_TIME_START_QUICK
vague27s = vague26e+VAGUE_TIME_END
vague27e = vague27s+VAGUE_TIME_START_QUICK
vague28s = vague27e+VAGUE_TIME_END
vague28e = vague28s+VAGUE_TIME_START_QUICK
vague29s = vague28e+VAGUE_TIME_END
vague29e = vague29s+VAGUE_TIME_START_QUICK
vague30s = vague29e+VAGUE_TIME_END
vague30e = vague30s+VAGUE_TIME_START_QUICK
vague31s = vague30e+VAGUE_TIME_END
vague31e = vague31s+VAGUE_TIME_START_VERY_QUICK
vague32s = vague31e+VAGUE_TIME_END
vague32e = vague32s+VAGUE_TIME_START_VERY_QUICK
vague33s = vague32e+VAGUE_TIME_END
vague33e = vague33s+VAGUE_TIME_START_VERY_QUICK
vague34s = vague33e+VAGUE_TIME_END
vague34e = vague34s+VAGUE_TIME_START_VERY_QUICK
vague35s = vague34e+VAGUE_TIME_END
vague35e = vague35s+VAGUE_TIME_START_VERY_QUICK
vague36s = vague35e+VAGUE_TIME_END
vague36e = vague36s+VAGUE_TIME_START_VERY_QUICK
vague37s = vague36e+VAGUE_TIME_END
vague37e = vague37s+VAGUE_TIME_START_VERY_QUICK
vague38s = vague37e+VAGUE_TIME_END
vague38e = vague38s+VAGUE_TIME_START_VERY_QUICK
vague39s = vague38e+VAGUE_TIME_END
vague39e = vague39s+VAGUE_TIME_START_VERY_QUICK
vague40s = vague39e+VAGUE_TIME_END
vague40e = vague40s+VAGUE_TIME_START_VERY_QUICK

