

; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
preparation_du_jeu
	call	FADE_OUT
Asic OFF

ld	a,#c0
ld hl,#4000
ld e,l
ld d,h
inc de
ld (hl),a
LD BC,#4000
ldir


ld	a,#c0
ld	(#c000),a
ld hl,#C000
ld	de,#c001
LD BC,#3fff
ldir





	ld		hl,#05FF

bcl_initialisation_du_jeu
	ld      b,#F5
VBL_init
	in      a,(c)
	rra
	jr 		nc,VBL_init

	dec hl
	ld	a,h
	cp	a,0

	jp	nz,bcl_initialisation_du_jeu



; /////////////////////////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////// POSITIONNEMENT de L'ECRAN ///////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////////////////////////
	LD 		BC,#BC01:OUT (C),C			; rognage du bord droit de 16 caracteres (32 octets)
	LD 		BC,#BD00+32:OUT (C),C
	LD 		BC,#BC02:OUT (C),C			; on pousse l'ecran vers la droite pour le recentrer
	LD 		BC,#BD00+42:OUT (C),C
	LD 		BC,#BC07:OUT (C),C			; on decale l'ecran vers le haut
	LD 		BC,#BD00+34:OUT (C),C		; 35
	LD 		BC,#BC06:OUT (C),C			; on agrandit l'ecran vers le bas
	LD 		BC,#BD00+32:OUT (C),C

; //////////////////////////////////////////////////////////////////
; //////////////////////////    RUPTURE     /////////////////////////
; //////////////////////////////////////////////////////////////////
	ld 		bc,#bc00+12:out (c),c   			;R12 selectionne
	ld 		bc,#bd00+#10:out (c),c 				;Ecran en #4000
	Asic ON
	ld		a,LGN_RUPTURE_HUD:ld (#6801),a					; ligne de 2eme split
	ld		a,#10:ld (#6802),a					; registre 12
	ld 		bc,#bc00+12:out (c),c      			; R12 selectionne
	ld 		bc,#BD00+#30:out (c),c 				; Ecran en #c000
	Asic off
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////////////    COPIE des palettes       /////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
	LD 		BC,BANK8_PALETTES:OUT (C),C				; on choisit DE LIRE la ROM 01 (#01)
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	ld		hl,PALETTE_DECORS							; lecture  de la palette du décors
	ld		de,PALETTE_DECORS_RAM							; ecriture
	ld		bc,32							; longueur
	LDIR
	ld		hl,PALETTE_HUD							; lecture de la palette du hud
	ld		de,PALETTE_HUD_RAM							; ecriture
	ld		bc,32							; longueur
	LDIR

; Copie du Programme principale
	LD 		BC,#DF00+1+#80:OUT (C),C				; on choisit DE LIRE la ROM 01 (#01)
	LD 		BC,#7FC0:OUT (c),c					; on choisit D'ECRIRE  dans la RAM central
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion Upper ROM et Lower ROM (et écran en mode 0.)
	ld		hl,#c000							; lecture
	ld		de,#8000							; ecriture
	ld		bc,#4000							; longueur
	LDIR




	JP		#8000										; Goldorak, GO !




