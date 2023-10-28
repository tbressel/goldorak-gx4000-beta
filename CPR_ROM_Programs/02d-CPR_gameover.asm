
Perdu
CALL	reinit_crtc_et_retard_video
;call	FADE_OUT
; //////////////////////////////////////////////////////////////////
; /////////////////////////    GAME OVER     /////////////////////
; //////////////////////////////////////////////////////////////////
; on formatte l'écran  pour l'overscan
	LD 		BC,#BC01:OUT (C),C						; position du border
	LD 		BC,#BD00+#30:OUT (C),C
	LD 		BC,#BC02:OUT (C),C						; position de la HBL
	LD 		BC,#BD00+#32:OUT (C),C
	LD 		BC,#BC07:OUT (C),C						; position de la HBL
	LD 		BC,#BD00+#23:OUT (C),C
	LD 		BC,#BC06:OUT (C),C						; position verticale du border
	LD 		BC,#BD00+#22:OUT (C),C

; copie des fichiers GO1 et GO2 en  pour l'overscan
	LD 		BC,BANK18_GAMEOVER:OUT (C),C				; on choisit DE LIRE la ROM 15
	LD		BC,#7F00+%10000000:OUT (C),C 			; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c						; on choisit D'ECRIRE  dans la RAM centrale

	ld		hl,#c000							; lecture dans la bank ROM
	ld		de,#4000							; ecriture dans le bank RAM #4000
	call	DepkZX0								; on décompresse
	
	ld		hl,#4000
	ld		de,#c000
	ld		bc,#4000							; longueur
	LDIR

	ld		hl,#d480							; lecture dans la bank ROM
	ld		de,#4000							; ecriture dans le bank RAM (oui c'est chelou elles ont la même adresse)
	call	DepkZX0
	
	LD 		BC,#BC0C:OUT (C),C      				;R12 selectionne
	LD 		BC,#BD10:OUT (C),C 						;Ecran en #4000

; rupture ligne 167 normalement mais avec iDRAW2 y'a une bannière a virer en bas de l'ecran
	Asic on
	ld		a,167:ld (#6801),a					; ligne de 2eme split
	ld		a,#10:ld (#6802),a					; registre 12
	Asic off
	LD 		BC,#BC0C:OUT (C),C      			; R12 selectionne
	LD 		BC,#BD30:OUT (C),C 					; Ecran en #c000
	
	
	Asic ON
; copie de la palette CPC+ (logé en bank 19) specialement pour le screen
	LD 		BC,BANK8_PALETTES:OUT (C),C				; on choisit DE LIRE la ROM 14
	LD		BC,#7F00+%10000000:OUT (C),C 		; connexion de la ROM supérieure et de la ROM inférieure et écran en mode 0.
	LD 		BC,#7FC0:OUT (c),c					; on choisit D'ECRIRE  dans la RAM centrale
	ld		hl,PALETTE_GAME_OVER							; lecture
	ld		de,#6400							; ecriture
	ld		bc,#20								; longueur
	LDIR

	Asic OFF


Boucle_Game_Over




call	lecture_clavier
bit		4,a
jp		z,0




jp Boucle_Game_Over

