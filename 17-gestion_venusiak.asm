


haut_venus
	ld			hl,(posy_venusiak)
	dec			hl : dec			hl
	ld			a,l
	cp			a,collision_goldo_haut				; identique pour venusiak
	call		z,stop_haut_venus
	ld 			(posy_venusiak),hl
	call		venus_affiche
	jp			retour_test_des_directions_venusiak
stop_haut_venus
	inc			hl
	inc			hl
	ret
bas_venus
	ld			hl,(posy_venusiak)
	inc			hl : inc			hl
	ld			a,l
	cp			a,collision_goldo_bas				; identique pour venusiak
	call		z,stop_bas_venus
	ld 			(posy_venusiak),hl
	call		venus_affiche
	jp			retour_test_des_directions_venusiak
stop_bas_venus
	dec			hl
	dec			hl
	ret
venus_droite
	ld			hl,(posx_venusiak)
	inc			hl : inc			hl
	inc			hl : inc			hl
	inc			hl : inc			hl
	push		hl
	or			a
	ld			de,collision_goldo_droite
	sbc			hl,de
	jr			z,stop_droite_venus
	pop			hl
ret_stp__venus_dr
	ld 			(posx_venusiak),hl
	call		venus_affiche
	jp			retour_test_des_directions2_venusiak
stop_droite_venus
	pop			hl
	dec			hl
	dec			hl
	dec			hl
	dec			hl
	dec			hl
	dec			hl
	jp		ret_stp__venus_dr

	
venus_gauche
	ld			hl,(posx_venusiak)
	dec			hl : dec			hl
	dec			hl : dec			hl
	dec			hl : dec			hl
	ld			a,h
	cp			a,collision_goldo_gauche				; identique pour venusiak
	call		z,stop_gauche_venus
	ld 			(posx_venusiak),hl
	call		venus_affiche
	jp			retour_test_des_directions2_venusiak
stop_gauche_venus
	inc			hl
	inc			hl
	inc			hl
	inc			hl
	inc			hl
	inc			hl
	ret
	
	
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; //////////////      TINY VENISIAK TIR    ////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////	
fireB_venusiak
	ld		a,(flag_fireAB)
	cp		a,1
	jp		z,retour_test_des_tirs_venusiak

	ld 		a,SFX_ATTACK	 ;Sound effect number (>=1)
    ld 		c,1 ;channel (0-2)
    ld 		b,0 ;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect
		arme_tiny_venus
				
			RST		ASIC_CONNEXION
			ld		a,(etp_arme3)
			cp		a,0
			jp		z,init_venus_gamma
			cp		a,1
			jp		z,venus_gamma1
			cp		a,2
			jp		z,venus_gamma2
		
				init_venus_gamma
					inc 	a
					ld 		(etp_arme3),a										; on incrémente les étapes de l'arme
					ld		a,1
					ld 		(flag_fireAB),a									; on signale que le bouton fire 1 viens d'être appuyé
					ld		a,1
					ld 		(flag_armes),a									; une arme est en cours de déclanchement
				
					ld		c,BANK9_GOLDORAK_SPRH
					RST 	UPPER_ROM_CONNEXION									; on se connection à la rom où se situes les sprites hard de cette arme
					ld		hl,Tir_tiny_venus
					ld		de,SPRH5_ADR
					ld		bc,#100
					LDIR		
															; on copie de puis la ROM vers l'ASIC	
					call	rom_off
					ld		a,_CALL
					ld		(event_arme_fireA_venisiak),a
					ld		hl,arme_tiny_venus
					ld		(event_arme_fireA_venisiak+1),hl													; on copie de puis la ROM vers l'ASIC	
					RST		ASIC_DECONNEXION
					xor  	a
					ld		(anim_arme_a_charger),a
					jp		retour_test_des_tirs_venusiak
						venus_gamma1
							inc		a:ld (etp_arme3),a
							ld		hl,(SPRH2_X)
							ld		de,16;+32
							add		hl,de
							ld		(SPRH5_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
							ld		hl,(SPRH2_Y):ld	de,-16:add hl,de
							ld		(SPRH5_Y),hl
							;ld		a,zoom_mode1_2
							ld		a,zoom_mode1_1
							ld 		(SPRH5_ZOOM),a
							ld		(valeur_zoom_sprh5),a
							RST		ASIC_DECONNEXION
							ret
								venus_gamma2
									ld		a,2
									ld		(id_joueur),a
									ld		hl,(SPRH5_Y)
									dec		l
									dec		l
									dec		l
									dec		l
									dec		l
									dec		l
									dec		l
									or 		a
									ld		a,l
									ld		b,-8
									add		a,b
									jr		nc,fin_venus_gamma
									ld		(SPRH5_Y),hl
									;call	test_collisions_tir_droite_venusiak
									ret
										fin_venus_gamma
											xor		a
											ld		(SPRH5_ZOOM),a
											ld		(valeur_zoom_sprh5),a
											ld		(flag_fireAB),a
											ld		(etp_arme3),a
											ld		(event_arme_fireA_venisiak),a
											ld		(event_arme_fireA_venisiak+1),a
											ld		(event_arme_fireA_venisiak+2),a
											ld		hl,SPRH_ARMES_GOLDORAK_CACHER
											ld		(SPRH5_X),hl
											ld		(SPRH5_Y),hl
											RST		ASIC_DECONNEXION
											ld 		c,1   ;Channel (0-2)
											call 	PLY_AKG_StopSoundEffectFromChannel
											ret
	
	