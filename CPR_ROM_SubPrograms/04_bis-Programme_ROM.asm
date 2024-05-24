 org #c000


include		"09_bis-armes_fireA_ROM.asm"
include		"11_bis-vagues_ennemis_ROM.asm"
include		"19_bis-scene_de_fin_ROM.asm"


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

		ld		hl,HUD_DEPART_POWER_UP2
		ld		(PowerupBar_ECRAN),hl
		push	hl
		ld		de,Tbl_couleur_pixel
		ld		a,(de)
		ld		c,4
		boucle_SetPowerUpBar_1
			push	de

			ld		b,3
boucle_couleurs
		; couleur 1,2,3
			ld		(hl),a
			ld		a,8
			add		a,h
			ld		h,a
			inc		de
			ld		a,(de)
			dec 	b
			jr		nz,boucle_couleurs
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


			call	fin_missiles_gamma2
			; call	rom_off
			ld		a,FORCE_MISSILES_GAMMA2
			ld		(points_attaque),a
			ret

			SetPowerUpBar_2
				ld		hl,HUD_DEPART_POWER_UP1
				ld		(PowerupBar_ECRAN),hl
				push	hl
				ld		de,Tbl_couleur_pixel
				ld		a,(de)
				ld		c,7
				boucle_SetPowerUpBar_2
					push	de
					ld		b,3
				boucle_couleurs_2
				; couleur 1,2,3
					ld		(hl),a
					ld		a,8
					add		a,h
					ld		h,a
					inc		de
					ld		a,(de)
					dec 	b
					jr		nz,boucle_couleurs_2
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
					call	fin_missiles_gamma2
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
	call	fin_missiles_gamma2
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

	call	fin_missiles_gamma2
	ld		a,1
	ld		(flag_PowerUP),a

	ld		a,FORCE_MISSILES_GAMMA3
	ld		(points_attaque),a
	ret


fin_missiles_gamma2
	call 	ASIC_CONNEXION
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a 
	ld		(flag_fireA),a
	ld		(etp_arme2),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	CALL	ASIC_DECONNEXION
	ld 		c,2   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret
	








; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 1        ///////////////////
; ////// (Soucoupes qui descendent depuis le haut vers le bas) //////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1b
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	32,-40
	dw	0
TypeSoucoupeVerte2b
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	56,-40
	dw  0
TypeSoucoupeVerte3b
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasDroite
	dw	80,-40
	dw  0
TypeSoucoupeVerte4b
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	423,-40
	dw	0
TypeSoucoupeVerte5b
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	400,-40
	dw  0
TypeSoucoupeVerte6b
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_BasGauche
	dw	375,-40
	dw  0
TypeSoucoupeOrange1b
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_BasDroite
	dw	32,-40
	dw	0
TypeSoucoupeOrange2b
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_BasDroite
	dw	56,-40
	dw  0
TypeSoucoupeOrange3b
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_BasDroite
	dw	80,-40
	dw  0
TypeSoucoupeOrange4b
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_BasGauche
	dw	423,-40
	dw	0
TypeSoucoupeOrange5b
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_BasGauche
	dw	400,-40
	dw  0
TypeSoucoupeOrange6b
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_BasGauche
	dw	375,-40
	dw  0
TypeSoucoupeBleue1b
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_BasDroite
	dw	32,-40
	dw	0
TypeSoucoupeBleue2b
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_BasDroite
	dw	56,-40
	dw  0
TypeSoucoupeBleue3b
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_BasDroite
	dw	80,-40
	dw  0
TypeSoucoupeBleue4b
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_BasGauche
	dw	423,-40
	dw	0
TypeSoucoupeBleue5b
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_BasGauche
	dw	400,-40
	dw  0
TypeSoucoupeBleue6b
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_BasGauche
	dw	375,-40
	dw  0



TypeSoucoupeViolette1b
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_BasDroite
	dw	32,-40
	dw	0
TypeSoucoupeViolette2b
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_BasDroite
	dw	56,-40
	dw  0
TypeSoucoupeViolette3b
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_BasDroite
	dw	80,-40
	dw  0
TypeSoucoupeViolette4b
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_BasGauche
	dw	423,-40
	dw	0
TypeSoucoupeViolette5b
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_BasGauche
	dw	400,-40
	dw  0
TypeSoucoupeViolette6b
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
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
TypeSoucoupeVerte1hvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw	TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte2hvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte3hvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeVerte4hvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw	TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeVerte5hvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeVerte6hvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeOrange1hvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw	TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeOrange2hvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeOrange3hvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeOrange4hvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw	TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeOrange5hvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeOrange6hvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeBleue1hvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw	TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeBleue2hvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeBleue3hvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeBleue4hvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw	TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeBleue5hvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeBleue6hvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche

	

TypeSoucoupeViolette1hvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw	TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeViolette2hvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeViolette3hvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_HorizVertiBasDroite
	dw	-60,60
	dw  TBL_DEPLACEMENT_HorizVertiBasDroite
TypeSoucoupeViolette4hvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw	TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeViolette5hvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche
TypeSoucoupeViolette6hvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_HorizVertiBasGauche
	dw	520,60
	dw  TBL_DEPLACEMENT_HorizVertiBasGauche


; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////    VAGUE MIX DE TYPE 3   	   ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1dvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte2dvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte3dvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeVerte4dvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeVerte5dvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeVerte6dvb
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeOrange1dvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeOrange2dvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeOrange3dvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeOrange4dvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeOrange5dvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeOrange6dvb
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeBleue1dvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeBleue2dvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeBleue3dvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeBleue4dvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeBleue5dvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeBleue6dvb
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche


TypeSoucoupeViolette1dvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeViolette2dvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeViolette3dvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_DiagoVertiBasDroite
	dw	-60,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasDroite
TypeSoucoupeViolette4dvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw	TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeViolette5dvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche
TypeSoucoupeViolette6dvb
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_DiagoVertiBasGauche
	dw	520,10
	dw  TBL_DEPLACEMENT_DiagoVertiBasGauche

; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 4        ///////////////////
; /////////////////                               ///////////////////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
TypeSoucoupeVerte1zv
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	32,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte2zv
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	56,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte3zv
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	80,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte4zv
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	323,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte5zv
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	300,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeVerte6zv
	dw	SOUCOUPE_VERTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VERTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	275,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas

TypeSoucoupeOrange1zv
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	32,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeOrange2zv
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	56,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeOrange3zv
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	80,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeOrange4zv
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	323,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeOrange5zv
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	300,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeOrange6zv
	dw	SOUCOUPE_ORANGE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_ORANGE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	275,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas

TypeSoucoupeBleue1zv
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	32,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeBleue2zv
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	56,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeBleue3zv
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	80,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeBleue4zv
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	323,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeBleue5zv
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	300,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeBleue6zv
	dw	SOUCOUPE_BLEUE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_BLEUE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	275,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas



TypeSoucoupeViolette1zv
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	32,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeViolette2zv
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	56,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeViolette3zv
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	80,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeViolette4zv
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	323,-40
	dw	TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeViolette5zv
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	300,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas
TypeSoucoupeViolette6zv
	dw	SOUCOUPE_VIOLETTE_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_ZigzagVertiBas
	dw	275,-40
	dw  TBL_DEPLACEMENT_ZigzagVertiBas



; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////
; /////////////////                               ///////////////////
; /////////////////        VAGUE DE TYPE 5        ///////////////////
; //////  (Soucoupes qui arrivent par derrière et y retourne)  //////
; ///////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////

TypeSoucoupeVerte1t
	dw	SOUCOUPE_QUI_TOURNE_HAUT_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_TourneGauche
	dw	32,220
	dw	0
TypeSoucoupeVerte2t
	dw	SOUCOUPE_QUI_TOURNE_HAUT_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_TourneGauche
	dw	64,220
	dw	0
TypeSoucoupeVerte3t
	dw	SOUCOUPE_QUI_TOURNE_HAUT_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_TourneGauche
	dw	96,220
	dw	0
TypeSoucoupeVerte4t
	dw	SOUCOUPE_QUI_TOURNE_BAS_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_TourneDroite
	dw	255,220
	dw	0
TypeSoucoupeVerte5t
	dw	SOUCOUPE_QUI_TOURNE_BAS_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_TourneDroite
	dw	375,220
	dw	0
TypeSoucoupeVerte6t
	dw	SOUCOUPE_QUI_TOURNE_BAS_SPRH_ROM_ADR
	db	PV_SOUCOUPE_VIOLETTE
	dw	deplace_soucoupe_TourneDroite
	dw	423,220
	dw	0





; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////
; ////////////////////////////  TYPE DE SOUCOUPE //////////////////////////////
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

; à l'interieur de soucoupe 1 à 6 ON CHOISIT LE TYPE DE SOUCOUPE


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////             LEVEL 1            ///////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////

TBL_TYPE_DE_SOUCOUPE_1

	dw		TypeSoucoupeVerte2b
	dw		TypeSoucoupeVerte5hvb
	
	; dw		TypeSoucoupeVerte1b,TypeSoucoupeVerte4dvb
	; dw		TypeSoucoupeVerte3hvb,TypeSoucoupeVerte6zv
	; dw		TypeSoucoupeVerte2zv,TypeSoucoupeVerte3b
	; dw		TypeSoucoupeVerte1dvb,TypeSoucoupeVerte6zv
	; dw		TypeSoucoupeVerte4b,TypeSoucoupeVerte5dvb
	
	; dw		TypeSoucoupeVerte1zv,TypeSoucoupeVerte2dvb,TypeSoucoupeVerte3hvb
	; dw		TypeSoucoupeVerte4dvb,TypeSoucoupeVerte5b,TypeSoucoupeVerte6zv
	; dw		TypeSoucoupeVerte1zv,TypeSoucoupeVerte3hvb,TypeSoucoupeVerte5zv
	; dw		TypeSoucoupeVerte2b,TypeSoucoupeVerte4dvb,TypeSoucoupeVerte6hvb
	; dw		TypeSoucoupeVerte3hvb,TypeSoucoupeVerte4zv,TypeSoucoupeVerte5hvb

	; dw		TypeSoucoupeVerte2zv,TypeSoucoupeVerte3b,TypeSoucoupeVerte4dvb,TypeSoucoupeVerte6b
	; dw		TypeSoucoupeVerte1dvb,TypeSoucoupeVerte2hvb,TypeSoucoupeVerte5dvb,TypeSoucoupeVerte6hvb
	; dw		TypeSoucoupeVerte1b,TypeSoucoupeVerte2dvb,TypeSoucoupeVerte3b,TypeSoucoupeVerte5dvb
	; dw		TypeSoucoupeVerte2hvb,TypeSoucoupeVerte4dvb,TypeSoucoupeVerte5hvb,TypeSoucoupeVerte6dvb
	; dw		TypeSoucoupeVerte1zv,TypeSoucoupeVerte3b,TypeSoucoupeVerte4dvb,TypeSoucoupeVerte5hvb

	; dw		TypeSoucoupeVerte5dvb,TypeSoucoupeVerte6zv
	; dw		TypeSoucoupeVerte1zv,TypeSoucoupeVerte2dvb

	; dw		TypeSoucoupeVerte3b,TypeSoucoupeVerte5zv,TypeSoucoupeVerte6b
	; dw		TypeSoucoupeVerte1hvb,TypeSoucoupeVerte2dvb,TypeSoucoupeVerte4hvb

; de soucoupe 1 à 6 ce sont les adresse des routines de ces 6 soucoupes qui sont mise en CALL
; à l'interieur de la boucle puit détruite en fin de vague pour par un tir.

TBL_NBR_SOUCOUPES

	dw		vague1s,vague1e,soucoupe_2,0
	dw		vague2s,vague2e,soucoupe_5,0

 	; dw		vague3s,vague3e,soucoupe_1,soucoupe_4,0
 	; dw		vague4s,vague4e,soucoupe_3,soucoupe_6,0
 	; dw		vague5s,vague5e,soucoupe_2,soucoupe_3,0
 	; dw		vague6s,vague6e,soucoupe_1,soucoupe_6,0
 	; dw		vague7s,vague7e,soucoupe_4,soucoupe_5,0

 	; dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,0
 	; dw		vague9s,vague9e,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague10s,vague10e,soucoupe_1,soucoupe_3,soucoupe_5,0
 	; dw		vague11s,vague11e,soucoupe_2,soucoupe_4,soucoupe_6,0
 	; dw		vague12s,vague12e,soucoupe_3,soucoupe_4,soucoupe_5,0

 	; dw		vague13s,vague13e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	; dw		vague14s,vague14e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0
 	; dw		vague15s,vague15e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	; dw		vague16s,vague16e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague17s,vague17e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,0

	; dw		vague18s,vague18e,soucoupe_5,soucoupe_6,0
 	; dw		vague19s,vague19e,soucoupe_1,soucoupe_2,0

 	; dw		vague20s,vague20e,soucoupe_3,soucoupe_5,soucoupe_6,0
 	; dw		vague21s,vague21e,soucoupe_1,soucoupe_2,soucoupe_4,0
 	; dw		vague22s,vague22e,soucoupe_1,soucoupe_2,soucoupe_4,0

	dw		#FFFF

; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////             LEVEL 2            ///////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////

TBL_TYPE_DE_SOUCOUPE_2
	dw		TypeSoucoupeVerte2zv,TypeSoucoupeVerte3b
	dw		TypeSoucoupeVerte1b,TypeSoucoupeVerte4hvb
	; dw		TypeSoucoupeVerte5b,TypeSoucoupeVerte6zv

	; dw		TypeSoucoupeVerte1b,TypeSoucoupeVerte3hvb,TypeSoucoupeOrange5hvb
	; dw		TypeSoucoupeVerte3zv,TypeSoucoupeOrange4zv,TypeSoucoupeVerte5zv
	; dw		TypeSoucoupeOrange2b,TypeSoucoupeVerte4dvb,TypeSoucoupeVerte6zv
	; dw		TypeSoucoupeVerte1hvb,TypeSoucoupeOrange2hvb,TypeSoucoupeVerte5dvb
	; dw		TypeSoucoupeVerte4zv,TypeSoucoupeVerte5zv,TypeSoucoupeOrange6zv
	; dw		TypeSoucoupeVerte1b,TypeSoucoupeOrange2dvb,TypeSoucoupeVerte3dvb
	; dw		TypeSoucoupeOrange2b,TypeSoucoupeVerte3hvb,TypeSoucoupeVerte4hvb
	

	; dw		TypeSoucoupeVerte1b,TypeSoucoupeOrange3dvb,TypeSoucoupeVerte5zv,TypeSoucoupeVerte6hvb
	; dw		TypeSoucoupeVerte2dvb,TypeSoucoupeVerte4b,TypeSoucoupeOrange5hvb,TypeSoucoupeVerte6zv
	; dw		TypeSoucoupeVerte1zv,TypeSoucoupeVerte2hvb,TypeSoucoupeOrange3b,TypeSoucoupeOrange4dvb
	; dw		TypeSoucoupeVerte2hvb,TypeSoucoupeOrange3zv,TypeSoucoupeVerte4dvb,TypeSoucoupeVerte5b
	; dw		TypeSoucoupeOrange1zv,TypeSoucoupeVerte2hvb,TypeSoucoupeOrange4b,TypeSoucoupeVerte6dvb
	; dw		TypeSoucoupeVerte3zv,TypeSoucoupeVerte4b,TypeSoucoupeOrange5hvb,TypeSoucoupeOrange6zv
	; dw		TypeSoucoupeVerte1b,TypeSoucoupeOrange2zv,TypeSoucoupeVerte5dvb,TypeSoucoupeVerte6hvb

	; dw		TypeSoucoupeVerte2zv,TypeSoucoupeVerte5b
	; dw		TypeSoucoupeOrange3b,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6zv
	; dw		TypeSoucoupeVerte4zv,TypeSoucoupeVerte6b
	; dw		TypeSoucoupeVerte2b,TypeSoucoupeOrange3zv,TypeSoucoupeOrange5zv
	dw		TypeSoucoupeOrange1zv,TypeSoucoupeOrange3b,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6zv
	


TBL_NBR_SOUCOUPES2
	dw		vague1s,vague1e,soucoupe_2,soucoupe_3,0
	dw		vague2s,vague2e,soucoupe_1,soucoupe_4,0
	; dw		vague3s,vague3e,soucoupe_5,soucoupe_6,0
	

 	; dw		vague4s,vague4e,soucoupe_1,soucoupe_3,soucoupe_5,0
 	; dw		vague5s,vague5e,soucoupe_3,soucoupe_4,soucoupe_5,0
 	; dw		vague6s,vague6e,soucoupe_2,soucoupe_4,soucoupe_6,0
 	; dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_5,0
 	; dw		vague8s,vague8e,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,0
 	; dw		vague10s,vague10e,soucoupe_2,soucoupe_3,soucoupe_4,0

 	; dw		vague11s,vague11e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	; dw		vague12s,vague12e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague13s,vague13e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,0
 	; dw		vague14s,vague14e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	; dw		vague15s,vague15e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
 	; dw		vague16s,vague16e,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague17s,vague17e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0

	; dw		vague18s,vague18e,soucoupe_2,soucoupe_5,0
 	; dw		vague19s,vague19e,soucoupe_3,soucoupe_5,soucoupe_6,0
	; dw		vague20s,vague20e,soucoupe_4,soucoupe_6,0
 	; dw		vague21s,vague21e,soucoupe_2,soucoupe_3,soucoupe_5,0
 	; dw		vague22s,vague22e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	; dw		vague23s,vague23e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0

	dw		#FFFF

; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////             LEVEL 3            ///////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////

TBL_TYPE_DE_SOUCOUPE_3
	dw		TypeSoucoupeOrange2b
	dw		TypeSoucoupeOrange5hvb
	
	dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange4dvb
	; dw		TypeSoucoupeOrange3hvb,TypeSoucoupeVerte6zv
	; dw		TypeSoucoupeBleue2zv,TypeSoucoupeOrange3b
	; dw		TypeSoucoupeOrange1dvb,TypeSoucoupeOrange6zv
	; dw		TypeSoucoupeVerte4b,TypeSoucoupeOrange5dvb
	
	; dw		TypeSoucoupeOrange1zv,TypeSoucoupeOrange2dvb,TypeSoucoupeOrange3hvb
	; dw		TypeSoucoupeVerte4dvb,TypeSoucoupeOrange5b,TypeSoucoupeOrange6zv
	; dw		TypeSoucoupeOrange1zv,TypeSoucoupeBleue3hvb,TypeSoucoupeVerte5zv
	; dw		TypeSoucoupeOrange2b,TypeSoucoupeOrange4dvb,TypeSoucoupeOrange6hvb
	; dw		TypeSoucoupeOrange3hvb,TypeSoucoupeVerte4zv,TypeSoucoupeOrange5hvb

	; dw		TypeSoucoupeOrange2zv,TypeSoucoupeOrange3b,TypeSoucoupeOrange4dvb,TypeSoucoupeVerte6b
	; dw		TypeSoucoupeOrange1dvb,TypeSoucoupeOrange2hvb,TypeSoucoupeOrange5dvb,TypeSoucoupeOrange6hvb
	; dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange2dvb,TypeSoucoupeBleue3b,TypeSoucoupeOrange5dvb
	; dw		TypeSoucoupeOrange2hvb,TypeSoucoupeVerte4dvb,TypeSoucoupeOrange5hvb,TypeSoucoupeOrange6dvb
	; dw		TypeSoucoupeOrange1zv,TypeSoucoupeOrange3b,TypeSoucoupeVerte4dvb,TypeSoucoupeOrange5hvb

	; dw		TypeSoucoupeOrange5dvb,TypeSoucoupeOrange6zv
	; dw		TypeSoucoupeOrange1zv,TypeSoucoupeVerte2dvb
	
	; dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange3dvb,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6hvb
	; dw		TypeSoucoupeVerte2dvb,TypeSoucoupeOrange4b,TypeSoucoupeOrange5hvb,TypeSoucoupeOrange6zv
	; dw		TypeSoucoupeOrange1zv,TypeSoucoupeVerte2hvb,TypeSoucoupeOrange3b,TypeSoucoupeOrange4dvb
	; dw		TypeSoucoupeBleue2hvb,TypeSoucoupeOrange3zv,TypeSoucoupeVerte4dvb,TypeSoucoupeOrange5b
	; dw		TypeSoucoupeOrange1zv,TypeSoucoupeOrange2hvb,TypeSoucoupeOrange4b,TypeSoucoupeVerte6dvb
	; dw		TypeSoucoupeOrange3zv,TypeSoucoupeOrange4b,TypeSoucoupeBleue5hvb,TypeSoucoupeOrange6zv
	; dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange2zv,TypeSoucoupeOrange5dvb,TypeSoucoupeOrange6hvb

	; dw		TypeSoucoupeOrange3b,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6b
	; dw		TypeSoucoupeOrange1hvb,TypeSoucoupeOrange2dvb,TypeSoucoupeOrange4hvb


TBL_NBR_SOUCOUPES3
	dw		vague1s,vague1e,soucoupe_2,0
	dw		vague2s,vague2e,soucoupe_5,0

 	dw		vague3s,vague3e,soucoupe_1,soucoupe_4,0
 	; dw		vague4s,vague4e,soucoupe_3,soucoupe_6,0
 	; dw		vague5s,vague5e,soucoupe_2,soucoupe_3,0
 	; dw		vague6s,vague6e,soucoupe_1,soucoupe_6,0
 	; dw		vague7s,vague7e,soucoupe_4,soucoupe_5,0

 	; dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,0
 	; dw		vague9s,vague9e,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague10s,vague10e,soucoupe_1,soucoupe_3,soucoupe_5,0
 	; dw		vague11s,vague11e,soucoupe_2,soucoupe_4,soucoupe_6,0
 	; dw		vague12s,vague12e,soucoupe_3,soucoupe_4,soucoupe_5,0

 	; dw		vague13s,vague13e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	; dw		vague14s,vague14e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0
 	; dw		vague15s,vague15e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	; dw		vague16s,vague16e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague17s,vague17e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,0

	; dw		vague18s,vague18e,soucoupe_5,soucoupe_6,0
 	; dw		vague19s,vague19e,soucoupe_1,soucoupe_2,0
	
 	; dw		vague20s,vague20e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	; dw		vague21s,vague21e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague22s,vague22e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,0
 	; dw		vague23s,vague23e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	; dw		vague24s,vague24e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
 	; dw		vague25s,vague25e,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	; dw		vague26s,vague26e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0

 	; dw		vague27s,vague27e,soucoupe_3,soucoupe_5,soucoupe_6,0
 	; dw		vague28s,vague28e,soucoupe_1,soucoupe_2,soucoupe_4,0
 	; dw		vague29s,vague29e,soucoupe_1,soucoupe_2,soucoupe_4,0
	dw		#FFFF


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////             LEVEL 4            ///////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////

 TBL_TYPE_DE_SOUCOUPE_4
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeOrange2dvb,TypeSoucoupeOrange3hvb
	dw		TypeSoucoupeOrange4dvb,TypeSoucoupeBleue5b,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange1zv,TypeSoucoupeOrange3hvb,TypeSoucoupeBleue5zv
	dw		TypeSoucoupeOrange2b,TypeSoucoupeBleue4dvb,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeBleue3hvb,TypeSoucoupeOrange4zv,TypeSoucoupeOrange5hvb

	dw		TypeSoucoupeOrange1b,TypeSoucoupeBleue3dvb,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeVerte2dvb,TypeSoucoupeOrange4b,TypeSoucoupeBleue5hvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange1zv,TypeSoucoupeVerte2hvb,TypeSoucoupeOrange3b,TypeSoucoupeBleue4dvb
	dw		TypeSoucoupeOrange2hvb,TypeSoucoupeOrange3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeOrange5b
	dw		TypeSoucoupeOrange1zv,TypeSoucoupeBleue2hvb,TypeSoucoupeOrange4b,TypeSoucoupeVerte6dvb
	dw		TypeSoucoupeBleue3zv,TypeSoucoupeOrange4b,TypeSoucoupeOrange5hvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange1b,TypeSoucoupeBleue2zv,TypeSoucoupeOrange5dvb,TypeSoucoupeOrange6hvb

	dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange3hvb,TypeSoucoupeBleue5hvb
	dw		TypeSoucoupeOrange3zv,TypeSoucoupeBleue4zv,TypeSoucoupeOrange5zv
	dw		TypeSoucoupeBleue2b,TypeSoucoupeOrange4dvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange1hvb,TypeSoucoupeBleue2hvb,TypeSoucoupeOrange5dvb

	dw		TypeSoucoupeOrange4zv,TypeSoucoupeOrange5zv,TypeSoucoupeBleue6zv
	dw		TypeSoucoupeBleue1b,TypeSoucoupeBleue2dvb,TypeSoucoupeOrange3dvb
	dw		TypeSoucoupeBleue2b,TypeSoucoupeBleue3hvb,TypeSoucoupeBleue4hvb

	dw		TypeSoucoupeOrange2zv,TypeSoucoupeOrange3b,TypeSoucoupeOrange4dvb,TypeSoucoupeVerte6b
	dw		TypeSoucoupeOrange1dvb,TypeSoucoupeOrange2hvb,TypeSoucoupeOrange5dvb,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange2dvb,TypeSoucoupeBleue3b,TypeSoucoupeOrange5dvb
	dw		TypeSoucoupeOrange2hvb,TypeSoucoupeVerte4dvb,TypeSoucoupeOrange5hvb,TypeSoucoupeOrange6dvb
	dw		TypeSoucoupeOrange1zv,TypeSoucoupeOrange3b,TypeSoucoupeVerte4dvb,TypeSoucoupeOrange5hvb

	dw		TypeSoucoupeOrange5dvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange1zv,TypeSoucoupeVerte2dvb
	
	dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange3dvb,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeVerte2dvb,TypeSoucoupeOrange4b,TypeSoucoupeOrange5hvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange1zv,TypeSoucoupeVerte2hvb,TypeSoucoupeOrange3b,TypeSoucoupeOrange4dvb
	dw		TypeSoucoupeBleue2hvb,TypeSoucoupeOrange3zv,TypeSoucoupeVerte4zv,TypeSoucoupeOrange5b
	dw		TypeSoucoupeOrange1zv,TypeSoucoupeOrange2zv,TypeSoucoupeOrange4b,TypeSoucoupeVerte6zv
	dw		TypeSoucoupeOrange3zv,TypeSoucoupeOrange4b,TypeSoucoupeBleue5zv,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange3zv,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange1b,TypeSoucoupeOrange4zv,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeOrange2b,TypeSoucoupeOrange4zv,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6zv



 TBL_NBR_SOUCOUPES4

 	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
 	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague3s,vague3e,soucoupe_1,soucoupe_3,soucoupe_5,0
 	dw		vague4s,vague4e,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague5s,vague5e,soucoupe_3,soucoupe_4,soucoupe_5,0

 	dw		vague6s,vague6e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague7s,vague7e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,0
 	dw		vague9s,vague9e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague11s,vague11e,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0

	dw		vague13s,vague13e,soucoupe_1,soucoupe_3,soucoupe_5,0
 	dw		vague14s,vague14e,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague15s,vague15e,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague16s,vague16e,soucoupe_1,soucoupe_2,soucoupe_5,0

	dw		vague17s,vague17e,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague18s,vague18e,soucoupe_1,soucoupe_2,soucoupe_3,0
 	dw		vague19s,vague19e,soucoupe_2,soucoupe_3,soucoupe_4,0

 	dw		vague20s,vague20e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague21s,vague21e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0
 	dw		vague22s,vague22e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	dw		vague23s,vague23e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague24s,vague24e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,0

	dw		vague25s,vague25e,soucoupe_5,soucoupe_6,0
 	dw		vague26s,vague26e,soucoupe_1,soucoupe_2,0
	
 	dw		vague27s,vague27e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague28s,vague28e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague29s,vague29e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,0
 	dw		vague30s,vague30e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague31s,vague31e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague32s,vague32e,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague33s,vague33e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague34s,vague34e,soucoupe_1,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague35s,vague35e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague36s,vague36e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	
	dw		#FFFF

; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////             LEVEL 5            ///////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////

 TBL_TYPE_DE_SOUCOUPE_5
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeOrange2zv,TypeSoucoupeOrange3hvb
	dw		TypeSoucoupeOrange4dvb,TypeSoucoupeBleue5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange3zv,TypeSoucoupeBleue5zv
	dw		TypeSoucoupeOrange2zv,TypeSoucoupeBleue4dvb,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeBleue3hvb,TypeSoucoupeOrange4zv,TypeSoucoupeOrange5hvb

	dw		TypeSoucoupeViolette1zv,TypeSoucoupeBleue3dvb,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeVerte2t,TypeSoucoupeOrange4zv,TypeSoucoupeBleue5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeOrange3b,TypeSoucoupeBleue4dvb
	dw		TypeSoucoupeOrange2hvb,TypeSoucoupeOrange3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeOrange5b
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeBleue2hvb,TypeSoucoupeOrange4zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeBleue3zv,TypeSoucoupeOrange4zv,TypeSoucoupeOrange5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeBleue2zv,TypeSoucoupeOrange5dvb,TypeSoucoupeOrange6hvb

	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange3hvb,TypeSoucoupeBleue5hvb
	dw		TypeSoucoupeOrange3zv,TypeSoucoupeBleue4zv,TypeSoucoupeOrange5zv
	dw		TypeSoucoupeViolette2b,TypeSoucoupeOrange4dvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeOrange1hvb,TypeSoucoupeBleue2hvb,TypeSoucoupeOrange5dvb

	dw		TypeSoucoupeOrange4zv,TypeSoucoupeOrange5zv,TypeSoucoupeBleue6zv
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeBleue2dvb,TypeSoucoupeOrange3dvb
	dw		TypeSoucoupeViolette2b,TypeSoucoupeBleue3hvb,TypeSoucoupeBleue4hvb

	dw		TypeSoucoupeOrange2zv,TypeSoucoupeOrange3b,TypeSoucoupeOrange4dvb,TypeSoucoupeVerte6t
	dw		TypeSoucoupeOrange1dvb,TypeSoucoupeOrange2hvb,TypeSoucoupeOrange5dvb,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange2dvb,TypeSoucoupeBleue3b,TypeSoucoupeOrange5dvb
	dw		TypeSoucoupeOrange2hvb,TypeSoucoupeVerte4t,TypeSoucoupeOrange5hvb,TypeSoucoupeOrange6dvb
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange3b,TypeSoucoupeVerte4t,TypeSoucoupeOrange5hvb

	dw		TypeSoucoupeVerte1t, TypeSoucoupeVerte4t, TypeSoucoupeOrange5dvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeVerte5t
	
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange3dvb,TypeSoucoupeOrange5zv,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeVerte2t,TypeSoucoupeOrange4zv,TypeSoucoupeOrange5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeOrange3b,TypeSoucoupeOrange4dvb
	dw		TypeSoucoupeBleue2hvb,TypeSoucoupeOrange3zv,TypeSoucoupeVerte4t,TypeSoucoupeOrange5b
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange2zv,TypeSoucoupeOrange4zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeOrange3zv,TypeSoucoupeOrange4zv,TypeSoucoupeBleue5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange3zv,TypeSoucoupeOrange5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange4zv,TypeSoucoupeOrange5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeOrange2b,TypeSoucoupeOrange4zv,TypeSoucoupeOrange5zv,TypeSoucoupeViolette6zv



 TBL_NBR_SOUCOUPES5
  	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,0
 	dw		vague2s,vague2e,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague3s,vague3e,soucoupe_1,soucoupe_3,soucoupe_5,0
 	dw		vague4s,vague4e,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague5s,vague5e,soucoupe_3,soucoupe_4,soucoupe_5,0

 	dw		vague6s,vague6e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague7s,vague7e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,0
 	dw		vague9s,vague9e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague11s,vague11e,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0

	dw		vague13s,vague13e,soucoupe_1,soucoupe_3,soucoupe_5,0
 	dw		vague14s,vague14e,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague15s,vague15e,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague16s,vague16e,soucoupe_1,soucoupe_2,soucoupe_5,0

	dw		vague17s,vague17e,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague18s,vague18e,soucoupe_1,soucoupe_2,soucoupe_3,0
 	dw		vague19s,vague19e,soucoupe_2,soucoupe_3,soucoupe_4,0

 	dw		vague20s,vague20e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague21s,vague21e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0
 	dw		vague22s,vague22e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	dw		vague23s,vague23e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague24s,vague24e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,0

	dw		vague25s,vague25e,soucoupe_1,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague26s,vague26e,soucoupe_1,soucoupe_2,soucoupe_5,0
	
 	dw		vague27s,vague27e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague28s,vague28e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague29s,vague29e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,0
 	dw		vague30s,vague30e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague31s,vague31e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague32s,vague32e,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague33s,vague33e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague34s,vague34e,soucoupe_1,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague35s,vague35e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague36s,vague36e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	
	dw		#FFFF

; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////             LEVEL 6            ///////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////

 TBL_TYPE_DE_SOUCOUPE_6
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeViolette2dvb,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette5b
	dw		TypeSoucoupeVerte2t,TypeSoucoupeBleue4dvb,TypeSoucoupeBleue5b,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeViolette3hvb,TypeSoucoupeBleue5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeBleue2b,TypeSoucoupeBleue4dvb,TypeSoucoupeBleue5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeVerte2t,TypeSoucoupeBleue3hvb,TypeSoucoupeBleue4zv,TypeSoucoupeViolette5hvb

	dw		TypeSoucoupeViolette1b,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette5zv,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeVerte2t,TypeSoucoupeVerte4t,TypeSoucoupeBleue5hvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeOrange3b,TypeSoucoupeBleue4dvb
	dw		TypeSoucoupeOrange2hvb,TypeSoucoupeOrange3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5b
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeBleue2hvb,TypeSoucoupeViolette4b,TypeSoucoupeVerte6t
	dw		TypeSoucoupeBleue3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5hvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeViolette1b,TypeSoucoupeBleue2zv,TypeSoucoupeViolette5dvb,TypeSoucoupeOrange6hvb

	dw		TypeSoucoupeViolette1b,TypeSoucoupeOrange3hvb,TypeSoucoupeBleue5hvb,TypeSoucoupeVerte6t
	dw		TypeSoucoupeOrange3zv,TypeSoucoupeBleue4zv,TypeSoucoupeViolette5zv
	dw		TypeSoucoupeVerte2t,TypeSoucoupeViolette4dvb,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1hvb,TypeSoucoupeBleue2hvb,TypeSoucoupeViolette5dvb

	dw		TypeSoucoupeViolette4zv,TypeSoucoupeViolette5zv,TypeSoucoupeBleue6zv
	dw		TypeSoucoupeBleue1b,TypeSoucoupeVerte2t,TypeSoucoupeOrange3dvb,TypeSoucoupeVerte5t
	dw		TypeSoucoupeBleue2b,TypeSoucoupeVerte3t,TypeSoucoupeBleue4hvb,TypeSoucoupeVerte6t

	dw		TypeSoucoupeOrange2zv,TypeSoucoupeOrange3b,TypeSoucoupeViolette4dvb,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1dvb,TypeSoucoupeOrange2hvb,TypeSoucoupeViolette5dvb,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeViolette1b,TypeSoucoupeOrange2dvb,TypeSoucoupeBleue3b,TypeSoucoupeViolette5dvb
	dw		TypeSoucoupeOrange2hvb,TypeSoucoupeVerte4t,TypeSoucoupeViolette5hvb,TypeSoucoupeOrange6dvb
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange3b,TypeSoucoupeVerte4t,TypeSoucoupeViolette5hvb

	dw		TypeSoucoupeViolette5dvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t
	
	dw		TypeSoucoupeViolette1b,TypeSoucoupeOrange3dvb,TypeSoucoupeViolette5zv,TypeSoucoupeOrange6hvb
	dw		TypeSoucoupeVerte2t,TypeSoucoupeViolette4b,TypeSoucoupeViolette5hvb,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeOrange3b,TypeSoucoupeViolette4dvb,TypeSoucoupeVerte6t
	dw		TypeSoucoupeBleue2hvb,TypeSoucoupeOrange3zv,TypeSoucoupeVerte4t,TypeSoucoupeViolette5b,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeOrange2zv,TypeSoucoupeVerte3t,TypeSoucoupeViolette4b,TypeSoucoupeVerte6t
	dw		TypeSoucoupeVerte2t,TypeSoucoupeOrange3zv,TypeSoucoupeViolette4b,TypeSoucoupeBleue5zv,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeOrange3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeOrange3zv,TypeSoucoupeViolette4hvb,TypeSoucoupeVerte5t,TypeSoucoupeOrange6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeViolette4zv,TypeSoucoupeVerte5t,TypeSoucoupeOrange6zv



 TBL_NBR_SOUCOUPES6
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	dw		vague2s,vague2e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague3s,vague3e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague4s,vague4e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague5s,vague5e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0

 	dw		vague6s,vague6e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague7s,vague7e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,0
 	dw		vague9s,vague9e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague11s,vague11e,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0

	dw		vague13s,vague13e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague14s,vague14e,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague15s,vague15e,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague16s,vague16e,soucoupe_1,soucoupe_2,soucoupe_5,0

	dw		vague17s,vague17e,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague18s,vague18e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	dw		vague19s,vague19e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0

 	dw		vague20s,vague20e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague21s,vague21e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0
 	dw		vague22s,vague22e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	dw		vague23s,vague23e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague24s,vague24e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,0

	dw		vague25s,vague25e,soucoupe_5,soucoupe_6,0
 	dw		vague26s,vague26e,soucoupe_1,soucoupe_2,0
	
 	dw		vague27s,vague27e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague28s,vague28e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague29s,vague29e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague30s,vague30e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague31s,vague31e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague32s,vague32e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague33s,vague33e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague34s,vague34e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague35s,vague35e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague36s,vague36e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	
	dw		#FFFF




; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////             LEVEL 7            ///////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////


  TBL_TYPE_DE_SOUCOUPE_7
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeViolette2dvb,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette4b,TypeSoucoupeViolette5b
	dw		TypeSoucoupeVerte1t,TypeSoucoupeVerte2t,TypeSoucoupeBleue4dvb,TypeSoucoupeBleue5b,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeViolette3hvb,TypeSoucoupeViolette4b,TypeSoucoupeBleue5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeBleue2b,TypeSoucoupeViolette3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeBleue5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeVerte2t,TypeSoucoupeBleue3hvb,TypeSoucoupeBleue4zv,TypeSoucoupeViolette5hvb

	dw		TypeSoucoupeViolette1b,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6hvb
	dw		TypeSoucoupeVerte2t,TypeSoucoupeVerte4t,TypeSoucoupeBleue5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeViolette3b,TypeSoucoupeBleue4dvb
	dw		TypeSoucoupeViolette2hvb,TypeSoucoupeViolette3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5b
	dw		TypeSoucoupeVerte1t,TypeSoucoupeBleue2hvb,TypeSoucoupeViolette4b,TypeSoucoupeVerte6t
	dw		TypeSoucoupeBleue3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeBleue2zv,TypeSoucoupeViolette5dvb,TypeSoucoupeViolette6hvb

	dw		TypeSoucoupeBleue2hvb,TypeSoucoupeViolette3zv,TypeSoucoupeVerte4t,TypeSoucoupeViolette5b,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeViolette2zv,TypeSoucoupeVerte3t,TypeSoucoupeViolette4b,TypeSoucoupeVerte6t
	dw		TypeSoucoupeVerte2t,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeBleue5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6zv

	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeBleue1b,TypeSoucoupeVerte2t,TypeSoucoupeViolette3dvb,TypeSoucoupeVerte5t
	dw		TypeSoucoupeBleue2b,TypeSoucoupeVerte3t,TypeSoucoupeBleue4hvb,TypeSoucoupeVerte6t

	dw		TypeSoucoupeViolette2zv,TypeSoucoupeViolette3b,TypeSoucoupeViolette4dvb,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1dvb,TypeSoucoupeViolette2hvb,TypeSoucoupeViolette5dvb,TypeSoucoupeViolette6hvb
	dw		TypeSoucoupeViolette1b,TypeSoucoupeViolette2dvb,TypeSoucoupeBleue3b,TypeSoucoupeViolette5dvb
	dw		TypeSoucoupeViolette2hvb,TypeSoucoupeVerte4t,TypeSoucoupeViolette5hvb,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeViolette3b,TypeSoucoupeVerte4t,TypeSoucoupeViolette5hvb

	dw		TypeSoucoupeViolette2hvb,TypeSoucoupeViolette3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5b
	dw		TypeSoucoupeVerte1t,TypeSoucoupeBleue2hvb,TypeSoucoupeViolette4b,TypeSoucoupeVerte6t
	
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette3dvb,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6hvb
	dw		TypeSoucoupeVerte2t,TypeSoucoupeViolette4b,TypeSoucoupeViolette5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeViolette3b,TypeSoucoupeViolette4dvb,TypeSoucoupeVerte6t
	dw		TypeSoucoupeBleue2hvb,TypeSoucoupeViolette3zv,TypeSoucoupeVerte4t,TypeSoucoupeViolette5b,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeViolette2zv,TypeSoucoupeVerte3t,TypeSoucoupeViolette4b,TypeSoucoupeVerte6t
	dw		TypeSoucoupeVerte2t,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeBleue5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4hvb,TypeSoucoupeVerte5t,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeViolette4zv,TypeSoucoupeVerte5t,TypeSoucoupeViolette6zv





  TBL_NBR_SOUCOUPES7
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague2s,vague2e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague3s,vague3e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague4s,vague4e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague5s,vague5e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0

 	dw		vague6s,vague6e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague7s,vague7e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,0
 	dw		vague9s,vague9e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
 	dw		vague11s,vague11e,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0

	dw		vague13s,vague13e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague14s,vague14e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague15s,vague15e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague16s,vague16e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

	dw		vague17s,vague17e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague18s,vague18e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	dw		vague19s,vague19e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0

 	dw		vague20s,vague20e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague21s,vague21e,soucoupe_1,soucoupe_2,soucoupe_5,soucoupe_6,0
 	dw		vague22s,vague22e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_5,0
 	dw		vague23s,vague23e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague24s,vague24e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,0

	dw		vague25s,vague25e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,0
 	dw		vague26s,vague26e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_6,0
	
 	dw		vague27s,vague27e,soucoupe_1,soucoupe_3,soucoupe_5,soucoupe_6,0
 	dw		vague28s,vague28e,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague29s,vague29e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague30s,vague30e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague31s,vague31e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_6,0
 	dw		vague32s,vague32e,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague33s,vague33e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague34s,vague34e,soucoupe_1,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague35s,vague35e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague36s,vague36e,soucoupe_1,soucoupe_2,soucoupe_4,soucoupe_5,soucoupe_6,0
 	
	dw		#FFFF



; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////


; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////             LEVEL 8            ///////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////

; TBL_TYPE_DE_SOUCOUPE_1

 TBL_TYPE_DE_SOUCOUPE_8
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeViolette2dvb,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette4b,TypeSoucoupeViolette5b,TypeSoucoupeVerte6t
	dw		TypeSoucoupeVerte1t,TypeSoucoupeBleue2b,TypeSoucoupeBleue3dvb,TypeSoucoupeBleue4dvb,TypeSoucoupeBleue5b,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeVerte2t,TypeSoucoupeViolette3hvb,TypeSoucoupeViolette4b,TypeSoucoupeBleue5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1b,TypeSoucoupeBleue2b,TypeSoucoupeViolette3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeBleue5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1b,TypeSoucoupeVerte2t,TypeSoucoupeBleue3hvb,TypeSoucoupeBleue4zv,TypeSoucoupeViolette5hvb,TypeSoucoupeViolette6zv

	dw		TypeSoucoupeViolette1b,TypeSoucoupeVerte2t,TypeSoucoupeBleue3dvb,TypeSoucoupeVerte4t,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6hvb
	dw		TypeSoucoupeViolette1hvb,TypeSoucoupeVerte2t,TypeSoucoupeBleue3dvb,TypeSoucoupeVerte4t,TypeSoucoupeBleue5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeViolette3b,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette2hvb,TypeSoucoupeViolette3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5b,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeVerte1t,TypeSoucoupeBleue2hvb,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1hvb,TypeSoucoupeViolette2b,TypeSoucoupeBleue3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeBleue2zv,TypeSoucoupeBleue3dvb,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5dvb,TypeSoucoupeViolette6hvb

	dw		TypeSoucoupeVerte1t,TypeSoucoupeBleue2hvb,TypeSoucoupeViolette3zv,TypeSoucoupeVerte4t,TypeSoucoupeViolette5b,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeViolette2zv,TypeSoucoupeVerte3t,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1hvb,TypeSoucoupeVerte2t,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeBleue5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette2b,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6zv

	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette2b,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeBleue1b,TypeSoucoupeVerte2t,TypeSoucoupeViolette3dvb,TypeSoucoupeBleue4dvb,TypeSoucoupeVerte5t,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeViolette1hvb, TypeSoucoupeBleue2b,TypeSoucoupeVerte3t,TypeSoucoupeBleue4hvb,TypeSoucoupeViolette5zv,TypeSoucoupeVerte6t

	dw		TypeSoucoupeBleue1zv,TypeSoucoupeViolette2zv,TypeSoucoupeViolette3b,TypeSoucoupeViolette4dvb,TypeSoucoupeViolette5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1dvb,TypeSoucoupeViolette2hvb,TypeSoucoupeBleue3dvb,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5dvb,TypeSoucoupeViolette6hvb
	dw		TypeSoucoupeViolette1b,TypeSoucoupeViolette2dvb,TypeSoucoupeBleue3b,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5dvb,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeViolette1hvb,TypeSoucoupeViolette2hvb,TypeSoucoupeBleue3dvb,TypeSoucoupeVerte4t,TypeSoucoupeViolette5hvb,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeViolette2b,TypeSoucoupeViolette3b,TypeSoucoupeVerte4t,TypeSoucoupeViolette5hvb,TypeSoucoupeViolette6dvb

	dw		TypeSoucoupeBleue1zv,TypeSoucoupeViolette2hvb,TypeSoucoupeViolette3zv,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5b,TypeSoucoupeViolette6dvb
	dw		TypeSoucoupeVerte1t,TypeSoucoupeBleue2hvb,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeVerte6t
	
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette2b,TypeSoucoupeViolette3dvb,TypeSoucoupeBleue4dvb,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6hvb
	dw		TypeSoucoupeBleue1zv,TypeSoucoupeVerte2t,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette4b,TypeSoucoupeViolette5hvb,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeViolette3b,TypeSoucoupeViolette4dvb,TypeSoucoupeViolette5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1hvb,TypeSoucoupeBleue2hvb,TypeSoucoupeViolette3zv,TypeSoucoupeVerte4t,TypeSoucoupeViolette5b,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeViolette2zv,TypeSoucoupeVerte3t,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeVerte6t
	dw		TypeSoucoupeViolette1hvb,TypeSoucoupeVerte2t,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeBleue5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette2b,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4b,TypeSoucoupeViolette5zv,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeVerte1t,TypeSoucoupeViolette2b,TypeSoucoupeViolette3zv,TypeSoucoupeViolette4hvb,TypeSoucoupeVerte5t,TypeSoucoupeViolette6zv
	dw		TypeSoucoupeViolette1zv,TypeSoucoupeVerte2t,TypeSoucoupeBleue3dvb,TypeSoucoupeViolette4zv,TypeSoucoupeVerte5t,TypeSoucoupeViolette6zv



; TBL_NBR_SOUCOUPES

 TBL_NBR_SOUCOUPES8
	dw		vague1s,vague1e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague2s,vague2e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague3s,vague3e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague4s,vague4e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague5s,vague5e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

 	dw		vague6s,vague6e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague7s,vague7e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague8s,vague8e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague9s,vague9e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague10s,vague10e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague11s,vague11e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague12s,vague12e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

	dw		vague13s,vague13e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague14s,vague14e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague15s,vague15e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague16s,vague16e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

	dw		vague17s,vague17e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague18s,vague18e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague19s,vague19e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

 	dw		vague20s,vague20e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague21s,vague21e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague22s,vague22e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague23s,vague23e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague24s,vague24e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0

	dw		vague25s,vague25e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague26s,vague26e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	
 	dw		vague27s,vague27e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague28s,vague28e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague29s,vague29e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague30s,vague30e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague31s,vague31e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague32s,vague32e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague33s,vague33e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague34s,vague34e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague35s,vague35e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
 	dw		vague36s,vague36e,soucoupe_1,soucoupe_2,soucoupe_3,soucoupe_4,soucoupe_5,soucoupe_6,0
	dw		#FFFF

; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////////////////
