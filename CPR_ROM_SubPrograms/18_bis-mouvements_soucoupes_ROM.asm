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
	