goldo_affiche_ROM	
	ld		a,(flag_mode_2_joueur)
	cp		a,0
	jr		nz,tiny_goldo_affiche
	ld		hl,(posx_goldorak)
	ld		(SPRH0_X),hl			; sprite 0 X
	ld		(#6010),hl			; sprite 2 X
	ld		de,32+32
	add		hl,de
	ld		(#6008),hl			; sprite 1 X
	ld		(#6018),hl			; sprite 3 X
	ld		hl,(posy_goldorak)
	ld		(SPRH0_Y),hl			; sprite 0 Y
	ld		(#600A),hl			; sprite 1 Y
	ld		de,16
	add 	hl,de
	ld		(#6012),hl			; sprite 2 Y
	ld		(#601A),hl			; sprite 3 Y
	ret
tiny_goldo_affiche	
	ld		hl,(posx_goldorak)
	ld		(#6000),hl			; sprite 0 X
	ld		de,32;+16+16
	add		hl,de
	ld		(#6008),hl			; sprite 1 X
	ld		hl,(posy_goldorak)
	ld		(#6002),hl			; sprite 0 Y
	ld		(#600A),hl			; sprite 1 Y
	ret
	
	
fondu_de_sortie_ROM	
	ld	a,(timer_fade_out)
	inc	a
	ld	(timer_fade_out),a
	cp	a,VITESSE_FONDU_DE_SORTIE
	ret	nz
	xor		a
	ld	(timer_fade_out),a
	RST		ASIC_CONNEXION
	
fondu_de_sortie_des_couleurs
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			; JP JUMP_TEST_DEV
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			ld	hl,PALETTE_DECORS_RAM						; emplacement RAM de la pallette ecran
			ld	de,PALETTE_ASIC						; emplacement ASIC de la pallette ecran NOIRE !
			ld 	b,16								; longueur de la pallette
		bcle_fadeout
				push bc
			fade_out_du_rouge
				ld	a,(hl)								; on lit l'octet rouge/bleu
				ld	c,a
				AND %11110000							; on ne garde que le quartet de gauche
				cp	0									; est ce qu'il est à zéros ?
				jp	z,fade_out_du_bleu					; si oui alors on s'occupe de la couleur verte
				or	c
				ld	b,#10								; sinon on va s'occuper du rouge
				sub	a,b									; on lui enlève 1
				ld	(hl),a								; et on la sauvegarde dans la palette RAM
			fade_out_du_bleu
				ld	a,(hl)								; on lit l'octet rouge/bleu
				ld	c,a
				AND %00001111
				cp	0									; est ce qu'il est à zéros ?
				jp	z,fade_out_du_vert						; si oui alors on s'occupe de la couleur verte
				or	c
				dec	a								; sinon on va s'occuper du bleu on lui enlève 1
				ld	(hl),a								; et on la sauvegarde
			fade_out_du_vert
				inc	hl
				ld	a,(hl)								; on lit l'octet vert
				cp	0									; est ce qu'il est à zéros ?
				jp	z,fade_out_encre_suivante			; si oui alors on s'occupe de l'encre suivante
				dec	a								; sinon on va s'occuper du vert on lui enlève 1
				ld	(hl),a								; et on la sauvegarde
			fade_out_encre_suivante
				inc	hl
				pop bc
				djnz bcle_fadeout
				
		ld		b,32
ld		hl,PALETTE_ASIC		
	test_fin_du_fondu
		ld		a,(hl)
		cp		a,0
		ret		NZ
		inc		l
		dec		b
		jr		nz,test_fin_du_fondu
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; JUMP_TEST_DEV
; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
; tester si on est sur un level qui propose un BIG BOSS
		ld		a,(flag_bigboss)
		cp		a,1
; OUI -> on JUMP vers la gestion d'un level BIG BOSS
		jp		z,big_boss_fin_level_4
		cp		a,2
		jp		z,big_boss_fin_level_8

; NON  -> on continue
jp		affiche_ecrans_de_fin
		

				