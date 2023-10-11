; ///////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////    GOLDORAK TOUCHE UN ENNEMI  ///////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
test_collisions_tir_gauche
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	
	LD			hl,(SPRH4_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero

	LD			hl,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH4_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C

	LD			hl,(SPRH4_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
	LD			de,(posy_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero

	LD			hl,(posy_soucoupe)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
	LD			de,(SPRH4_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	JP 			NC,goldorak_touche					; si hl>=de le flag C est à zero
	RET
	
test_collisions_tir_gauche_golgoth
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	
	LD			hl,(SPRH4_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posX_Golgoth)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero

	LD			hl,(posX_Golgoth)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH4_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C

	LD			hl,(SPRH4_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
	LD			de,(posY_Golgoth)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero

	LD			hl,(posY_Golgoth)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
	LD			de,(SPRH4_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	JP 			NC,goldorak_touche_golgoth					; si hl>=de le flag C est à zero
	RET
	
	
test_collisions_tir_gauche_goldorak
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	ld			a,1
	ld			(id_joueur),a
	LD			hl,(SPRH4_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero

	LD			hl,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH4_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C

	LD			hl,(SPRH4_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posy_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero

	LD			hl,(posy_soucoupe)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
												; on est sur le coin haut-droite
	LD			de,(SPRH4_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	jp 			NC,goldorak_touche					; si hl>=de le flag C est à zero
	RET

test_collisions_tir_droite
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz

	LD			hl,(SPRH5_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero

	LD			hl,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH5_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C

	LD			hl,(SPRH5_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posy_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero

	LD			hl,(posy_soucoupe)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
												; on est sur le coin haut-droite
	LD			de,(SPRH5_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	jp 			NC,goldorak_touche					; si hl>=de le flag C est à zero
		
	RET


test_collisions_tir_droite_golgoth
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz

	LD			hl,(SPRH5_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posX_Golgoth)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero

	LD			hl,(posX_Golgoth)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH5_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C

	LD			hl,(SPRH5_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posY_Golgoth)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero

	LD			hl,(posY_Golgoth)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
												; on est sur le coin haut-droite
	LD			de,(SPRH5_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	Jr 			NC,goldorak_touche_golgoth					; si hl>=de le flag C est à zero
		
	RET



goldorak_touche_golgoth
	pop		ix	
goldorak_touche
	
	rst		ASIC_CONNEXION
	ld		hl,COULEUR_BOOM_ENNEMI
	ld		(#6420),hl
	rst		ASIC_DECONNEXION
	call	fin_armes
	ld 		a,SFX_BOOM	;Sound effect number (>=1)
    ld 		c,2 					;channel (0-2)
    ld 		b,0 					;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect
	ld		a,(id_soucoupe)
	cp		a,1
	jp		z,init_mort_soucoupe1
	cp		a,2
	jp		z,init_mort_soucoupe2
	cp		a,3
	jp		z,init_mort_soucoupe3
	cp		a,4
	jp		z,init_mort_soucoupe4
	cp		a,5
	jp		z,init_mort_soucoupe5
	cp		a,6
	jp		z,init_mort_soucoupe6
	cp		a,7
	jp		z,init_mort_golgoth1
	cp		a,8
	jp		z,init_mort_golgoth1
	cp		a,9
	jp		z,init_mort_golgoth1
	cp		a,10
	jp		z,init_mort_golgoth1
	cp		a,11
	jp		z,init_mort_golgoth1
	cp		a,12
	jp		z,init_mort_golgoth1
	cp		a,13
	jp		z,init_mort_golgoth1
	ret
		
init_mort_soucoupe1
		ld		a,(points_attaque)
		ld		b,a
		ld		a,(TblConfigSoucoupe1+27)
		sub		a,b
		bit		7,a
		jr		nz,.rip_soucoupe
		ld		(TblConfigSoucoupe1+27),a
		ret
.rip_soucoupe
	; on incremente l'étape de la soucoupe 
			ld		a,(etp_soucoupe1)
			inc		a
			ld		(etp_soucoupe1),a
	; on définit le type d'explosion pour les soucoupes
			ld		hl,BOOM_SPRH_ROM_ADR
			ld		(BoomSprhRomAdr),hl
	; on recupère l'identite du joueur auteur de cette destructrion horrible		
			ld		a,(id_joueur)
			ld		hl,TblConfigSoucoupe1+26		; et on stock l'identitée dans le tableau
			ld		(hl),a
			ret
init_mort_soucoupe2
		ld		a,(points_attaque)
		ld		b,a
		ld		a,(TblConfigSoucoupe2+27)
		sub		a,b
		bit		7,a
		jr		nz,.rip_soucoupe
		ld		(TblConfigSoucoupe2+27),a
		ret
.rip_soucoupe
		ld		a,(etp_soucoupe2)
		inc		a
		ld		(etp_soucoupe2),a
		ld		hl,BOOM_SPRH_ROM_ADR
		ld		(BoomSprhRomAdr),hl
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe2+26
		ld		(hl),a
		ret
init_mort_soucoupe3
		ld		a,(points_attaque)
		ld		b,a
		ld		a,(TblConfigSoucoupe3+27)
		sub		a,b
		bit		7,a
		jr		nz,.rip_soucoupe
		ld		(TblConfigSoucoupe3+27),a
		ret
.rip_soucoupe
		ld		a,(etp_soucoupe3)
		inc		a
		ld		(etp_soucoupe3),a
		ld		hl,BOOM_SPRH_ROM_ADR
		ld		(BoomSprhRomAdr),hl
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe3+26
		ld		(hl),a
		ret
init_mort_soucoupe4
		ld		a,(points_attaque)
		ld		b,a
		ld		a,(TblConfigSoucoupe4+27)
		sub		a,b
		bit		7,a
		jr		nz,.rip_soucoupe
		ld		(TblConfigSoucoupe4+27),a
		ret
.rip_soucoupe
		ld		a,(etp_soucoupe4)
		inc		a
		ld		(etp_soucoupe4),a
		ld		hl,BOOM_SPRH_ROM_ADR
		ld		(BoomSprhRomAdr),hl
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe4+26
		ld		(hl),a
		ret
init_mort_soucoupe5
		ld		a,(points_attaque)
		ld		b,a
		ld		a,(TblConfigSoucoupe5+27)
		sub		a,b
		bit		7,a
		jr		nz,.rip_soucoupe
		ld		(TblConfigSoucoupe5+27),a
		ret
.rip_soucoupe
		ld		a,(etp_soucoupe5)
		inc		a
		ld		(etp_soucoupe5),a
		ld		hl,BOOM_SPRH_ROM_ADR
		ld		(BoomSprhRomAdr),hl
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe5+26
		ld		(hl),a
		ret
init_mort_soucoupe6
	ld		a,(points_attaque)
		ld		b,a
		ld		a,(TblConfigSoucoupe6+27)
		sub		a,b
		bit		7,a
		jr		nz,.rip_soucoupe
		ld		(TblConfigSoucoupe6+27),a
		ret
.rip_soucoupe
		ld		a,(etp_soucoupe6)
		inc		a
		ld		(etp_soucoupe6),a
		ld		hl,BOOM_SPRH_ROM_ADR
		ld		(BoomSprhRomAdr),hl
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe6+26
		ld		(hl),a
		ret
init_mort_golgoth1
		ld		a,(points_attaque)
		ld		b,a
		ld		a,(point_vie_golgoth)
		sub		a,b
		bit		7,a
		jr		nz,.rip_golgoth
		ld		(point_vie_golgoth),a
		ret
.rip_golgoth
		ld		a,(EtpGolgoth)
		inc		a
		ld		(EtpGolgoth),a
	
		; on efface les evenement relatif au tirs en cours dans la boucle
		rst		ASIC_CONNEXION
		xor		a
		
		ld		(event_golgoth+6),a
		ld		(event_golgoth+7),a
		ld		(event_golgoth+8),a
		ld		(event_golgoth+9),a
		ld		(event_golgoth+10),a
		ld		(event_golgoth+11),a
		ld		(event_golgoth+12),a
		ld		(event_golgoth+13),a
		ld		(event_golgoth+14),a
		ld		(event_golgoth+15),a
		ld		(event_golgoth+16),a
		ld		(event_golgoth+17),a
		ld		(event_golgoth+18),a
		ld		(event_golgoth+19),a
		ld		(event_golgoth+20),a
		ld		(event_golgoth+21),a
		ld		(event_golgoth+22),a
		ld		(event_golgoth+23),a
		ld		(event_golgoth+24),a
		ld		(event_golgoth+25),a
		ld		(event_golgoth+26),a
		ld		(event_golgoth+27),a
		ld		(event_golgoth+28),a
		ld		(event_golgoth+29),a
; on desactive les sprites hard des tirs
		
		ld		(SPRH10_ZOOM),a
		ld		(SPRH11_ZOOM),a
		ld		(SPRH12_ZOOM),a
		ld		(SPRH13_ZOOM),a
		ld		(valeur_zoom_sprh10),a
		ld		(valeur_zoom_sprh11),a
		ld		(valeur_zoom_sprh12),a
		ld		(valeur_zoom_sprh13),a
; on reinitialise les différente etapes
		ret

	

	





fin_armes
	RST		ASIC_CONNEXION
	ld		a,(id_arme)
	cp		a,6
	jr		z,on_gere_fulguro_point
	cp		a,7
	jr		z,on_gere_fulguro_point
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a 
	ld		(flag_fireA),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		(etp_arme1),a
	ld		(etp_arme2),a
	ld		(etp_arme3),a
	ld		(etp_arme4),a
	ld		(etp_arme5),a
	ld		(etp_arme6),a
	ld		(etp_arme7),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH5_X),hl
	ld		(SPRH4_X),hl
	ld		(SPRH5_Y),hl
	ld		(SPRH4_Y),hl
	RST		#28
	ret
	
on_gere_fulguro_point
	ld		a,13
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a 
	RST		#28	
	ret


; ///////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////    GOLDORAK PRENDS UN ITEM  ///////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
test_collisions_goldorak_item
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	LD			hl,(SPRH0_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero

	LD			hl,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH0_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C

	LD			hl,(SPRH0_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posy_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero

	LD			hl,(posy_soucoupe)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
												; on est sur le coin haut-droite
	LD			de,(SPRH0_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	Jr 			NC,goldorak_prends_item					; si hl>=de le flag C est à zero
		
	RET	
test_collisions_goldorak_item2
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz

	LD			hl,(SPRH1_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero

	LD			hl,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH1_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C

	LD			hl,(SPRH1_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posy_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero

	LD		hl,(posy_soucoupe)						; à partir du coin haut-gauche de link
	LD		de,15
	add		hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD		de,(SPRH1_Y)					; à partir du coin haut-gauche du monstre
	SBC		hl,de
	Jr 		NC,goldorak_prends_item					; si hl>=de le flag C est à zero
		
	RET	


goldorak_prends_item
	ld		a,1
	ld		(id_joueur),a
	;prends_item_J1ouJ2
	ld		a,SFX_GET_ITEM
	ld 		c,0 					;channel (0-2)
    ld 		b,0 					;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect
	ld		a,(id_soucoupe)
	cp		a,1
	jr		z,prends_item_soucoupe1
	cp		a,2
	jr		z,prends_item_soucoupe2
	cp		a,3
	jr		z,prends_item_soucoupe3
	cp		a,4
	jr		z,prends_item_soucoupe4
	cp		a,5
	jr		z,prends_item_soucoupe5
	cp		a,6
	jr		z,prends_item_soucoupe6
	ret
prends_item_soucoupe1
		ld		a,(etp_soucoupe1)
		inc		a
		ld		(etp_soucoupe1),a
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe1+26
		ld		(hl),a
		call	score_items
		ret
prends_item_soucoupe2
		ld		a,(etp_soucoupe2)
		inc		a
		ld		(etp_soucoupe2),a
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe2+26
		ld		(hl),a
		call	score_items
		ret
prends_item_soucoupe3
		ld		a,(etp_soucoupe3)
		inc		a
		ld		(etp_soucoupe3),a
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe3+26
		ld		(hl),a
		call	score_items
		ret
prends_item_soucoupe4
		ld		a,(etp_soucoupe4)
		inc		a
		ld		(etp_soucoupe4),a
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe4+26
		ld		(hl),a
		call	score_items
		ret
prends_item_soucoupe5
		ld		a,(etp_soucoupe5)
		inc		a
		ld		(etp_soucoupe5),a
		ld	a,(id_joueur)
		ld		hl,TblConfigSoucoupe5+26
		ld		(hl),a
		call	score_items
		ret
prends_item_soucoupe6
		ld		a,(etp_soucoupe6)
		inc		a
		ld		(etp_soucoupe6),a
		ld		a,(id_joueur)
		ld		hl,TblConfigSoucoupe6+26
		ld		(hl),a
		call	score_items
		ret
; ///////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////    GOLDORAK SE PRENDS DES DEGATS  ///////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////////////////
test_collisions_avec_les_ennemisG
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	
	ld			a,(flag_retournement)
	cp			a,0
	ret			nz
	
	
	
	LD			hl,(SPRH0_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero
	LD			hl,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH0_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C
	LD			hl,(SPRH0_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posy_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero
	LD			hl,(posy_soucoupe)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(SPRH0_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	jp 			NC,goldorak_percute					; si hl>=de le flag C est à zero
	ret
test_collisions_avec_les_ennemisD
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	
	ld			a,(flag_retournement)
	cp			a,0
	ret			nz
	
	
	LD			hl,(SPRH1_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero
	LD			hl,(posx_soucoupe)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH1_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C
	LD			hl,(SPRH1_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posy_soucoupe)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero
	LD		hl,(posy_soucoupe)						; à partir du coin haut-gauche de link
	LD		de,15
	add		hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD		de,(SPRH1_Y)					; à partir du coin haut-gauche du monstre
	SBC		hl,de
	jp 		NC,goldorak_percute					; si hl>=de le flag C est à zero
	RET
	
test_collisions_avec_les_tirs_ennemisG
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	
	ld			a,(flag_retournement)
	cp			a,0
	ret			nz
	
	
	
	LD			hl,(SPRH0_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posX_Missile)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero
	LD			hl,(posX_Missile)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH0_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C
	LD			hl,(SPRH0_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posY_Missile)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero
	LD			hl,(posY_Missile)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(SPRH0_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	jp 			NC,goldorak_percute_tirs					; si hl>=de le flag C est à zero
	ret
test_collisions_avec_les_tirs_ennemisD
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	
	ld			a,(flag_retournement)
	cp			a,0
	ret			nz
	
	
	LD			hl,(SPRH1_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posX_Missile)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero
	LD			hl,(posX_Missile)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH1_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C
	LD			hl,(SPRH1_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posY_Missile)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero
	LD		hl,(posY_Missile)						; à partir du coin haut-gauche de link
	LD		de,15
	add		hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD		de,(SPRH1_Y)					; à partir du coin haut-gauche du monstre
	SBC		hl,de
	jp 		NC,goldorak_percute_tirs					; si hl>=de le flag C est à zero
	RET
test_collisions_avec_les_Golgoths_G
	ret
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	
	ld			a,(flag_retournement)
	cp			a,0
	ret			nz
	
	
	
	LD			hl,(SPRH0_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posX_Golgoth)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero
	LD			hl,(posX_Golgoth)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH0_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C
	LD			hl,(SPRH0_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posY_Golgoth)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero
	LD			hl,(posY_Golgoth)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(SPRH0_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	jp 			NC,goldorak_percute_golgoth					; si hl>=de le flag C est à zero
	ret
test_collisions_avec_les_Golgoths_D
	ret			
	ld			a,(GoldorakMort)
	cp			a,0
	RET			nz
	
	ld			a,(flag_retournement)
	cp			a,0
	ret			nz
	
	
	
	LD			hl,(SPRH0_X)					; à partir du coin haut-gauche de link
	LD			de,30							
	add			hl,de							; 31 pixels plus loin on est sur le coin haut-droite
	LD			de,(posX_Golgoth)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET			C								; si hl>=de le flag C est à zero
	LD			hl,(posX_Golgoth)						; à partir du coin haut-gauche du monstre
	LD			de,30						
	add			hl,de							; 31 pixels plus loin on est sur le coin haut_droite
	LD			de,(SPRH0_X)					; à partir du coin haut-gauche de link
	SBC			hl,de
	RET			C
	LD			hl,(SPRH0_Y)					; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(posY_Golgoth)						; à partir du coin haut-gauche du monstre
	SBC			hl,de
	RET 		C								; si hl>=de le flag C est à zero
	LD			hl,(posY_Golgoth)						; à partir du coin haut-gauche de link
	LD			de,15
	add			hl,de							; 15 pixels plus loin (sinon Golem va me faire un caca nerveu si j'écrit 16) 
											; on est sur le coin haut-droite
	LD			de,(SPRH0_Y)					; à partir du coin haut-gauche du monstre
	SBC			hl,de
	jp 			NC,goldorak_percute_golgoth					; si hl>=de le flag C est à zero
	ret
goldorak_percute
	ret		; !!! invincibilité !!!
	rst		ASIC_CONNEXION
	ld		hl,COULEUR_DEGAT_BORDER_J1
	ld		(#6420),hl
	rst		ASIC_DECONNEXION
	ld		a,SFX_HIT
	ld 		c,0 					;channel (0-2)
    ld 		b,0 					;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect
	ld		a,1
	ld		(id_joueur),a
	ld		a,(flag_percute)
	inc		a
	ld		(flag_percute),a
	cp		a,nrj_damage_goldorak
	ret		NZ
	xor		a
	ld		(flag_percute),a
	call	fin_armes
	ld		a,(points_sante)
	dec		a
	ld		(points_sante),a
	jp		z,on_perd_une_vie
	call	diminue_NRJ_bar
	ret


goldorak_percute_golgoth
	nop
	rst		ASIC_DECONNEXION
	call	rom_off
	;pop		ix
goldorak_percute_tirs
	pop		ix
	;rst		ASIC_DECONNEXION
	;call	rom_off
	jp		goldorak_percute

