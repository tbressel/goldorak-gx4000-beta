le_menu
	

	call	FADE_OUT
; /////////////////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////// POSITIONNEMENT de L'ECRAN ///////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////////////////
	LD 		BC,#BC01:OUT (C),C			; rognage du bord droit de 16 caracteres (32 octets)
	LD 		BC,#BD00+40:OUT (C),C
	LD 		BC,#BC02:OUT (C),C			; on pousse l'ecran vers la droite pour le recentrer
	LD 		BC,#BD00+46:OUT (C),C
	LD 		BC,#BC07:OUT (C),C			; on decale l'ecran vers le haut
	LD 		BC,#BD00+30:OUT (C),C
	LD 		BC,#BC06:OUT (C),C			; on agrandit l'ecran vers le bas
	LD 		BC,#BD00+25:OUT (C),C
	Asic on
	xor		a
	ld 		(#6801),a					; ligne de 2eme split
	ld		a,#10:ld (#6802),a					; registre 12

Asic OFF
LD 		BC,BANK4_MENU:OUT (C),C				; on choisit DE LIRE la ROM 15
	LD		BC,#7F00+%10000000:OUT (C),C 			; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c						; on choisit D'ECRIRE  dans la RAM centrale

	ld		hl,#C000							; lecture dans la bank ROM
	ld		de,#4000							; ecriture dans le bank RAM #4000
	call	DepkZX0								; on décompresse

	ld		hl,#4000
	ld		de,#c000
	ld		bc,#4000							; longueur
	LDIR

Asic ON
; copie de la palette CPC+ (logé en bank 19) specialement pour le screen
	LD 		BC,BANK8_PALETTES:OUT (C),C				; on choisit DE LIRE la ROM 14
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c					; on choisit D'ECRIRE  dans la RAM centrale
	ld		hl,PALETTE_MENU						; lecture
	ld		de,#6400							; ecriture
	ld		bc,#20								; longueur
	LDIR

	ld		hl,PALETTE_MENU							; lecture
	ld		de,Adresse_pallette_screen							; ecriture
	ld		bc,#20								; longueur
	LDIR
Asic OFF
	ld		bc,#7F00+%10001000				; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	out		(c),c			

; //////////////////////////////////////////////////////////////////
; /////////////////////////    BOUCLE PRINCIPALE      //////////////
; /////////////////////////           de              //////////////
; /////////////////////////      L'ECRAN TITRE       ///////////////
; //////////////////////////////////////////////////////////////////
	ld		hl,TBL_ADR_CURSEUR_MENU
	ld		(PointeurTblCurseurMenu),hl
	ld		a,(hl)
	ld		e,a
	inc		hl
	ld		a,(hl)
	ld		d,a
	ex		hl,de	; le pointeur adresse écran est dans HL
; on stock le curseur au poing dans un buffer
	ld		de,BufCurseurMenu		; on va ecrire en mémoire tampon
	ld		b,8*3
	call	BoucleSauveCurseur
	xor		a
	ld		(choix_menu),a


	
boucle_menu
	ld      b,#F5
VBL_menu
	in      a,(c)
	rra
	jr 		nc,VBL_menu

	ld		a,(CompteurAttente)
	inc		a
	ld		(CompteurAttente),a
	cp		a,128
	jr		nz,boucle_menu
	xor		a
	ld		(CompteurAttente),a


	call	lecture_clavier
	bit		4,a
	jp		z,ValidationChoix
	bit		5,a
	jp		z,MenuOnChoisi
	;jp		z,scenario_du_jeu


	jp boucle_menu


ValidationChoix
	ld	a,(choix_menu)
	cp	a,0
	jp	z,metamorphose
	cp	a,1
	jp	z,scenario_du_jeu
	cp	a,2
	jp	z,credits
	jp boucle_menu

MenuOnChoisi
	ld	a,(choix_menu)
	inc	a
	cp	a,3
	jr	nz,SauteChoixMenu
	xor	a
SauteChoixMenu	
	ld	(choix_menu),a

	ld		de,(PointeurTblCurseurMenu)
	ld		a,(de)
	ld		l,a
	inc		de
	ld		a,(de)
	ld		h,a
	ex		hl,de
					; on sauvegarde l'adresse du point de départ
	ld		b,8*3
	call	BoucleEffaceCurseur
	ld		de,(PointeurTblCurseurMenu)
	inc		de
	inc		de
	ld		a,(de)
	cp		a,#FF
	jp		nz,OnSauteReinitPointeur
	ld		de,TBL_ADR_CURSEUR_MENU
OnSauteReinitPointeur
	ld	(PointeurTblCurseurMenu),de
	ld		a,(de)
	ld		l,a
	inc		de
	ld		a,(de)
	ld		h,a
	ex		hl,de
	ld		hl,BufCurseurMenu
	ld		b,8*3
	call	BoucleBougeCurseur
	jp	boucle_menu
	
TBL_ADR_CURSEUR_MENU
	dw	#C16C,#C20C,#C2AC,#FFFF

BoucleSauveCurseur
	push	bc					; on sauve le compteur
	push	hl					; on sauve dans la pile le pointeur ecran
	ld		bc,4*4
	LDIR
	pop		hl					; on restitue l'adresse ecrna pour le calcule
	push	de					; on sauvegarde l'adresse destination en cours
	ex		hl,de
	call	ligneinf_c000
	ex		hl,de
	pop		de					; on recupère l'adresse tampon
	pop		bc
	djnz	BoucleSauveCurseur
	ret

BoucleBougeCurseur
	push	bc					; on sauve le compteur
	push	de					; on sauve dans la pile le pointeur ecran
	ld		bc,4*4
	LDIR
	pop		de					; on restitue l'adresse ecrna pour le calcule
	push	hl					; on sauvegarde l'adresse destination en cours
	
	call	ligneinf_c000
	
	pop		hl					; on recupère l'adresse tampon
	pop		bc
	djnz	BoucleBougeCurseur
	ret	
BoucleEffaceCurseur
	push	bc					; on sauve le compteur
	push	de					; on sauve dans la pile le pointeur ecran
	ld		hl,#c040			; y'a que des zero à cette adresse 
	ld		bc,4*4
	LDIR
	pop		de					; on restitue l'adresse ecrna pour le calcule
	call	ligneinf_c000
	pop		bc
	djnz	BoucleEffaceCurseur
	ret	




