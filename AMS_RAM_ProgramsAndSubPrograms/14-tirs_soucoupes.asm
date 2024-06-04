tir_ennemis_4



rst		ASIC_CONNEXION
	ld		a,(EtpTirEnnemis_4)
	or 		a
	jr		z,InitTirEnnemis_4
	
	jr		DeplacementTirEnnemis_4
		InitTirEnnemis_4
			ld		a,(AttenteTirEnnemis_4)
			inc		a
			ld		(AttenteTirEnnemis_4),a
			cp		a,50
			RET		NZ
			xor		a
			ld		(AttenteTirEnnemis_4),a
			ld		a,(EtpTirEnnemis_4)
			inc		a
			ld		(EtpTirEnnemis_4),a
			ld		hl,(SPRH9_X)
			ld		(SPRH12_X),hl
			ld		(posx_soucoupe_tir),hl
			ld		hl,(SPRH9_Y)
			ld		(SPRH12_Y),hl
			ld		(posy_soucoupe_tir),hl
			ld		c,10
			rst		UPPER_ROM_CONNEXION
			ld		hl,TIR_SPRH_SOUCOUPES
			ld		de,SPRH12_ADR
			ld		bc,#100
			LDIR
			ld		a,zoom_mode1_1
			ld		(SPRH12_ZOOM),a
			ld		(valeur_zoom_sprh12),a
			call	CalculePositionGoldorak
			ret
				DeplacementTirEnnemis_4
				
					ld		hl,(SPRH12_X)
					ld		de,(DirectionXTirEnnemis)
					add		hl,de				
					ld		(SPRH12_X),hl
					ld		(posx_soucoupe),hl
					
					ld		hl,(SPRH12_Y)	
					ld		de,(DirectionYTirEnnemis)
					add		hl,de			
					ld		(SPRH12_Y),hl
					ld		(posy_soucoupe),hl
					bit		0,h
					jr		nz,TirEnnemis4Fin
					call	test_collisions_avec_les_ennemisG
					call	test_collisions_avec_les_ennemisD
					jp		ASIC_DECONNEXION
					
						TirEnnemis4Fin
								xor		a
								ld		(EtpTirEnnemis_4),a
								ld		(SPRH12_ZOOM),a
								ld		(valeur_zoom_sprh12),a
								ld		(event_tir_ennemis_4),a
								ld		(event_tir_ennemis_4+1),a
								ld		(event_tir_ennemis_4+2),a
								jp		ASIC_DECONNEXION
								
									
; ////////////////////////////////////////////////////////////////////////////////////////////////									
; ////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////////									
									
tir_ennemis_1

rst		ASIC_CONNEXION
	ld		a,(EtpTirEnnemis_1)
	or 		a
	jr		z,InitTirEnnemis_1
	
	jr		DeplacementTirEnnemis_1
		InitTirEnnemis_1
			ld		a,(AttenteTirEnnemis_1)
			inc		a
			ld		(AttenteTirEnnemis_1),a
			cp		a,50
			RET		NZ
			xor		a
			ld		(AttenteTirEnnemis_1),a
		
			ld		a,(EtpTirEnnemis_1)
			inc		a
			ld		(EtpTirEnnemis_1),a
			ld		hl,(SPRH6_X)
			ld		(SPRH13_X),hl
			ld		(posx_soucoupe_tir),hl
			ld		hl,(SPRH6_Y)
			ld		(SPRH13_Y),hl
			ld		(posy_soucoupe_tir),hl
			ld		c,10
			rst		UPPER_ROM_CONNEXION
			ld		hl,TIR_SPRH_SOUCOUPES
			ld		de,SPRH13_ADR
			ld		bc,#100
			LDIR
			ld		a,zoom_mode1_1
			ld		(SPRH13_ZOOM),a
			ld		(valeur_zoom_sprh13),a
			call	CalculePositionGoldorak
			ret
				DeplacementTirEnnemis_1
					
					ld		hl,(SPRH13_X)
					ld		de,(DirectionXTirEnnemis)
					add		hl,de				
					ld		(SPRH13_X),hl
					ld		(posx_soucoupe),hl
					ld		hl,(SPRH13_Y)	
					ld		de,(DirectionYTirEnnemis)
					add		hl,de			
					ld		(SPRH13_Y),hl
					ld		(posy_soucoupe),hl
					bit		0,h
					jr		nz,TirEnnemis1Fin
					call	test_collisions_avec_les_ennemisG
					call	test_collisions_avec_les_ennemisD
					jp		ASIC_DECONNEXION
					
						TirEnnemis1Fin
							xor		a
							ld		(EtpTirEnnemis_1),a
							ld		(SPRH13_ZOOM),a
							ld		(valeur_zoom_sprh13),a
							ld		(event_tir_ennemis_1),a
							ld		(event_tir_ennemis_1+1),a
							ld		(event_tir_ennemis_1+2),a
							jp		ASIC_DECONNEXION
							


CalculePositionGoldorak
		rst	ASIC_CONNEXION
		ld	hl,(posy_soucoupe_tir)
		ld	bc,(SPRH0_Y)
		or	a
		sbc	hl,bc
		jr	nc,TirVersLeHaut
		jr	TirVersLeBas
				TirVersLeHaut
						ld	hl,VITESSE_TIR_SOUCOUPE_Y_HAUT
						ld	(DirectionYTirEnnemis),hl
						jr	TestPositionX
				TirVersLeBas
						ld	hl,VITESSE_TIR_SOUCOUPE_Y_BAS
						ld	(DirectionYTirEnnemis),hl
						jr	TestPositionX
								TestPositionX
										ld	hl,(posx_soucoupe_tir)
										ld	bc,(SPRH0_X)
										or	a
										sbc	hl,bc
										jr	nc,TirVersLaGauche
										jr	TirVersLaDroite
												TirVersLaGauche
														ld	hl,VITESSE_TIR_SOUCOUPE_X_GAUCHE
														ld	(DirectionXTirEnnemis),hl
														ret
												TirVersLaDroite
														ld	hl,VITESSE_TIR_SOUCOUPE_X_DROITE
														ld	(DirectionXTirEnnemis),hl
														jp	ASIC_DECONNEXION
														




