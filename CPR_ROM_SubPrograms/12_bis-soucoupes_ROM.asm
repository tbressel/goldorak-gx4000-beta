init_soucoupe_ROM	
; on initialise les coordonnées de la soucoupe actuelle
	ld		hl,(SPRH_X)			; DE contient l'adresse de l'ASIC pour X
	ld		de,(soucoupe_X)
	ld		(hl),e
	inc		hl
	ld		(hl),d
	ld		de,(soucoupe_Y)
	ld		hl,(SPRH_Y)
	ld		(hl),e
	inc		de
	inc		hl
	ld		(hl),d
; on affiche le zoom de la soucoupe et met a jour son flag
	ld		a,13
	ld		hl,(SPRH_ZOOM)
	ld		(hl),a
	ld		hl,(valeur_zoom_sprh)
	ld		(hl),a
; on met à jour les variable de position des soucoupes générales
	ld		hl,(SPRH_Y)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret
soucoupe_disparait_ROM
	xor		a
	;ld	(flag_bomb),a
; on eteind le sprite hard de la soucoupe
	ld		hl,(SPRH_ZOOM)
	ld		( hl),a
	ld		hl,(valeur_zoom_sprh)
	ld		(hl),a
; on efface la soucoupe dans la boucle
	ld		hl,(adr_soucoupe_event)
	ld		(hl),a
	inc		hl
	ld		(hl),a
	inc		hl
	ld		(hl),a
; on remet les etape des soucoupe à zero	
	ld		hl,(etp_soucoupe)
	ld		a,(hl)
	xor		a
	ld		(hl),a
; on reinit les coordonnées du sprite
	ld		hl,(SPRH_X)
	ld		(hl),a
	inc		hl
	ld		(hl),a
	ld		hl,(SPRH_Y)
	ld		(hl),a
	inc		hl
	ld		(hl),a	
	ret
	


	tbl_distribution_points

	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_10_PTS
	db		ITEM_20_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS
	db		ITEM_20_PTS,ITEM_500_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_100_PTS
	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_POWERUP,ITEM_20_PTS,ITEM_10_PTS,ITEM_10_PTS
	db		ITEM_20_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_FULL_NRJ,ITEM_20_PTS,ITEM_500_PTS,ITEM_100_PTS,ITEM_20_PTS,ITEM_10_PTS
	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_AJOUTE_1VIE,ITEM_10_PTS,ITEM_20_PTS
	db		ITEM_500_PTS,ITEM_500_PTS,ITEM_20_PTS,ITEM_100_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_10_PTS
	db		ITEM_20_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_POWERUP,ITEM_20_PTS,ITEM_50_PTS,ITEM_10_PTS
	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_100_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_50_PTS
	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_10_PTS
	db		ITEM_20_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS
	db		ITEM_10_PTS,ITEM_10_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_10_PTS
	db		ITEM_20_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS,ITEM_50_PTS,ITEM_10_PTS,ITEM_20_PTS,ITEM_10_PTS
	db		#FF