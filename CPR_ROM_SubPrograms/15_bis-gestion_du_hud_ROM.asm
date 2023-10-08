score_items_ROM

	
		counter_goldorak_items
			exx		
			ld		a,(Counter_score+4)			; on recupère les unitées
			ld		c,a						; on tranfer dans c
			ld		a,(Counter_score+3)
			ld		d,a
			ld		a,(Counter_score+2)
			ld		E,a
			ld		a,(Counter_score+1)
			ld		h,a
			ld		a,(Counter_score)
			ld		l,a
			exx
			jr		counter_suite_items
				;counter_venusiak_items
				;	exx		
				;	ld		a,(Counter_score2+4)			; on recupère les unitées
				;	ld		c,a						; on tranfer dans c
				;	ld		a,(Counter_score2+3)
				;	ld		d,a
				;	ld		a,(Counter_score2+2)
				;	ld		E,a
				;	ld		a,(Counter_score2+1)
				;	ld		h,a
				;	ld		a,(Counter_score2)
				;	ld		l,a
				;	exx
						counter_suite_items
							ld	hl,(adr_tbl_points_soucoupe)
							ld	a,(hl)
							;ld	a,(nbr_de_points)
							cp	a,ITEM_AJOUTE_1VIE
							jp	z,inc_one_life_j1etj2
							cp	a,ITEM_FULL_NRJ
							jp	z,inc_NRJ_item
							cp	a,ITEM_10_PTS
							jp	z,inc_dizaine_items
							cp	a,ITEM_100_PTS
							jp	z,items100_centaine
							cp	a,ITEM_50_PTS
							jp	z,items50_dizaine
							cp	a,ITEM_500_PTS
							jp	z,items500_centaine
							cp	a,ITEM_20_PTS
							jp	z,items20_dizaine
							;cp	a,ITEM_BOMB
							;jp	z,boom_toutes_les_soucoupes
							cp	a,ITEM_POWERUP
							jp	z,inc_arme_power
items50_dizaine
	exx
	ld		a,d				; on recupère le chiffre des dizaine de D' vers A qui un registre commun
	exx
	inc		a				; on incremente A = 3
	inc		a				; ou A = 7
	inc		a
	inc		a
	inc		a				; si a etait a 3, alors on est a 8
							; si on était à 7 alors A = 12
	exx
	ld		d,a				; on envoye 8
							; on envoie 12 quand même
	exx
	ld		b,10			; est ce que l'on garde 8 ?
							; est ce que l'on garde 12 ?
	sbc		a,b				; 8 - 10 = -2
							; 12-10  = 2
	jr		nc,retenue_items50 	; si c'est negatif on garde et on zap on affiche le score
								; si c'est PAS negatif c'estqu'on déborde et donc on va en retenue
	jp		afficher_le_score
		retenue_items50
			exx
			ld		d,a
			exx
			jp		inc_centaine_items	; et donc on incremente les centaines

items20_dizaine
	exx
	ld		a,d				; on recupère le chiffre des dizaine de D' vers A qui un registre commun
	exx
	inc		a				; on incremente A = 3
	inc		a				; ou A = 7
							; si a etait a 3, alors on est a 8
							; si on était à 7 alors A = 12
	exx
	ld		d,a				; on envoye 8
							; on envoie 12 quand même
	exx
	ld		b,10			; est ce que l'on garde 8 ?
							; est ce que l'on garde 12 ?
	sbc		a,b				; 8 - 10 = -2
							; 12-10  = 2
	jr		nc,retenue_items20 	; si c'est negatif on garde et on zap on affiche le score
								; si c'est PAS negatif c'estqu'on déborde et donc on va en retenue
	jp		afficher_le_score
retenue_items20
	exx
	ld		d,a
	exx
	jp		inc_centaine_items	; et donc on incremente les centaines
	



items500_centaine
	exx
	ld		a,e				; on recupère le chiffre des centaines de E' vers A qui un registre commun
	exx
	inc		a				; on incremente A = 3
	inc		a				; ou A = 7
	inc		a
	inc		a
	inc		a				; si a etait a 3, alors on est a 8
							; si on était à 7 alors A = 12
	exx
	ld		e,a				; on envoye 8
							; on envoie 12 quand même
	exx
	ld		b,10			; est ce que l'on garde 8 ?
							; est ce que l'on garde 12 ?
	sbc		a,b				; 8 - 10 = -2
							; 12-10  = 2
	jr		nc,retenue_items500 	; si c'est negatif on garde et on zap on affiche le score
								; si c'est PAS negatif c'estqu'on déborde et donc on va en retenue
	jp		afficher_le_score
retenue_items500
	exx
	ld		e,a
	exx
	jp		inc_millier_items	; et donc on incremente les centaines

	
items200_centaine
		exx
	ld		a,e				; on recupère le chiffre des centaines de E' vers A qui un registre commun
	exx
	inc		a				; on incremente A = 3
	inc		a				; ou A = 7
						; si a etait a 3, alors on est a 8
							; si on était à 7 alors A = 12
	exx
	ld		e,a				; on envoye 8
							; on envoie 12 quand même
	exx
	ld		b,10			; est ce que l'on garde 8 ?
							; est ce que l'on garde 12 ?
	sbc		a,b				; 8 - 10 = -2
							; 12-10  = 2
	jr		nc,retenue_items200 	; si c'est negatif on garde et on zap on affiche le score
								; si c'est PAS negatif c'estqu'on déborde et donc on va en retenue
	jp		afficher_le_score
retenue_items200
	exx
	ld		e,a
	exx
	jp		inc_millier_items	; et donc on incremente les centaines

items100_centaine
		exx
	ld		a,e				; on recupère le chiffre des centaines de E' vers A qui un registre commun
	exx
	inc		a				; on incremente A = 3
					; ou A = 7
						; si a etait a 3, alors on est a 8
							; si on était à 7 alors A = 12
	exx
	ld		e,a				; on envoye 8
							; on envoie 12 quand même
	exx
	ld		b,10			; est ce que l'on garde 8 ?
							; est ce que l'on garde 12 ?
	sbc		a,b				; 8 - 10 = -2
							; 12-10  = 2
	jr		nc,retenue_items100 	; si c'est negatif on garde et on zap on affiche le score
								; si c'est PAS negatif c'estqu'on déborde et donc on va en retenue
	jp		afficher_le_score
retenue_items100
	exx
	ld		e,a
	exx
	jp		inc_millier_items	; et donc on incremente les centaines


	

rst_dizaine_items
	exx
	ld		d,0
	inc		e
	ld		a,e
	cp		a,10
	jp		z,rst_centaine_items
	exx
	jp		afficher_le_score
rst_centaine_items
	ld		e,0
	inc		h
	ld		a,h
	cp		a,10
	jp		z,rst_millier_items
	exx
	jp		afficher_le_score
rst_millier_items
	ld		h,0
	inc		l
	ld		a,l
	cp		a,10
	jp		z,score_maxi_bloque
	exx
	jp		afficher_le_score



score_maxi_bloque
jp	$


inc_dizaine_items
	exx
	ld		a,d				; on recupère le chiffre des dizaine de D' vers A qui un registre commun
	exx
	inc		a				; on incremente A
	cp		a,10			; si on obtient 10 c'est qu'il était à 9
	jr		z,rst_dizaine_items	; et donc on incremente les centaines
	exx	
	ld		d,a				; sinon en renvoie simplment la valeur dans D'
	exx
	jp		afficher_le_score
inc_centaine_items
	exx
	ld		a,E				; on recupère le chiffre des dizaine de E' vers A qui un registre commun
	exx
	inc		a				; on incremente A
	cp		a,10				; si on obtient 10 c'estqu'il était à 9
	jr		z,inc_millier_items	; et donc on incremente les milliers
	exx	
	ld		E,a				; sinon en renvoie simplment la valeur dans E'
	exx
	jp		afficher_le_score
inc_millier_items
	exx
	ld		a,h				; on recupère le chiffre des millier de H' vers A qui un registre commun
	ld		D,0				; si on change de 100 aines c'est que l'on revient à zero dans les dizaines
	ld		c,0				; ...et dans les unités
	ld		E,0				; ... et des centainre
	exx
	inc		a				; on incremente A
	cp		a,10				; si on obtient zéro c'estqu'il était à 9
	jr		z,inc_dizaine_de_millier_items	; et donc on incremente les dizaine de millier
	exx	
	ld		h,a				; sinon en renvoie simplment la valeur dans H'
	exx
	jp		afficher_le_score
inc_dizaine_de_millier_items
	exx
	ld		a,l				; on recupère le chiffre des dizaine de L' vers A qui un registre commun
	ld		D,0				; si on change de 100 aines c'est que l'on revient à zero dans les dizaines
	ld		c,0				; ...et dans les unités
	ld		E,0				; ... et des centainres
	ld		h,0				; ... et des milliers
	exx
	inc		a				; on incremente A
	cp		a,10				; si on obtient zéro c'estqu'il était à 9
	jp		z,afficher_le_score	; et donc on incremente les centaines
	exx	
	ld		l,a				; sinon en renvoie simplment la valeur dans L'
	exx
	jp		afficher_le_score



score_BOOM_ROM

counter_goldorak
	exx		
	ld		a,(Counter_score+4)			; on recupère les unitées
	ld		c,a						; on tranfer dans c
	ld		a,(Counter_score+3)
	ld		d,a
	ld		a,(Counter_score+2)
	ld		E,a
	ld		a,(Counter_score+1)
	ld		h,a
	ld		a,(Counter_score)
	ld		l,a
	exx
	jr		counter_suite
;counter_venusiak
;	exx		
;	ld		a,(Counter_score2+4)			; on recupère les unitées
;	ld		c,a						; on tranfer dans c
;	ld		a,(Counter_score2+3)
;	ld		d,a
;	ld		a,(Counter_score2+2)
;	ld		E,a
;	ld		a,(Counter_score2+1)
;	ld		h,a
;	ld		a,(Counter_score2)
;	ld		l,a
;	exx
counter_suite
	ld		hl,(points_a_ajouter)
	exx
	ld		a,c			; on recupère le chiffre des unités de C'
	exx
	ld		c,l			; on recupère les points à ajouter dans C
	add		a,c			; on les additionne et le resultat est dans A
	cp		a,10			; si on obtient 10 on ajoute 1 aux dizaines
	jr		z,inc_dizaine_BOOM
	exx		
	ld		c,a			; sinon on evnoie simplement la valeur dans C'
	exx
	jp		afficher_le_score
inc_dizaine_BOOM
	exx
	ld		c,0				; SI on change de 10 aines c'est que l'on revient à zero dans les unités
	ld		a,d				; on recupère le chiffre des dizaine de D' vers A qui un registre commun
	exx
	inc		a				; on incremente A
	cp		a,10			; si on obtient 10 c'est qu'il était à 9
	jr		z,inc_centaine_BOOM	; et donc on incremente les centaines
	exx	
	ld		d,a				; sinon en renvoie simplment la valeur dans D'
	exx
	jp		afficher_le_score
inc_centaine_BOOM
	exx
	ld		d,0				; si on change de 100 aines c'est que l'on revient à zero dans les dizaines
	ld		c,0				; ...et dans les unités
	ld		a,E				; on recupère le chiffre des dizaine de E' vers A qui un registre commun
	exx
	inc		a				; on incremente A
	cp		a,10				; si on obtient 10 c'estqu'il était à 9
	jr		z,inc_millier_BOOM	; et donc on incremente les milliers
	exx	
	ld		E,a				; sinon en renvoie simplment la valeur dans E'
	exx
	jp		afficher_le_score
inc_millier_BOOM
	exx
	ld		a,h				; on recupère le chiffre des millier de H' vers A qui un registre commun
	ld		D,0				; si on change de 100 aines c'est que l'on revient à zero dans les dizaines
	ld		c,0				; ...et dans les unités
	ld		E,0				; ... et des centainre
	exx
	inc		a				; on incremente A
	cp		a,10				; si on obtient zéro c'estqu'il était à 9
	jr		z,inc_dizaine_de_millier_BOOM	; et donc on incremente les dizaine de millier
	exx	
	ld		h,a				; sinon en renvoie simplment la valeur dans H'
	exx
	jp		afficher_le_score
inc_dizaine_de_millier_BOOM
	exx
	ld		a,l				; on recupère le chiffre des dizaine de L' vers A qui un registre commun
	ld		D,0				; si on change de 100 aines c'est que l'on revient à zero dans les dizaines
	ld		c,0				; ...et dans les unités
	ld		E,0				; ... et des centainres
	ld		h,0				; ... et des milliers
	exx
	inc		a				; on incremente A
	cp		a,10				; si on obtient zéro c'estqu'il était à 9
	jp		z,afficher_le_score	; et donc on incremente les centaines
	exx	
	ld		l,a				; sinon en renvoie simplment la valeur dans L'
	exx
	jp		afficher_le_score
	
	
