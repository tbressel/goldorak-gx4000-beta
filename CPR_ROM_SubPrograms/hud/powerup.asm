
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////     GESTION POWERUP  //////////////////////
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
			ld		a,FORCE_MISSILES_GAMMA2
			ld		(points_attaque),a
			ld 		a,SFX_GAMMA_LVL2
			ld		(sfx_arme),a
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
					ld 		a,SFX_GAMMA_LVL3
					ld		(sfx_arme),a
					ret




dec_PowerUpbar
; compteur de frame pour la vitesse à laquelle descends le power up
	ld		a,(CompteurFramePowerUp)
	inc		a
	ld		(CompteurFramePowerUp),a
	cp		a,VITESSE_PERTE_POWER_UP
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
	ld 		a,SFX_GAMMA_LVL1
	ld		(sfx_arme),a
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
	ld		hl,HUD_DEPART_POWER_UP2
	ld		(PowerupBar_ECRAN),hl

	call	fin_missiles_gamma2
	ld		a,1
	ld		(flag_PowerUP),a

	ld		a,FORCE_MISSILES_GAMMA3
	ld		(points_attaque),a
	ld 		a,SFX_GAMMA_LVL3
	ld		(sfx_arme),a
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
	
