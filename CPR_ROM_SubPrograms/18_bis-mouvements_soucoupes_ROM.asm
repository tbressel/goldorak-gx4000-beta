deplace_soucoupe_BasGauche_ROM
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_BasGauche
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_BasGauche
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort
	ld		hl,(SPRH_Y)
	inc		(hl): inc (hl)
	inc		(hl): inc (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	dec		de					; on incremente de 2 octets
	dec		de						
	ld		(hl),d				; on repointe vers l'adresse ASIC de X
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret
deplace_soucoupe_BasDroite_ROM
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_BasDroite
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_BasDroite
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort
	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	inc		de					; on incremente de 2 octets
	inc		de					; on repointe vers l'adresse ASIC de X
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
deplace_soucoupe_HorizVertiBasDroite_ROM
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_HorizVertiBasDroite
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_HorizVertiBasDroite
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort

; //////// deplacement horizontal vers la droite	 /////////

; on recupère l'adr ASIC de X dans DE
; je recupère l'adresse de la variable ou est stockée l'adresse du tableau
	ld		hl,(pointeur_deplacement)
	
; Je stock l'adresse du tableau dans DE
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
; je lit la valeur pointé
	ld		BC,(valeur_decompte_deplacement)	
	ld		a,(bc)
	
; si c'est égale à zero on decale le pointeur 3 octet plus loin	
	cp		a,0				
	call	z,on_change_de_direction
; sinon on diminue la valeur	
	dec		a
; je recupere l'adresse ou est stockée l'adresse de la valeur
	ld		hl,(valeur_decompte_deplacement)	
	ld		(hl),a
; je place mon pointeur sur le deplacement en X
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_X)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée X
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur X
	ld		h,0
	ld		l,a
	add		hl,bc
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_X)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de X
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posx_soucoupe),bc
	
; je place mon pointeur sur le deplacement en Y
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_Y)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée Y
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur Y
	ld		h,0
	ld		l,a
	add		hl,bc
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_Y)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de Y
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posy_soucoupe),bc
	ret



deplace_soucoupe_HorizVertiBasGauche_ROM
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_HorizVertiBasGauche
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_HorizVertiBasGauche
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort

; //////// deplacement horizontal vers la gauche	 /////////

; on recupère l'adr ASIC de X dans DE
; je recupère l'adresse de la variable ou est stockée l'adresse du tableau
	ld		hl,(pointeur_deplacement)
	
; Je stock l'adresse du tableau dans DE
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
; je lit la valeur pointé
	ld		BC,(valeur_decompte_deplacement)	
	ld		a,(bc)
	
; si c'est égale à zero on decale le pointeur 3 octet plus loin	
	cp		a,0				
	call	z,on_change_de_direction
; sinon on diminue la valeur	
	dec		a
; je recupere l'adresse ou est stockée l'adresse de la valeur
	ld		hl,(valeur_decompte_deplacement)	
	ld		(hl),a
; je place mon pointeur sur le deplacement en X
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_X)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée X
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur X
	ld		h,0
	ld		l,a

	push	bc
	ld		c,l
	ld		b,h
	pop		hl
	
	SBC		hl,bc
	
	
	
	
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_X)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de X
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posx_soucoupe),bc
	
; je place mon pointeur sur le deplacement en Y
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_Y)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée Y
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur Y
	ld		h,0
	ld		l,a

	
	add		hl,bc
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_Y)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de Y
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posy_soucoupe),bc
	ret
	



deplace_soucoupe_DiagoVertiBasDroite_ROM	
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_DiagoVertiBasDroite
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_DiagoVertiBasDroite
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort

; //////// deplacement horizontal vers la droite	 /////////

; on recupère l'adr ASIC de X dans DE
; je recupère l'adresse de la variable ou est stockée l'adresse du tableau
	ld		hl,(pointeur_deplacement)
	
; Je stock l'adresse du tableau dans DE
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
; je lit la valeur pointé
	ld		BC,(valeur_decompte_deplacement)	
	ld		a,(bc)
	
; si c'est égale à zero on decale le pointeur 3 octet plus loin	
	cp		a,0				
	call	z,on_change_de_direction
; sinon on diminue la valeur	
	dec		a
; je recupere l'adresse ou est stockée l'adresse de la valeur
	ld		hl,(valeur_decompte_deplacement)	
	ld		(hl),a
; je place mon pointeur sur le deplacement en X
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_X)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée X
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur X
	ld		h,0
	ld		l,a
	add		hl,bc
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_X)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de X
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posx_soucoupe),bc
	
; je place mon pointeur sur le deplacement en Y
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_Y)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée Y
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur Y
	ld		h,0
	ld		l,a
	add		hl,bc
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_Y)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de Y
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posy_soucoupe),bc
	ret




deplace_soucoupe_DiagoVertiBasGauche_ROM
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_DiagoVertiBasGauche
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_DiagoVertiBasGauche
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort

; //////// deplacement horizontal vers la gauche	 /////////

; on recupère l'adr ASIC de X dans DE
; je recupère l'adresse de la variable ou est stockée l'adresse du tableau
	ld		hl,(pointeur_deplacement)
	
; Je stock l'adresse du tableau dans DE
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
; je lit la valeur pointé
	ld		BC,(valeur_decompte_deplacement)	
	ld		a,(bc)
	
; si c'est égale à zero on decale le pointeur 3 octet plus loin	
	cp		a,0				
	call	z,on_change_de_direction
; sinon on diminue la valeur	
	dec		a
; je recupere l'adresse ou est stockée l'adresse de la valeur
	ld		hl,(valeur_decompte_deplacement)	
	ld		(hl),a
; je place mon pointeur sur le deplacement en X
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_X)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée X
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur X
	ld		h,0
	ld		l,a

	push	bc
	ld		c,l
	ld		b,h
	pop		hl
	
	SBC		hl,bc
	
	
	
	
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_X)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de X
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posx_soucoupe),bc
	
; je place mon pointeur sur le deplacement en Y
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_Y)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée Y
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur Y
	ld		h,0
	ld		l,a

	
	add		hl,bc
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_Y)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de Y
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posy_soucoupe),bc
	ret
	
	
	
	
	
	
deplace_soucoupe_ZigzagVertiBas_ROM
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_ZigzagVertiBas
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_ZigzagVertiBas
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort

; //////// deplacement horizontal vers la droite	 /////////

; on recupère l'adr ASIC de X dans DE
; je recupère l'adresse de la variable ou est stockée l'adresse du tableau
	ld		hl,(pointeur_deplacement)
	
; Je stock l'adresse du tableau dans DE
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
; je lit la valeur pointé
	ld		BC,(valeur_decompte_deplacement)	
	ld		a,(bc)
	
; si c'est égale à zero on decale le pointeur 3 octet plus loin	
	cp		a,0				
	call	z,on_change_de_directionz
; sinon on diminue la valeur	
	dec		a
; je recupere l'adresse ou est stockée l'adresse de la valeur
	ld		hl,(valeur_decompte_deplacement)	
	ld		(hl),a
; je place mon pointeur sur le deplacement en X
	inc		de
; je lit le poid faible valeur 
	ld		a,(de)
	ld		c,a
	inc		de
	ld		a,(de)
	ld		b,a
push	bc
	ld		hl,(SPRH_X)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée X
push	bc
pop		hl
pop		bc
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur X
	
	add		hl,bc
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_X)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de X
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posx_soucoupe),bc
	
; je place mon pointeur sur le deplacement en Y
	inc		de
; je lit la valeur 
	ld		a,(de)

	ld		hl,(SPRH_Y)			
	ld		c,(hl)				
	inc		hl					; on pointe à l'octet ASIC suivant
	ld		b,(hl)				; que l'on stock dans D: BC contient les coordonnée Y
; on place la valeur dans HL et on additionne pour avoir la nouvelle valeur Y
	ld		h,0
	ld		l,a
	add		hl,bc
	ld		c,l
	ld		b,h
	
	ld		hl,(SPRH_Y)	
	ld		(hl),c				; on repointe vers l'adresse ASIC de Y
	inc		hl
	ld		(hl),b
	dec		hl
	ld		(posy_soucoupe),bc
	
	ret
	









deplace_soucoupe_TourneGauche_ROM	
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_TourneGauche
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_TourneGauche
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort


	ld		hl,(SPRH_ADR)
	ld		(adr_sprh_tourne_tg),hl


; compteur du cycle de changement d'orientation de la soucoupe
	ld 		a,(compteur_etape_orientation_soucoupe_tg)	
	cp		a,0
	jp		z,tourne_gauche_etape_1
	cp		a,1
	jp		z,tourne_gauche_etape_1b
	cp		a,2
	jp		z,tourne_gauche_etape_2 ; changement de sprite
	cp		a,3
	jp		z,tourne_gauche_etape_2b
	cp		a,4
	jp		z,tourne_gauche_etape_3 ; changement de sprite
	cp		a,5
	jp		z,tourne_gauche_etape_3b
	cp		a,6
	jp		z,tourne_gauche_etape_4 ; ; changement de sprite
	cp		a,7
	jp		z,tourne_gauche_etape_4b
	cp		a,8
	jp		z,tourne_gauche_etape_5 ; changement de sprite
	ret


; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici la soucoupe prends la trajectoir vertical à 90°
tourne_gauche_etape_1
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg
; calcule du déplacement en vertical vers le haut
	ld		hl,(SPRH_Y)
	dec		(hl):dec (hl)
	dec		(hl): dec (hl)
	dec		(hl): dec (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
	ret



; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici la soucoupe amorce la prochaine trajectoir qui sera en pure diagonale
tourne_gauche_etape_1b
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg
; calcule du déplacement en vertical vers le haut
	ld		hl,(SPRH_Y)
	dec		(hl):dec (hl)
	dec		(hl): dec (hl)
	dec		(hl): dec (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	inc		de	: inc de				; on incremente de 2 octets
	inc		de	: inc de					; on repointe vers l'adresse ASIC de X
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret

; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur une trajectoire à 45°
tourne_gauche_etape_2
; calcule du déplacement en vertical vers le haut
	ld		hl,(SPRH_Y)
	dec		(hl):dec (hl)
	dec		(hl): dec (hl)
	dec		(hl): dec (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
; calcule de déplacement en horizontal
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg

	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	inc		de	: inc de				; on incremente de 2 octets
	inc		de	: inc de					; on repointe vers l'adresse ASIC de X
	inc		de	: inc de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de





	ret
; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on termine en tournant un peu moins
tourne_gauche_etape_2b
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg

; calcule du déplacement en vertical vers le haut
	ld		hl,(SPRH_Y)
	dec		(hl):dec (hl)
	dec		(hl): dec (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
; calcule de déplacement en horizontal

	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	inc		de	: inc de				; on incremente de 2 octets
	inc		de	: inc de					; on repointe vers l'adresse ASIC de X
	inc		de	: inc de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret



; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de l'horizontal
tourne_gauche_etape_3
; calcule du déplacement en vertical vers le bas
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg

; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	inc		de	: inc de				; on incremente de 2 octets
	inc		de	: inc de					; on repointe vers l'adresse ASIC de X
	inc		de	: inc de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret


; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de l'horizontal mais on descends un peut
tourne_gauche_etape_3b
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg

	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)

	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de

; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	inc		de	: inc de				; on incremente de 2 octets
	inc		de	: inc de					; on repointe vers l'adresse ASIC de X
	inc		de	: inc de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret


; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de la diagoanle à 45° vers le bas
tourne_gauche_etape_4
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg

	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)
	inc		(hl): inc (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de

; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	inc		de	: inc de				; on incremente de 2 octets
	inc		de	: inc de					; on repointe vers l'adresse ASIC de X
	inc		de	: inc de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret
; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de la diagoanle à 45° vers le bas
tourne_gauche_etape_4b
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg

	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)
	inc		(hl): inc (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de

; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	inc		de	: inc de				; on incremente de 2 octets
	inc		de	: inc de					; on repointe vers l'adresse ASIC de X
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret
; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de la diagoanle à 45° vers le bas
tourne_gauche_etape_5
	ld		a,(compteur_cycle_orientation_soucoupe_tg)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_tg),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_tg
; calcule du déplacement en vertical vers le bas
	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)
	inc		(hl): inc (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
	ret





etape_suivante_orientation_soucoupe_tg
	; on recupère le compteur d'orientation de la soucoupe 
	; ce compteur correponds au cycle de chaque changement qui à lieu
	; toutes les 7 fois
	ld	a,(compteur_etape_orientation_soucoupe_tg)	
	cp	a,NOMBRE_ETAPE_COUCOUPE_QUI_TOURNE
	ret	z

	cp	a,1
	jr	z,soucoupe_tourne_sprh_suivant_tg
	cp	a,3
	jr	z,soucoupe_tourne_sprh_suivant_tg
	cp	a,4
	jr	z,soucoupe_tourne_sprh_suivant_tg
	cp	a,5
	jr	z,soucoupe_tourne_sprh_suivant_tg

	; xor	a
	; ld	(flag_tourne_sprh_next_tg),a

fin_etape_tg
	ld	a,(compteur_etape_orientation_soucoupe_tg)	
	inc	a
	ld	(compteur_etape_orientation_soucoupe_tg),a
	
	xor	a
	ld	(compteur_cycle_orientation_soucoupe_tg),a
	ret


soucoupe_tourne_sprh_suivant_tg
	ld	a,1
	ld	(flag_tourne_sprh_next_tg),a


	ld	a,(id_soucoupe)
	cp	a,1
	jr	z,change_adr_soucoupe_tg1
	cp	a,2
	jr	z,change_adr_soucoupe_tg2
	cp	a,3
	jr	z,change_adr_soucoupe_tg3


change_adr_soucoupe_tg1
	ld	hl,(adr_soucoupe_tourne_tg1)
	inc	h
	ld	(adr_soucoupe_tourne_tg1),hl
	ld	(adr_soucoupe_tourne_tg),hl
	jr fin_etape_tg


change_adr_soucoupe_tg2
	ld	hl,(adr_soucoupe_tourne_tg2)
	inc	h
	ld	(adr_soucoupe_tourne_tg2),hl
	ld	(adr_soucoupe_tourne_tg),hl
	jr fin_etape_tg


change_adr_soucoupe_tg3
	ld	hl,(adr_soucoupe_tourne_tg3)
	inc	h
	ld	(adr_soucoupe_tourne_tg3),hl
	ld	(adr_soucoupe_tourne_tg),hl
	jr fin_etape_tg



	VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE		=	8
	NOMBRE_ETAPE_COUCOUPE_QUI_TOURNE			=	8








; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////



	

deplace_soucoupe_TourneDroite_ROM
; timer définit dans le tableau	
	ld		hl,adr_timer_depart_soucoupe		; varable stockant l'adresse d'une autre variable
	ld		e,(hl)								; on lit l'adresse contenu et la met dans DE
	inc		hl
	ld		d,(hl)
	ld		a,(de)								; on recupère ce qu'elle contient
	dec		a
	ld		(de),a	
	RET		NZ
	inc		a
	ld		(de),a
; est ce que l'on est arrivé enbas de l'écran ?
	ld		hl,(SPRH_Y)
	inc		hl
	ld		a,(hl)				; je recupere 240 dans A
	cp		a,#FF
	jr		z,premier_deplacement_TourneDroite
	dec		hl
	ld		a,(hl)
	ld		h,0
	ld		l,a
	ld		de,240				 
	or		a
	sbc		hl,de
	jp		nc,pas_decollision_soucoupe
premier_deplacement_TourneDroite
	dec		hl
	ld		a,(hl)
	bit		7,a
	call	z,reinit_poid_fort


	ld		hl,(SPRH_ADR)
	ld		(adr_sprh_tourne_td),hl


; compteur du cycle de changement d'orientation de la soucoupe
	ld 		a,(compteur_etape_orientation_soucoupe_td)	
	cp		a,0
	jp		z,tourne_droite_etape_1
	cp		a,1
	jp		z,tourne_droite_etape_1b
	cp		a,2
	jp		z,tourne_droite_etape_2 ; changement de sprite
	cp		a,3
	jp		z,tourne_droite_etape_2b
	cp		a,4
	jp		z,tourne_droite_etape_3 ; changement de sprite
	cp		a,5
	jp		z,tourne_droite_etape_3b
	cp		a,6
	jp		z,tourne_droite_etape_4 ; ; changement de sprite
	cp		a,7
	jp		z,tourne_droite_etape_4b
	cp		a,8
	jp		z,tourne_droite_etape_5 ; changement de sprite
	ret


; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici la soucoupe prends la trajectoir vertical à 90°
tourne_droite_etape_1
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td
; calcule du déplacement en vertical vers le haut
	ld		hl,(SPRH_Y)
	dec		(hl):dec (hl)
	dec		(hl): dec (hl)
	dec		(hl): dec (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
	ret



; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici la soucoupe amorce la prochaine trajectoir qui sera en pure diagonale
tourne_droite_etape_1b
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td
; calcule du déplacement en vertical vers le haut
	ld		hl,(SPRH_Y)
	dec		(hl):dec (hl)
	dec		(hl): dec (hl)
	dec		(hl): dec (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	dec		de	: dec de				; on decremente de 2 octets
	dec		de	: dec de					; on repointe vers l'adresse ASIC de X
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret

; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur une trajectoire à 45°
tourne_droite_etape_2
; calcule du déplacement en vertical vers le haut
	ld		hl,(SPRH_Y)
	dec		(hl):dec (hl)
	dec		(hl): dec (hl)
	dec		(hl): dec (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
; calcule de déplacement en horizontal
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td

	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	dec		de	: dec de				; on decremente de 2 octets
	dec		de	: dec de					; on repointe vers l'adresse ASIC de X
	dec		de	: dec de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de





	ret
; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on termine en tournant un peu moins
tourne_droite_etape_2b
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td

; calcule du déplacement en vertical vers le haut
	ld		hl,(SPRH_Y)
	dec		(hl):dec (hl)
	dec		(hl): dec (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
; calcule de déplacement en horizontal

	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	dec		de	: dec de				; on decremente de 2 octets
	dec		de	: dec de					; on repointe vers l'adresse ASIC de X
	dec		de	: dec de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret



; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de l'horizontal
tourne_droite_etape_3
; calcule du déplacement en vertical vers le bas
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td

; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	dec		de	: dec de				; on decremente de 2 octets
	dec		de	: dec de					; on repointe vers l'adresse ASIC de X
	dec		de	: dec de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret


; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de l'horizontal mais on descends un peut
tourne_droite_etape_3b
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td

	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)

	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de

; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	dec		de	: dec de				; on decremente de 2 octets
	dec		de	: dec de					; on repointe vers l'adresse ASIC de X
	dec		de	: dec de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret


; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de la diagoanle à 45° vers le bas
tourne_droite_etape_4
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td

	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)
	inc		(hl): inc (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de

; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	dec		de	: dec de				; on decremente de 2 octets
	dec		de	: dec de					; on repointe vers l'adresse ASIC de X
	dec		de	: dec de
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret
; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de la diagoanle à 45° vers le bas
tourne_droite_etape_4b
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td

	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)
	inc		(hl): inc (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de

; calcule de déplacement en horizontal
	ld		hl,(SPRH_X)			; on recupère l'adr ASCI de X
	ld		e,(hl)				; on prends sont octet on copie dans e
	inc		hl					; on pointe à l'octet ASICsuivant
	ld		d,(hl)				; que l'on stock dans D: DE contient les coordonnée X
	dec		de	: dec de				; on decremente de 2 octets
	dec		de	: dec de					; on repointe vers l'adresse ASIC de X
	ld		(hl),d
	dec		hl
	ld		(hl),e
	ld		hl,(SPRH_X)	
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posx_soucoupe),de
	ret
; //////////////////////////////////////////
; //////////////////////////////////////////
; //////////////////////////////////////////
; Ici on est sur de la diagoanle à 45° vers le bas
tourne_droite_etape_5
	ld		a,(compteur_cycle_orientation_soucoupe_td)
	inc		a
	ld		(compteur_cycle_orientation_soucoupe_td),a
	cp		a,VITESSE_DEPLACEMENT_SOUCOUPE_QUI_TOURNE
	call	z,etape_suivante_orientation_soucoupe_td
; calcule du déplacement en vertical vers le bas
	ld		hl,(SPRH_Y)
	inc		(hl):inc (hl)
	inc		(hl): inc (hl)
	inc		(hl): inc (hl)
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_soucoupe),de
	ret





etape_suivante_orientation_soucoupe_td
	; on recupère le compteur d'orientation de la soucoupe 
	; ce compteur correponds au cycle de chaque changement qui à lieu
	; toutes les 7 fois
	ld	a,(compteur_etape_orientation_soucoupe_td)	
	cp	a,NOMBRE_ETAPE_COUCOUPE_QUI_TOURNE
	ret	z

	cp	a,1
	jr	z,soucoupe_tourne_sprh_suivant_td
	cp	a,3
	jr	z,soucoupe_tourne_sprh_suivant_td
	cp	a,4
	jr	z,soucoupe_tourne_sprh_suivant_td
	cp	a,5
	jr	z,soucoupe_tourne_sprh_suivant_td

fin_etape_td
	ld	a,(compteur_etape_orientation_soucoupe_td)	
	inc	a
	ld	(compteur_etape_orientation_soucoupe_td),a
	
	xor	a
	ld	(compteur_cycle_orientation_soucoupe_td),a
	ret


soucoupe_tourne_sprh_suivant_td
	ld	a,1
	ld	(flag_tourne_sprh_next_td),a


	ld	a,(id_soucoupe)
	cp	a,4
	jr	z,change_adr_soucoupe_td4
	cp	a,5
	jr	z,change_adr_soucoupe_td5
	cp	a,6
	jr	z,change_adr_soucoupe_td6


change_adr_soucoupe_td4
	ld	hl,(adr_soucoupe_tourne_td4)
	dec	h
	ld	(adr_soucoupe_tourne_td4),hl
	ld	(adr_soucoupe_tourne_td),hl
	
	jr fin_etape_td

change_adr_soucoupe_td5
	ld	hl,(adr_soucoupe_tourne_td5)
	dec	h
	ld	(adr_soucoupe_tourne_td5),hl
	ld	(adr_soucoupe_tourne_td),hl
	jr fin_etape_td

change_adr_soucoupe_td6
	ld	hl,(adr_soucoupe_tourne_td6)
	dec	h
	ld	(adr_soucoupe_tourne_td6),hl
	ld	(adr_soucoupe_tourne_td),hl
	jr fin_etape_td



