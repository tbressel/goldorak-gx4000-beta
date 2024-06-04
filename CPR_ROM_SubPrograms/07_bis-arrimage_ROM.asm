init_arrimage_ROM	
	ld		hl,230
	ld		(posy_goldorak),hl
	ld		hl,190
	ld		(posx_goldorak),hl
	ld		hl,240
	ld		(posy2),hl
	ld		hl,190
	ld		(posx2),hl
	; on place la soucoupe
	ld		hl,190		
	ld		(SPRH4_X),hl			; sprite 0 X
	ld		(SPRH2_X),hl			; sprite 2 X
	ld		de,32+32
	add		hl,de
	ld		(SPRH5_X),hl			; sprite 1 X
	ld		(SPRH3_X),hl			; sprite 3 X
	ld		hl,230
	ld		(SPRH4_Y),hl			; sprite 0 Y
	ld		(SPRH5_Y),hl			; sprite 1 Y
	ld		de,16
	add 	hl,de
	ld		(SPRH2_Y),hl			; sprite 2 Y
	ld		(SPRH3_Y),hl			; sprite 3 Y
; on place la goldorak	


	ld	a,13
	ld	(SPRH2_ZOOM),a:ld	(valeur_zoom+2),a
	ld	(SPRH3_ZOOM),a:ld	(valeur_zoom+3),a
	ld	(SPRH4_ZOOM),a:ld	(valeur_zoom+4),a
	ld	(SPRH5_ZOOM),a:ld	(valeur_zoom+5),a
	xor	a
	ld	(SPRH0_ZOOM),a:ld	(valeur_zoom+0),a
	ld	(SPRH1_ZOOM),a:ld	(valeur_zoom+1),a
	ld	(SPRH10_ZOOM),a:ld	(valeur_zoom+10),a
	ld	(SPRH11_ZOOM),a:ld	(valeur_zoom+11),a

	ret
	
avance_soucoupe_ROM	
	ld		a,(vitesse_soucoupe)
	inc		a
	ld		(vitesse_soucoupe),a
	cp		a,5
	ret		nz
	xor		a
	ld		(vitesse_soucoupe),a
	
	ld		a,(count_anim_soucoupe)
	inc		a
	ld		(count_anim_soucoupe),a
	cp		a,128
	jp		z,stop_soucoupe
	
	ld		hl,(posy_goldorak)
	dec 	 hl
	ld  	(posy_goldorak),hl
	ld		(SPRH4_Y),hl	
	ld		(SPRH5_Y),hl			; sprite 1 Y
	ld		de,16
	add 	hl,de
	ld		(SPRH2_Y),hl			; sprite 2 Y
	ld		(SPRH3_Y),hl			; sprite 3 Y
	ret
init_goldorak_ROM	
	; on place goldorak
	ld		hl,190		
	ld		(SPRH8_X),hl			; sprite 0 X
	ld		(SPRH6_X),hl			; sprite 2 X
	ld		(SPRH10_X),hl
	ld		de,32+32
;ld	de,16+16
	add		hl,de
	ld		(SPRH11_X),hl
	ld		(SPRH9_X),hl			; sprite 1 X
	ld		(SPRH7_X),hl			; sprite 3 X
	ld		hl,240
	ld		(SPRH8_Y),hl			; sprite 0 Y

	ld		(SPRH9_Y),hl			; sprite 1 Y
	ld		de,-16
	add 	hl,de
	ld		(SPRH6_Y),hl			; sprite 2 Y
	ld		(SPRH7_Y),hl			; sprite 3 Y
	ld		de,-16
	add 	hl,de
	ld		(SPRH10_Y),hl
	ld		(SPRH11_Y),hl
	ld		a,13
	ld		(SPRH6_ZOOM),a:ld	(valeur_zoom+6),a
	ld		(SPRH7_ZOOM),a:ld	(valeur_zoom+7),a
	ld		(SPRH8_ZOOM),a:ld	(valeur_zoom+8),a
	ld		(SPRH9_ZOOM),a:ld	(valeur_zoom+9),a
	ret
avance_goldorak_ROM	
	ld		a,(vitesse_goldorak)
	inc		a
	ld		(vitesse_goldorak),a
	cp		a,3
	ret		nz
	xor		a
	ld		(vitesse_goldorak),a
	ld		a,(count_anim_goldorak)
	inc		a
	ld		(count_anim_goldorak),a
	cp		a,60
	jp		z,etp_goldorak1
	ld		(count_anim_goldorak),a
retour_avance_goldorak	
	ld		hl,(SPRH2_Y)
	ld		a,l
	ld		hl,(posy2)
	cp		a,l
	jp		z,stop_goldorak
	dec 	 hl
	ld  	(posy2),hl
	ld		(SPRH8_Y),hl	
	ld		(SPRH9_Y),hl			; sprite 1 Y
	ld		de,-16
	add 	hl,de
	ld		(SPRH6_Y),hl			; sprite 2 Y
	ld		(SPRH7_Y),hl			; sprite 3 Y
	ld		de,-16
	add 	hl,de
	ld		(SPRH10_Y),hl
	ld		(SPRH11_Y),hl
	ret
stop_goldorak
	ld	a,(etp_arrimage)
	inc	a
	ld	(etp_arrimage),a
	xor	a
	ld	(vitesse_goldorak),a
	ret	
fin_goldorak_ROM	
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(SPRH6_ZOOM),a
	ld		(SPRH7_ZOOM),a
	ld		(SPRH8_ZOOM),a
	ld		(SPRH9_ZOOM),a
	ld		a,13
	ld		(SPRH0_ZOOM),a
	ld		(SPRH1_ZOOM),a
	
	xor	a
	ld	(valeur_zoom+4),a
	ld	(valeur_zoom+5),a
	ld	(valeur_zoom+6),a
	ld	(valeur_zoom+7),a
	ld	(valeur_zoom+8),a
	ld	(valeur_zoom+9),a
	ld		a,13
	ld	(valeur_zoom+0),a
	ld	(valeur_zoom+1),a
	
	ld	hl,(SPRH4_Y)
	ld	(SPRH0_Y),hl
	ld	(SPRH1_Y),hl
	ld	hl,(SPRH4_X)
	ld	(SPRH0_X),hl
	ld	hl,(SPRH5_X)
	ld	(SPRH1_X),hl
	
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	
	xor	a
	ld	(event_arrimage),a
	ld	(event_arrimage+1),a
	ld	(event_arrimage+2),a
	ld	(event_arrimage+3),a
	ld	(event_arrimage+4),a
	ld	(event_arrimage+5),a
	ret
	
	
	
	