
animation_bigboss_ROM
	ld 		a,(flagDirectionBigboss)
	cp		a,4
	jp		z,deplacement_Bigboss_bas_droite
	cp		a,3
	jp		z,deplacement_Bigboss_bas_gauche
	cp		a,2
	jp		z,deplacement_Bigboss_haut_droite
	cp		a,1
	jp		z,deplacement_Bigboss_haut_gauche

	
deplacement_Bigboss_haut_gauche
	ld 		de,(SPRH6_X)			; on récupère la coonrdonnées X du sprite du milieur de la soucoupe comme référence, pour els autres sprites
	ld		hl,(SPRH6_Y)			; on recupère également sa coordonnée actuelle en Y
	; on incremente la popsition Y
	dec		l
	dec		l	
	ld		(bigboss_Y),hl
	push	hl
	; on décremente la position X
	dec		de
	dec		de
	dec		de
	dec		de
	dec		de
	dec		de
	ld		(bigboss_X),de
	push	de
	; on test si on touche les bords de l'écran
	call	test_collision_bord_haut
	call	test_collision_bord_gauche
	; on continue l'update des sprite et des collision de tirs
	pop		de
	pop 	hl
	ret


deplacement_Bigboss_haut_droite
	ld 		de,(SPRH6_X)			; on récupère la coonrdonnées X du sprite du milieur de la soucoupe comme référence, pour els autres sprites
	ld		hl,(SPRH6_Y)			; on recupère également sa coordonnée actuelle en Y
	; on incremente la popsition Y
	dec		l
	dec		l	
	ld		(bigboss_Y),hl
	push	hl
	; on décremente la position X
	inc		de
	inc		de
	inc		de
	inc		de
	inc		de
	inc		de
	ld		(bigboss_X),de
	push	de
	; on test si on touche les bords de l'écran
	call	test_collision_bord_haut
	call	test_collision_bord_droite
	; on continue l'update des sprite et des collision de tirs
		pop		de
	pop 	hl
	ret


deplacement_Bigboss_bas_gauche
	ld 		de,(SPRH6_X)			; on récupère la coonrdonnées X du sprite du milieur de la soucoupe comme référence, pour els autres sprites
	ld		hl,(SPRH6_Y)			; on recupère également sa coordonnée actuelle en Y
	; on incremente la popsition Y
	inc		l
	inc		l	
	ld		(bigboss_Y),hl
	push	hl
	; on décremente la position X
	dec		de
	dec		de
	dec		de
	dec		de
	dec		de
	dec		de
	ld		(bigboss_X),de
	push	de
	; on test si on touche les bords de l'écran
	call	test_collision_bord_bas
	call	test_collision_bord_gauche
	; on continue l'update des sprite et des collision de tirs
		pop		de
	pop 	hl
	ret


deplacement_Bigboss_bas_droite
	ld 		de,(SPRH6_X)			; on récupère la coonrdonnées X du sprite du milieur de la soucoupe comme référence, pour els autres sprites
	ld		hl,(SPRH6_Y)			; on recupère également sa coordonnée actuelle en Y
	; on incremente la popsition Y
	inc		l
	inc		l	
	ld		(bigboss_Y),hl
	push	hl
	; on décremente la position X
	inc		de
	inc		de
	inc		de
	inc		de
	inc		de
	inc		de
	ld		(bigboss_X),de
	push	de
	; on test si on touche les bords de l'écran
	call	test_collision_bord_bas
	call	test_collision_bord_droite
		pop		de
	pop 	hl
	ret




	
; Tests de collision avec les bords de l'écran
test_collision_bord_bas
	ld		a,(flag_bigboss)
	cp		a,2
	jr		z,.test_collision_bigboss_2
	ld		hl,(SPRH13_Y)
	ld		bc,#00C8
	or 		a
	sbc 	hl,bc
	jp		nc,changement_direction_haut
	ret
	.test_collision_bigboss_2
	ld		hl,(SPRH10_Y)
	ld		bc,#00C8
	or 		a
	sbc 	hl,bc
	jp		nc,changement_direction_haut
	ret
test_collision_bord_haut
	ld		a,(flag_bigboss)
	cp		a,2
	jr		z,.test_collision_bigboss_2
	ld		hl,(SPRH7_Y)
	ld		bc,#000D
	or 		a
	sbc 	hl,bc
	jp		c,changement_direction_bas
	ret
	.test_collision_bigboss_2
	ld		hl,(SPRH7_Y)
	ld		bc,#000D
	or 		a
	sbc 	hl,bc
	jp		c,changement_direction_bas
	ret
test_collision_bord_gauche
	ld		a,(flag_bigboss)
	cp		a,2
	jr		z,.test_collision_bigboss_2
	ld		hl,(SPRH9_X)
	ld		bc,#0004
	or 		a
	sbc 	hl,bc
	jp		c,changement_direction_droite
	ret
	.test_collision_bigboss_2
	ld		hl,(SPRH11_X)
	ld		bc,#0004
	or 		a
	sbc 	hl,bc
	jp		c,changement_direction_droite
	ret
test_collision_bord_droite
	ld		a,(flag_bigboss)
	cp		a,2
	jr		z,.test_collision_bigboss_2
	ld		hl,(SPRH11_X)
	ld		bc,#01BE
	or 		a
	sbc 	hl,bc
	jp		nc,changement_direction_gauche
	ret
	.test_collision_bigboss_2
	ld		hl,(SPRH12_X)
	ld		bc,#01BE
	or 		a
	sbc 	hl,bc
	jp		nc,changement_direction_gauche
	ret	

	
; changement de direction de la soucoupe si collision il y a
changement_direction_haut
	ld		a,(flagDirectionBigboss)
	cp		a,3
	jp		z,config_haut_gauche1
	cp		a,4
	jp		z,config_haut_droite
config_haut_gauche1
	ld		a,1
	ld		(flagDirectionBigboss),a
	ret
config_haut_droite
	ld		a,2
	ld		(flagDirectionBigboss),a
	ret
changement_direction_gauche
	ld 		a,(flagDirectionBigboss)
	cp 		a,4
	jp		z,config_bas_gauche
	cp		a,2
	jp		z,config_haut_gauche2
config_bas_gauche
	ld		a,3
	ld		(flagDirectionBigboss),a
	ret
config_haut_gauche2
	ld		a,1
	ld		(flagDirectionBigboss),a
	ret
changement_direction_bas
	ld		a,(flagDirectionBigboss)
	cp		a,2
	jp		z,config_bas_gauche2
	cp		a,1
	jp		z,config_bas_droite
config_bas_gauche2
	ld		a,3
	ld		(flagDirectionBigboss),a
	ret
config_bas_droite
	ld		a,4
	ld		(flagDirectionBigboss),a
	ret
changement_direction_droite
	ld 		a,(flagDirectionBigboss)
	cp 		a,3
	jp		z,config_bas_droite2
	cp		a,1
	jp		z,config_haut_droite2
config_bas_droite2
	ld		a,4
	ld		(flagDirectionBigboss),a
	ret
config_haut_droite2
	ld		a,2
	ld		(flagDirectionBigboss),a
	ret

