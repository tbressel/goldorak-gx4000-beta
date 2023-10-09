nouvelle_vague_ROM
	;ld		hl,TBL_DEPLACEMENT_HorizVertiBasDroite
	;ld		(Pointeur_TblHorizVertiBasDroite),hl
	;ld		hl,TBL_DEPLACEMENT_HorizVertiBasGauche
	;ld		(Pointeur_TblHorizVertiBasGauche),hl
	ld		hl,(Pointeur_TblNombreDeSoucoupes)		; on recupère le pointeur en debut de ligne
	inc		hl:inc hl				; on incremente pour tester le poid fort
	inc		hl:inc hl
	ld		bc,event_enemis
	exx
	ld		de,(Pointeur_TblTypeDeSoucoupe)
	exx
		boucle_test_vague
		; on test si on est en fin de ligne
			inc		hl
			ld		a,(hl)				; poid fort dans A
			cp		a,0					; est il à 0 ?
			jp		z,maj_du_pointeur	; alors on est en fin de ligne et on met a jour le pointeur
		; on créer l'evenement		
			ld		a,_CALL		; call
			ld		(bc),a
			dec		hl			; on pointe sur le poid faible à recupérer
			inc		bc			; on cible l'octet juste après le CALL
			ld		a,(hl)		; poid faible dans A

			exx					; on stock le poid faible 
			ld		l,a			; de l'adresse de la routine soucoupe
			exx

			ld		(bc),a
			inc		bc
			inc		hl
			ld		a,(hl)
		; ICI ON RECUPERE LES DONNEES A ENVOTER DANS LES TABLEAU DES SPRITES ENNEMIS	
			push	af
			exx					; on stock le poid fort de 
			ld		h,a			; l'adresse de la routine soucoupe
								; HL contient l'adresse de la routine soucoupe_1
			ld		bc,8		; 8octets plus loin
			add		hl,bc		; HL contient l'adresse vers laquelle on pointe
								; et qui contient l'adresse de TblConfigsoucoupe1+7 
			ld		c,(hl)		; on lit cette adresse et on la stock dans BC
			inc		hl
			ld		b,(hl)		; BC contient l'adresse ou il faut ecrire
		; ON A RECUPERE L'ADRESSE DU TABLEAU DE CONFIG DU SPRITE EN COURS	
	
		; sauvegarde de l'adresse Destiantion dans le tableau des psrite
			push	bc
			; ---------------------------------------------------------------------------------------------
			; ---------------------- LECTURE DU TYPE DE SOUCOUPE DANS LE TABLEAU --------------------------
			; ---------------------------------------------------------------------------------------------
			; on recupère le poid faible de l'adresse à lire dans le tableau	
				ld		a,(de)
				ld		l,a
			; on recupère le poid fort de l'adresse à lire dans le tableau	
				inc		de
				ld		a,(de)
			; HL contient l'adresse TypeSoucoupeVerte
				ld		h,a
			; on décale de pointeur pour lire la prochaine adresse du tableau et on la sauvegarde	
				inc		de
				ld		(Pointeur_TblTypeDeSoucoupe),de
			; on sauvegarde le type de soucoupe ciblé
				push	hl
				
				; ---------------------------------------------------------------------------------------------
				; ----------------- LECTURE DE L'ADRESSE DU SPRH DU TYPE DE SOUCOUPE --------------------------
				; ---------------------------------------------------------------------------------------------	
				; on recupère de poid faible de l'adresse du sprite hard
					ld		a,(hl)		
				; on l'écrit dans le tableau
					ld		(bc),a
					inc		bc
					inc		hl
				; on recupère de poid fort de l'adresse du sprite hard
					ld		a,(hl)
				; on l'écrit dans le tableau
					ld		(bc),a
		
					; ---------------------------------------------------------------------------------------------
					; ----------------- LECTURE DU NBR DE PTS DE VIE DU TYPE DE SOUCOUPE --------------------------
					; ---------------------------------------------------------------------------------------------	
						pop		de			; adresse de TypeSoucoupeVerte
						pop		bc			; Destination précédante du Tableau
						ld		hl,20		; 20 octets plus loin
						add		hl,bc
					; nouvelle destination tableau dans BC	
						ld		c,l
						ld		b,h
					; on pointe sur PV	
						inc		de
						inc 	de
					; on recupère la valeur des poitn de vie	
						ld		a,(de)
					; on les ecrit dans le tableau
						ld		(bc),a
			
			
						; ---------------------------------------------------------------------------------------------
						; ----------------- LECTURE DU TYPE DE DEPLACEMENT DU TYPE DE SOUCOUPE ------------------------
						; ---------------------------------------------------------------------------------------------		
						; on pointe sur le poids faible du type de déplacement	
							inc 	de
						; on pointe sur l'octet suivant donc la où on ecrira l'adresse du type de déplacement	
							inc		bc
						; on recupère de poid faible du type de déplcament	
							ld		a,(de)
							ld		(bc),a
						; on pointe sur le poids fort du type de déplacement	
							inc 	de				
							inc 	bc
							ld		a,(de)
							ld		(bc),a
			
							; ---------------------------------------------------------------------------------------------
							; ----------------- LECTURE DES COORDONNEES DE DEPART DU TYPE DE SOUCOUPE ------------------------
							; ---------------------------------------------------------------------------------------------		
								
							; on pointe sur la position X
								inc		de
							; on pointe sur l'endroit du tableau ou l'on va ecrire la coordonnées	
								ld		hl,-26		
								add		hl,bc
							; BC contient la destination
								ld		c,l
								ld		b,h
							; on recupère l'ctet de poid faible X à lire et on ecrit			
								ld		a,(de)		
								ld		(bc),a		
								inc		de
								inc		bc
							; on recupère l'ctet de poid fort X à lire et on ecrit
								ld		a,(de)		
								ld		(bc),a		
							; on pointe on recupère l'ctet de poid faible Y à lire et on ecrit				
								inc		de
								inc		bc
								ld		a,(de)		
								ld		(bc),a
							; on pointe on recupère l'ctet de poid fort Y à lire et on ecrit		
								inc		de
								inc		bc
								ld		a,(de)		
								ld		(bc),a		
			
								; ---------------------------------------------------------------------------------------------
								; ----------------- LECTURE DES POINTEURS DE TABLEAU DU TYPE DE SOUCOUPE ---------------------
								; ---------------------------------------------------------------------------------------------	
								; configuration du pointeur pour ceertain type de déplacement
								; on se déplace au bon endroit dans le TblConfig
									ld		hl,24		
									add		hl,bc
									
								; BC contient l'adresse de la variable contenant ll'adresse du tableau
									ld		c,(hl)
									inc 	hl
									ld		b,(hl)
									push	hl			; on sauvagarde le pointeur de lecture en cours
											
								; on se place sur l'adresse à lire dans le Type De soucoupe	
									inc		de
								; on recupère le poid faible	
									ld		a,(de)		
									ld		(bc),a
									ld		l,a
								; on recupère le poid fort
									inc		de
									inc		bc
									ld		a,(de)		
									ld		(bc),a
								; HL contient l'adresse du Tableau	
									ld		h,a			
									
								; stockage de l'adresse qui contient la valeur de deplacement
									ld		a,(hl)		
											; BC contient l'adresse de la variable contenant la valeur de déplacement
									pop     hl		
									inc		hl
									ld		c,(hl)
									inc		hl
									ld		b,(hl)
									ld		(bc),a
								
									; on met le pointeur à jour
									ld		de,(Pointeur_TblTypeDeSoucoupe)
									exx					; 
									pop		af
								
								
								
								
									ld		(bc),a		; poid fort
									inc		bc
									inc		hl
									jp		boucle_test_vague

										maj_du_pointeur
											inc		hl
											ld		(pointeur_vague_fin),hl
											ld		a,(hl)
											ld		e,a
											inc		hl
											ld		a,(hl)
											ld		d,a
											ld		hl,#FFFF
											sbc		hl,de
											jr		z,reinit_counter_vagues
											ret

												reinit_counter_vagues
													call	fin_de_la_vague_ROM
													;call	fin_de_la_vague				; la routine inclu une mise à jour du pointeur de vague
																						; on va devoir en définir une autre
													
													ld		hl,(pointeur_tbl_level)
													inc hl : inc hl
													ld		(pointeur_tbl_level),hl
													ld		e,(hl)							; on lit l'adresse contenu à l'adresse du pointeur
													inc		hl
													ld		d,(hl)
													or		a
													ld		hl,#FFFE
													sbc		hl,de
													jp		z,boss_de_fin_ROM
													or		a
													ld		hl,#FFFF
													sbc		hl,de
													jp		z,fin_du_level ; fin du level à partir du moment où goldorak est détruit
													ld		(Pointeur_TblNombreDeSoucoupes),de
													ld		a,#00
													ld		(counter_poid_faible),a
													ld		a,#04
													ld		(counter_poid_fort),a
													ret
													
												



; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////

fin_de_la_vague_ROM
; on efface la vague precedente
	xor		a
	ld		hl,event_enemis
	ld		(hl),a
	ld		de,event_enemis+1
	ld		bc,18
	ldir
	ld		hl,(pointeur_vague_fin)
	ld		(Pointeur_TblNombreDeSoucoupes),hl
	xor	a
	ld		(etp_soucoupe1),a
	ld		(etp_soucoupe2),a
	ld		(etp_soucoupe3),a
	ld		(etp_soucoupe4),a
	ld		(etp_soucoupe5),a
	ld		(etp_soucoupe6),a
	ld		(EtpTirEnnemis_4),a
	ld		(EtpTirEnnemis_1),a
	ld		(flag_1up),a
	RST		ASIC_CONNEXION
	ld		(SPRH6_ZOOM),a : ld	 (valeur_zoom_sprh6),a
	ld		(SPRH7_ZOOM),a : ld	 (valeur_zoom_sprh7),a
	ld		(SPRH8_ZOOM),a : ld	 (valeur_zoom_sprh8),a
	ld		(SPRH9_ZOOM),a : ld	 (valeur_zoom_sprh9),a
	ld		(SPRH10_ZOOM),a : ld	 (valeur_zoom_sprh10),a
	ld		(SPRH11_ZOOM),a : ld	 (valeur_zoom_sprh11),a
	ld		(SPRH12_ZOOM),a : ld	 (valeur_zoom_sprh12),a
	ld		(SPRH13_ZOOM),a : ld	 (valeur_zoom_sprh13),a
	ld		(SPRH14_ZOOM),a : ld	 (valeur_zoom_sprh14),a
	ld		(SPRH15_ZOOM),a : ld	 (valeur_zoom_sprh15),a
	ld		de,Tbl_timer_depart_soucoupes
	ld		hl,Tbl_VALEUR_TIMER_soucoupes
	ld		bc,6
	LDIR
	ret 


; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	

boss_de_fin_ROM
	ld		a,1
	ld		(flag_boss),a
	ld		a,(level_en_cours)
	cp		a,1
	jp		z,Golgoth_Level_1
	cp		a,2
	jp		z,Golgoth_Level_2
	cp		a,3
	jp		z,Golgoth_Level_3
	cp		a,4
	jp		z,Golgoth_Level_4
	cp		a,5
	jp		z,Golgoth_Level_5
	cp		a,6
	jp		z,Golgoth_Level_6
	cp		a,7
	jp		z,Golgoth_Level_7
	cp		a,8
	jp		z,Golgoth_Level_8
		Golgoth_Level_1
			ld		a,_JP							; JP pas_de_scroll_hard
			ld		(event_stop_scroll),a
			ld		hl,pas_de_scroll_hard
			ld		(event_stop_scroll+1),hl
			ld		a,_CALL
			ld		(event_golgoth),a
			ld		hl,golgoth_1
			ld		(event_golgoth+1),hl
			ld		a,_CALL
			ld		(event_golgoth+3),a
			ld		hl,Update_Golgoth_1
			ld		(event_golgoth+4),hl
			ld		a,_CALL
			ld		(event_golgoth+6),a
			ld		hl,missileG1_1
			ld		(event_golgoth+7),hl
			ld		a,_CALL
			ld		(event_golgoth+9),a
			ld		hl,Update_missileG1_1
			ld		(event_golgoth+10),hl
			ld		a,_CALL
			ld		(event_golgoth+12),a
			ld		hl,missileG1_2
			ld		(event_golgoth+13),hl
			ld		a,_CALL
			ld		(event_golgoth+15),a
			ld		hl,Update_missileG1_2
			ld		(event_golgoth+16),hl
			ld		a,_CALL
			ld		(event_golgoth+18),a
			ld		hl,missileG1_3
			ld		(event_golgoth+19),hl
			ld		a,_CALL
			ld		(event_golgoth+21),a
			ld		hl,Update_missileG1_3
			ld		(event_golgoth+22),hl	
			ld		a,_CALL
			ld		(event_golgoth+24),a
			ld		hl,missileG1_4
			ld		(event_golgoth+25),hl	
			ld		a,_CALL
			ld		(event_golgoth+27),a
			ld		hl,Update_missileG1_4
			ld		(event_golgoth+28),hl
		
			xor		a
			ld		(EtpGolgoth),a
			ld		a,7
			ld		(id_soucoupe),a
			ld		a,16
			ld		(point_vie_golgoth),a
			ld		hl,GOLGOTH1_SPRH_ADR_ROM
			ld		(GolgothAdrRom),hl
			ld		hl,SPRH6_ADR
			ld		(GolgothSprh),hl
			ld		hl,#400
			ld		(GolgothLongeur),hl
			ld		hl,Tbl_Gologoth1
			ld		(Pointeur_TblGolgoth_1),hl
			ld		hl,0
			ld		(posX_Golgoth),hl
			ld		hl,16
			ld		(posY_Golgoth),hl
			call	Update_Golgoth_after
			ld		a,zoom_mode0_1
			ld		(SPRH6_ZOOM),a
			ld		(SPRH7_ZOOM),a
			ld		(SPRH8_ZOOM),a
			ld		(SPRH9_ZOOM),a
			ld		(valeur_zoom_sprh6),a
			ld		(valeur_zoom_sprh7),a
			ld		(valeur_zoom_sprh8),a
			ld		(valeur_zoom_sprh9),a
			ld		hl,Music
			ld		a,2
			call	PLY_AKG_Init
			
			ld		hl,GOLGOTH1_SPRH_ADR_ROM+#400
			ld		(Tbl_Golgoth_anim),hl
			ld		hl,GOLGOTH1_SPRH_ADR_ROM
			ld		(Tbl_Golgoth_anim+2),hl
			ld		hl,Update_Golgoth
			ld		(PointeurUpdateGolgoth),hl
			
			
			
			ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////		
				Golgoth_Level_2	
					ld		a,_JP							; JP pas_de_scroll_hard
					ld		(event_stop_scroll),a
					ld		hl,pas_de_scroll_hard
					ld		(event_stop_scroll+1),hl
					ld		a,_CALL
					ld		(event_golgoth),a
					ld		hl,golgoth_2
					ld		(event_golgoth+1),hl
					ld		a,_CALL
					ld		(event_golgoth+3),a
					ld		hl,Update_Golgoth_2
					ld		(event_golgoth+4),hl
					ld		a,_CALL
					ld		(event_golgoth+6),a
					ld		hl,missileG2_1
					ld		(event_golgoth+7),hl
					ld		a,_CALL
					ld		(event_golgoth+9),a
					ld		hl,Update_missileG2_1
					ld		(event_golgoth+10),hl
					ld		a,_CALL
					ld		(event_golgoth+12),a
					ld		hl,missileG2_2
					ld		(event_golgoth+13),hl
					ld		a,_CALL
					ld		(event_golgoth+15),a
					ld		hl,Update_missileG2_2
					ld		(event_golgoth+16),hl
					ld		a,_CALL
					ld		(event_golgoth+18),a
					ld		hl,missileG2_3
					ld		(event_golgoth+19),hl
					ld		a,_CALL
					ld		(event_golgoth+21),a
					ld		hl,Update_missileG2_3
					ld		(event_golgoth+22),hl
					
					
					ld		a,8
					ld		(id_soucoupe),a
					ld		a,16
					ld		(point_vie_golgoth),a
					xor		a
					ld		(EtpGolgoth),a
					ld		hl,GOLGOTH2_SPRH_ADR_ROM
					ld		(GolgothAdrRom),hl
					ld		hl,SPRH6_ADR
					ld		(GolgothSprh),hl
					ld		hl,#400
					ld		(GolgothLongeur),hl
					ld		hl,Tbl_Gologoth2
					ld		(Pointeur_TblGolgoth_1),hl
					ld		hl,0
					ld		(posX_Golgoth),hl
					ld		hl,0
					ld		(posY_Golgoth),hl
					call	Update_Golgoth2_after
					ld		a,zoom_mode0_1
					ld		(SPRH6_ZOOM),a
					ld		(SPRH7_ZOOM),a
					ld		(SPRH8_ZOOM),a
					ld		(SPRH9_ZOOM),a
					ld		(valeur_zoom_sprh6),a
					ld		(valeur_zoom_sprh7),a
					ld		(valeur_zoom_sprh8),a
					ld		(valeur_zoom_sprh9),a
					ld		hl,Music
					ld		a,2
					call	PLY_AKG_Init			
					ld		hl,GOLGOTH2_SPRH_ADR_ROM+#400
					ld		(Tbl_Golgoth_anim),hl
					ld		hl,GOLGOTH2_SPRH_ADR_ROM
					ld		(Tbl_Golgoth_anim+2),hl
					ld		hl,Update_Golgoth2
					ld		(PointeurUpdateGolgoth),hl	
					ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
						Golgoth_Level_3	
							ld		a,_JP							; JP pas_de_scroll_hard
							ld		(event_stop_scroll),a
							ld		hl,pas_de_scroll_hard
							ld		(event_stop_scroll+1),hl
							ld		a,_CALL
							ld		(event_golgoth),a
							ld		hl,golgoth_3
							ld		(event_golgoth+1),hl
							ld		a,_CALL
							ld		(event_golgoth+3),a
							ld		hl,Update_Golgoth_3
							ld		(event_golgoth+4),hl
							ld		a,_CALL
							ld		(event_golgoth+6),a
							ld		hl,missileG3_1
							ld		(event_golgoth+7),hl
							ld		a,_CALL
							ld		(event_golgoth+9),a
							ld		hl,Update_missileG3_1
							ld		(event_golgoth+10),hl
							ld		a,_CALL
							ld		(event_golgoth+12),a
							ld		hl,missileG3_2
							ld		(event_golgoth+13),hl
							ld		a,_CALL
							ld		(event_golgoth+15),a
							ld		hl,Update_missileG3_2
							ld		(event_golgoth+16),hl
							ld		a,_CALL
							ld		(event_golgoth+18),a
							ld		hl,missileG3_3
							ld		(event_golgoth+19),hl
							ld		a,_CALL
							ld		(event_golgoth+21),a
							ld		hl,Update_missileG3_3
							ld		(event_golgoth+22),hl
							
							
							ld		a,9
							ld		(id_soucoupe),a
							ld		a,16
							ld		(point_vie_golgoth),a
							xor		a
							ld		(EtpGolgoth),a

							ld		hl,Tbl_Gologoth3
							ld		(Pointeur_TblGolgoth_1),hl
							ld		hl,0
							ld		(posX_Golgoth),hl
							ld		hl,16
							ld		(posY_Golgoth),hl
							call	Update_Golgoth3_after
							rst		ASIC_CONNEXION
							ld		a,zoom_mode0_1
							ld		(SPRH6_ZOOM),a
							ld		(SPRH7_ZOOM),a
							ld		(SPRH8_ZOOM),a
							ld		(SPRH9_ZOOM),a
							ld		(SPRH10_ZOOM),a
							ld		(SPRH11_ZOOM),a
							ld		(SPRH12_ZOOM),a
							ld		(valeur_zoom_sprh6),a
							ld		(valeur_zoom_sprh7),a
							ld		(valeur_zoom_sprh8),a
							ld		(valeur_zoom_sprh9),a
							ld		(valeur_zoom_sprh10),a
							ld		(valeur_zoom_sprh11),a
							ld		(valeur_zoom_sprh12),a
							ld		hl,Music
							ld		a,2
							call	PLY_AKG_Init
							ld		hl,Update_Golgoth3
							ld		(PointeurUpdateGolgoth),hl	
							rst		ASIC_DECONNEXION
							ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
								Golgoth_Level_4	
									ld		a,_JP							; JP pas_de_scroll_hard
									ld		(event_stop_scroll),a
									ld		hl,pas_de_scroll_hard
									ld		(event_stop_scroll+1),hl
									ld		a,_CALL
									ld		(event_golgoth),a
									ld		hl,golgoth_4
									ld		(event_golgoth+1),hl
									ld		a,_CALL
									ld		(event_golgoth+3),a
									ld		hl,Update_Golgoth_4
									ld		(event_golgoth+4),hl
									
									
									
									
								
									ld		a,10
									ld		(id_soucoupe),a
									ld		a,16
									ld		(point_vie_golgoth),a
									xor		a
									ld		(EtpGolgoth),a
		
									ld		hl,GOLGOTH4_SPRH_ADR_ROM
									ld		(GolgothAdrRom),hl
									ld		hl,SPRH6_ADR
									ld		(GolgothSprh),hl
									ld		hl,#800
									ld		(GolgothLongeur),hl
		
		
									ld		hl,Tbl_Gologoth4
									ld		(Pointeur_TblGolgoth_1),hl
									ld		hl,0
									ld		(posX_Golgoth),hl
									ld		hl,16
									ld		(posY_Golgoth),hl
									call	Update_Golgoth4_after
									rst		ASIC_CONNEXION
									ld		a,zoom_mode0_1
									ld		(SPRH6_ZOOM),a
									ld		(SPRH7_ZOOM),a
									ld		(SPRH8_ZOOM),a
									ld		(SPRH9_ZOOM),a
									ld		(SPRH10_ZOOM),a
									ld		(SPRH11_ZOOM),a
									ld		(SPRH12_ZOOM),a
									ld		(SPRH13_ZOOM),a
									ld		(valeur_zoom_sprh6),a
									ld		(valeur_zoom_sprh7),a
									ld		(valeur_zoom_sprh8),a
									ld		(valeur_zoom_sprh9),a
									ld		(valeur_zoom_sprh10),a
									ld		(valeur_zoom_sprh11),a
									ld		(valeur_zoom_sprh12),a
									ld		(valeur_zoom_sprh13),a
									ld		hl,Music
									ld		a,2
									call	PLY_AKG_Init
					ld		hl,GOLGOTH4_SPRH_ADR_ROM_MARCHE			; +#200
					ld		(GolgothAdrRom_MarcheG),hl
					ld		hl,GOLGOTH4_SPRH_ADR_ROM_ANIM1+#500		; +#200
					ld		(GolgothAdrRom_MarcheD),hl
									
									ld		hl,Update_Golgoth4
									ld		(PointeurUpdateGolgoth),hl	
									rst		ASIC_DECONNEXION
									ret	
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
										Golgoth_Level_5	
											ld		a,_JP							; JP pas_de_scroll_hard
											ld		(event_stop_scroll),a
											ld		hl,pas_de_scroll_hard
											ld		(event_stop_scroll+1),hl
											ld		a,_CALL
											ld		(event_golgoth),a
											ld		hl,golgoth_5
											ld		(event_golgoth+1),hl
											ld		a,_CALL
											ld		(event_golgoth+3),a
											ld		hl,Update_Golgoth_5
											ld		(event_golgoth+4),hl
										
										
											ld		a,_CALL
											ld		(event_golgoth+6),a
											ld		hl,missileG3_1
											ld		(event_golgoth+7),hl
											ld		a,_CALL
											ld		(event_golgoth+9),a
											ld		hl,Update_missileG3_1
											ld		(event_golgoth+10),hl
											ld		a,_CALL
											ld		(event_golgoth+12),a
											ld		hl,missileG3_2
											ld		(event_golgoth+13),hl
											ld		a,_CALL
											ld		(event_golgoth+15),a
											ld		hl,Update_missileG3_2
											ld		(event_golgoth+16),hl
											ld		a,_CALL
											ld		(event_golgoth+18),a
											ld		hl,missileG3_3
											ld		(event_golgoth+19),hl
											ld		a,_CALL
											ld		(event_golgoth+21),a
											ld		hl,Update_missileG3_3
											ld		(event_golgoth+22),hl
							
										
										
											ld		a,11
											ld		(id_soucoupe),a
											ld		a,16
											ld		(point_vie_golgoth),a
											xor		a
											ld		(EtpGolgoth),a
				
											ld		hl,GOLGOTH5_SPRH_ADR_ROM
											ld		(GolgothAdrRom),hl
											ld		hl,SPRH6_ADR
											ld		(GolgothSprh),hl
											ld		hl,#800
											ld		(GolgothLongeur),hl
				
				
											ld		hl,Tbl_Gologoth5
											ld		(Pointeur_TblGolgoth_1),hl
											ld		hl,0
											ld		(posX_Golgoth),hl
											ld		hl,16
											ld		(posY_Golgoth),hl
											call	Update_Golgoth5_after
											rst		ASIC_CONNEXION
											ld		a,zoom_mode0_1
											ld		(SPRH6_ZOOM),a
											ld		(SPRH7_ZOOM),a
											ld		(SPRH8_ZOOM),a
											ld		(SPRH9_ZOOM),a
											ld		(SPRH10_ZOOM),a
											ld		(SPRH11_ZOOM),a
											ld		(SPRH12_ZOOM),a
											ld		(SPRH13_ZOOM),a
											ld		(valeur_zoom_sprh6),a
											ld		(valeur_zoom_sprh7),a
											ld		(valeur_zoom_sprh8),a
											ld		(valeur_zoom_sprh9),a
											ld		(valeur_zoom_sprh10),a
											ld		(valeur_zoom_sprh11),a
										
											ld		hl,Music
											ld		a,2
											call	PLY_AKG_Init
											
											
											ld		hl,Update_Golgoth5
											ld		(PointeurUpdateGolgoth),hl	
											rst		ASIC_DECONNEXION
											ret														
											
											
; ////////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////////////////								
											
													Golgoth_Level_6
														ld		a,_JP							; JP pas_de_scroll_hard
														ld		(event_stop_scroll),a
														ld		hl,pas_de_scroll_hard
														ld		(event_stop_scroll+1),hl
														ld		a,_CALL
														ld		(event_golgoth),a
														ld		hl,golgoth_6
														ld		(event_golgoth+1),hl
														ld		a,_CALL
														ld		(event_golgoth+3),a
														ld		hl,Update_Golgoth_6
														ld		(event_golgoth+4),hl
														ld		a,_CALL
														ld		(event_golgoth+6),a
														ld		hl,missileG1_1
														ld		(event_golgoth+7),hl
														ld		a,_CALL
														ld		(event_golgoth+9),a
														ld		hl,Update_missileG1_1
														ld		(event_golgoth+10),hl
														ld		a,_CALL
														ld		(event_golgoth+12),a
														ld		hl,missileG1_2
														ld		(event_golgoth+13),hl
														ld		a,_CALL
														ld		(event_golgoth+15),a
														ld		hl,Update_missileG1_2
														ld		(event_golgoth+16),hl
														ld		a,_CALL
														ld		(event_golgoth+18),a
														ld		hl,missileG1_3
														ld		(event_golgoth+19),hl
														ld		a,_CALL
														ld		(event_golgoth+21),a
														ld		hl,Update_missileG1_3
														ld		(event_golgoth+22),hl	
														ld		a,_CALL
														ld		(event_golgoth+24),a
														ld		hl,missileG1_4
														ld		(event_golgoth+25),hl	
														ld		a,_CALL
														ld		(event_golgoth+27),a
														ld		hl,Update_missileG1_4
														ld		(event_golgoth+28),hl
													
														xor		a
														ld		(EtpGolgoth),a
														ld		a,12
														ld		(id_soucoupe),a
														ld		a,16
														ld		(point_vie_golgoth),a
														ld		hl,GOLGOTH6_SPRH_ADR_ROM
														ld		(GolgothAdrRom),hl
														ld		hl,SPRH6_ADR
														ld		(GolgothSprh),hl
														ld		hl,#500
														ld		(GolgothLongeur),hl
														ld		hl,Tbl_Gologoth6
														ld		(Pointeur_TblGolgoth_1),hl
														ld		hl,0
														ld		(posX_Golgoth),hl
														ld		hl,0
														ld		(posY_Golgoth),hl
														call	Update_Golgoth6_after
														ld		a,zoom_mode0_1
														ld		(SPRH6_ZOOM),a
														ld		(SPRH7_ZOOM),a
														ld		(SPRH8_ZOOM),a
														ld		(SPRH9_ZOOM),a
														ld		(SPRH10_ZOOM),a
														ld		(valeur_zoom_sprh6),a
														ld		(valeur_zoom_sprh7),a
														ld		(valeur_zoom_sprh8),a
														ld		(valeur_zoom_sprh9),a
														ld		(valeur_zoom_sprh10),a
														ld		hl,Music
														ld		a,2
														call	PLY_AKG_Init
														
													
														ld		hl,Update_Golgoth6
														ld		(PointeurUpdateGolgoth),hl
														ret
														
; ////////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////////////////								
															Golgoth_Level_7
																ld		a,_JP							; JP pas_de_scroll_hard
																ld		(event_stop_scroll),a
																ld		hl,pas_de_scroll_hard
																ld		(event_stop_scroll+1),hl
																ld		a,_CALL
																ld		(event_golgoth),a
																ld		hl,golgoth_7
																ld		(event_golgoth+1),hl
																ld		a,_CALL
																ld		(event_golgoth+3),a
																ld		hl,Update_Golgoth_7
																ld		(event_golgoth+4),hl
																ld		a,_CALL
																ld		(event_golgoth+6),a
																ld		hl,missileG1_1
																ld		(event_golgoth+7),hl
																ld		a,_CALL
																ld		(event_golgoth+9),a
																ld		hl,Update_missileG1_1
																ld		(event_golgoth+10),hl
																ld		a,_CALL
																ld		(event_golgoth+12),a
																ld		hl,missileG1_2
																ld		(event_golgoth+13),hl
																ld		a,_CALL
																ld		(event_golgoth+15),a
																ld		hl,Update_missileG1_2
																ld		(event_golgoth+16),hl
																ld		a,_CALL
																ld		(event_golgoth+18),a
																ld		hl,missileG1_3
																ld		(event_golgoth+19),hl
																ld		a,_CALL
																ld		(event_golgoth+21),a
																ld		hl,Update_missileG1_3
																ld		(event_golgoth+22),hl	
																ld		a,_CALL
																ld		(event_golgoth+24),a
																ld		hl,missileG1_4
																ld		(event_golgoth+25),hl	
																ld		a,_CALL
																ld		(event_golgoth+27),a
																ld		hl,Update_missileG1_4
																ld		(event_golgoth+28),hl
															
																xor		a
																ld		(EtpGolgoth),a
																ld		a,13
																ld		(id_soucoupe),a
																ld		a,16
																ld		(point_vie_golgoth),a
																ld		hl,GOLGOTH7_SPRH_ADR_ROM
																ld		(GolgothAdrRom),hl
																ld		hl,SPRH6_ADR
																ld		(GolgothSprh),hl
																ld		hl,#600
																ld		(GolgothLongeur),hl
																ld		hl,Tbl_Gologoth7
																ld		(Pointeur_TblGolgoth_1),hl
																ld		hl,0
																ld		(posX_Golgoth),hl
																ld		hl,0
																ld		(posY_Golgoth),hl
																call	Update_Golgoth7_after
																ld		a,zoom_mode0_1
																ld		(SPRH6_ZOOM),a
																ld		(SPRH7_ZOOM),a
																ld		(SPRH8_ZOOM),a
																ld		(SPRH9_ZOOM),a
																ld		(SPRH10_ZOOM),a
																ld		(SPRH11_ZOOM),a
																ld		(valeur_zoom_sprh6),a
																ld		(valeur_zoom_sprh7),a
																ld		(valeur_zoom_sprh8),a
																ld		(valeur_zoom_sprh9),a
																ld		(valeur_zoom_sprh10),a
																ld		(valeur_zoom_sprh11),a
																ld		hl,Music
																ld		a,2
																call	PLY_AKG_Init
																ld		hl,Update_Golgoth7
																ld		(PointeurUpdateGolgoth),hl
																ret
																
																																										
; ////////////////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////////////////								
															Golgoth_Level_8
																ld		a,_JP							; JP pas_de_scroll_hard
																ld		(event_stop_scroll),a
																ld		hl,pas_de_scroll_hard
																ld		(event_stop_scroll+1),hl
																ld		a,_CALL
																ld		(event_golgoth),a
																ld		hl,golgoth_8
																ld		(event_golgoth+1),hl
																ld		a,_CALL
																ld		(event_golgoth+3),a
																ld		hl,Update_Golgoth_8
																ld		(event_golgoth+4),hl
																ld		a,_CALL
																ld		(event_golgoth+6),a
																ld		hl,missileG1_1
																ld		(event_golgoth+7),hl
																ld		a,_CALL
																ld		(event_golgoth+9),a
																ld		hl,Update_missileG1_1
																ld		(event_golgoth+10),hl
																ld		a,_CALL
																ld		(event_golgoth+12),a
																ld		hl,missileG1_2
																ld		(event_golgoth+13),hl
																ld		a,_CALL
																ld		(event_golgoth+15),a
																ld		hl,Update_missileG1_2
																ld		(event_golgoth+16),hl
																ld		a,_CALL
																ld		(event_golgoth+18),a
																ld		hl,missileG1_3
																ld		(event_golgoth+19),hl
																ld		a,_CALL
																ld		(event_golgoth+21),a
																ld		hl,Update_missileG1_3
																ld		(event_golgoth+22),hl	
																ld		a,_CALL
																ld		(event_golgoth+24),a
																ld		hl,missileG1_4
																ld		(event_golgoth+25),hl	
																ld		a,_CALL
																ld		(event_golgoth+27),a
																ld		hl,Update_missileG1_4
																ld		(event_golgoth+28),hl
															
																xor		a
																ld		(EtpGolgoth),a
																ld		a,14
																ld		(id_soucoupe),a
																ld		a,16
																ld		(point_vie_golgoth),a
																ld		hl,GOLGOTH8_SPRH_ADR_ROM
																ld		(GolgothAdrRom),hl
																ld		hl,SPRH6_ADR
																ld		(GolgothSprh),hl
																ld		hl,#800
																ld		(GolgothLongeur),hl
																ld		hl,Tbl_Gologoth8
																ld		(Pointeur_TblGolgoth_1),hl
																ld		hl,0
																ld		(posX_Golgoth),hl
																ld		hl,0
																ld		(posY_Golgoth),hl
																call	Update_Golgoth8_after
																ld		a,zoom_mode0_1
																ld		(SPRH6_ZOOM),a
																ld		(SPRH7_ZOOM),a
																ld		(SPRH8_ZOOM),a
																ld		(SPRH9_ZOOM),a
																ld		(SPRH10_ZOOM),a
																ld		(SPRH11_ZOOM),a
																ld		(SPRH12_ZOOM),a
																ld		(SPRH13_ZOOM),a
																ld		(valeur_zoom_sprh6),a
																ld		(valeur_zoom_sprh7),a
																ld		(valeur_zoom_sprh8),a
																ld		(valeur_zoom_sprh9),a
																ld		(valeur_zoom_sprh10),a
																ld		(valeur_zoom_sprh11),a
																ld		(valeur_zoom_sprh12),a
																ld		(valeur_zoom_sprh13),a
																ld		hl,Music
																ld		a,2
																call	PLY_AKG_Init
		
																ld		hl,GOLGOTH8_SPRH_ADR_ROM_ANIM1_CORP
																ld		(Golgoth_Corp_AdrRom),hl
																ld		hl,GOLGOTH8_SPRH_ADR_ROM_ANIM1_TETES
																ld		(Golgoth_Tete_AdrRom),hl
					
					

																ld		hl,Update_Golgoth8
																ld		(PointeurUpdateGolgoth),hl
																ret
																
																												