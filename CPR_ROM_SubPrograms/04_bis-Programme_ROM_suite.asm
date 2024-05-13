org #c000
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////     ON COPIE DES ROUTINE EN DEBUT DE BANK      ////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
rstCreationPrograms_ROM
	ld		hl,rom_on			; alias RST #0
	ld		de,#0
	ld		bc,24
	LDIR
	ld		hl,asic_on			; alias RST #18
	ld		de,#18
	ld		bc,12
	LDIR
	ld		hl,asic_off			; alias RST #28
	ld		de,#28
	ld		bc,12
	LDIR
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ///////     ON CONFIGURE LES VARIABLES DU SCREEN ROUTE    ////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
	ld		hl,LARGEUR_CHIFFRE1
	ld		(largeur_chiffre),hl
	ld		hl,adr_chiffre1_ROM
	ld		(adr_chiffre),hl

; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ///////////     ON CONFIGURE LES PARAMETRE DU JEU    /////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
	; on allume et selectionne par défaut le 1er boutton et la 1ere amre
	ld		a,1
	ld		(flag_deja_affiche),a
	ld		a,VITESSE_RETOURNEMENT
	ld		(Compteur_Retournement),a


	ld		hl,tbl_distribution_points
	ld		(pointeur_tbl_point),hl
	ld		hl,Tbl_NRJ_bar+19
	ld		(pointeur_tbl_NRJ_bar),hl
	ld		hl,Tbl_NRJ_bar2+19
	ld		(pointeur_tbl_NRJ_bar2),hl
	ld		hl,TBL_NBR_SOUCOUPES
	ld		(Pointeur_TblNombreDeSoucoupes),hl
	ld		a,NBR_DE_VIE_DEPART
	ld		(nbr_de_vie),a
	ld		a,10
	ld		(points_sante),a
test_debug
	ld		a,4
	ld		(level_en_cours),a

	ld		hl,TBL_VAGUES_LEVEL_1			; on lit l'adresse du tableau des vague de Level 1
	ld		(pointeur_tbl_level),hl			; on stock l'adresse du pointeur
	ld		e,(hl)							; on lit l'adresse contenu à l'adresse du pointeur
	inc		hl
	ld		d,(hl)
	ld		(Pointeur_TblNombreDeSoucoupes),de
	ld		hl,TBL_TYPE_DE_SOUCOUPE_1
	ld		(Pointeur_TblTypeDeSoucoupe),hl
	
; on lit la table des adresse a lire pour l'affichage du hud pour le retournement
	ld	hl,TBL_RETOURNEMENT_COUNT+19
	ld  (pointer_tbl_retournement),hl
	ld	a,(hl)
	ld	(display_tbl_retournement_top+1),a
	dec 	hl
	ld 	a,(hl)
	ld (display_tbl_retournement_top),a
	dec hl 
	ld	a,(hl)
	ld	(display_tbl_retournement_bot+1),a
	dec hl
	ld a,(hl)
	ld (display_tbl_retournement_bot),a
	ld  (pointer_tbl_retournement),hl
	ret



; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; /////////////////     INITIALISATION  DU JEU    //////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
initialisation_du_jeu_ROM

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
	ld		a,1
	ld		(id_joueur),a

	xor		a
	ld		(count_anim_soucoupe),a
	ld		(etp_arrimage),a
	ld		(vitesse_goldorak),a
	ld		(count_anim_goldorak),a
	ld		(bloc_tile),a
	ld		(counter_poid_fort),a
	ld		(counter_poid_faible),a
	ld		(etp_soucoupe1),a
	ld		(etp_soucoupe2),a
	ld		(etp_soucoupe3),a
	ld		(etp_soucoupe4),a
	ld		(etp_soucoupe5),a
	ld		(etp_soucoupe6),a
	ld		(flag_fireA),a
	ld		(id_arme),a
; on remplit le tableau des adresse de sprite hard de goldorak
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
	ld		hl,Tbl_sprh_direction2
	ld		de,GOLDORAK_HAUTBAS_SPRH_ROM_ADR+#200
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		de,GOLDORAK_GAUCHE_SPRH_ROM_ADR+#200
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		de,GOLDORAK_DROITE_SPRH_ROM_ADR+#200
	ld		(hl),e : inc hl
	ld		(hl),d : inc hl
	ld		hl,(Tbl_sprh_direction)
	ld		(sprh_goldorak),hl
	ld		hl,(Tbl_sprh_direction2)
	ld		(sprh_goldorak2),hl
; on remplit le tableau des timer des soucoupes simple
	ld		de,Tbl_timer_depart_soucoupes
	ld		hl,Tbl_VALEUR_TIMER_soucoupes
	ld		bc,6
	LDIR
	ld		a,1
	ld		(sample_counter),a
	ld		(direction_goldorak),a
	ld		hl,#0100
	ld		(adr_sample),hl
	ld		hl,#1d40
	ld		(longueur_sample),hl
	ld		a,SCROLL_INIT_RETARD_VIDEO
	ld		(valeur_retard),a

	ld		hl,tbl_reg1213_fin
	ld		(valeur_crtc),hl
	ld		hl,#c7c0
	ld		(valeur_offset),hl
	ld		(pointeur_ecran),hl

	ld		hl,aucune_arme
	ld		(adr_type_arme),hl
	ld		a,_CALL						; call
	ld		(event_arrimage),a
	ld		hl,Arrimage
	ld		(event_arrimage+1),hl
	ld		a,#C3						; JP
	ld		(event_arrimage+3),a
	ld		hl,boucle_principale
	ld		(event_arrimage+4),hl

	RET


    include		"06_bis-Init_de_jeu_ROM.asm"

    