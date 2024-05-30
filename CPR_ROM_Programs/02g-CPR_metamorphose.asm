
metamorphose
	call	FADE_OUT
	ld		hl,#05FF

boucle_attendre
	dec		hl
	ld		a,l
	cp		a,0
	jr		z,testH
	
jp	boucle_attendre	
	testH
		ld	a,h
		cp	a,0
		jr	Z,fin_du_decomptem
jp	boucle_attendre






fin_du_decomptem
Asic OFF
LD 		BC,BANK4_MENU:OUT (C),C				; on choisit DE LIRE la ROM 4
	LD		BC,#7F00+%10000000:OUT (C),C 			; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c						; on choisit D'ECRIRE  dans la RAM centrale

	ld		hl,METAMORPHOSE_SCREEN_ADR							; lecture dans la bank ROM
	ld		de,#4000							; ecriture dans le bank RAM #4000
	call	DepkZX0								; on décompresse

	ld		hl,#4000
	ld		de,#c000
	ld		bc,#4000							; longueur
	LDIR

Asic ON
; copie de la palette CPC+ (logé en bank 19) specialement pour le screen
	LD 		BC,BANK8_PALETTES:OUT (C),C				; on choisit DE LIRE la ROM 8
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c					; on choisit D'ECRIRE  dans la RAM centrale
	ld		hl,PALETTE_METAMORPHOSE						; lecture
	ld		de,#6400							; ecriture
	ld		bc,#20								; longueur
	LDIR

	ld		hl,PALETTE_METAMORPHOSE							; lecture
	ld		de,Adresse_pallette_screen							; ecriture
	ld		bc,#20								; longueur
	LDIR
	
	ld		hl,PALETTE_SPRITE_HARD							; lecture
	ld		de,#6422							; ecriture
	ld		bc,32								; longueur
	LDIR
	
	
	
	
	
	
	
	
Asic OFF
	ld		bc,#7F00+%10001000				; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	out		(c),c			
; //////////////////////////////////////////////////////////////////
; /////////////////////////    BOUCLE PRINCIPALE      //////////////
; /////////////////////////           du              //////////////
; /////////////////////////        METAMORPHOSE         ///////////////
; //////////////////////////////////////////////////////////////////
	exx		
	ld	e,VITESSE_METAMORPHOSE
	exx
boucle_metamorphose
	ld      b,#F5
VBL_metamorphose
	in      a,(c)
	rra
	jr 		nc,VBL_metamorphose
	
	exx
	dec	e
	exx
	jr	nz,boucle_metamorphose
	exx	
	ld	e,VITESSE_METAMORPHOSE
	exx
	
	
	
	

	call	actarus_animations
	
	
	
	;call	lecture_clavier
	;bit		4,a
	;jp		z,preparation_du_jeu
	jp boucle_metamorphose


actarus_animations
	Asic	ON
	ld		a,(etp_anim_actarus)
	cp		a,0
	jp		z,init_actarus
	cp		a,1
	jp		z,anim_phase_1
	cp		a,2
	jp		z,sample_metamorphose
	cp		a,3
	jp		z,anim_phase_2
	cp		a,4
	jp		z,anim_termine
	
	
init_actarus
	inc		a
	ld		(etp_anim_actarus),a
	LD 		BC,BANK15_ACTARUS:OUT (C),C				; on choisit DE LIRE la ROM 14
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c	
	exx	
	ld		b,0
	exx
	

	ld		hl,ACTARUS
	ld		(sprh_actuarus),hl
	ld		de,#4000
	ld		bc,#100
	LDIR

	ld		hl,290
	ld		de,35
	ld		(SPRH0_X),hl
	ld		(SPRH0_Y),de
	ld		a,8
	ld		(duree_animation_actarus),a
		
	ld		a,zoom_mode1_1
	ld		(SPRH0_ZOOM),a



	ret


anim_phase_1
	ld		hl,(SPRH0_X)
	dec		hl
	ld		(SPRH0_X),hl
anim_phase_2	
	
	ld		a,(duree_animation_actarus)
	dec		a
	ld		(duree_animation_actarus),a
	
	

	ld		hl,(SPRH0_Y)
	inc		hl
	ld		(SPRH0_Y),hl
	
	cp		a,0
	ret		nz
	ld		a,8
	ld		(duree_animation_actarus),a
	push	af
	ld		hl,(sprh_actuarus)
	ld		de,#100
	add		hl,de
	ld		a,h
	cp		a,#EE
	jr		z,anim_termine
	ld		(sprh_actuarus),hl
	ld		de,#4000
	ld		bc,#100
	LDIR
	pop		af
	exx
	inc	b
	ld	a,b
	exx
	cp	a,3
	call z,inc_etp_actarus
	
	
	
	ret
anim_termine
	xor		a
	ld		(SPRH0_ZOOM),a
	pop		ix
	pop		ix
	jp		preparation_du_jeu
ret


inc_etp_actarus
	exx
	ld		b,0
	exx
	ld		a,(etp_anim_actarus)
	inc		a
	ld		(etp_anim_actarus),a
	
	ret


sample_metamorphose
	inc		a
	ld		(etp_anim_actarus),a
	
	LD 		BC,#DF00+28+#80:OUT (C),C	
	LD		BC,#7F00+%10000000:OUT (C),C 
	ld		hl,#c000			; adresse du début du sample en ROM
	
	ld		de,#2000			; longueur du sample
	
	CALL	play_sample
	
		LD 		BC,BANK15_ACTARUS:OUT (C),C				; on choisit DE LIRE la ROM 14
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c	
ret





	






