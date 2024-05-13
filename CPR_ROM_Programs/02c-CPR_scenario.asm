
scenario_du_jeu
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
; copie des fichiers GO1 et GO2 en  pour l'overscan
	LD 		BC,BANK17_SCENARIO:OUT (C),C				; on choisit DE LIRE la ROM 15
	LD		BC,#7F00+%10000000:OUT (C),C 			; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c						; on choisit D'ECRIRE  dans la RAM centrale

	ld		hl,#e5c0							; lecture dans la bank ROM
	ld		de,#4000							; ecriture dans le bank RAM #4000
	call	DepkZX0								; on décompresse

	ld		hl,#4000
	ld		de,#c000
	ld		bc,#4000							; longueur
	LDIR

	ld		hl,#ee40							; lecture dans la bank ROM
	ld		de,#4000							; ecriture dans le bank RAM #4000
	call	DepkZX0								; on décompresse

Asic ON
; copie de la palette CPC+ pour le screen
	LD 		BC,BANK8_PALETTES:OUT (C),C			; on choisit DE LIRE la ROM 14
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c					; on choisit D'ECRIRE  dans la RAM centrale
	ld		hl,PALETTE_SCENARIO							; lecture
	ld		de,#6400							; ecriture
	ld		bc,#20								; longueur
	LDIR
Asic OFF



reprise
	exx
	ld		bc,#02FF
	exx

	ld		ix,tbl_ordre_scenario
; //////////////////////////////////////////////////////////////////
; /////////////////////////    BOUCLE PRINCIPALE      //////////////
; /////////////////////////           du              //////////////
; /////////////////////////        SCENARIO         ///////////////
; //////////////////////////////////////////////////////////////////
scenario
	

boucle_scenario
	ld      b,#F5
VBL_scenario
	in      a,(c)
	rra
	jr 		nc,VBL_scenario

	jp 		on_attends
retour_on_attends

; on lit le tableau des adresse correspondant au label des vignettes
	ld		a,(ix)
	ld		l,a
	ld		a,(ix+1)
	ld		h,a
	jp		(hl)
retour_vignette_bulle
	inc		ix
	inc		ix
	ld		a,(ix)
	cp		a,#FF
	jp		z,le_menu

	exx
	ld		bc,#04FF
	exx
	jp boucle_scenario


on_attends
	exx
	dec bc
	ld	a,b
	cp	a,0
	exx
	jp	nz,boucle_scenario
	exx
		ld		bc,#04FF
	exx
		jp	retour_on_attends


vignette_1
	ld		hl,#4000
	ld		de,#c000
	ld		bc,#21
	ld		a,11*8
	call	vignette
	jp		retour_vignette_bulle
vignette_2
	ld		hl,#4391
	ld		de,#c34e
	ld		bc,#21
	ld		a,11*8
	call	vignette
	jp		retour_vignette_bulle
vignette_3
	ld		hl,#4370
	ld		de,#c468
	ld		bc,#21
	ld		a,11*8
	call	vignette
	jp		retour_vignette_bulle
bulle_3
	ld		hl,#7252
	ld		de,#eeb2
	ld		bc,#727f+-#7251
	ld		a,2*8+6
	call	vignette
	LD 		BC,#DF00+31+#80:OUT (C),C	
	LD		BC,#7F00+%10000000:OUT (C),C 
	ld		hl,#c000
	ld		de,#1d40
	CALL	play_sample
	jp		retour_vignette_bulle
bulle_2
	ld		hl,#796b
	ld		de,#cb7f
	ld		bc,#7990+-#796b
	ld		a,2*8+6
	call	vignette
	LD 		BC,#DF00+29+#80:OUT (C),C	
	LD		BC,#7F00+%10000000:OUT (C),C 
	ld		hl,#c000
	ld		de,#3cce
	CALL	play_sample
	jp		retour_vignette_bulle

bulle_1
	ld		hl,#4025
	ld		de,#f020
	ld		bc,#404f+-#4024
	ld		a,4*8+7
	call	vignette
	LD 		BC,#DF00+30+#80:OUT (C),C	
	LD		BC,#7F00+%10000000:OUT (C),C 
	ld		hl,#c000
	ld		de,#272A
	CALL	play_sample
	jp		retour_vignette_bulle



tbl_ordre_scenario
	dw	vignette_1,bulle_1,vignette_2,bulle_2,vignette_3,bulle_3,bulle_3,#FFFF

vignette
	push	bc
	exx
	ld		b,a
	exx
	pop		bc
boucle_affiche_vignettes
	push	bc
	push	hl
	push	de
	LDIR
	pop		de
	pop		hl
	call	ligneinf_c000
	call	ligneinf_4000
	pop		bc
	exx
	dec		b
	exx
	jr		nz,boucle_affiche_vignettes
	ret
