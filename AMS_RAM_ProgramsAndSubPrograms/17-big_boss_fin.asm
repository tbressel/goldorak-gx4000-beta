big_boss_fin_level_4
call scrolling_off 

; on désactive les évenements de la boucle	
	xor		a						; on va remplir de zero
	ld		hl,event_fade_out		; les evenements qui sont
	ld		(hl),a					; encore actif dans la boucle
	ld		de,event_fade_out+1
	ld		bc,40
	LDIR

       ; on indique la bank de la maptile du prochain level
	ld		hl,BANK_LEVEL_SPACE
	ld		(bank_level),hl
       ; on indique la bank de la tile set du level
	ld		hl,BANK_TILESET_SPACE
	ld		(bank_tileset),hl        
	ld		(automodif_Bank_tileset_scroll+1),hl
       ; on indique l'adresse à laquelle se situe la maptile (à corrige car celle ci ne démarre pas en #C000)
	ld		hl,SCREEN_LEVEL_SPACE
	ld		(adr_screen_level),hl
       ; on indique l'adresse du premier numéro de tile à afficher
	ld		hl,SCREEN_DEPART_LEVEL_SPACE+(-16*13)		; je pointe sur la première tile de la ligne à afficher
	ld		(pointeur_de_tile),hl


	ld		a,#30
	ld		bc,#bc00+12: out (c),c
	ld		bc,#bd00 : out (c),a
	ld		a,0
	ld		bc,#bc00+13: out (c),c
	ld		bc,#bd00 :out (c),a

    ld		hl,#c000
	ld		(valeur_offset),hl
	ld		a,SCROLL_SLOW_RETARD_VIDEO
	ld		(vitesse_scroll),a
	ld 		bc,#bc00+12:out (c),c      			; R12 selectionne
	ld 		bc,#BD00+#30:out (c),c 				; Ecran en #c000
    
	di
	call	affiche_fond
	; ei
    ld		c,BANK_ROM_2
	call	rom_on_EI

       ; on indique l'adresse où se situde la palette du level
	;  ld		hl,PALETTE_DECORS_ESPACE
	;  ld		(pallette_level),hl
	;  ld		hl,(pallette_level)
	;  ld		de,PALETTE_DECORS_RAM
	;  ld		bc,#20
	;  LDIR
	ld		hl,tbl_reg1213_fin
	ld		(valeur_crtc),hl
	ld		hl,#c7c0 
	ld		(valeur_offset),hl
	ld		(pointeur_ecran),hl

	call	nouvelle_ligne		; 5 nops

	ld		a,TEST_RETARD_VIDEO
	ld		(#6804),a
	
	ld		c,BANK_ROM_2
	call	rom_on_EI
	Asic ON

; Copie pallette fond
	LD 		BC,BANK8_PALETTES:OUT (C),C			; on choisit DE LIRE la ROM 11
	LD		BC,#7F00+%10000100:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)

; Copie pallette sprites hard
	ld		hl,PALETTE_SPRITE_HARD
	ld		de,PALETTE_SPRH
	ld		bc,#1d
	LDIR
	Asic OFF
	ld		hl,event_test_de_goldorak
	ld		a,_JP
	ld		(event_test_de_goldorak),a
	ld		hl,test_de_goldorak
	ld		(event_test_de_goldorak+1),hl

	ld		a,_CALL						; call
	ld		(event_fade_out),a
	ld		hl,fondu_des_couleurs2
	ld		(event_fade_out+1),hl
	
	ld		a,_JP						; JP
	ld		(event_fade_out+3),a
	ld		hl,boucle_principale
	ld		(event_fade_out+4),hl
			
	call 	scrolling_on 
	Asic ON

	jp		boucle_principale
	


big_boss_fin_level_8
jp big_boss_fin_level_8



fadein_counter		ds		1,0

fondu_des_couleurs2
	ei
	ld		a,(fadein_counter)
	inc 	a
	ld		(fadein_counter),a
	cp		a,#FF
	call	z,fondu_entree
	ret
fondu_entree	
			xor		a
			ld		(fadein_counter),a
			RST		ASIC_CONNEXION
			ld		hl,(pallette_level)		; emplacement RAM de la pallette ecran
			ld		de,#6400						; emplacement ASIC de la pallette ecran NOIRE !
			ld 		b,32								; longueur de la pallette
		boucle_fadein2
				push bc
			fade_in_du_rouge2
				ld	a,(hl)								; on lit l'octet rouge/bleu
				ld	c,a
				AND %11110000
				cp	0									; est ce qu'il est à zéros ?
				jp	z,fade_in_du_bleu2					; si oui alors on s'occupe de la couleur verte
				or	c
				ld	b,#10								; sinon on va s'occuper du rouge
				sub	a,b									; on lui enlève 1
				ld	(hl),a								; et on la sauvegarde
				ld	a,(de)								; on recupère l'octet rouge/bleu de l'ASIC
				add	a,b									; on augmente le rouge seulement
				ld	(de),a								; et on stock le rouge
			fade_in_du_bleu2
				ld	a,(hl)								; on lit l'octet rouge/bleu
				ld	c,a
				AND %00001111
				cp	0									; est ce qu'il est à zéros ?
				jp	z,fade_in_du_vert2						; si oui alors on s'occupe de la couleur verte
				or	c
				dec	a								; sinon on va s'occuper du bleu on lui enlève 1
				ld	(hl),a								; et on la sauvegarde
				ld	a,(de)								; on recupère l'octet rouge/bleu de l'ASIC
				inc	a								; on augmente le rouge seulement
				ld	(de),a								; et on stock le bleu
			fade_in_du_vert2
				inc	hl
				inc	de
				ld	a,(hl)								; on lit l'octet vert
				cp	0									; est ce qu'il est à zéros ?
				jp	z,fade_in_encre_suivante2			; si oui alors on s'occupe de l'encre suivante
				dec	a								; sinon on va s'occuper du vert on lui enlève 1
				ld	(hl),a								; et on la sauvegarde
				ld	a,(de)								; on recupère l'octet vert de l'ASIC
				inc	a								; on augmente le rouge seulement
				ld	(de),a								; et on stock le vert
			fade_in_encre_suivante2
				inc	hl
				inc	de
				pop bc
				djnz boucle_fadein2
				ret



