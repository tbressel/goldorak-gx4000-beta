
; //////////////////////////////////////////////////////////////////
; ///////////        INTERRUPTION ET RUPTURE            ////////////
; //////////////////////////////////////////////////////////////////
LGN_INTERRUPTION_BAS			equ		254
LGN_INTERRUPTION_HUD			equ		211
LGN_RUPTURE_HUD					equ		214
; //////////////////////////////////////////////////////////////////
; /////////////////////  DEFINITION DES BANK  //////////////////////
; //////////////////////////////////////////////////////////////////
BANK_ROM_0				equ		0
BANK_ROM_2				equ		2
BANK2_INIT				equ		#DF00+#80+2
BANK28_MUSIC			equ		#DF00+#80+28
BANK3_MUSIC				equ		#DF00+#80+3
BANK4_MENU				equ		#DF00+#80+4
BANK_TILESET_1			equ		#DF00+#80+5
BANK_TILESET_2			equ		#DF00+#80+5
BANK_TILESET_3			equ		#DF00+#80+6
BANK_TILESET_4			equ		#DF00+#80+6
BANK_TILESET_5			equ		#DF00+#80+6
BANK_TILESET_6			equ		#DF00+#80+7
BANK_TILESET_7			equ		#DF00+#80+7
BANK_TILESET_8			equ		#DF00+#80+7
BANK_TILESET_SPACE   	equ		#DF00+#80+7


BANK_HUD				equ		#DF00+#80+8
BANK8_HUD				=		8
BANK_FONTES				=		#DF00+#80+8
BANK8_FONTES			=		8
BANK8_PALETTES			= 		#DF00+#80+8

BANK_GOLDORAK_SPRH		equ		#DF00+#80+9
BANK9_GOLDORAK_SPRH		=		9
BANK10_SOUCOUPES_SPRH	=		10
BANK10_GOLGOTH_SPRH		=		10

BANK10_GOLGOTH_TIRE_SPRH		=		10

BANK11_ITEMS_SPRH		=		11
BANK11_GOLGOTH_SPRH 	=		11
BANK12_SPRH				=		12
BANK12_GOLGOTH_SPRH		=		12
BANK13_SPRH				=		13
BANK13_GOLGOTH_SPRH		=		13
BANK15_GOLDORAK_RET_SPRH =  	15
BANK15_ACTARUS			=       #DF00+#80+15
BANK17_SCENARIO			=		#DF00+#80+17
BANK17_TITLESCREEN		=		#DF00+#80+17
BANK18_GAMEOVER			=		#DF00+#80+18
BANK18_CROCOFEST		=		#DF00+#80+18
BANK19_FIN				=		#DF00+#80+19
BANK20_ROUTE			=		#DF00+#80+20



BANK16_BOOM_SPRH		=		16
BANK_LEVEL_1			equ		#DF00+#80+21
BANK_LEVEL_2			equ		#DF00+#80+22
BANK_LEVEL_3			equ		#DF00+#80+23
BANK_LEVEL_4			equ		#DF00+#80+24
BANK_LEVEL_5			equ		#DF00+#80+25
BANK_LEVEL_6			equ		#DF00+#80+26
BANK_LEVEL_7			equ		#DF00+#80+27
BANK_LEVEL_8			equ		#DF00+#80+14
BANK_LEVEL_SPACE		equ		#DF00+#80+31


UPPER_ROM_CONNEXION		=		#0
ASIC_CONNEXION			=		#18
ASIC_DECONNEXION		=		#28

; //////////////////////////////////////////////////////////////////
; //////////////////        COULEURS            ///////////////////
; //////////////////////////////////////////////////////////////////
PALETTE_ASIC			equ		#6400
PALETTE_SPRH			equ		#6422
PALETTE_DECORS_RAM		equ		#0040
PALETTE_HUD_RAM			equ		#0060

VITESSE_FONDU_DE_SORTIE	equ		10

DEPART_PALETTES			equ		#D500			; #C000
PALETTE_TITLE_SCREEN	equ		DEPART_PALETTES
PALETTE_SCENARIO		equ		DEPART_PALETTES+#20
PALETTE_GAME_OVER		equ		DEPART_PALETTES+#40
PALETTE_SPRITE_HARD		equ		DEPART_PALETTES+#80
PALETTE_DECORS			equ		DEPART_PALETTES+#A0
PALETTE_FIN				equ		DEPART_PALETTES+#D0
PALETTE_INTERLEVEL		equ		DEPART_PALETTES+#100	;#D000
PALETTE_HUD				equ 	DEPART_PALETTES+#120	;#D020
PALETTE_MENU			equ		DEPART_PALETTES+#140
PALETTE_CREDIT			equ		DEPART_PALETTES+#160
PALETTE_METAMORPHOSE	equ		DEPART_PALETTES+#180
PALETTE_SHOP			equ		DEPART_PALETTES+#200
PALETTE_CROCOFEST		equ		DEPART_PALETTES+#220

COULEUR_DEGAT_BORDER_J1		= #080
COULEUR_DEGAT_BORDER_J2		= #088
COULEUR_HIT_ENNEMI			= #999
COULEUR_BOOM_ENNEMI			= #FFF


PALETTE_DECORS_LEVEL1
dw #000,#0F0,#00F,#07F,#121,#251,#3A2,#700,#8F0,#B00,#D70,#EA3,#ED3,#FF3,#F0F,#FEF

PALETTE_DECORS_LEVEL2
DW #060,#0F0,#001,#00F,#108,#380,#60E,#800,#888,#80F,#AAA,#B00,#C0F,#D00,#F0F,#FFF

PALETTE_DECORS_LEVEL3
DW #000,#0F0,#006,#007,#00F,#400,#66F,#800,#80F,#B00,#EC0,#F00,#FF0,#F05,#F66,#F5F

PALETTE_DECORS_LEVEL4
dw #000,#122,#1FF,#232,#242,#461,#581,#681,#692,#9C3,#9D3,#AE3,#B02,#BF3,#CF4,#E46

PALETTE_DECORS_LEVEL5
DW #080,#0F0,#333,#4F0,#444,#666,#6A7,#7F0,#800,#888,#9F0,#999,#BBB,#CCC,#FF0,#FFF

PALETTE_DECORS_LEVEL6
DW #000,#090,#0F0,#008,#00E,#08F,#0FF,#222,#333,#455,#788,#8F0,#83F,#9AA,#FF0,#F8F

PALETTE_DECORS_LEVEL7
DW  #000,#004,#008,#03A,#04C,#05D,#06E,#07F,#08F,#0FF,#50E,#70E,#80F,#B0F,#C0F,#F8F

PALETTE_DECORS_LEVEL8
dw #000,#050,#080,#0A0,#0FF,#0FF,#3F0,#50E,#6F0,#70E,#8F0,#80F,#B0F,#C0F,#FF0,#F8F

PALETTE_DECORS_ESPACE
dw #000,#001,#002,#013,#023,#034,#035,#006,#046,#057,#068,#079,#66F,#6CF,#F00,#F66

PALETTE_DECORS_ESPACE2
dw #000,#001,#002,#013,#023,#034,#035,#006,#046,#057,#068,#079,#66F,#6CF,#F00,#F66



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
; /////////////////////        MUSIQUE        //////////////////////
; //////////////////////////////////////////////////////////////////
; player et musique
PLY_AKG_MANAGE_SOUND_EFFECTS = 1
PLAYER_ADR_RAM				EQU	#0090		; adresse à reporter manuellement dans creation_cartouche.asm
		LONGUEUR_PLAYER		equ	#0c50
MUSIC_ADR_RAM				EQU #0AC0		; toutes les musiques du jeu
		LONGUEUR_MUSIC		equ	#1A00    ;#14cc


; player dans la cartouche : problème de double label avec un assemblage des  .asm
; le l'ai convertir en binair dans mon fichier .bat, avec en entête org #8300
; le fichier .bin est mis dans la bank 28
; ce player étant le même que celui de la bank 3, j'ai pris l'adresse du 
; label PLY_AKG_Play en RAM (#02A7) et soustrait de l'adresse de départ (#0090)
; J'obtient ainsi la distance entre le début du player et le label 

PLY_AKG_PlayROM				equ		#8300+#02A7+-#0090
PLY_AKG_InitROM				equ		#8300+#01DD+-#0090


; id des soundeffects
SFX_WEAPONS_CHANGE		equ	4
SFX_BOOM				equ 2
SFX_ATTACK				equ	1
SFX_GET_ITEM			equ	4
SFX_POW					equ	3
SFX_HIT					EQU	5
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



; sprites hard des armes
sprh_cornofulgure_bas		equ	#f800
sprh_cornofulgure_haut		equ	#f900
SPRH_MISSILES_GAMMA			equ	#f400
SPRH_MISSILES_GAMMA2			equ	#EF00
SPRH_MISSILES_GAMMA3			equ	#EE00
sprh_planitron				equ	#F000
sprh_planitron2				equ	#F600
sprh_fulguro_poing			equ	#ca00
sprh_clavicogyres			equ	#fa00

; flag d'identification des amres
id_missibles_gamma			equ		1
id_missibles_gamma2			equ		2
id_missibles_gamma3			equ		3

id_planitron1				equ		4
id_planitron2				equ		5
id_planitron3				equ		6

id_planitron21				equ		7
id_planitron22				equ		8
id_planitron23				equ		9

id_bombe					equ		10

id_cornofulgure1			equ		11
id_cornofulgure2			equ		12
id_cornofulgure3			equ		13

id_fulguropoint				equ		14

id_clavicogyres				equ		15

; degat instaurer par les armes de Goldorak
; constantes logé dans 'point_attaque'
FORCE_MISSILES_GAMMA	= 1
FORCE_MISSILES_GAMMA2	= 2
FORCE_MISSILES_GAMMA3	= 3

FORCE_PLANITRON_1		= 2	
FORCE_PLANITRON_2		= 3	
FORCE_CORNOFULGURE_1	= 4
FORCE_FULGURO_POINGS	= 5
FORCE_CLAVICOGYRES		= 6 

; collision de goldorak avec les bords de l'écran
collision_goldo_droite		equ	#0184
collision_goldo_gauche		equ	#ff
collision_goldo_bas			equ	#c5
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
Tiny_goldorak			equ	#E400
TIny_venusiak			equ	#E600
Tir_tiny_goldo			equ	#ef00
Tir_tiny_venus			equ	#f500


nrj_damage_goldorak		equ	3
nrj_damage_venusiak		equ	3





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



	SOUCOUPE_VERTE_SPRH_ROM_ADR			equ		#E400
	PV_SOUCOUPE_VERTE					equ		0		; simple soucoupe
	TIR_SOUCOUPE_VERTE					equ		0

	SOUCOUPE_ORANGE_SPRH_ROM_ADR		equ		#E500
	PV_SOUCOUPE_ORANGE					equ		2		; simple soucoupe
	TIR_SOUCOUPE_ORANGE					equ		0
	
	SOUCOUPE_BLEUE_SPRH_ROM_ADR			equ		#E600
	PV_SOUCOUPE_BLEUE					equ		3		; soucoupe qui tire
	TIR_SOUCOUPE_BLEUE					equ		1

	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR		equ		#E700
	PV_SOUCOUPE_VIOLETTE				equ		4		; simple soucoupe
	TIR_SOUCOUPE_VIOLETTE				equ		0
	
	SOUCOUPE_BLEUE_RAYEE_SPRH_ROM_ADR	equ		#E800
	PV_SOUCOUPE_BLEUE_RAYEE				equ		5		; simple soucoupe
	TIR_SOUCOUPE_BLEUE_RAYEE			equ		0

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




; //////////////////////////////////////////////////////////////////
; /////////////////////////  LES VAISSEAUX MERE  ////////////////////////
; //////////////////////////////////////////////////////////////////



BIGBOSS1_SPRH_ADR_ROM					equ		#c000
BIGBOSS2_SPRH_ADR_ROM					equ		#db00
BIGBOSS2_SPRH_ADR_ROM_ANIM1  			equ		#e000
BIGBOSS2_SPRH_ADR_ROM_ANIM2  			equ		#e400
BIGBOSS2_SPRH_ADR_ROM_ANIM3  			equ		#e800




; ________________________________________
;                SPRITE HARD ASIC
; ________________________________________
; ////////////////////////////////////////////////   Adresses  //////////////////////////////////////
SPRH0_ADR		EQU	#4000:SPRH1_ADR		EQU	#4100:SPRH2_ADR		EQU	#4200
SPRH3_ADR		EQU	#4300:SPRH4_ADR		EQU	#4400:SPRH5_ADR		EQU	#4500
SPRH6_ADR		EQU	#4600:SPRH7_ADR		EQU	#4700:SPRH8_ADR		EQU	#4800
SPRH9_ADR		EQU	#4900:SPRH10_ADR	EQU	#4A00:SPRH11_ADR	EQU	#4B00
SPRH12_ADR		EQU	#4C00:SPRH13_ADR	EQU	#4D00:SPRH14_ADR	EQU	#4E00
SPRH15_ADR		EQU	#4F00
; ////////////////////////////////////////////////   Zoom  /////////////////////////////////////////




SPRH0_ZOOM		EQU	#6004:SPRH1_ZOOM		EQU	#600c
SPRH2_ZOOM		EQU	#6014:SPRH3_ZOOM		EQU	#601c
SPRH4_ZOOM		EQU	#6024:SPRH5_ZOOM		EQU	#602c
SPRH6_ZOOM		EQU	#6034:SPRH7_ZOOM		EQU	#603c
SPRH8_ZOOM		EQU	#6044:SPRH9_ZOOM		EQU	#604c
SPRH10_ZOOM		EQU	#6054:SPRH11_ZOOM		EQU	#605c
SPRH12_ZOOM		EQU	#6064:SPRH13_ZOOM		EQU	#606c
SPRH14_ZOOM		EQU	#6074:SPRH15_ZOOM		EQU	#607c

zoom_mode2_1		equ		5
zoom_mode2_2		equ		6
zoom_mode2_3		equ		7

zoom_mode1_1		equ		9
zoom_mode1_2		equ		10
zoom_mode1_3		equ		11

zoom_mode0_1		equ		13
zoom_mode0_2		equ		14
zoom_mode0_3		equ		15



; ////////////////////////////////////////////   Coordonnées  /////////////////////////////////////////
SPRH0_X			EQU	#6000:SPRH0_Y			EQU	#6002
SPRH1_X			EQU	#6008:SPRH1_Y			EQU	#600A
SPRH2_X			EQU	#6010:SPRH2_Y			EQU	#6012
SPRH3_X			EQU	#6018:SPRH3_Y			EQU	#601A
SPRH4_X			EQU	#6020:SPRH4_Y			EQU	#6022
SPRH5_X			EQU	#6028:SPRH5_Y			EQU	#602A
SPRH6_X			EQU	#6030:SPRH6_Y			EQU	#6032
SPRH7_X			EQU	#6038:SPRH7_Y			EQU	#603A
SPRH8_X			EQU	#6040:SPRH8_Y			EQU	#6042
SPRH9_X			EQU	#6048:SPRH9_Y			EQU	#604A
SPRH10_X		EQU	#6050:SPRH10_Y			EQU	#6052
SPRH11_X		EQU	#6058:SPRH11_Y			EQU	#605A
SPRH12_X		EQU	#6060:SPRH12_Y			EQU	#6062
SPRH13_X		EQU	#6068:SPRH13_Y			EQU	#606A
SPRH14_X		EQU	#6070:SPRH14_Y			EQU	#6072
SPRH15_X		EQU	#6078:SPRH15_Y			EQU	#607A
SPRH0_X_Y_ZOOM	EQU	#6000:SPRH1_X_Y_ZOOM	EQU	#6008
SPRH5_X_Y_ZOOM	EQU	#6028:SPRH6_X_Y_ZOOM	EQU	#6030
SPRH7_X_Y_ZOOM	EQU	#6038:SPRH8_X_Y_ZOOM	EQU	#6040
SPRH9_X_Y_ZOOM	EQU	#6048:SPRH10_X_Y_ZOOM	EQU	#6050
SPRH11_X_Y_ZOOM	EQU	#6058:SPRH12_X_Y_ZOOM	EQU	#6060


; ///////////////////////////// OPCODE  //////////////////////////////

SPRH_ARMES_GOLDORAK_CACHER			=  -32



_CALL		equ		#cd
_JP			equ		#c3


vague1s = #0490
vague1e = vague1s+#b0
vague2s = vague1e+#16
vague2e = vague2s+#b0
vague3s = vague2e+#16
vague3e = vague3s+#b0
vague4s = vague3e+#16
vague4e = vague4s+#90
vague5s = vague4e+#16
vague5e = vague5s+#90
vague6s = vague5e+#16
vague6e = vague6s+#90
vague7s = vague6e+#16
vague7e = vague7s+#90
vague8s = vague7e+#16
vague8e = vague8s+#90
vague9s = vague8e+#16
vague9e = vague9s+#90
vague10s = vague9e+#16
vague10e = vague10s+#90
vague11s = vague10e+#16
vague11e = vague11s+#90
vague12s = vague11e+#16
vague12e = vague12s+#90
vague13s = vague12e+#16
vague13e = vague13s+#90
vague14s = vague13e+#16
vague14e = vague14s+#90
vague15s = vague14e+#16
vague15e = vague15s+#90
vague16s = vague15e+#16
vague16e = vague16s+#90
vague17s = vague16e+#16
vague17e = vague17s+#90
vague18s = vague17e+#16
vague18e = vague18s+#90
vague19s = vague18e+#16
vague19e = vague19s+#90
vague20s = vague19e+#16
vague20e = vague20s+#90
vague21s = vague20e+#16
vague21e = vague21s+#90
vague22s = vague21e+#16
vague22e = vague22s+#90


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
