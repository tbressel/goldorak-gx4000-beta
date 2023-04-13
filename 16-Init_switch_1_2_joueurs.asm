init_2joueurs
	;di
	ld		a,(etp_scroll_soft_hud)
	cp		a,0
	jp		z,init_evenement_scroll_hud
	cp		a,1
	jp		z,on_scrollsoft_le_hud
	cp		a,2
	jp		z,boucle_scroll_complet_hud
init_evenement_scroll_hud
	inc		a
	ld		(etp_scroll_soft_hud),a
; on initialise les evenements necessaires au mode 2 joueurs
	ld		a,_JP							; CALL
	ld		(event_bloquer_la_boucle),a
	ld		hl,init_2joueurs					; on_scroll_le_hud
	ld		(event_bloquer_la_boucle+1),hl
	
	ld		a,_JP							; JP pas_de_scroll_hard
	ld		(event_stop_scroll),a
	ld		hl,pas_de_scroll_hard
	ld		(event_stop_scroll+1),hl
	
	ld		a,_JP							; JP pas_de_scroll_hard
	ld		(event_boucle_2_joueurs),a
	ld		hl,boucle_principale
	ld		(event_boucle_2_joueurs+1),hl
	ld		hl,Init_1joueur
	ld		(automodif_retour_1joueur+1),hl
	ld		a,_JP						; JP test_de_venusiak
	ld		(event_test_de_venusiak),a
	ld		hl,test_de_venusiak
	ld		(event_test_de_venusiak+1),hl

; on déplace les adresse du compteur de point à l'écran dans le hud 2
	ld		hl,HUD_SCOREJ1_UNITE_ADR
	ld		(val_HUD_SCORE_UNITE_ADR_hudJ1),hl
	ld		hl,HUD_SCOREJ1_DIZAINNE_ADR
	ld		(val_HUD_SCORE_DIZAINNE_ADR_hudJ1),hl
	ld		hl,HUD_SCOREJ1_CENTAINE_ADR
	ld		(val_HUD_SCORE_CENTAINE_ADR_hudJ1),hl
	ld		hl,HUD_SCOREJ1_MILLIER_ADR
	ld		(val_HUD_SCORE_MILLIER_ADR_hudJ1),hl
	ld		hl,HUD_SCOREJ1_DIZAINE_DE_MILLIER_ADR
	ld		(val_HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hudJ1),hl
	
	ld		hl,HUD_SCOREJ2_UNITE_ADR
	ld		(val_HUD_SCORE_UNITE_ADR_hudJ2),hl
	ld		hl,HUD_SCOREJ2_DIZAINNE_ADR
	ld		(val_HUD_SCORE_DIZAINNE_ADR_hudJ2),hl
	ld		hl,HUD_SCOREJ2_CENTAINE_ADR
	ld		(val_HUD_SCORE_CENTAINE_ADR_hudJ2),hl
	ld		hl,HUD_SCOREJ2_MILLIER_ADR
	ld		(val_HUD_SCORE_MILLIER_ADR_hudJ2),hl
	ld		hl,HUD_SCOREJ2_DIZAINE_DE_MILLIER_ADR
	ld		(val_HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hudJ2),hl

	RST		ASIC_CONNEXION
	ld		c,BANK9_GOLDORAK_SPRH
	RST		UPPER_ROM_CONNEXION
	ld		hl,Tiny_goldorak		; copie aussi Venuiak
	ld		de,SPRH0_ADR
	ld		bc,#400
	ldir
	;ld		a,zoom_mode0_2
	ld		a,zoom_mode1_1
	ld		(SPRH0_ZOOM),a : ld		(valeur_zoom_sprh0),a
	ld		(SPRH1_ZOOM),a : ld		(valeur_zoom_sprh1),a
	ld		(SPRH2_ZOOM),a : ld		(valeur_zoom_sprh2),a
	ld		(SPRH3_ZOOM),a : ld		(valeur_zoom_sprh3),a
	ld		a,1
	ld		(flag_mode_2_joueur),a
	call	goldo_affiche
	
	ld		hl,(SPRH0_X)
	ld		(posx_venusiak),hl
	ld		(SPRH2_X),hl			; sprite 0 X
	ld		de,32					;+16+16
	add		hl,de
	ld		(SPRH3_X),hl			; sprite 1 X
	ld		hl,(SPRH0_Y)
	ld		(posy_venusiak),hl
	ld		(SPRH2_Y),hl			; sprite 0 Y
	ld		(SPRH3_Y),hl			; sprite 1 Y
	RST		ASIC_DECONNEXION
	call	rom_off
	
	ld		a,3
	ld		(points_attaque),a
	
	
	jp		boucle_principale
on_scrollsoft_le_hud
		inc		a
		ld		(etp_scroll_soft_hud),a
		ld		b,41
		push	bc
boucle_scroll_complet_hud
		ld		de,#7800				
		push	de
		call	ligne_inf_4000
		ex		hl,de	
		pop		de
		ld		b,40*2					; hauteur de graph à recopier
.boucle
	push	bc
	push	de				; destination
	push	hl				; lecture
	ld		bc,64			; on recopie a chaque fois une ligne de 64 octets de longueur
	LDIR
	pop		hl				; on recupère la première ligne lu
	pop		de				; on recupère la ligne du dessous ou on ecrit
	ex		hl,de			; on fait passer l'adr de destination dans l'adr de lecture
	push	de
	call	ligne_inf_4000	; utilise DE
	ex		de,hl
	pop		de
	pop		bc
	djnz	.boucle
	pop		bc
	dec		b
	push	bc
	jp		nz,boucle_principale
	pop		bc
affiche_hud_retour
	ld		c,BANK8_HUD
	RST		UPPER_ROM_CONNEXION
	RST		ASIC_DECONNEXION
	ld		hl,HUD_J2_ADR_ROM
	ld		de,HUD_J2_ADR_ECRAN
	ld		bc,16*4
	ld		a,HUD_J1_HAUTEUR
	ld		b,a
.boucle
	push	bc
	push	de
	ld		bc,HUD_LONGEUR
	ldir
	pop		de
	call	ligne_inf_4000
	pop		bc
	djnz	.boucle

	xor		a
	ld		(event_stop_scroll),a
	ld		(event_stop_scroll+1),a
	ld		(event_stop_scroll+2),a
	ld		(event_bloquer_la_boucle),a
	ld		(event_bloquer_la_boucle+1),a
	ld		(event_bloquer_la_boucle+2),a
	ld		(etp_scroll_soft_hud),a
	jp		boucle_principale

; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////
Init_1joueur
	ld		a,(etp_scroll_soft_hud)
	cp		a,0
	jp		z,init_evenement_scroll_hud2
	cp		a,1
	jp		z,on_scrollsoft_le_hud
	cp		a,2
	jp		z,boucle_scroll_complet_hud
init_evenement_scroll_hud2
	inc		a
	ld		(etp_scroll_soft_hud),a
; on initialise les evenements necessaires au mode 2 joueurs
	ld		a,_JP								; CALL
	ld		(event_bloquer_la_boucle),a
	ld		hl,init_1joueur					; on_scroll_le_hud
	ld		(event_bloquer_la_boucle+1),hl
	ld		a,_JP							; JP pas_de_scroll_hard
	ld		(event_stop_scroll),a
	ld		hl,pas_de_scroll_hard
	ld		(event_stop_scroll+1),hl
	ld		a,0						
	ld		(event_boucle_2_joueurs),a
	ld		(event_boucle_2_joueurs+1),a
	ld		(event_boucle_2_joueurs+2),a
									
	ld		(event_test_de_venusiak),a
	ld		(event_test_de_venusiak+1),a
	ld		(event_test_de_venusiak+2),a
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

	ld		hl,Init_2joueurs
	ld		(automodif_retour_1joueur+1),hl
	
	RST		ASIC_CONNEXION
	ld		c,BANK9_GOLDORAK_SPRH
	RST		UPPER_ROM_CONNEXION
	ld		hl,GOLDORAK_HAUTBAS_SPRH_ROM_ADR		; copie aussi Venuiak
	ld		de,SPRH0_ADR
	ld		bc,#400
	ldir
	ld		a,zoom_mode0_1
	ld		(SPRH0_ZOOM),a : ld		(valeur_zoom_sprh0),a
	ld		(SPRH1_ZOOM),a : ld		(valeur_zoom_sprh1),a
	ld		(SPRH2_ZOOM),a : ld		(valeur_zoom_sprh2),a
	ld		(SPRH3_ZOOM),a : ld		(valeur_zoom_sprh3),a
	
	xor		a
	ld		(no_id_joueur),a
	ld		(flag_mode_2_joueur),a
	ld		a,1
	ld		(id_joueur),a
	call	goldo_affiche
	RST		ASIC_DECONNEXION
	ld		c,BANK8_HUD
	RST		UPPER_ROM_CONNEXION
	RST		ASIC_DECONNEXION
	ld		hl,HUD_J1_ADR_ROM
	ld		de,HUD_J2_ADR_ECRAN
	ld		bc,16*4
	ld		a,HUD_J1_HAUTEUR
	ld		b,a
.boucle
	push	bc
	push	de
	ld		bc,HUD_LONGEUR
	ldir
	pop		de
	call	ligne_inf_4000
	pop		bc
	djnz	.boucle
	jp		boucle_principale




