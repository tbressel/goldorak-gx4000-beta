soucoupe_1
	pop		de
	dec		de : dec de : dec de
	ld		hl,TblConfigSoucoupe1+1
	ld		(hl),e
	inc		hl
	ld		(hl),d
	inc		de : inc de : inc de
	push	de
	RST		ASIC_CONNEXION
	ld		de,TBL_CONFIG_DES_SOUCOUPES
	ld		hl,TblConfigSoucoupe1
	ld		bc,20
	LDIR
	ld		a,(etp_soucoupe1)
	jp		test_soucoupe
soucoupe_2
	pop		de
	dec		de : dec de : dec de
	ld		hl,TblConfigSoucoupe2+1
	ld		(hl),e
	inc		hl
	ld		(hl),d
	inc		de : inc de : inc de
	push	de
	RST		ASIC_CONNEXION
	ld		de,TBL_CONFIG_DES_SOUCOUPES
	ld		hl,TblConfigSoucoupe2
	ld		bc,20
	LDIR
	ld		a,(etp_soucoupe2)
	jp		test_soucoupe
soucoupe_3
	pop		de
	dec		de : dec de : dec de
	ld		hl,TblConfigSoucoupe3+1
	ld		(hl),e
	inc		hl
	ld		(hl),d
	inc		de : inc de : inc de
	push	de
	RST		ASIC_CONNEXION
	ld		de,TBL_CONFIG_DES_SOUCOUPES
	ld		hl,TblConfigSoucoupe3
	ld		bc,20
	LDIR
	ld		a,(etp_soucoupe3)
	jp		test_soucoupe
soucoupe_4
	pop		de
	dec		de : dec de : dec de
	ld		hl,TblConfigSoucoupe4+1
	ld		(hl),e
	inc		hl
	ld		(hl),d
	inc		de : inc de : inc de
	push	de
	RST		ASIC_CONNEXION
	ld		de,TBL_CONFIG_DES_SOUCOUPES
	ld		hl,TblConfigSoucoupe4
	ld		bc,20
	LDIR
	ld		a,(etp_soucoupe4)
	jp		test_soucoupe
soucoupe_5
	pop		de
	dec		de : dec de : dec de
	ld		hl,TblConfigSoucoupe5+1
	ld		(hl),e
	inc		hl
	ld		(hl),d
	inc		de : inc de : inc de
	push	de
	RST		ASIC_CONNEXION
	ld		de,TBL_CONFIG_DES_SOUCOUPES
	ld		hl,TblConfigSoucoupe5
	ld		bc,20
	LDIR
	ld		a,(etp_soucoupe5)
	jp		test_soucoupe
soucoupe_6
	pop		de
	dec		de : dec de : dec de
	ld		hl,TblConfigSoucoupe6+1
	ld		(hl),e
	inc		hl
	ld		(hl),d
	inc		de : inc de : inc de
	push	de
	RST		ASIC_CONNEXION
	ld		de,TBL_CONFIG_DES_SOUCOUPES
	ld		hl,TblConfigSoucoupe6
	ld		bc,20
	LDIR
	ld		a,(etp_soucoupe6)
	jp		test_soucoupe
test_soucoupe
	cp		a,0
	jr		z,init_soucoupe
	cp		a,1
	jr		z,deplace_soucoupe
	cp		a,2
	jp		z,explose_soucoupe
	cp		a,3
	jp		z,soucoupe_disparait
init_soucoupe
	inc		a
	ld		hl,(etp_soucoupe)
	ld		(hl),a
	ld		c,BANK10_SOUCOUPES_SPRH
	call	rom_on
	ld		hl,(adr_soucoupe)
	ld		de,(SPRH_ADR)
	ld		bc,#100
	LDIR
	call	rom_off
	ld		hl,(SPRH_X)			; DE contient l'adresse de l'ASIC pour X
	ld		de,(soucoupe_X)
	ld		(hl),e
	inc		hl
	ld		(hl),d
	ld		a,(soucoupe_Y)
	ld		hl,(SPRH_Y)
	ld		(hl),a
	ld		a,13
	ld		hl,(SPRH_ZOOM)
	ld		(hl),a
	ld		hl,(valeur_zoom_sprh)
	ld		(hl),a
	ld		hl,(SPRH_Y)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(pos_y),de
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(pos_x),de
	ret
deplace_soucoupe
	ld		hl,(SPRH_Y)
	inc		(hl):inc	(hl)
	inc		(hl)
	ld		hl,(SPRH_Y)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(pos_y),de
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(pos_x),de
	call	test_collisions_tir_gauche
	call	test_collisions_tir_droite
	ret
explose_soucoupe
; elle se déplace quand même
	ld	hl,(SPRH_Y)
	inc	(hl):inc	(hl)
	ld		a,(timer_BOOM)
	inc		a
	ld		(timer_BOOM),a
	cp		a,6
	ret		nz
	xor		a
	ld		(timer_BOOM),a
	ld		c,BANK16_BOOM_SPRH
	call	rom_on
	RST		ASIC_CONNEXION
	ld		hl,(BoomSprhRomAdr)
	push	hl
	ld		de,(SPRH_ADR)
	ld		bc,#100
	LDIR
	pop		hl
	inc		h
	ld		a,h
	cp		a,#c5
	jr		z,soucoupe_detruite
	ld		(BoomSprhRomAdr),hl
	call	rom_off
	ret
soucoupe_detruite
	ld		hl,(etp_soucoupe)
	ld		a,(hl)
	inc		a
	ld		(hl),a
	call	rom_off
	ret
soucoupe_disparait
	xor		a
; on eteind le sprite hard de la soucoupe
	ld		hl,(SPRH_ZOOM)
	ld		(hl),a
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
	ret
