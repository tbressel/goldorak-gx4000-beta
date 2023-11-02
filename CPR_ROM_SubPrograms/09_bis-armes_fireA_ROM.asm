
missiles_gamma1_ROM
	ld		a,(etp_arme2)
	inc		a
	ld 		(etp_arme2),a
	ld		hl,(SPRH0_X)
	ld		de,-19
	add		hl,de
	ld		(SPRH4_X),hl 												; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,64+32+3
	add 	hl,de
	ld 		(SPRH5_X),hl						; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y)
		ld	de,6	
		add hl,de
	ld		(SPRH4_Y),hl	
	ld	(SPRH5_Y),hl
	ld		a,zoom_mode0_1
		ld (SPRH4_ZOOM),a
		ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a 
	ld (valeur_zoom_sprh5),a 
	
	ret
	

missiles_gamma2_ROM
	ld		hl,(SPRH4_Y)
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	ld		e,l
	ld		d,h
	ld		bc,-8
	add		hl,bc
	jr		nc,fin_missiles_gamma

	ld		(SPRH4_Y),de
	ld		hl,(SPRH5_Y)
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	ld		(SPRH5_Y),hl
	ret
fin_missiles_gamma
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a 
	ld		(flag_fireA),a
	ld		(etp_arme2),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	
	ld 		c,1   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret
	
	
	
	
	
	
	
	
	
	

missiles_gamma_pow21_ROM
	ld		a,(etp_arme2)
	inc		a:ld (etp_arme2),a
	ld		hl,(SPRH0_X)
	ld		de,-19
	add		hl,de
	ld		(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,64+32+3:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,6:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode0_1:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	ret

missiles_gamma_pow22_ROM
	ld		hl,(SPRH4_Y)
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	ld		e,l
	ld		d,h	
	ld		bc,-8
	add		hl,bc
	jr		nc,fin_missiles_gamma_pow2
	ld		(SPRH4_Y),de
	ld		hl,(SPRH5_Y)
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	ld		(SPRH5_Y),hl
	ret
fin_missiles_gamma_pow2

	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a 
	ld		(flag_fireA),a
	ld		(etp_arme2),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl

	ld 		c,1   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret	
	
	
	
missiles_gamma_pow31_ROM	
	ld		a,(etp_arme2)
	inc		a:ld (etp_arme2),a
	ld		hl,(SPRH0_X)
	ld		(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,64+34:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-6:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ld		a,zoom_mode1_2:ld (SPRH4_ZOOM),a:ld	(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a : ld (valeur_zoom_sprh5),a 
	ret
	
missiles_gamma_pow32_ROM	
	ld		hl,(SPRH4_Y)
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
		dec		hl
	ld		e,l
	ld		d,h	
	ld		bc,-8
	add		hl,bc
	jr		nc,fin_missiles_gamma_pow3
	ld		(SPRH4_Y),de
	ld		hl,(SPRH5_Y)
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
	dec		hl
		dec		hl
	dec		hl
		dec		hl
	ld		(SPRH5_Y),hl
	ret
fin_missiles_gamma_pow3
	xor		a
	ld		(SPRH4_ZOOM),a
	ld		(SPRH5_ZOOM),a
	ld		(valeur_zoom_sprh4),a
	ld 		(valeur_zoom_sprh5),a 
	ld		(flag_fireA),a
	ld		(etp_arme2),a
	ld		(event_arme_fireA),a
	ld		(event_arme_fireA+1),a
	ld		(event_arme_fireA+2),a
	ld		hl,SPRH_ARMES_GOLDORAK_CACHER
	ld		(SPRH4_X),hl
	ld		(SPRH4_Y),hl
	ld		(SPRH5_X),hl
	ld		(SPRH5_Y),hl
	
	ld 		c,1   ;Channel (0-2)
	call 	PLY_AKG_StopSoundEffectFromChannel
	ret	


