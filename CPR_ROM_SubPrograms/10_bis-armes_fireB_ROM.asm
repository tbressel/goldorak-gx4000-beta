fin_attente_fireB_ROM
	ld 		a,SFX_WEAPONS_CHANGE	;Sound effect number (>=1)
    ld 		c,1 					;channel (0-2)
    ld 		b,0 					;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect
	
	xor		a
	ld		(counter_fireB),a
	ld		a,(id_arme)
	inc		a
	ld		(id_arme),a
	cp		a,1
	jp		z,affiche_boutton_1			; missile gamma
	cp		a,2
	jp		z,affiche_boutton_2			; planitron
	cp		a,3
	jp		z,affiche_boutton_3			; planitron
	cp		a,4
	jp		z,affiche_boutton_4			; 
	cp		a,5
	jp		z,affiche_boutton_5			; cornofulgure
	cp		a,6
	jp		z,affiche_boutton_6			; fulguro point
	cp		a,7
	jp		z,affiche_boutton_7			; clavycogire
	cp		a,8
	jp		z,affiche_boutton_8
	cp		a,9
	jp		z,affiche_boutton_fin
	affiche_boutton_1
		ld		a,(ArmesDisponible)
		bit		0,a
		jr		z,affiche_boutton_2
		ld		a,1
		ld		(id_arme),a
		ld		hl,HUD_BOUTON_ON_ADR
		ld		de,HUD_BOUTON1_ADR
		ld		b,HUD_HAUTEUR_BOUTTON
		call	bcl_affiche_bouton
		ld		hl,arme_missiles_gamma
		ld		(adr_type_arme),hl
		ld		a,FORCE_MISSILES_GAMMA
		ld		(points_attaque),a
		ret
		affiche_boutton_2
			ld		a,(ArmesDisponible)
			bit		1,a
			jr		z,affiche_boutton_3
			ld		a,2
			ld		(id_arme),a
			ld		hl,HUD_BOUTON_ON_ADR
			ld		de,HUD_BOUTON2_ADR
			ld		b,HUD_HAUTEUR_BOUTTON
			call	bcl_affiche_bouton
			ld		hl,HUD_BOUTON_AFF_ADR
			ld		de,HUD_BOUTON1_ADR
			ld		b,HUD_HAUTEUR_BOUTTON
			call	bcl_affiche_bouton
			ld		hl,arme_planitron
			ld		(adr_type_arme),hl
			ld		a,FORCE_PLANITRON_1
			ld		(points_attaque),a
			ret
			affiche_boutton_3
				ld		a,(ArmesDisponible)
				bit		2,a
				jr		z,affiche_boutton_4
				ld		a,3
				ld		(id_arme),a
				ld		hl,HUD_BOUTON_ON_ADR
				ld		de,HUD_BOUTON3_ADR
				ld		b,HUD_HAUTEUR_BOUTTON
				call	bcl_affiche_bouton
				ld		hl,HUD_BOUTON_AFF_ADR
				ld		de,HUD_BOUTON2_ADR
				ld		b,HUD_HAUTEUR_BOUTTON
				call	bcl_affiche_bouton
				ld		hl,arme_planitron2
				ld		(adr_type_arme),hl
				ld		a,FORCE_PLANITRON_2
				ld		(points_attaque),a
				ret		
				affiche_boutton_4
					ld		a,(ArmesDisponible)
					bit		3,a
					jr		z,affiche_boutton_5
					ld		a,4
					ld		(id_arme),a
					ld		hl,HUD_BOUTON_ON_ADR
					ld		de,HUD_BOUTON4_ADR
					ld		b,HUD_HAUTEUR_BOUTTON
					call	bcl_affiche_bouton
					ld		hl,HUD_BOUTON_AFF_ADR
					ld		de,HUD_BOUTON3_ADR
					ld		b,HUD_HAUTEUR_BOUTTON
					call	bcl_affiche_bouton
					;ld		a,FORCE_PLANITRON_1
					;ld		(points_attaque),a
					ret
					affiche_boutton_5	
						ld		a,(ArmesDisponible)
						bit		4,a
						jr		z,affiche_boutton_6
						ld		a,5
						ld		(id_arme),a
						ld		hl,HUD_BOUTON_ON_ADR
						ld		de,HUD_BOUTON5_ADR
						ld		b,HUD_HAUTEUR_BOUTTON
						call	bcl_affiche_bouton
						ld		hl,HUD_BOUTON_AFF_ADR
						ld		de,HUD_BOUTON4_ADR
						ld		b,HUD_HAUTEUR_BOUTTON
						call	bcl_affiche_bouton
						ld		hl,arme_cornofulgure
						ld		(adr_type_arme),hl
						ld		a,FORCE_CORNOFULGURE_1
						ld		(points_attaque),a
						ret
						affiche_boutton_6
							ld		a,(ArmesDisponible)
							bit		5,a
							jr		z,affiche_boutton_7
							ld		a,6
							ld		(id_arme),a
							ld		hl,HUD_BOUTON_ON_ADR
							ld		de,HUD_BOUTON6_ADR
							ld		b,HUD_HAUTEUR_BOUTTON
							call	bcl_affiche_bouton
							ld		hl,HUD_BOUTON_AFF_ADR
							ld		de,HUD_BOUTON5_ADR
							ld		b,HUD_HAUTEUR_BOUTTON
							call	bcl_affiche_bouton
							ld		hl,arme_fulguro_poing
							ld		(adr_type_arme),hl
							ld		a,_CALL
							ld		(event_arme_fireB),a
							ld		hl,pre_init_fulguro_poing
							ld		(event_arme_fireB+1),hl
							ld		a,FORCE_FULGURO_POINGS
							ld		(points_attaque),a
							ret
							affiche_boutton_7
								ld		a,(ArmesDisponible)
								bit		6,a
								jp		z,affiche_boutton_8
								ld		a,7
								ld		(id_arme),a
								ld		hl,HUD_BOUTON_ON_ADR
								ld		de,HUD_BOUTON7_ADR
								ld		b,HUD_HAUTEUR_BOUTTON
								call	bcl_affiche_bouton
								ld		hl,HUD_BOUTON_AFF_ADR
								ld		de,HUD_BOUTON6_ADR
								ld		b,HUD_HAUTEUR_BOUTTON
								call	bcl_affiche_bouton
								ld		a,_CALL
								ld		(event_arme_fireB),a
								ld		hl,pre_init_fulguro_poing_retour
								ld		(event_arme_fireB+1),hl
								ld		a,FORCE_CLAVICOGYRES
								ld		(points_attaque),a
								ret
								affiche_boutton_8
									ld		a,(ArmesDisponible)
									bit		7,a
									jp		z,affiche_boutton_fin
									ld		a,8
									ld		(id_arme),a
									ld		hl,HUD_BOUTON_ON_ADR
									ld		de,HUD_BOUTON8_ADR
									ld		b,HUD_HAUTEUR_BOUTTON
									call	bcl_affiche_bouton
									ld		hl,HUD_BOUTON_AFF_ADR
									ld		de,HUD_BOUTON7_ADR
									ld		b,HUD_HAUTEUR_BOUTTON
									call	bcl_affiche_bouton
									ret
									affiche_boutton_fin

										;ld		hl,HUD_BOUTON_AFF_ADR
										;ld		de,HUD_BOUTON8_ADR
										;ld		b,HUD_HAUTEUR_BOUTTON
										;call	bcl_affiche_bouton
										;ld		hl,HUD_BOUTON_ON_ADR
										;ld		de,HUD_BOUTON1_ADR
										;ld		b,HUD_HAUTEUR_BOUTTON
										;call	bcl_affiche_bouton
										jp		affiche_boutton_1
	
	
	
pre_anim_fulguro_poing_ROM		
			ld		a,1
			ld		(flag_fulguro),a
			ld		hl,Tbl_sprh_direction
			ld		de,GOLDORAK_HAUTBAS_ANIMPOINT1_SPRH_ROM_ADR
			ld		(hl),e : inc hl
			ld		(hl),d : inc hl
			ld		de,GOLDORAK_GAUCHE_ANIMPOINT1_SPRH_ROM_ADR
			ld		(hl),e : inc hl
			ld		(hl),d : inc hl
			ld		de,GOLDORAK_DROITE_ANIMPOINT1_SPRH_ROM_ADR
			ld		(hl),e : inc hl
			ld		(hl),d : inc hl
			ld		hl,(Tbl_sprh_direction)
			ld		(sprh_goldorak),hl	
			RST		ASIC_CONNEXION
		
			xor		a:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
			ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
			RST		ASIC_DECONNEXION
			ret
				pre_anim_fulguro_poing_2_ROM
					ld		hl,Tbl_sprh_direction
					ld		de,GOLDORAK_HAUTBAS_ANIMPOINT2_SPRH_ROM_ADR
					ld		(hl),e : inc hl
					ld		(hl),d : inc hl
					ld		de,GOLDORAK_GAUCHE_ANIMPOINT2_SPRH_ROM_ADR
					ld		(hl),e : inc hl
					ld		(hl),d : inc hl
					ld		de,GOLDORAK_DROITE_ANIMPOINT2_SPRH_ROM_ADR
					ld		(hl),e : inc hl
					ld		(hl),d : inc hl
					ld		hl,(Tbl_sprh_direction)
					ld		(sprh_goldorak),hl

					RST		ASIC_CONNEXION
					ld		hl,(SPRH0_X)
					ld		de,22:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
					ld		de,20:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
					ld		hl,(SPRH0_Y):ld	de,-14:add hl,de
					ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
					ld		a,zoom_mode0_1:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
					ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
					ret

pre_init_fulguro_poing_retour_ROM
		ld		a,(counter_pre_poing)
		inc		a
		ld		(counter_pre_poing),a
		cp		a,4
		ret		nz
		xor		a
		ld		(counter_pre_poing),a
		ld		a,(etp_pre_poing)
		cp		a,0
		jp		z,pre_anim_fulguro_poing
		cp		a,2
		jp		z,pre_anim_fulguro_poing_3
		cp		a,4
		jp		z,pre_anim_fulguro_poing_fin3
		inc		a
		ld		(etp_pre_poing),a
		ret
			pre_anim_fulguro_poing_3
				inc		a: ld	(etp_pre_poing),a
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
				ld		hl,(Tbl_sprh_direction)
				ld		(sprh_goldorak),hl
				ret
					pre_anim_fulguro_poing_fin3
						xor	a
						ld	(etp_pre_poing),a
						ld	(event_arme_fireB),a
						ld	(event_arme_fireB+1),a
						ld	(event_arme_fireB+2),a
						ld	(flag_fulguro),a
						ld		hl,arme_clavicogyres
						ld		(adr_type_arme),hl
						ld		hl,SPRH_ARMES_GOLDORAK_CACHER
						ld		(SPRH4_X),hl
						ld		(SPRH4_Y),hl
						ld		(SPRH5_X),hl
						ld		(SPRH5_Y),hl
						ret
			