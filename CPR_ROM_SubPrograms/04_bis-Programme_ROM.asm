org #c000
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////     ON COPIE DES ROUTINE EN DEBUT DE BANK      ////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
rstCreationPrograms_ROM
	ld		hl,rom_on			; alias RST #0
	ld		de,#0
	ld		bc,24
	LDIR
	ld		hl,asic_on			; alias RST #18
	ld		de,#18
	ld		bc,12
	LDIR
	ld		hl,asic_off			; alias RST #28
	ld		de,#28
	ld		bc,12
	LDIR
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ///////     ON CONFIGURE LES VARIABLES DU SCREEN ROUTE    ////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
	ld		hl,LARGEUR_CHIFFRE1
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre1_ROM
	ld		(adr_chiffre),hl
	;ld	hl,tbl_regHUD_fin
	;ld	(pointeur_tbl_regHUD),hl
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ///////////     ON CONFIGURE LES PARAMETRE DU JEU    /////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////	
	; on allume et selectionne par défaut le 1er boutton et la 1ere amre
ld		a,1
ld		(flag_deja_affiche),a
		ld		a,VITESSE_RETOURNEMENT
		ld		(Compteur_Retournement),a
	
	
	ld		hl,tbl_distribution_points
	ld		(pointeur_tbl_point),hl
	ld		hl,Tbl_NRJ_bar+19
	ld		(pointeur_tbl_NRJ_bar),hl
	ld		hl,Tbl_NRJ_bar2+19
	ld		(pointeur_tbl_NRJ_bar2),hl
	ld		hl,TBL_NBR_SOUCOUPES
	ld		(Pointeur_TblNombreDeSoucoupes),hl
	ld		a,NBR_DE_VIE_DEPART
	ld		(nbr_de_vie),a
	ld		(nbr_de_vie_j2),a
	ld		a,10
	ld		(points_sante),a
	ld		(points_sante_J2),a
	ld		a,1
	ld		(level_en_cours),a
	ret

	
	
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; /////////////////     INITIALISATION  DU JEU    //////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
initialisation_du_jeu_ROM

	; on déplace les adresse du compteur de point à l'écran dans le hud 2
	ld		hl,HUD_SCORE_UNITE_ADR
	ld		(val_HUD_SCORE_UNITE_ADR_hudJ1),hl
	ld		hl,HUD_SCORE_DIZAINNE_ADR
	ld		(val_HUD_SCORE_DIZAINNE_ADR_hudJ1),hl
	ld		hl,HUD_SCORE_CENTAINE_ADR
	ld		(val_HUD_SCORE_CENTAINE_ADR_hudJ1),hl
	ld		hl,HUD_SCORE_MILLIER_ADR
	ld		(val_HUD_SCORE_MILLIER_ADR_hudJ1),hl
	ld		hl,HUD_SCORE_DIZAINE_DE_MILLIER_ADR
	ld		(val_HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hudJ1),hl
	ld		a,1
	ld		(id_joueur),a

	xor		a
	ld		(count_anim_soucoupe),a
	ld		(etp_arrimage),a
	ld		(vitesse_goldorak),a
	ld		(count_anim_goldorak),a
	ld		(bloc_tile),a
	ld		(counter_poid_fort),a
	ld		(counter_poid_faible),a
	ld		(etp_soucoupe1),a
	ld		(etp_soucoupe2),a
	ld		(etp_soucoupe3),a
	ld		(etp_soucoupe4),a
	ld		(etp_soucoupe5),a
	ld		(etp_soucoupe6),a
	ld		(flag_fireA),a
	ld		(id_arme),a
; on remplit le tableau des adresse de sprite hard de goldorak
	ld		hl,Tbl_sprh_direction
	ld		de,GOLDORAK_HAUTBAS_SPRH_ROM_ADR
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		de,GOLDORAK_GAUCHE_SPRH_ROM_ADR
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		de,GOLDORAK_DROITE_SPRH_ROM_ADR
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		hl,Tbl_sprh_direction2
	ld		de,GOLDORAK_HAUTBAS_SPRH_ROM_ADR+#200
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		de,GOLDORAK_GAUCHE_SPRH_ROM_ADR+#200
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		de,GOLDORAK_DROITE_SPRH_ROM_ADR+#200
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		hl,(Tbl_sprh_direction)
	ld		(sprh_goldorak),hl	
	ld		hl,(Tbl_sprh_direction2)
	ld		(sprh_goldorak2),hl	
; on remplit le tableau des timer des soucoupes simple
	ld		de,Tbl_timer_depart_soucoupes
	ld		hl,Tbl_VALEUR_TIMER_soucoupes
	ld		bc,6
	LDIR
	ld		a,1
	ld		(sample_counter),a
	ld		(direction_goldorak),a
	ld		hl,#0100
	ld		(adr_sample),hl
	ld		hl,#1d40
	ld		(longueur_sample),hl
	ld		a,SCROLL_INIT_RETARD_VIDEO
	ld		(valeur_retard),a
	ld		hl,TBL_VAGUES_LEVEL_1			; on lit l'adresse du tableau des vague de Level 1
	ld		(pointeur_tbl_level),hl			; on stock l'adresse du pointeur
	ld		e,(hl)							; on lit l'adresse contenu à l'adresse du pointeur
	inc		hl
	ld		d,(hl)
	;ld	hl,TBL_NBR_SOUCOUPES
	ld	(Pointeur_TblNombreDeSoucoupes),de
	
	ld		hl,TBL_TYPE_DE_SOUCOUPE
	ld		(Pointeur_TblTypeDeSoucoupe),hl
	
	
	ld		hl,tbl_reg1213_fin
	ld		(valeur_crtc),hl
	ld		hl,#c7c0 
	ld		(valeur_offset),hl
	ld		(pointeur_ecran),hl
	
	
	
	
	
	ld		hl,aucune_arme
	ld		(adr_type_arme),hl
	ld		a,_CALL						; call
	ld		(event_arrimage),a
	ld		hl,Arrimage
	ld		(event_arrimage+1),hl
	ld		a,#C3						; JP
	ld		(event_arrimage+3),a
	ld		hl,boucle_principale
	ld		(event_arrimage+4),hl

	RET	


; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; /////////////////     GESTION POWERUP  //////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
powerup_ROM	
	ld	a,(etp_powerup)
	cp	a,0
	jp	z,init_powerup
	cp	a,1
	jp	z,set_PowerUpBar
	cp	a,2
	jp	z,dec_PowerUpbar
	init_powerup
		inc		a
		ld		(etp_powerup),a
		ld		hl,HUD_DEPART_POWER_UP2+3
		ld		b,HUD_POWERUP_PIXEL_NOIR
		ld		e,7
		boucle_powerup_total
			ld		c,4
			push	hl
			.boucle_powerup
				ld		(hl),b
				ld		a,8
				add		a,h
				ld		h,a
				dec		c
				jr		nz,.boucle_powerup
				pop		hl
				dec		hl
				dec		e
				jr		nz,boucle_powerup_total
				ret
set_PowerUpBar
	ld		a,(flag_PowerUP)
	cp		a,0
	ret		Z
	cp		a,1
	jp		z,SetPowerUpBar_1
	cp		a,2
	jp		z,SetPowerUpBar_2
	SetPowerUpBar_1
		ld		a,(compteur_powerup_niv1)
		cp		a,0
		jr		nz,SetPowerUpBar_2

		ld		hl,#4970
		ld		(PowerupBar_ECRAN),hl
		push	hl
		ld		de,Tbl_couleur_pixel
		ld		a,(de)
		ld		c,4
		boucle_SetPowerUpBar_1
			push	de
		; couleur 1
			ld		(hl),a
			ld		a,8
			add		a,h
			ld		h,a
			inc		de
			ld		a,(de)
		; couleur 2	
			ld		(hl),a
			ld		a,8
			add		a,h
			ld		h,a
			inc		de
			ld		a,(de)
		; couleur 3	
			ld		(hl),a
			ld		a,8
			add		a,h
			ld		h,a
			inc		de
			ld		a,(de)
		; couleur 4	
			ld		(hl),a

		; on recupère l'adresse de départ de la table des couleur des pixels	
			pop		de
		; on se place un 1 octet avant
			ld		hl,(PowerupBar_ECRAN)
			dec		hl
			ld		(PowerupBar_ECRAN),hl
			dec		c
			jr		nz,boucle_SetPowerUpBar_1
			pop		HL
			ld		(PowerupBar_ECRAN),hl
			ld		a,2
			ld		(etp_powerup),a
			call	fin_missiles_gamma
			ld		a,FORCE_MISSILES_GAMMA2
			ld		(points_attaque),a
			ret
	
			SetPowerUpBar_2
				ld		hl,#4973
				ld		(PowerupBar_ECRAN),hl
				push	hl
				ld		de,Tbl_couleur_pixel
				ld		a,(de)
				ld		c,7
				boucle_SetPowerUpBar_2
					push	de
				; couleur 1
					ld		(hl),a
					ld		a,8
					add		a,h
					ld		h,a
					inc		de
					ld		a,(de)
				; couleur 2	
					ld		(hl),a
					ld		a,8
					add		a,h
					ld		h,a
					inc		de
					ld		a,(de)
				; couleur 3	
					ld		(hl),a
					ld		a,8
					add		a,h
					ld		h,a
					inc		de
					ld		a,(de)
				; couleur 4	
					ld		(hl),a
				
				; on recupère l'adresse de départ de la table des couleur des pixels	
					pop		de
				; on se place un 1 octet avant
					ld		hl,(PowerupBar_ECRAN)
					dec		hl
					ld		(PowerupBar_ECRAN),hl
					dec		c
					jr		nz,boucle_SetPowerUpBar_2
					pop		HL
					ld		(PowerupBar_ECRAN),hl
					ld		a,2
					ld		(etp_powerup),a
					call	fin_missiles_gamma
					ld		a,FORCE_MISSILES_GAMMA3
					ld		(points_attaque),a
					ret
	


Tbl_couleur_pixel
db	HUD_POWERUP_PIXEL_ORANGE,HUD_POWERUP_PIXEL_JAUNE
db	HUD_POWERUP_PIXEL_JAUNE,HUD_POWERUP_PIXEL_ORANGE



	
	
	
	
dec_PowerUpbar

; compteur de frame pour la vitesse à laquelle descends le power up
	ld		a,(CompteurFramePowerUp)
	inc		a
	ld		(CompteurFramePowerUp),a
	cp		a,128
	RET		NZ
	xor		a
	ld		(CompteurFramePowerUp),a
	ld		a,(flag_PowerUP)
	cp		a,1
	jr		z,DecrementePowerUp_Niv1
	cp		a,2
	jr		z,DecrementePowerUp_Niv2
DecrementePowerUp_Niv1
	ld		hl,(PowerupBar_ECRAN)
	ld		b,HUD_POWERUP_PIXEL_NOIR
	ld		c,4
.boucle_dec_powerup	
	ld		(hl),b
	ld		a,8
	add		a,h
	ld		h,a
	dec		c
	jr		nz,.boucle_dec_powerup
	ld		hl,(PowerupBar_ECRAN)
	dec		hl
	ld		(PowerupBar_ECRAN),hl
	
	ld		a,(compteur_powerup_niv1)
	inc		a
	ld		(compteur_powerup_niv1),a
	cp		a,4
	jr		z,reinit_compteur_powerup_niv1
	ret
reinit_compteur_powerup_niv1
	xor		a
	ld		(compteur_powerup_niv1),a
	ld		(flag_PowerUP),a
	inc		a
	ld		(etp_powerup),a
	call	fin_missiles_gamma
	ld		a,FORCE_MISSILES_GAMMA
	ld		(points_attaque),a
	ret




	
DecrementePowerUp_Niv2
	ld		hl,(PowerupBar_ECRAN)
	ld		b,HUD_POWERUP_PIXEL_NOIR
	ld		c,4
.boucle_dec_powerup2	
	ld		(hl),b
	ld		a,8
	add		a,h
	ld		h,a
	dec		c
	jr		nz,.boucle_dec_powerup2
	ld		hl,(PowerupBar_ECRAN)
	dec		hl
	ld		(PowerupBar_ECRAN),hl
	ld		a,(compteur_powerup_niv2)
	inc		a
	ld		(compteur_powerup_niv2),a
	cp		a,3
	jr		z,reinit_compteur_powerup_niv2
	ret
reinit_compteur_powerup_niv2
	xor		a
	ld		(compteur_powerup_niv2),a
	ld		(compteur_powerup_niv1),a
	ld		hl,#4970
	ld		(PowerupBar_ECRAN),hl
	
	call	fin_missiles_gamma
	ld		a,1
	ld		(flag_PowerUP),a

	ld		a,FORCE_MISSILES_GAMMA3
	ld		(points_attaque),a
	ret






include		"05_bis-Init_affichage_ROM.asm"		
include		"06_bis-Init_de_jeu_ROM.asm"
include		"07_bis-arrimage_ROM.asm"
include		"09_bis-armes_fireA_ROM.asm"
include 	"10_bis-armes_fireB_ROM.asm"
include		"11_bis-vagues_ennemis_ROM.asm"
include		"12_bis-soucoupes_ROM.asm"
include		"15_bis-gestion_du_hud_ROM.asm"
include		"18_bis-mouvements_soucoupes_ROM.asm"
include		"19_bis-golgoths_ROM.asm"
include		"19_bis-bis-missiles_ROM.asm"
include		"17_bigboss_fin_ROM.asm"


; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 1        ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	32,-40
	dw	0
TypeSoucoupeVerte2
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	56,-40
	dw  0
TypeSoucoupeVerte3
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	80,-40
	dw  0
TypeSoucoupeVerte4
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	423,-40
	dw	0
TypeSoucoupeVerte5
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	400,-40
	dw  0
TypeSoucoupeVerte6
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	375,-40
	dw  0
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 2        ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw	TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte2A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte3A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte4A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw	TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeVerte5A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeVerte6A
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
	
	
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////    VAGUE MIX DE TYPE 1 & 2    ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte2B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte3B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte4B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeVerte5B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeVerte6B
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
	
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 3        ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	32,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte2C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	56,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte3C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	80,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte4C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	323,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte5C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	300,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte6C
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	275,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
	
	
TypeSoucoupeOrange
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_BasGauche
	dw	423,-40
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
	
TypeSoucoupeBleue
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_BasGauche
	dw	400,-40
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
	
TypeSoucoupeViolette
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR	
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_BasGauche	
	dw	375,-40
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite	

	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////
; ////////////////////////////  TYPE DE SOUCOUPE //////////////////////////////	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

; à l'interieur de soucoupe 1 à 6 ON CHOISIT LE TYPE DE SOUCOUPE
TBL_TYPE_DE_SOUCOUPE
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3,TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6A
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3A,TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6A
; ------------------------------------------------------------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3B
	dw		TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3C
	dw		TypeSoucoupeVerte4C,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3C,TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
; ------------------------------------------------------------------------------------------------------------------------------
; ------------------------------------------------------------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3B
	dw		TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3C
	dw		TypeSoucoupeVerte4C,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3C,TypeSoucoupeVerte4C,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------

	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2A,TypeSoucoupeVerte3
	dw		TypeSoucoupeVerte4A,TypeSoucoupeVerte5B,TypeSoucoupeVerte6A
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2C,TypeSoucoupeVerte3B,TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2,TypeSoucoupeVerte3C
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5A,TypeSoucoupeVerte6
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2B,TypeSoucoupeVerte3A,TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6A
; ------------------------------------------------------------------------------------------------------------------------------
; ------------------------------------------------------------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2C,TypeSoucoupeVerte3B
	dw		TypeSoucoupeVerte4C,TypeSoucoupeVerte5,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2A,TypeSoucoupeVerte3,TypeSoucoupeVerte4B,TypeSoucoupeVerte5B,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2B,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4B,TypeSoucoupeVerte5C,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2,TypeSoucoupeVerte3C,TypeSoucoupeVerte4C,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------

	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3
	dw		TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3,TypeSoucoupeVerte4A,TypeSoucoupeVerte5B,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6A
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------
	dw		TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3,TypeSoucoupeVerte4A,TypeSoucoupeVerte5A,TypeSoucoupeVerte6B
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6,TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte1B,TypeSoucoupeVerte2B,TypeSoucoupeVerte3,TypeSoucoupeVerte4A,TypeSoucoupeVerte5B,TypeSoucoupeVerte6C
	dw		TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A,TypeSoucoupeVerte1C,TypeSoucoupeVerte2C,TypeSoucoupeVerte3A
	dw		TypeSoucoupeVerte4,TypeSoucoupeVerte5,TypeSoucoupeVerte6A,TypeSoucoupeVerte1,TypeSoucoupeVerte2,TypeSoucoupeVerte3,
	dw		TypeSoucoupeVerte1A,TypeSoucoupeVerte2A,TypeSoucoupeVerte3B,TypeSoucoupeVerte4B,TypeSoucoupeVerte5C,TypeSoucoupeVerte6C
; ------------------------------------------------------------------------------------------------------------------------------

; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////  NOMBRE D'ENNEMI SIMULTANE ////////////////////////////	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

; de soucoupe 1 à 6 ce sont les adresse des routines de ces 6 soucoupes qui sont mise en CALL
; à l'interieur de la boucle puit détruite en fin de vague pour par un tir.

TBL_NBR_SOUCOUPES
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague5s,vague5e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF
; -----------------------------------------------------------------------------------------------
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague8s,vague8e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague11s,vague11e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF
	
TBL_NBR_SOUCOUPES2	
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague5s,vague5e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
; -----------------------------------------------------------------------------------------------
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague8s,vague8e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague11s,vague11e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF
	
	
TBL_NBR_SOUCOUPES3	
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague2s,vague2e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague5s,vague5e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
;---------------------------------------------------------------------------------------------------
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

	dw		#FFFF
	


TBL_NBR_SOUCOUPES4
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague5s,vague5e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF
	
TBL_NBR_SOUCOUPES5	
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague5s,vague5e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
; -----------------------------------------------------------------------------------------------
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague8s,vague8e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_3,0
	dw		vague11s,vague11e,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF
	
	
TBL_NBR_SOUCOUPES6	
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague2s,vague2e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague5s,vague5e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

	dw		#FFFF



