include "musique.asm"
include "couleurs.asm"
include "connexions.asm"
include "asic.asm"
include "weapons.asm"

; //////////////////////////////////////////////////////////////////
; ///////////        INTERRUPTION ET RUPTURE            ////////////
; //////////////////////////////////////////////////////////////////
LGN_INTERRUPTION_BAS			equ		254
LGN_INTERRUPTION_HUD			equ		211
LGN_RUPTURE_HUD					equ		214



; //////////////////////////////////////////////////////////////////
; /////////////////////        SHOP        //////////////////////
; //////////////////////////////////////////////////////////////////
CASE_CORNOFULGURE_ECRAN = #FA15
CASE_PULVONIUM_ECRAN = #FA23
CASE_CLAVICOGYRE_ECRAN = #FBF5
CASE_PLANITRON_ECRAN = #FC03
CASE_PLANITRON2_ECRAN = #FDD5
CASE_FULGUROPOINT_ECRAN = #FDE3
CASE_FERME_ROM = #F220
CURSOR_ORIGIN_X = 440
CURSOR_ORIGIN_Y = 70
HAUTEUR_CASE	= 41



; //////////////////////////////////////////////////////////////////
; /////////////////////       SCROLLING       //////////////////////
; //////////////////////////////////////////////////////////////////


; scrolling hard du fond

SCROLL_SLOW_RETARD_VIDEO		equ	16
SCROLL_NORMAL_RETARD_VIDEO		equ	32
SCROLL_FAST_RETARD_VIDEO		equ	48
SCROLL_VERY_FAST_RETARD_VIDEO	equ	112
;VALEUR_TIMER			equ	255
SCROLL_INIT_RETARD_VIDEO		equ	#70

; //////////////////////////////////////////////////////////////////
; /////////////////////       MAPTILES       //////////////////////
; //////////////////////////////////////////////////////////////////
SCREEN_DEPART_LEVEL_1	equ		#df30
SCREEN_LEVEL_1			equ		#de60

SCREEN_DEPART_LEVEL_2	equ		#e570
SCREEN_LEVEL_2			equ		#e4a0

SCREEN_DEPART_LEVEL_3	equ		#ebb0
SCREEN_LEVEL_3			equ		#eae0

SCREEN_DEPART_LEVEL_4	equ		#f1f0
SCREEN_LEVEL_4			equ		#f120

SCREEN_DEPART_LEVEL_5	equ		#F830
SCREEN_LEVEL_5			equ		#F760

SCREEN_DEPART_LEVEL_6	equ		#fe70
SCREEN_LEVEL_6			equ		#fda0

SCREEN_DEPART_LEVEL_7	equ		#FE70
SCREEN_LEVEL_7			equ		#FDA0

SCREEN_DEPART_LEVEL_8	equ		#FE70
SCREEN_LEVEL_8			equ		#FDA0


SCREEN_DEPART_LEVEL_SPACE	equ		#FF8E
SCREEN_LEVEL_SPACE			equ		#FEBE

TILES_NBR_RANGEES		equ 14
TILES_NBR_COLONNES		equ	16
TILES_HAUTEUR			equ	16
TILES_LARGEUR			equ	4
GOLDORAK_INIT_POSX		equ	260
GOLDORAK_INIT_POSY		equ	165

;.zoom_mode0	equ	13
; //////////////////////////////////////////////////////////////////
; //////////////       ECRANS INTER LEVEL       ////////////////////
; //////////////////////////////////////////////////////////////////
adr_route_ROM			equ		#c391
adr_route_SCR			equ		#c108
largeur_route			equ		#c3b6+-#c391
hauteur_texte			equ		4*8+5

adr_chiffreroute_SCR	equ		adr_route_SCR+#28

hauteur_vignettes		equ		11*8
largeur_vignettes		equ		#21
adr_vignette_SCR		equ		#c2cc		; #c2d0

adr_vignette1_ROM		equ		#c000
adr_vignette2_ROM		equ		#c021
adr_vignette3_ROM		equ		#c370

adr_chiffre1_ROM		equ		#ECD1
adr_chiffre2_ROM		equ		#ECD6
adr_chiffre3_ROM		equ		#ECDD
adr_chiffre4_ROM		equ		#ECe4
adr_chiffre5_ROM		equ		#ECeb
adr_chiffre6_ROM		equ		#ECf2
adr_chiffre7_ROM		equ		#ECf9
adr_chiffre8_ROM		equ		#ECf9

adr_chiffre1_SCR		equ		#c3c0
LARGEUR_CHIFFRE1		equ		5

largeur_chiffre2		equ		7
largeur_chiffre3		equ		7
largeur_chiffre4		equ		7
largeur_chiffre5		equ		7
largeur_chiffre6		equ		7
largeur_chiffre7		equ		7
largeur_chiffre8		equ		7

val_points			equ		5

compteur_evenement_level1		equ		#00FF


; //////////////////////////////////////////////////////////////////
; ////////////////////LES ADRESSES DE ACTARUS  ////////////////////
; //////////////////////////////////////////////////////////////////
ACTARUS					equ			#E800
ACTARUS_ANIMATION_1		equ			ACTARUS+#100
ACTARUS_ANIMATION_2		equ			ACTARUS+#200
ACTARUS_ANIMATION_3		equ			ACTARUS+#300
ACTARUS_ANIMATION_4		equ			ACTARUS+#400
ACTARUS_ANIMATION_5		equ			ACTARUS+#500
ACTARUS_ANIMATION_6		equ			ACTARUS+#600

VITESSE_METAMORPHOSE	equ			64

; //////////////////////////////////////////////////////////////////
; ////////////////////LES ADRESSES DE GOLDORAK  ////////////////////
; //////////////////////////////////////////////////////////////////
; goldorak et sa navette
GOLDORAK_HAUTBAS_SPRH_ROM_ADR				equ	#C000		; de #c000 à #C4000
GOLDORAK_GAUCHE_SPRH_ROM_ADR				equ #D000
GOLDORAK_DROITE_SPRH_ROM_ADR				equ	#D400
GOLDORAK_HAUTBAS_ANIMPOINT1_SPRH_ROM_ADR	equ	#D800
GOLDORAK_HAUTBAS_ANIMPOINT2_SPRH_ROM_ADR	equ	#DA00
GOLDORAK_GAUCHE_ANIMPOINT1_SPRH_ROM_ADR		equ	#DC00
GOLDORAK_GAUCHE_ANIMPOINT2_SPRH_ROM_ADR		equ	#DE00
GOLDORAK_DROITE_ANIMPOINT1_SPRH_ROM_ADR		equ	#E000
GOLDORAK_DROITE_ANIMPOINT2_SPRH_ROM_ADR		equ	#E200

; goldorak retournement étapes des 

GOLDORAK_RET_SPRH				equ	#c000
GOLDORAK_RET1_SPRH_ROM_ADR		equ	GOLDORAK_RET_SPRH   ; %1100 0000
GOLDORAK_RET2_SPRH_ROM_ADR		equ	GOLDORAK_RET_SPRH+#400   ; %1100 0100	
GOLDORAK_RET3_SPRH_ROM_ADR		equ	GOLDORAK_RET_SPRH+#800	; %1100 1000
GOLDORAK_RET4_SPRH_ROM_ADR		equ	GOLDORAK_RET_SPRH+#C00	; %1100 1100
GOLDORAK_RET5_SPRH_ROM_ADR		equ	GOLDORAK_RET_SPRH+#1000	; %1101 0000
GOLDORAK_RET6_SPRH_ROM_ADR		equ	GOLDORAK_RET_SPRH+#1400	; %1101 0100
GOLDORAK_RET7_SPRH_ROM_ADR		equ	GOLDORAK_RET_SPRH+#1800	; %1101 1100



; collision de goldorak avec les bords de l'écran
collision_goldo_droite		equ	#0184
collision_goldo_gauche		equ	#ff
collision_goldo_bas			equ	#C3  ;#c5
collision_goldo_bas2		equ	#C5
collision_goldo_haut		equ	#1B

; identification des directions
val_dir_haut			equ	1
val_dir_bas				equ	2
val_dir_gauche			equ	3
val_dir_droite			equ	4

VITESSE_RETOURNEMENT		=	3
DISTANCE_RETOURNEMENT_AVANCER	= 	-16
DISTANCE_RETOURNEMENT_RECULER	= 	16
DISTANCE_RETOURNEMENT_AVANCER_moins	= 	-8
DISTANCE_RETOURNEMENT_RECULER_moins	= 	8


	
BOOM_SPRH_ROM_ADR		equ	#c000
BOOM2_SPRH_ROM_ADR		equ	#c500
BIG_BOOM_SPRH_ROM_ADR	equ	#d000



nrj_damage_goldorak		equ	3





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
; //////////////////////////////////////////////////////////////////
; /////////////////////////  LES GOLGOTH  ////////////////////////
; //////////////////////////////////////////////////////////////////

GOLGOTH1_SPRH_ADR_ROM			equ		#C000
TIR_GOLGOTH1_SPRH_ADR_ROM		equ		#FA00

GOLGOTH2_SPRH_ADR_ROM			equ		#C800
TIR_GOLGOTH2_SPRH_ADR_ROM		equ		#FB00

GOLGOTH3_SPRH_ADR_ROM			equ		#E900			; 4 sprites du corps sans animation
GOLGOTH3_SPRH_ADR_ROM_TETE_C	equ		#F000			; 2 sprites
GOLGOTH3_SPRH_ADR_ROM_QUEUE_C	equ		#EE00			; 1 sprite
GOLGOTH3_SPRH_ADR_ROM_TETE_G	equ		#F200
GOLGOTH3_SPRH_ADR_ROM_QUEUE_G	equ		#ED00
GOLGOTH3_SPRH_ADR_ROM_TETE_D	equ		#F400
GOLGOTH3_SPRH_ADR_ROM_QUEUE_D	equ		#EF00
TIR_GOLGOTH3_SPRH_ADR_ROM		equ		#F800


GOLGOTH4_SPRH_ADR_ROM			equ		#d800
GOLGOTH4_SPRH_ADR_ROM_ANIM1		equ		#D800
GOLGOTH4_SPRH_ADR_ROM_ANIM2		equ		#E000
GOLGOTH4_SPRH_ADR_ROM_ANIM3		equ		#E800
GOLGOTH4_SPRH_ADR_ROM_MARCHE	equ		#F000



GOLGOTH5_SPRH_ADR_ROM				equ		#EC00
GOLGOTH5_SPRH_ADR_ROM_ANIM_OUT1		equ		#EC00
GOLGOTH5_SPRH_ADR_ROM_ANIM_OUT2		equ		#F200
GOLGOTH5_SPRH_ADR_ROM_ANIM_IN1		equ		#F800
GOLGOTH5_SPRH_ADR_ROM_ANIM_IN2		equ		#FE00
ouvert  = 1
ferme	= 0


GOLGOTH6_SPRH_ADR_ROM			equ		#E000
GOLGOTH6_SPRH_ADR_ROM_ANIM1		equ		#E000
GOLGOTH6_SPRH_ADR_ROM_ANIM2		equ		#E500
GOLGOTH6_SPRH_ADR_ROM_ANIM3		equ		#EA00


GOLGOTH7_SPRH_ADR_ROM			equ		#D000
GOLGOTH7_SPRH_ADR_ROM_ANIM1		equ		#D000
GOLGOTH7_SPRH_ADR_ROM_ANIM2		equ		#D600


GOLGOTH8_SPRH_ADR_ROM					equ		#C000
GOLGOTH8_SPRH_ADR_ROM_ANIM1_CORP		equ		#C000
GOLGOTH8_SPRH_ADR_ROM_ANIM1_TETES		equ		#C400
GOLGOTH8_SPRH_ADR_ROM_ANIM2_CORP		equ		#c800
GOLGOTH8_SPRH_ADR_ROM_ANIM2_TETES		equ		#D000
GOLGOTH8_SPRH_ADR_ROM_ANIM3_CORP		equ		#c000
GOLGOTH8_SPRH_ADR_ROM_ANIM3_TETES		equ		#D400
GOLGOTH8_SPRH_ADR_ROM_ANIM4_CORP		equ		#C800
GOLGOTH8_SPRH_ADR_ROM_ANIM4_TETES		equ		#CC00




VITESSE_ANIM_GOLGOTH			equ		8
VITESSE_ANIM_GOLGOTH4			equ		4
VITESSE_EXPLOSE_GOLGOTH			equ		2
VITESSE_ANIM_GOLGOTH5			equ		4
VITESSE_ANIM_GOLGOTH8			equ		3

CADANCE_TIR_1_GOLGOTH1			equ		32
CADANCE_TIR_2_GOLGOTH1			equ		16
CADANCE_TIR_3_GOLGOTH1			equ		8
CADANCE_TIR_4_GOLGOTH1			equ		4


CADANCE_TIR_1_GOLGOTH2			equ		32
CADANCE_TIR_2_GOLGOTH2			equ		16
CADANCE_TIR_3_GOLGOTH2			equ		8
CADANCE_TIR_4_GOLGOTH2			equ		4

CADANCE_TIR_1_GOLGOTH3			equ		32
CADANCE_TIR_2_GOLGOTH3			equ		16
CADANCE_TIR_3_GOLGOTH3			equ		8
CADANCE_TIR_4_GOLGOTH3			equ		4


PV_GOLGOTH_1		equ		16
PV_GOLGOTH_2		equ		16
PV_GOLGOTH_3		equ		16
PV_GOLGOTH_4		equ		16
PV_GOLGOTH_5		equ		16
PV_GOLGOTH_6		equ		16
PV_GOLGOTH_7		equ		16
PV_GOLGOTH_8		equ		16

; //////////////////////////////////////////////////////////////////
; /////////////////////////  LES VAISSEAUX MERE  ////////////////////////
; //////////////////////////////////////////////////////////////////



BIGBOSS1_SPRH_ADR_ROM					equ		#c000


BIGBOSS2_SPRH_ADR_ROM					equ		#db00
BIGBOSS2_SPRH_ADR_ROM_ANIM1  			equ		#e000
BIGBOSS2_SPRH_ADR_ROM_ANIM2  			equ		#e400
BIGBOSS2_SPRH_ADR_ROM_ANIM3  			equ		#e800

BIGBOSS1_VITESSE_ANIMATION			equ		4
BIGBOSS2_VITESSE_ANIMATION			equ		8



; ///////////////////////////// OPCODE  //////////////////////////////


_CALL		equ		#cd
_JP			equ		#c3



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


NBR_RETOURNEMENT_MAX equ 5

TBL_RETOURNEMENT_COUNT
dw	RET1a, RET1b
dw	RET2a, RET2b
dw	RET3a, RET3b
dw	RET4a, RET4b
dw	RET5a, RET5b
TBL_RETOURNEMENT_COUNT_END

RET1a equ #68DA
RET1b equ #70DA
RET2a equ #50DD
RET2b equ #58DD
RET3a equ #60A0
RET3b equ #68A0
RET4a equ #50E3
RET4b equ #58E3
RET5a equ #68E6
RET5b equ #70E6



; ///////////////// SCENE DE FIN //////////////

PORTRAIT_ACTARUS_HAUT		EQU		#F000
PORTRAIT_ACTARUS_BAS		EQU		#F400

PORTRAIT_ALCOR_HAUT			EQU		#F200
PORTRAIT_ALCOR_BAS			EQU		#F600


; ///////////////////////////////////////////////////////////////////
; ////////////////////LES ADRESSES DE L'ALCORAK  ////////////////////
; ///////////////////////////////////////////////////////////////////

ALCORAK_HAUTBAS_SPRH_ROM_ADR			equ	#DC00		; de #c000 à #C4000
ALCORAK_GAUCHE_SPRH_ROM_ADR				equ #E000
ALCORAK_DROITE_SPRH_ROM_ADR				equ	#E400



