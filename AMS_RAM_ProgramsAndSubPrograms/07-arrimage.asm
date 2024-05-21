; ///////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////
Arrimage
	ld		a,(etp_arrimage)
	cp		a,0
	jp		z,init_arrimage
	cp		a,1
	jp		z,avance_soucoupe
	cp		a,2
	jp		z,init_goldorak
	cp		a,3
	jp		z,avance_goldorak
	cp		a,4
	jp		z,arrimage_goldorak
	cp		a,10
	jp		z,fin_goldorak
	inc		a
	ld		(etp_arrimage),a
	RET
		init_arrimage
			inc		a
			ld		(etp_arrimage),a
			ld		c,BANK_ROM_18
			; ld		c,BANK_ROM_2
			RST		UPPER_ROM_CONNEXION
			RST		ASIC_CONNEXION
			call	init_arrimage_ROM

			call	rom_off
			RET
				avance_soucoupe
					ld		c,BANK_ROM_18
					; ld		c,BANK_ROM_2
					RST		UPPER_ROM_CONNEXION
					call	avance_soucoupe_ROM
					call	rom_off
					ret
						stop_soucoupe
							ld		a,(etp_arrimage)
							inc		a
							ld		(etp_arrimage),a
							call	sample_on
							;call	music_on
							;call	scrolling_on
							ret
								init_goldorak
									inc		a
									ld		(etp_arrimage),a
									ld		c,BANK_ROM_18
									; ld		c,BANK_ROM_2
									RST		UPPER_ROM_CONNEXION
									call	init_goldorak_ROM
									call	rom_off
									call	reinit_music
									ret
										avance_goldorak	
											ld		c,BANK_ROM_18
											; ld		c,BANK_ROM_2
											RST		UPPER_ROM_CONNEXION
											call	avance_goldorak_ROM
											call	rom_off
											ret	
												etp_goldorak1
													ld		c,BANK9_GOLDORAK_SPRH
													RST 	UPPER_ROM_CONNEXION
													ld		hl,#cC00										; emplacement départ des données de la palette 
													ld		de,#4600										; emplacement de la palette dans l'ASIC
													ld		bc,#400								; longueur de la pellette à copier dans l'ASIC
													LDIR
													ld		a,13
													ld		(SPRH11_ZOOM),a:ld	(valeur_zoom+11),a
													ld		(SPRH10_ZOOM),a:ld	(valeur_zoom+10),a
													call	rom_off
													ld		c,BANK_ROM_18
													; ld		c,BANK_ROM_2
													RST 	UPPER_ROM_CONNEXION
													jp		retour_avance_goldorak
														arrimage_goldorak
															inc		a
															ld		(etp_arrimage),a
															ld		c,BANK9_GOLDORAK_SPRH
															RST 	UPPER_ROM_CONNEXION
															ld		hl,#C600							; emplacement départ des données de la palette 
															ld		de,#4600							; emplacement de la palette dans l'ASIC
															ld		bc,#200								; longueur de la pellette à copier dans l'ASIC
															LDIR
															xor		a
															ld		(SPRH11_ZOOM),a:ld	(valeur_zoom+11),a
															ld		(SPRH10_ZOOM),a:ld	(valeur_zoom+10),a
															call	rom_off
															ret
																fin_goldorak
																	ld		a,(vitesse_goldorak)
																	inc		a
																	ld		(vitesse_goldorak),a
																	cp		a,64
																	ret		nz
																	ld		c,BANK9_GOLDORAK_SPRH
																	RST 	UPPER_ROM_CONNEXION
																	ld		hl,#C600										; emplacement départ des données de la palette 
																	ld		de,#4600										; emplacement de la palette dans l'ASIC
																	ld		bc,#200								; longueur de la pellette à copier dans l'ASIC
																	LDIR
																	ld		c,BANK_ROM_18
																	; ld		c,BANK_ROM_2
																	RST		UPPER_ROM_CONNEXION
																	call	fin_goldorak_ROM
																	call	rom_off
																	
																;	jp		init_2joueurs
																	ret
	