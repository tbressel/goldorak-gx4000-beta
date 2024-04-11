; ////////////////////////////////////////////////
; ////////////////////////////////////////////////
; /////////////////    FIRE A    /////////////////
; ////////////////////////////////////////////////
; ////////////////////////////////////////////////
fireA

	ld		a,(flag_fireA)
	cp		a,1
	jp		z,retour_test_des_tirs

	
	call	test_du_clavier
	bit		5,a
	jp		z,Init_Retournement
	
	ld 		a,SFX_ATTACK	 ;Sound effect number (>=1)
    ld 		c,1 ;channel (0-2)
    ld 		b,0 ;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect

	ld		a,(id_arme)
	cp		a,0
	jp		z,aucune_arme
	cp		a,1
	jp		z,arme_missiles_gamma_test
	cp		a,2
	jp		z,arme_planitron
	cp		a,3
	jp		z,arme_planitron2
	cp		a,4
	jp		z,aucune_arme
	cp		a,5
	jp		z,arme_cornofulgure
	cp		a,6
	jp		z,arme_fulguro_poing
	cp		a,7
	jp		z,arme_clavicogyres
	cp		a,8
	jp		z,aucune_arme

	
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; //////////////       MISSILES GAMMA      ////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////	
arme_missiles_gamma_test
	ld	a,(flag_PowerUP)
	cp	a,0
	jp	z,arme_missiles_gamma
	cp	a,1
	jp	z,arme_missiles_gamma_pow2
	cp	a,2
	jp	z,arme_missiles_gamma_pow3
		arme_missiles_gamma
			RST		ASIC_CONNEXION
			ld		a,(etp_arme2)
			cp		a,0
			jp		z,init_missiles_gamma
			cp		a,1
			jp		z,missiles_gamma1
			cp		a,2
			jp		z,missiles_gamma2
				init_missiles_gamma
					inc 	a:ld (etp_arme2),a										; on incrémente les étapes de l'arme
					ld		a,1:ld (flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
					ld		a,1:ld (flag_armes),a									; une arme est en cours de déclanchement
					ld		c,BANK9_GOLDORAK_SPRH
					RST 	UPPER_ROM_CONNEXION									; on se connection à la rom où se situes les sprites hard de cette arme
					ld		hl,SPRH_MISSILES_GAMMA
					ld		de,SPRH4_ADR
					ld		bc,#100
					LDIR		
					ld		hl,SPRH_MISSILES_GAMMA
					ld		de,SPRH5_ADR
					ld		bc,#100
					LDIR																; on copie de puis la ROM vers l'ASIC	
					call	rom_off
					ld		a,_CALL
					ld		(event_arme_fireA),a
					ld		hl,arme_missiles_gamma
					ld		(event_arme_fireA+1),hl													; on copie de puis la ROM vers l'ASIC	
					RST		ASIC_DECONNEXION
					xor  	a
					ld		(anim_arme_a_charger),a
					jp 		retour_test_des_tirs
						missiles_gamma1
							ld		c,BANK_ROM_2
							rst		UPPER_ROM_CONNEXION
							rst		ASIC_CONNEXION
							call	missiles_gamma1_ROM
							call	rom_off
							RST		ASIC_DECONNEXION
							ret
							missiles_gamma2
								ld		c,BANK_ROM_2
								rst		UPPER_ROM_CONNEXION
								RST		ASIC_CONNEXION
								call	missiles_gamma2_ROM
								call	rom_off
								RST		ASIC_DECONNEXION
								ret
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; //////////////       MISSILES GAMMA POWER UP 2     ////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////	
arme_missiles_gamma_pow2
	RST		ASIC_CONNEXION
	ld		a,(etp_arme2)
	cp		a,0
	jp		z,init_missiles_gamma_pow2
	cp		a,1
	jp		z,missiles_gamma_pow21
	cp		a,2
	jp		z,missiles_gamma_pow22
		init_missiles_gamma_pow2
			inc 	a:ld (etp_arme2),a										; on incrémente les étapes de l'arme
			ld		a,1:ld (flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
			ld		a,1:ld (flag_armes),a									; une arme est en cours de déclanchement
			ld		c,BANK9_GOLDORAK_SPRH: RST 0									; on se connection à la rom où se situes les sprites hard de cette arme
			ld		hl,SPRH_MISSILES_GAMMA2
			ld		de,SPRH4_ADR
			ld		bc,#100
			LDIR		
			ld		hl,SPRH_MISSILES_GAMMA2
			ld		de,SPRH5_ADR
			ld		bc,#100
			LDIR																; on copie de puis la ROM vers l'ASIC	
			call	rom_off
			ld		a,_CALL
			ld		(event_arme_fireA),a
			ld		hl,arme_missiles_gamma_pow2
			ld		(event_arme_fireA+1),hl													; on copie de puis la ROM vers l'ASIC	
			RST		ASIC_DECONNEXION
			xor  a
			ld		(anim_arme_a_charger),a
			jp 		retour_test_des_tirs
				missiles_gamma_pow21
					ld		c,BANK_ROM_2
					rst		UPPER_ROM_CONNEXION
						RST		ASIC_CONNEXION
					call	missiles_gamma_pow21_ROM
					call	rom_off
					RST		ASIC_DECONNEXION
					ret
						missiles_gamma_pow22
							ld		c,BANK_ROM_2
							rst		UPPER_ROM_CONNEXION
								RST		ASIC_CONNEXION
							call	missiles_gamma_pow22_ROM
							call	rom_off
							RST		ASIC_DECONNEXION
							ret
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; //////////////       MISSILES GAMMA POWER UP 3     ////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////	
arme_missiles_gamma_pow3
	RST		ASIC_CONNEXION
	ld		a,(etp_arme2)
	cp		a,0
	jp		z,init_missiles_gamma_pow3
	cp		a,1
	jp		z,missiles_gamma_pow31
	cp		a,2
	jp		z,missiles_gamma_pow32
init_missiles_gamma_pow3
	inc 	a:ld (etp_arme2),a										; on incrémente les étapes de l'arme
	ld		a,1:ld (flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
	ld		a,1:ld (flag_armes),a									; une arme est en cours de déclanchement
	ld		c,BANK9_GOLDORAK_SPRH: RST 0									; on se connection à la rom où se situes les sprites hard de cette arme
	ld		hl,SPRH_MISSILES_GAMMA3
	ld		de,SPRH4_ADR
	ld		bc,#100
	LDIR		
	ld		hl,SPRH_MISSILES_GAMMA3
	ld		de,SPRH5_ADR
	ld		bc,#100
	LDIR																; on copie de puis la ROM vers l'ASIC	
	call	rom_off
	ld		a,_CALL
	ld		(event_arme_fireA),a
	ld		hl,arme_missiles_gamma_pow3
	ld		(event_arme_fireA+1),hl													; on copie de puis la ROM vers l'ASIC	
	RST		ASIC_DECONNEXION
	xor  a
	ld		(anim_arme_a_charger),a
	jp 		retour_test_des_tirs
missiles_gamma_pow31
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	missiles_gamma_pow31_ROM
	call	rom_off
	RST		ASIC_DECONNEXION
	ret
missiles_gamma_pow32
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	missiles_gamma_pow32_ROM
	call	rom_off
	RST		ASIC_DECONNEXION
	ret
	




	
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; ///////////////////       PLANITRON   ///////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////	
arme_planitron
	RST		ASIC_CONNEXION
	ld		a,(etp_arme3)
	cp		a,0
	jp		z,init_planitron
	cp		a,1
	jp		z,planitron1
	cp		a,2
	jp		z,planitron2
		init_planitron
			inc 	a:ld (etp_arme3),a										; on incrémente les étapes de l'arme
			ld		a,1:ld (flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
			ld		a,1:ld (flag_armes),a									; une arme est en cours de déclanchement
			ld		c,BANK9_GOLDORAK_SPRH: RST 0										; on se connection à la rom où se situes les sprites hard de cette arme
			ld		hl,sprh_planitron
			ld		(adr_anim_planitron),hl
			ld		de,SPRH4_ADR
			ld		bc,#100
			LDIR		
			ld		hl,sprh_planitron
			ld		de,SPRH5_ADR
			ld		bc,#100
			LDIR																; on copie de puis la ROM vers l'ASIC	
			call	rom_off
			; FIX START      / 11-04-2024 / _JP à la place de _CALL pour revenir dans la boucle sans problème de pile
			; 				 / replacer les ret par jp retour_event_arme_fireA
			ld		a,_JP
			; FIX END
			ld		(event_arme_fireA),a
			ld		hl,(adr_type_arme)
			ld		(event_arme_fireA+1),hl													; on copie de puis la ROM vers l'ASIC	
			RST		ASIC_DECONNEXION
			ld		a,4
			ld		(etp_anim_planitron),a
			ld		a,1
			ld		(anim_arme_a_charger),a
			jp 		retour_test_des_tirs
				planitron1
					inc		a:ld (etp_arme3),a
					ld		hl,(SPRH0_X)
					ld		de,-19
					add		hl,de
					ld		(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
					ld		de,64+32+3:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
					ld		hl,(SPRH0_Y):ld	de,6:add hl,de
					ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
					ld		a,zoom_mode0_1:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
					ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
					RST		ASIC_DECONNEXION
					jp		retour_event_arme_fireA
					; jp		retour_test_des_tirs
					;ret      
						planitron2
							ld		a,(resultat_test_de_touche)
							cp		a,#ef
							jr		z,retour_planitron_gauche
							cp		a,#ff
							jr		z,retour_planitron_gauche
							ld		a,(direction_goldorak)
							cp		a,4						; gauche
							jr		z,planitron_droite
							cp		a,3						; gauche
							jr		z,planitron_gauche
								retour_planitron_droite
								retour_planitron_gauche
									ld		hl,(SPRH4_Y)
									dec		l
									dec		l
									dec		l
									dec		l
									dec		l
									or 		a
									ld		a,l
									ld		b,-8
									add		a,b
									jr		nc,fin_planitron
									ld		(SPRH4_Y),hl
									ld		hl,(SPRH5_Y)
									dec		l
									dec		l
									dec		l
									dec		l
									dec		l
									ld		(SPRH5_Y),hl
									ld		a,(etp_anim_planitron)
									dec		a
									cp		a,0
									jr		z,switch_anim_planitron
									ld		(etp_anim_planitron),a
									jp	retour_event_arme_fireA
									;ret
										switch_anim_planitron
											ld		a,4
											ld		(etp_anim_planitron),a
											ld		hl,(adr_anim_planitron)	
											inc		h
											bit		2,h
											jr		nz,reinit_adr_anim_planitron
												retour_reinit_adr_anim_planitron
													ld		(adr_anim_planitron),hl
													jp	retour_event_arme_fireA
													;ret
														reinit_adr_anim_planitron
															ld	h,#F0	
															jr	retour_reinit_adr_anim_planitron
																	planitron_droite
																		ld		hl,(SPRH4_X)
																		inc		hl
																		inc		hl
																		inc		hl
																		inc		hl
																		inc		hl
																		ld		(SPRH4_X),hl
																		ld		hl,(SPRH5_X)
																		inc		hl
																		inc		hl
																		inc		hl
																		ld		(SPRH5_X),hl
																		jr		retour_planitron_droite
																			planitron_gauche
																				ld		hl,(SPRH4_X)
																				dec		hl
																				dec		hl
																				dec		hl
																				ld		(SPRH4_X),hl
																				ld		hl,(SPRH5_X)
																				dec		hl
																				dec		hl
																				dec		hl
																				dec		hl
																				dec		hl
																				ld		(SPRH5_X),hl
																				jr		retour_planitron_gauche
																					fin_planitron
																						xor		a
																						ld		(SPRH4_ZOOM),a
																						ld		(SPRH5_ZOOM),a
																						ld		(valeur_zoom_sprh4),a
																						ld 		(valeur_zoom_sprh5),a 
																						ld		(flag_fireA),a
																						ld		(etp_arme3),a
																						ld		(event_arme_fireA),a
																						ld		(event_arme_fireA+1),a
																						ld		(event_arme_fireA+2),a
																						ld		(anim_arme_a_charger),a
																						ld		hl,SPRH_ARMES_GOLDORAK_CACHER
																						ld		(SPRH4_X),hl
																						ld		(SPRH4_Y),hl
																						ld		(SPRH5_X),hl
																						ld		(SPRH5_Y),hl
																						RST		ASIC_DECONNEXION
																						ld 		c,1   ;Channel (0-2)
																						call 	PLY_AKG_StopSoundEffectFromChannel
																						;ret
																						jp	retour_event_arme_fireA
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; ///////////////////       PLANITRON  2 ///////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////	
arme_planitron2
	RST		ASIC_CONNEXION

	ld		a,(etp_arme4)
	cp		a,0
	jp		z,init_planitron2
	cp		a,1
	jp		z,planitron12
	cp		a,2
	jp		z,planitron22
		init_planitron2
			inc 	a:ld (etp_arme4),a										; on incrémente les étapes de l'arme
			ld		a,1:ld (flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
			ld		a,1:ld (flag_armes),a									; une arme est en cours de déclanchement
			ld		c,BANK9_GOLDORAK_SPRH: RST 0									; on se connection à la rom où se situes les sprites hard de cette arme
			ld		hl,sprh_planitron2
			ld		(adr_anim_planitron2),hl
			ld		de,SPRH4_ADR
			ld		bc,#100
			LDIR		
			ld		hl,sprh_planitron2
			ld		de,SPRH5_ADR
			ld		bc,#100
			LDIR																; on copie de puis la ROM vers l'ASIC	
			call	rom_off
			ld		a,_CALL
			ld		(event_arme_fireA),a
			ld		hl,(adr_type_arme)
			ld		(event_arme_fireA+1),hl													; on copie de puis la ROM vers l'ASIC	
			RST		ASIC_DECONNEXION
			ld		a,4
			ld		(etp_anim_planitron2),a
			ld		a,2
			ld		(anim_arme_a_charger),a
			ld		hl,-8
			ld		(courbe_sprh4),hl
			ld		hl,8
			ld		(courbe_sprh5),hl
			
			jp 	retour_test_des_tirs
				planitron12
					inc		a:ld (etp_arme4),a
					ld		hl,(SPRH0_X)
					ld		de,-19
					add		hl,de
					ld		(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
					ld		de,64+32+3:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
					ld		hl,(SPRH0_Y):ld	de,6:add hl,de
					ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
					ld		a,zoom_mode0_1:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
					ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
					RST		ASIC_DECONNEXION
					ret
						planitron22
							ld		hl,(SPRH4_Y)
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
							jr		nc,fin_planitron2
							ld		(SPRH4_Y),hl
							ld		hl,(SPRH5_Y)
							dec		l
							dec		l
							dec		l
							dec		l
							dec		l
							dec		l
							ld		(SPRH5_Y),hl
							ld		a,(timer_planitron2)
							inc		a
							cp		a,4
							ld		(timer_planitron2),a
							call	z,planitron_devier
							ld		a,(etp_anim_planitron2)
							dec		a
							cp		a,0
							jr		z,switch_anim_planitron2
							ld		(etp_anim_planitron2),a
							ret
							;jp		retour_test_des_tirs
								switch_anim_planitron2
									ld		a,4
									ld		(etp_anim_planitron2),a
									ld		hl,(adr_anim_planitron2)	
									inc		h
									bit		0,h
									jr		nz,reinit_adr_anim_planitron2
										retour_reinit_adr_anim_planitron2
											ld		(adr_anim_planitron2),hl
											ret
												reinit_adr_anim_planitron2
													ld		h,#F6
													jr	retour_reinit_adr_anim_planitron2
														planitron_devier
															ld		hl,(SPRH4_X)
															ld		de,(courbe_sprh4)
															add		hl,de
															ld		(SPRH4_X),hl
															inc		de
															inc		de
															inc		de
															inc		de
															ld		(courbe_sprh4),de
															ld		hl,(SPRH5_X)
															ld		de,(courbe_sprh5)
															add		hl,de
															ld		(SPRH5_X),hl
															dec		de
															dec		de
															dec		de
															dec		de
															ld		(courbe_sprh5),de
															ld		a,2
															ld			(timer_planitron2),a
															ret
																fin_planitron2
																	xor		a
																	ld		(SPRH4_ZOOM),a
																	ld		(SPRH5_ZOOM),a
																	ld		(valeur_zoom_sprh4),a
																	ld 		(valeur_zoom_sprh5),a 
																	ld		(flag_fireA),a
																	ld		(etp_arme4),a
																	ld		(event_arme_fireA),a
																	ld		(event_arme_fireA+1),a
																	ld		(event_arme_fireA+2),a
																	ld		(anim_arme_a_charger),a
																	ld		(timer_planitron2),a
																	ld		hl,-32
																	ld		(SPRH4_X),hl
																	ld		(SPRH4_Y),hl
																	ld		(SPRH5_X),hl
																	ld		(SPRH5_Y),hl
																	RST		ASIC_DECONNEXION
																	ld 		c,1   ;Channel (0-2)
																	call 	PLY_AKG_StopSoundEffectFromChannel
																	ret
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; //////////////       CORNOFULGURE        ////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
arme_cornofulgure
	RST		ASIC_CONNEXION

	ld		a,(etp_arme1)
	cp		a,0
	jp		z,init_cornofulgure
	cp		a,2
	jp		z,cornofulgure1
	cp		a,4
	jp		z,cornofulgure2
	cp		a,6
	jp		z,cornofulgure3
	cp		a,8
	jp		z,cornofulgure2
	cp		a,10
	jp		z,cornofulgure1
	cp		a,12
	jp		z,cornofulgure_fin
	inc		a:ld (etp_arme1),a
	ret

init_cornofulgure
	inc 	a:ld (etp_arme1),a										; on incrémente les étapes de l'arme
	ld		a,1:ld (flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
	ld		a,1:ld (flag_armes),a									; une arme est en cours de déclanchement
	ld		c,BANK9_GOLDORAK_SPRH: RST 0										; on se connection à la rom où se situes les sprites hard de cette arme
	ld		hl,sprh_cornofulgure_bas
	ld		de,SPRH4_ADR
	ld		bc,#200
	LDIR															; on copie de puis la ROM vers l'ASIC	
	call	rom_off
	ld		a,_CALL
	ld		(event_arme_fireA),a
	ld		hl,(adr_type_arme)
	ld		(event_arme_fireA+1),hl													; on copie de puis la ROM vers l'ASIC	
	RST		ASIC_DECONNEXION
	xor  a
	ld		(anim_arme_a_charger),a
	
	jp 	retour_test_des_tirs
cornofulgure1
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,50:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,20:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-14:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode2_1:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
cornofulgure2
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,50:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,20:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-14+-16:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode2_2:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
cornofulgure3
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,50:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,20:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-14+-16+-32:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode2_3:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
cornofulgure_fin
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	ld		(flag_fireA),a
	ld		(etp_arme1),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	RST		ASIC_DECONNEXION
	ld 		c,1   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret
arme_cornofulgure2	
	RST		ASIC_CONNEXION
	
	ld		a,(etp_arme1)
	cp		a,0
	jp		z,init_cornofulgure
	cp		a,1
	jp		z,cornofulgure1b
	cp		a,2
	jp		z,cornofulgure2b
	cp		a,4
	jp		z,cornofulgure3b
	cp		a,6
	jp		z,cornofulgure2b
	cp		a,8
	jp		z,cornofulgure1b
	cp		a,10
	jp		z,cornofulgure_finb
	inc		a:ld (etp_arme1),a
	jp 	retour_test_des_tirs
cornofulgure1b
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,16:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-14:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode1_1:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
cornofulgure2b
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,16:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-14+-16:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode1_2:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
cornofulgure3b
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,16:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-14+-16+-32:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode1_3:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
cornofulgure_finb
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	ld		(flag_fireA),a
	ld		(etp_arme1),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	RST		ASIC_DECONNEXION
	ret
arme_cornofulgure3	
	RST		#18
	;RST		#18
	ld		a,(etp_arme1)
	cp		a,0
	jp		z,init_cornofulgure
	cp		a,1
	jp		z,cornofulgure1c
	cp		a,2
	jp		z,cornofulgure2c
	cp		a,3
	jp		z,cornofulgure3c
	cp		a,4
	jp		z,cornofulgure4c
	cp		a,5
	jp		z,cornofulgure5c
	cp		a,6
	jp		z,cornofulgure6c
	cp		a,7
	jp		z,cornofulgure5c
	cp		a,8
	jp		z,cornofulgure4c
	cp		a,9
	jp		z,cornofulgure3c
	cp		a,10
	jp		z,cornofulgure2c
	cp		a,11
	jp		z,cornofulgure1c
	cp		a,12
	jp		z,cornofulgure_finc
	inc		a:ld (etp_arme1),a
	jp 	retour_test_des_tirs
cornofulgure1c
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld (SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		hl,(SPRH0_Y):ld	de,-16:add hl,de:ld	(SPRH4_Y),hl
	ld		a,zoom_mode0_1:ld (SPRH4_ZOOM),a
	ld		(valeur_zoom_sprh4),a 
	xor		a:ld (SPRH5_ZOOM),a
	ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
cornofulgure2c
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		hl,(SPRH0_Y):ld	de,-16+-16:add hl,de:ld	(SPRH4_Y),hl
	ld		a,zoom_mode0_2:ld (SPRH4_ZOOM),a :ld (valeur_zoom_sprh4),a 
	xor		a:ld (SPRH5_ZOOM),a
	ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
cornofulgure3c
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		hl,(SPRH0_Y):ld	de,-16+-16+-32:add hl,de:ld	(SPRH4_Y),hl
	ld		a,zoom_mode0_3:ld (SPRH4_ZOOM),a : ld (valeur_zoom_sprh4),a
	xor		a:ld (SPRH5_ZOOM),a : ld (valeur_zoom_sprh5),a
	RST		ASIC_DECONNEXION
	ret
cornofulgure4c
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld	(SPRH4_X),hl:ld (SPRH5_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		hl,(SPRH0_Y):ld	de,-16+-16+-32:add hl,de:ld	(SPRH4_Y),hl
	ld		de,-16:add hl,de:ld	(SPRH5_Y),hl
	ld		a,zoom_mode0_1:ld	(SPRH5_ZOOM),a : ld (valeur_zoom_sprh5),a
	RST		ASIC_DECONNEXION
	ret
cornofulgure5c
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld	(SPRH4_X),hl:ld (SPRH5_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		hl,(SPRH0_Y):ld	de,-16+-16+-32:add hl,de:ld	(SPRH4_Y),hl
	ld		de,-16+-16:add hl,de:ld	(SPRH5_Y),hl
	ld		a,zoom_mode0_2:ld	(SPRH5_ZOOM),a :ld (valeur_zoom_sprh5),a
	RST		ASIC_DECONNEXION
	ret
cornofulgure6c
	inc		a:ld (etp_arme1),a
	ld		hl,(SPRH0_X):ld	de,48:add hl,de:ld	(SPRH4_X),hl:ld (SPRH5_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		hl,(SPRH0_Y):ld	de,-16+-16+-32:add hl,de:ld	(SPRH4_Y),hl
	ld		de,-16+-16+-32:add hl,de:ld	(SPRH5_Y),hl
	ld		a,zoom_mode0_3:ld	(SPRH5_ZOOM),a :ld (valeur_zoom_sprh5),a
	RST		ASIC_DECONNEXION
	ret
cornofulgure_finc
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld 		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a
	ld		(flag_fireA),a
	ld		(etp_arme1),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	RST		ASIC_DECONNEXION
	ld 		c,1   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret
aucune_arme
	RST		ASIC_CONNEXION
	;RST		#18
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld 		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a
	ld		(flag_fireA),a
	ld		(etp_arme1),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	RST		ASIC_DECONNEXION
	jp	retour_test_des_tirs
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; //////////////       FULGURO POING        ////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
arme_fulguro_poing
	RST		ASIC_CONNEXION
	;RST		#18
	ld		a,(etp_arme6)
	cp		a,0
	jp		z,init_fulguro_poing
	cp		a,2
	jp		z,init_fulguro_poing2
	cp		a,3
	jp		z,fulguro_poing_fin
	inc		a:ld (etp_arme6),a
	jp 	retour_test_des_tirs
init_fulguro_poing
	inc 	a:ld (etp_arme6),a										; on incrémente les étapes de l'arme
	ld		a,1:ld (flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
	ld		a,1:ld (flag_armes),a									; une arme est en cours de déclanchement
	ld		a,_CALL
	ld		(event_arme_fireA),a
	ld		hl,(adr_type_arme)
	ld		(event_arme_fireA+1),hl		
	ld		a,13
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld 		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a	
	
	jp 		retour_test_des_tirs	
init_fulguro_poing2
	ld		hl,(SPRH4_Y)
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
	jr		nc,fulguro_poing_fin
	ld		(SPRH4_Y),hl
	ld		hl,(SPRH5_Y)
	dec		l
	dec		l
	dec		l
	dec		l
	dec		l
	dec		l
	ld		(SPRH5_Y),hl
	ret	
fulguro_poing_fin
	RST		ASIC_CONNEXION
	;RST		#18
	ld		hl,(SPRH0_X)
	ld		de,22:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,20:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-14:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,13
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld 		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a
	xor		a
	ld		(flag_fireA),a
	ld		(etp_arme6),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	RST		ASIC_DECONNEXION
	ld 		c,1   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////
; //////////////       ASTERO HACHE        ////////////////////
; /////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////	
arme_clavicogyres
	RST		ASIC_CONNEXION
	;RST		#18
	ld		a,(etp_arme7)
	cp		a,0
	jp		z,init_clavicogyres
	cp		a,1
	jp		z,clavicogyres12
	cp		a,2
	jp		z,clavicogyres22
init_clavicogyres
	inc 	a:ld (etp_arme7),a										; on incrémente les étapes de l'arme
	ld		a,1:ld (flag_fireA),a									; on signale que le bouton fire 1 viens d'être appuyé
	ld		a,1:ld (flag_armes),a									; une arme est en cours de déclanchement
	ld		c,BANK9_GOLDORAK_SPRH: RST 0										; on se connection à la rom où se situes les sprites hard de cette arme
	ld		hl,sprh_clavicogyres
	ld		(adr_anim_clavicogyres),hl
	ld		de,SPRH4_ADR
	ld		bc,#100
	LDIR		
	ld		hl,sprh_clavicogyres
	ld		de,SPRH5_ADR
	ld		bc,#100
	LDIR																; on copie de puis la ROM vers l'ASIC	
	call	rom_off
	ld		a,_CALL
	ld		(event_arme_fireA),a
	ld		hl,(adr_type_arme)
	ld		(event_arme_fireA+1),hl													; on copie de puis la ROM vers l'ASIC	
	RST		ASIC_DECONNEXION
	ld		a,4
	ld		(etp_anim_clavicogyres),a
	ld		a,3
	ld		(anim_arme_a_charger),a
	ld		hl,-4
	ld		(courbe_sprh4),hl
	ld		hl,4
	ld		(courbe_sprh5),hl
	
	jp 	retour_test_des_tirs
clavicogyres12
	inc		a:ld (etp_arme7),a
	ld		hl,(SPRH0_X)
	ld		de,32
	add		hl,de
	ld		(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,30:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,6:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode0_1:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	RST		ASIC_DECONNEXION
	ret
clavicogyres22
	ld		hl,(SPRH4_Y)
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
	jr		nc,fin_clavicogyres
	ld		(SPRH4_Y),hl
	ld		hl,(SPRH5_Y)
	dec		l
	dec		l
	dec		l
	dec		l
	dec		l
	dec		l
	ld		(SPRH5_Y),hl
	ld		a,(timer_clavicogyres)
	inc		a
	cp		a,4
	ld		(timer_clavicogyres),a
	call	z,clavicogyres_devier
	ld		a,(etp_anim_clavicogyres)
	dec		a
	cp		a,0
	jr		z,switch_anim_clavicogyres
	ld		(etp_anim_clavicogyres),a
	ret
switch_anim_clavicogyres
	ld		a,4
	ld		(etp_anim_clavicogyres),a
	ld		hl,(adr_anim_clavicogyres)	
	inc		h
	bit		7,h
	jr		z,reinit_adr_anim_clavicogyres
retour_reinit_adr_anim_clavicogyres
	ld		(adr_anim_clavicogyres),hl
	ret
reinit_adr_anim_clavicogyres
	ld		h,#FA
	jr	retour_reinit_adr_anim_clavicogyres
clavicogyres_devier
	ld		hl,(SPRH4_X)
	ld		de,(courbe_sprh4)
	add		hl,de
	ld		(SPRH4_X),hl
	inc		de
	inc		de
	;inc		de
	inc		de
	ld		(courbe_sprh4),de
	ld		hl,(SPRH5_X)
	ld		de,(courbe_sprh5)
	add		hl,de
	ld		(SPRH5_X),hl
	dec		de
	dec		de
	;dec		de
	dec		de
	ld		(courbe_sprh5),de
	ld		a,2
	ld		(timer_clavicogyres),a
	ret
fin_clavicogyres
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a 
	ld		(flag_fireA),a
	ld		(etp_arme7),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		(anim_arme_a_charger),a
	ld		(timer_clavicogyres),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	RST		ASIC_DECONNEXION
	ld 		c,1   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret


; /////////////////////////////////////////////////////////////
; ////////////////   GOLDORAK RETOURNEMENT     ////////////////
; /////////////////////////////////////////////////////////////

GoldroakRetournement
	; on vérifie que l'on a encore des retournement disponible
	ld		a,(nbr_de_retournement)
	cp		a,NBR_RETOURNEMENT_MAX
	jp z,Fin_Retournement

	ld		hl,Compteur_Retournement
	dec		(hl)
	ret		nz
	
	ld		a,VITESSE_RETOURNEMENT
	ld		(Compteur_Retournement),a

	ld		a,(EtpRetournement)
	cp		a,0
	jp		z,Init_Retournement
	cp		a,1
	jp		z,Init_Retournement_0
	cp		a,2
	jp		z,Init_Retournement_0b
	cp		a,3
	jp		z,Init_Retournement_1
	cp		a,4
	jp		z,Init_Retournement_2
	cp		a,5
	jp		z,Init_Retournement_3
	cp		a,6
	jp		z,Init_Retournement_4
	cp		a,7
	jp		z,Init_Retournement_4b
	cp		a,8
	jp		z,Init_Retournement_4c
	cp		a,9
	jp		z,Init_Retournement_5
	cp		a,10
	jp		z,Init_Retournement_6
	cp		a,11
	jp		z,Init_Retournement_7
	cp		a,12
	jp		z,Fin_Retournement
	
Init_Retournement
; passage des étapes de l'animation
	ld		a,(EtpRetournement)
	inc		a
	ld		(EtpRetournement),a
; création de l'évenbement Retyournement dans la boucle
	ld		hl,GoldroakRetournement
	ld		a,_CALL
	ld		(event_retournement),a
	ld		(event_retournement+1),hl
; on efface le test de touche
	xor		a
	ld		(event_test_de_goldorak),a
	ld		(event_test_de_goldorak+1),a
	ld		(event_test_de_goldorak+2),a
; un retournement est en cours
	ld		a,1
	ld		(flag_retournement),a
; on cible les vitesse de retournement	
	ld		hl,Tbl_Vitesse_Retournement
	ld		(Pointeur_Vitesse_Retournement),hl

	jp		retour_test_des_tirs


Init_Retournement_0
		inc		a
		ld		(EtpRetournement),a
		rst		ASIC_CONNEXION
		call	UpdateRetournement
		jp		ASIC_DECONNEXION
Init_Retournement_0b
		inc		a
		ld		(EtpRetournement),a
		rst		ASIC_CONNEXION
		call	UpdateRetournement
		jp		ASIC_DECONNEXION





Init_Retournement_1
		inc		a
		ld		(EtpRetournement),a
		ld		c,BANK15_GOLDORAK_RET_SPRH
		RST		UPPER_ROM_CONNEXION
		RST		ASIC_CONNEXION
		ld		hl,GOLDORAK_RET1_SPRH_ROM_ADR
		ld		de,SPRH0_ADR
		ld		bc,#400
		LDIR
		call	UpdateRetournement
		call	rom_off
		jp		ASIC_DECONNEXION
	
Init_Retournement_2
		inc		a
		ld		(EtpRetournement),a
		ld		c,BANK15_GOLDORAK_RET_SPRH
		RST		UPPER_ROM_CONNEXION
		RST		ASIC_CONNEXION
		ld		hl,GOLDORAK_RET2_SPRH_ROM_ADR
		ld		de,SPRH0_ADR
		ld		bc,#400
		LDIR
		call	UpdateRetournement
		call	rom_off
		jp		ASIC_DECONNEXION
	
Init_Retournement_3
		inc		a
		ld		(EtpRetournement),a
		ld		c,BANK15_GOLDORAK_RET_SPRH
		RST		UPPER_ROM_CONNEXION
		RST		ASIC_CONNEXION
		ld		hl,GOLDORAK_RET3_SPRH_ROM_ADR
		ld		de,SPRH0_ADR
		ld		bc,#400
		LDIR
		call	UpdateRetournement
		call	rom_off
		jp		ASIC_DECONNEXION
		
Init_Retournement_4
		inc		a
		ld		(EtpRetournement),a
		ld		c,BANK15_GOLDORAK_RET_SPRH
		RST		UPPER_ROM_CONNEXION
		RST		ASIC_CONNEXION
		ld		hl,GOLDORAK_RET4_SPRH_ROM_ADR
		ld		de,SPRH0_ADR
		ld		bc,#400
		LDIR
		call	UpdateRetournement
		call	rom_off
		jp		ASIC_DECONNEXION
Init_Retournement_4b
		inc		a
		ld		(EtpRetournement),a
		RST		ASIC_CONNEXION
		call	UpdateRetournement

		jp		ASIC_DECONNEXION
Init_Retournement_4c
		inc		a
		ld		(EtpRetournement),a
		RST		ASIC_CONNEXION
		call	UpdateRetournement
	
		jp		ASIC_DECONNEXION
Init_Retournement_5
		inc		a
		ld		(EtpRetournement),a
		ld		c,BANK15_GOLDORAK_RET_SPRH
		RST		UPPER_ROM_CONNEXION
		RST		ASIC_CONNEXION
		ld		hl,GOLDORAK_RET5_SPRH_ROM_ADR
		ld		de,SPRH0_ADR
		ld		bc,#400
		LDIR
		call	UpdateRetournement
		call	rom_off
		jp		ASIC_DECONNEXION
Init_Retournement_6
		inc		a
		ld		(EtpRetournement),a
		ld		c,BANK15_GOLDORAK_RET_SPRH
		RST		UPPER_ROM_CONNEXION
		RST		ASIC_CONNEXION
		ld		hl,GOLDORAK_RET6_SPRH_ROM_ADR
		ld		de,SPRH0_ADR
		ld		bc,#400
		LDIR
		call	UpdateRetournement
		call	rom_off
		jp		ASIC_DECONNEXION
Init_Retournement_7
		inc		a
		ld		(EtpRetournement),a
		ld		c,BANK15_GOLDORAK_RET_SPRH
		RST		UPPER_ROM_CONNEXION
		RST		ASIC_CONNEXION
		ld		hl,GOLDORAK_RET7_SPRH_ROM_ADR
		ld		de,SPRH0_ADR
		ld		bc,#400
		LDIR		
		call	UpdateRetournement
		call	rom_off
		jp		ASIC_DECONNEXION	
Fin_Retournement
		xor		a
		ld		(flag_retournement),a
		ld		(flag_deja_affiche),a
	
		ld		(event_retournement),a
		ld		(event_retournement+1),a
		ld		(event_retournement+2),a
		ld		(EtpRetournement),a
		
		ld		hl,event_test_de_goldorak
		ld		a,_JP
		ld		(event_test_de_goldorak),a
		ld		hl,test_de_goldorak
		ld		(event_test_de_goldorak+1),hl
		ld		a,VITESSE_RETOURNEMENT
		ld		(Compteur_Retournement),a

		ld a,(nbr_de_retournement)
		cp a,NBR_RETOURNEMENT_MAX
		call nz,uncount_retounment
		ret

uncount_retounment
	; on ajoute un retournement effectué
	ld a,(nbr_de_retournement)
	inc a
	ld (nbr_de_retournement),a

	; on ajoute un pixel en haut
	ld  hl,(display_tbl_retournement_top)
	ld (hl),#76

	; on ajoute un pixel en bas
	ld hl,(display_tbl_retournement_bot)
	ld (hl),#76
	ld (display_tbl_retournement_bot),hl

	ld hl,(pointer_tbl_retournement)
	dec hl

	call	update_pointer_tbl_retournement
	ret


update_pointer_tbl_retournement
	ld	a,(hl)
	ld	(display_tbl_retournement_top+1),a
	dec hl
	ld a,(hl)
	ld (display_tbl_retournement_top),a
	dec hl 
	ld	a,(hl)
	ld	(display_tbl_retournement_bot+1),a
	dec hl
	ld a,(hl)
	ld (display_tbl_retournement_bot),a
	ld  (pointer_tbl_retournement),hl
	ret



nbr_de_retournement				ds 	1,0
display_tbl_retournement_top	ds	2,0
display_tbl_retournement_bot	ds	2,0
pointer_tbl_retournement 		ds 	2,0




UpdateRetournement
	ld		hl,(Pointeur_Vitesse_Retournement)
	ld		e,(hl)
	inc		hl
	ld		(Pointeur_Vitesse_Retournement),hl
	ld		d,0
	ld		hl,(SPRH0_Y)
	add		hl,de
	res		0,h
	ld		(SPRH0_Y),hl
	ld		(SPRH1_Y),hl
	ld 		(posy_goldorak),hl
	ld		hl,(SPRH2_Y)
	add		hl,de
	res		0,h
	ld		(SPRH2_Y),hl
	ld		(SPRH3_Y),hl

	ret


Tbl_Vitesse_Retournement

	db		-16
	db		-8

	db		DISTANCE_RETOURNEMENT_AVANCER,DISTANCE_RETOURNEMENT_AVANCER_moins,DISTANCE_RETOURNEMENT_RECULER_moins
	db		DISTANCE_RETOURNEMENT_RECULER,16,8
	db		DISTANCE_RETOURNEMENT_RECULER_moins,DISTANCE_RETOURNEMENT_RECULER_moins
	db		DISTANCE_RETOURNEMENT_AVANCER






