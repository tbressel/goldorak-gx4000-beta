; //////////////////////////////////////////////////////////////////
; /////////////////////        HUD            //////////////////////
; //////////////////////////////////////////////////////////////////
JOUEUR1	= 1
JOUEUR2 = 2
NBR_DE_VIE_DEPART = 3


; Localisation des boutons du tableau de bord
HUD_BOUTON1_ADR			equ		#504B ;HUD_J1_ADR_ECRAN+#100B
HUD_BOUTON2_ADR			equ		HUD_BOUTON1_ADR+3
HUD_BOUTON3_ADR			equ		HUD_BOUTON1_ADR+6
HUD_BOUTON4_ADR			equ		HUD_BOUTON1_ADR+9
HUD_BOUTON5_ADR			equ		#506A ;HUD_J1_ADR_ECRAN+#102A
HUD_BOUTON6_ADR			equ		HUD_BOUTON5_ADR+3
HUD_BOUTON7_ADR			equ		HUD_BOUTON5_ADR+6
HUD_BOUTON8_ADR			equ		HUD_BOUTON5_ADR+9
HUD_BOUTON_ON_ADR		equ		#4183 ;#42c3 
HUD_BOUTON_AFF_ADR		equ		#41a1 ;#7961 ;#42e1 
HUD_LARGEUR_BOUTTON		equ		3
HUD_HAUTEUR_BOUTTON		equ		10

; scoring du mode 1 joueur
HUD_SCORE_UNITE_ADR						equ		#4000+#0132
HUD_SCORE_DIZAINNE_ADR					equ		HUD_SCORE_UNITE_ADR+-2
HUD_SCORE_CENTAINE_ADR					equ		HUD_SCORE_DIZAINNE_ADR+-2
HUD_SCORE_MILLIER_ADR					equ		HUD_SCORE_CENTAINE_ADR+-2
HUD_SCORE_DIZAINE_DE_MILLIER_ADR		equ		HUD_SCORE_MILLIER_ADR+-2

; scoring du joueur 1 en mode 2 joueurs
HUD_SCOREJ1_UNITE_ADR					equ		#4000+#00A3
HUD_SCOREJ1_DIZAINNE_ADR				equ		HUD_SCOREJ1_UNITE_ADR+-2
HUD_SCOREJ1_CENTAINE_ADR				equ		HUD_SCOREJ1_DIZAINNE_ADR+-2
HUD_SCOREJ1_MILLIER_ADR					equ		HUD_SCOREJ1_CENTAINE_ADR+-2
HUD_SCOREJ1_DIZAINE_DE_MILLIER_ADR		equ		HUD_SCOREJ1_MILLIER_ADR+-2

; scoring du joueur 2 en mode 2 joueurs
HUD_SCOREJ2_UNITE_ADR					equ		#4000+#0123
HUD_SCOREJ2_DIZAINNE_ADR				equ		HUD_SCOREJ2_UNITE_ADR+-2
HUD_SCOREJ2_CENTAINE_ADR				equ		HUD_SCOREJ2_DIZAINNE_ADR+-2
HUD_SCOREJ2_MILLIER_ADR					equ		HUD_SCOREJ2_CENTAINE_ADR+-2
HUD_SCOREJ2_DIZAINE_DE_MILLIER_ADR		equ		HUD_SCOREJ2_MILLIER_ADR+-2


; scoring du mode 1 joueur Magasin d'arme
HUD_SCORE_SHOP_UNITE_ADR						equ		#c0cc
HUD_SCORE_SHOP_DIZAINNE_ADR					equ		HUD_SCORE_SHOP_UNITE_ADR+-2
HUD_SCORE_SHOP_CENTAINE_ADR					equ		HUD_SCORE_SHOP_DIZAINNE_ADR+-2
HUD_SCORE_SHOP_MILLIER_ADR					equ		HUD_SCORE_SHOP_CENTAINE_ADR+-2
HUD_SCORE_SHOP_DIZAINE_DE_MILLIER_ADR		equ		HUD_SCORE_SHOP_MILLIER_ADR+-2

; scoring mode 2 joueur crocofest
SCORE_J1_SCR							equ		#C10C


HUD_FONTE_OK				equ		#e960
SCORE_FONTE_OK				equ		#d6a0 

HUD_DEPART_FONTES				equ		#D6A0
HUD_FONTE1_ROM_ADR				equ		HUD_DEPART_FONTES
HUD_FONTE2_ROM_ADR				equ		HUD_DEPART_FONTES+#500
HUD_FONTE3_ROM_ADR				equ		HUD_DEPART_FONTES+#A00
HUD_FONTE4_ROM_ADR				equ		HUD_DEPART_FONTES+#F00
HUD_VIEJ1_ECRAN_ADR				equ		#4112

HUD_NRJJ1_ECRAN_ADR				equ		#514C   ;494C				; jusqu'a #4955
HUD_NRJJ2_ECRAN_ADR				equ		#496A				; jusqu'a #4955
HUD_NRJ_PIXEL_NOIR				equ		#c0
HUD_NRJ_PIXEL_VERT				equ		#c3
HUD_NRJ_PIXEL_BLEU				equ		#fc
HUD_FONTE_HAUTEUR				equ		8

HUD_DEPART_POWER_UP1			equ		#5173
HUD_DEPART_POWER_UP2			equ		#5170
HUD_POWERUP_PIXEL_NOIR			equ		#c0
HUD_POWERUP_PIXEL_ORANGE		equ		#33
HUD_POWERUP_PIXEL_JAUNE			equ		#F3

; ////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////
; ////////////////////// AFFICHAGE DU HUD ////////////////////////
; ////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////

HUD_J1_ADR_ROM			equ	#C000
HUD_J1_ADR_ECRAN		equ	#4040   ;#7800
HUD_J1_HAUTEUR			equ	45
HUD_LONGEUR				equ	16*4			; 16 lignes de 4 octets



affiche_hud
	LD 		BC,BANK_HUD
	OUT 	(C),C
	LD		BC,#7F00+%10000100
	OUT 	(C),C
	ld		hl,HUD_J1_ADR_ROM
	ld		de,HUD_J1_ADR_ECRAN
	ld		bc,HUD_LONGEUR
	ld		a,HUD_J1_HAUTEUR
	ld		b,a
	.boucle
		push	bc
		push	de
		ld		bc,HUD_LONGEUR
		ldir
		pop		de
		call	ligne_inf_4000
		pop		bc
		djnz	.boucle
		LD		BC,#7F00
		OUT 	(C),C
		ret

	
	
; ////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////
; ////////////////////// AFFICHAGE DU FOND ///////////////////////
; ////////////////////// AVANT SCROLLING !!! /////////////////////
; ////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////
affiche_fond
	LD		HL,(adr_screen_level)
	LD		DE,(valeur_offset)		;point de depart d'affichage sur l'ecran
	LD    	A,TILES_NBR_RANGEES		;12 lignes de tiles
	affiche_ecran
		PUSH	AF
		LD		A,TILES_NBR_COLONNES    ;on sauvegarde au cas ou, on sait jamais pour les routines futures.
		LD		B,A	                  	;nombre de tiles 16
		ligne_tile
			PUSH	BC                      ;on le sauvegarde pour le cas ou les sous-routines s'en serviraient.
			PUSH	HL
			PUSH	DE
											;on sauvegarde nos registres car ils vont etre modifies
			CALL 	calcul_tile       		;ici on calcul l'adresse du TILE dans la RAM
											;HL contient l'adresse du tile a afficher
			CALL 	affiche_tile            ;on affiche le premier TILE
			POP  	DE
			POP 	HL                  	;on recupere nos registres
			INC 	HL                      ;si notre table fait moins de 256 octet un INC L suffira
			INC   	DE
			INC 	DE
			INC   	DE
			INC 	DE                  	;4 octets de large pour notre TILE donc 4xINC
			POP   	BC
			DJNZ  	ligne_tile
			EX    	HL,DE                   ;on echange le contenu de HL et DE
			LD    	BC,16*4
			ADD  	HL,BC                   ;on ajoute 80
			EX    	HL,DE                   ;on remet les valeurs dans les bons registres
			POP  	AF                      ;on recupere le nombre de lignes
			DEC  	A                       ;on decremente
			OR    	A                       ;equivalent d'un CP 0 mais en plus rapide
											;Un OR A pour modifier Z quand A=0)
			JP     	NZ,affiche_ecran        ;si c'est pas =0 alors on boucle.
			RET
			calcul_tile
				LD 		BC,(bank_level)
				OUT 	(C),c						; on execute la sélèction de la ROM
				ld		bc,#7f00+%10000100			; ROM inferieur connecté, ROM supérieur déconnecté
				OUT 	(C),C
				LD 		A,(HL)				;l'adresse de HL qui contient 1 octet est mis dans A (le numero ASCII de "H" donc #48 en hexa ou 72 en dec)
				LD 		L,A		 			; donc met le resultat dans L
				LD 		H,0           		;on met 0 dans H (car H ne doit pas etre vide)
				ADD 	HL,HL        		; 40 + 40 = 80  ca fait x2
				ADD 	HL,HL        		; 80 + 80 = 160  ca fait x4
				ADD 	HL,HL        		; 160 + 160 = 320  ca fait x8
				ADD 	HL,HL        		; 320 + 320 = 640  ca fait x16
				ADD 	HL,HL        		; 640 + 640 = 1280  ca fait x32
				ADD 	HL,HL        		; 1280 + 1280 = 2560 ca fait x64
				LD 		BC,#c000    		;on met #A000 dans BC qui correspond a l'adresse de nos tiles ->dans la rom<-
				ADD 	HL,BC        		;on additionne pour avoir l'adresse de la tile ->dans la rom<-
				ld		bc,#7F00			; ROM inf déconnectée, ROM sup déconnectée, MODE 0
				out		(c),c						; on exécute la connexion de la ROM sélectionnée.
				RET
				affiche_tile
					LD 		BC,(bank_tileset)
					OUT 	(C),C
					LD		BC,#7F00+%10000100
					OUT 	(C),C
					LD		A,TILES_HAUTEUR      ;on sauvegarde au cas ou, on sait jamais pour les routines futures.
					LD		B,A		 	; les tiles font 16 lignes sur une longueur BC
					boucle_tile
						PUSH 	BC		 	; ... pour mettre ca dans la pile (registre 16 bits obligatoir)
						LD 		BC,TILES_LARGEUR	 		; largeur d'une lettre de 4 octets (mode 1, 8 pxl font 4 octets)
						PUSH 	DE		 	; on sauve DE avant que le LDIR le modifie ...
						LDIR		 		; il incremente HL et DE (HL = #4A01   DE = C001 BC = 00)
						POP 	DE		 	; on recupere notre DE de la pile
						CALL 	ligne_inf_C000_type1
						POP 	BC		 	; nouvelle ligne calcule, on recupere notre compteur ...
						DJNZ 	boucle_tile
						LD		BC,#7F00
						OUT 	(C),C
						RET

; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ////////////////////// CALCULE LIGNE INFERIEUR  ///////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
ligne_inf_C000_type1
	ld		a,d
	add		a,#8
	ld		d,a
	ret		nc
	ld		bc,#c040
	ex		de,hl
	add		hl,bc
	ex		hl,de
	ret
ligne_inf_C000_type2
	ld		a,h
	add		a,#8
	ld		h,a
	ret		nc
	ld		bc,#c050
	add		hl,bc
	ret
ligne_inf_4000
	ld 		a,d
	add 	a,#08
	ld 		d,a
	bit		7,a
	ret 	Z		; debordement
	ex 		de,hl
	ld 		bc,#C040
	add 	hl,bc
	ex 		de,hl
	ret
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; //////////////////////  AFFICHAGE DE GOLDORAK   ///////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
Affiche_sprite_hard
	Asic ON
; Goldorak sprite hard
	LD 		BC,BANK_GOLDORAK_SPRH
	OUT 	(C),C						; on execute la sélèction de la ROM
	LD		BC,#7F00+%10000100
	OUT 	(C),C
	ld		hl,#c000										; emplacement départ des données de la palette
	ld		de,#4000										; emplacement de la palette dans l'ASIC
	ld		bc,#1000								; longueur de la pellette à copier dans l'ASIC
	LDIR
	ld		hl,#4600
	ld		de,#5000
	ld		bc,#400
	LDIR
; on place goldorak
	ld		hl,GOLDORAK_INIT_POSX
	ld		(#6000),hl			; sprite 0 X
	ld		(#6010),hl			; sprite 2 X
	ld		de,32+32
;ld	de,16+16
	add		hl,de
	ld		(#6008),hl			; sprite 1 X
	ld		(#6018),hl			; sprite 3 X
	ld		hl,GOLDORAK_INIT_POSY
	ld		(#6002),hl			; sprite 0 Y
	ld		(#600A),hl			; sprite 1 Y
	ld		de,16
	add 	hl,de
	ld		(#6012),hl			; sprite 2 Y
	ld		(#601A),hl			; sprite 3 Y
	ld		hl,GOLDORAK_INIT_POSY
	ld		(posy_goldorak),hl
	ld		hl,GOLDORAK_INIT_POSX
	ld		(posx_goldorak),hl
Asic OFF
	ret

; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
; //////     on place goldorak avec les cooronnées de déplaceacement    ////////
; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
goldo_affiche
	ld		c,BANK_ROM_18
	RST		UPPER_ROM_CONNEXION
	RST		ASIC_CONNEXION
	call	goldo_affiche_ROM
	call	rom_off
	ret
	
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; //////////// CONFIGURATION SPRITES ET ARME EN FIN DE BOUCLE ///////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
sprh_a_charger_ou_pas_avec_poing
	RST		ASIC_CONNEXION
	ld		a,(resultat_test_de_touche)
	cp		a,#FF
	jp		z,init_on_charge_sprh_haut_bas2
	ld		a,(sprh_a_charger)
	cp		a,0
	ret		z
	cp		a,1
	jp		z,on_charge_sprh_haut_bas2
	cp		a,2
	jp		z,on_charge_sprh_gauche2
	cp		a,3
	jp		z,on_charge_sprh_droite2
		init_on_charge_sprh_haut_bas2
			ld		hl,GOLDORAK_HAUTBAS_ANIMPOINT1_SPRH_ROM_ADR
			ld		(sprh_goldorak),hl
	
				on_charge_sprh_haut_bas2
					ld		c,BANK9_GOLDORAK_SPRH
					RST 	UPPER_ROM_CONNEXION
				automodif_srph_goldoHB2
					ld		hl,(sprh_goldorak)
					ld		de,#4000
					ld		bc,#200
					LDIR
					ld		hl,+#200
					ld		de,#4200
					ld		bc,#200
					LDIR
					call	rom_off
					ld		a,1
					ld		(direction_goldorak),a
					ret
on_charge_sprh_gauche2
	ld		c,BANK9_GOLDORAK_SPRH
	RST 	UPPER_ROM_CONNEXION
automodif_srph_goldoG2
	ld		hl,(sprh_goldorak)
	ld		de,#4000
	ld		bc,#200
	LDIR
	ld		hl,GOLDORAK_GAUCHE_SPRH_ROM_ADR+#200
	ld		de,#4200
	ld		bc,#200
	LDIR
	call	rom_off
	ret
on_charge_sprh_droite2
	ld		c,BANK9_GOLDORAK_SPRH
	RST 	UPPER_ROM_CONNEXION
automodif_srph_goldoD2
	ld		hl,(sprh_goldorak)
	ld		de,#4000
	ld		bc,#200
	LDIR
	ld		hl,GOLDORAK_DROITE_SPRH_ROM_ADR+#200
	ld		de,#4200
	ld		bc,#200
	LDIR
	call	rom_off
	ret
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////	
sprh_a_charger_ou_pas
	RST		ASIC_CONNEXION
	
	ld		a,(resultat_test_de_touche)
	cp		a,#FF
	jp		z,on_init_charge_sprh_haut_bas
	
	ld		a,(flag_retournement)
	cp		a,1
	ret		z
	
	
	
	ld		a,(sprh_a_charger)
	cp		a,0
	ret		z
	cp		a,1
	jp		z,on_charge_sprh_haut_bas
	cp		a,2
	jp		z,on_charge_sprh_gauche
	cp		a,3
	jp		z,on_charge_sprh_droite
on_init_charge_sprh_haut_bas
	ld		a,(flag_deja_affiche)
	cp		a,1
	ret		z

	ld		a,1
	ld		(flag_deja_affiche),a

	ld		hl,(Tbl_sprh_direction)
	ld		(sprh_goldorak),hl
	ld		hl,(Tbl_sprh_direction2)
	ld		(sprh_goldorak2),hl
on_charge_sprh_haut_bas
		XOR		a
	ld		(flag_deja_affiche),a
	ld		c,BANK9_GOLDORAK_SPRH
	RST 	UPPER_ROM_CONNEXION
automodif_srph_goldoHB
	ld		hl,(sprh_goldorak)
	ld		de,#4000
	ld		bc,#200
	LDIR
	ld		hl,(sprh_goldorak2)
	ld		de,#4200
	ld		bc,#200
	LDIR
	call	rom_off
	ld		a,1
	ld		(direction_goldorak),a
	ret
on_charge_sprh_gauche
	XOR		a
	ld		(flag_deja_affiche),a
	ld		c,BANK9_GOLDORAK_SPRH
	RST 	UPPER_ROM_CONNEXION
automodif_srph_goldoG
	ld		hl,(sprh_goldorak)
	ld		de,#4000
	ld		bc,#200
	LDIR
	ld		hl,(sprh_goldorak2)
	ld		de,#4200
	ld		bc,#200
	LDIR
	call	rom_off
	ret
on_charge_sprh_droite
	XOR		a
	ld		(flag_deja_affiche),a
	ld		c,BANK9_GOLDORAK_SPRH
	RST 	UPPER_ROM_CONNEXION
automodif_srph_goldoD
	ld		hl,(sprh_goldorak)
	ld		de,#4000
	ld		bc,#200
	LDIR
	ld		hl,(sprh_goldorak2)
	ld		de,#4200
	ld		bc,#200
	LDIR
	call	rom_off
	ret
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////	
sprh_animations_arme
	RST		ASIC_CONNEXION
	ld		a,(id_arme)
	cp		a,6
	call	z,les_poings_suivent
	ld		a,(anim_arme_a_charger)
	cp		a,0
	ret		z
	cp		a,1
	jr		z,charger_anim_planitron
	cp		a,2
	jr		z,charger_anim_planitron2
	cp		a,3
	jr		z,charger_anim_clavicogyres

	ret
charger_anim_planitron
	ld		c,BANK9_GOLDORAK_SPRH
	RST 	UPPER_ROM_CONNEXION
	ld		hl,(adr_anim_planitron)
	ld		de,SPRH4_ADR
	ld		bc,#100
	LDIR
	ld		hl,(adr_anim_planitron)
	ld		de,SPRH5_ADR
	ld		bc,#100
	LDIR
	RST		ASIC_DECONNEXION
	call	rom_off
	RET
charger_anim_planitron2
	ld		c,BANK9_GOLDORAK_SPRH
	RST 	UPPER_ROM_CONNEXION
	ld		hl,(adr_anim_planitron2)
	ld		de,SPRH4_ADR
	ld		bc,#100
	LDIR
	ld		hl,(adr_anim_planitron2)
	ld		de,SPRH5_ADR
	ld		bc,#100
	LDIR
	RST		ASIC_DECONNEXION
	call	rom_off
	RET	
les_poings_suivent
	ld		a,(flag_fireA)
	cp		a,1
	ret		z
	ld		hl,(SPRH0_X)
	ld		de,22:add hl,de:ld	(SPRH4_X),hl 			; on calcule l'emplacement de l'arme en fonctione des coordonnée de Goldorak
	ld		de,20:add hl,de:ld (SPRH5_X),hl								; on calcule le 2eme sprite par rapport au 1er
	ld		hl,(SPRH0_Y):ld	de,-14:add hl,de
	ld		(SPRH4_Y),hl:ld	(SPRH5_Y),hl
	ret
charger_anim_clavicogyres	
	ld		c,BANK9_GOLDORAK_SPRH
	RST 	UPPER_ROM_CONNEXION
	ld		hl,(adr_anim_clavicogyres)
	ld		de,SPRH4_ADR
	ld		bc,#100
	LDIR
	ld		hl,(adr_anim_clavicogyres)
	ld		de,SPRH5_ADR
	ld		bc,#100
	LDIR
	RST		ASIC_DECONNEXION
	call	rom_off
	RET
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ////////////     FONDUE DE SORTIE A LA FIN DU LEVEL         ///////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
fondu_de_sortie
	call	rom_off
	rst		ASIC_DECONNEXION
	call	 SauvegardeScores

	ld		c,BANK_ROM_18
	RST		UPPER_ROM_CONNEXION
	call	fondu_de_sortie_ROM
	call	rom_off
	ret
				

; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////  MORT DE TINY GOLDORAK  ///////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////	

goldorak_explose
	; ld	a,(flag_mode_2_joueur)
	; cp	a,1
	; jp	z,tiny_goldorak_boom
	; cp	a,0
	jp	normal_goldorak_boom_init

; tiny_goldorak_boom
; ; test de l'initialisation de la destruction de goildorak
; 	ld		a,(BoomGoldorakEtp)
; 	cp		a,0
; 	jp		nz,animation_goldorak_boom
; 	inc		a
; 	ld		(BoomGoldorakEtp),a
; 	ld		a,1
; 	ld		(GoldorakMort),a
; ; configuration des variables pour l'envoie vers la routine principale
; 	ld		hl,SPRH0_Y
; 	ld		(SPRH_Y),hl
; 	ld		hl,BOOM_SPRH_ROM_ADR
; 	ld		(BoomGoldorakSprhRomAdr),hl
; 	xor		a
; 	ld		(BoomGoldorakTimerAdr),a
; ; suppression du test de touche de goldorak
; 	ld		(event_test_de_goldorak),a
; 	ld		(event_test_de_goldorak+1),a
; 	ld		(event_test_de_goldorak+2),a
; ; creation de l'évenement goldorak boom	
; 	ld		a,_CALL			; call
; 	ld		(event_goldorak_boom),a
; 	ld		hl,goldorak_boom
; 	ld		(event_goldorak_boom+1),hl
; 	ld 		a,SFX_BOOM	;Sound effect number (>=1)
;     ld 		c,0 					;channel (0-2)
;     ld 		b,0 					;Inverted volume (0-16)
;     call 	PLY_AKG_PlaySoundEffect
; 	ret
goldorak_boom
	ld		a,(BoomGoldorakEtp)
	cp		a,0
	jp		nz,animation_goldorak_boom
	inc		a
	ld		(BoomGoldorakEtp),a
	ret
animation_goldorak_boom
; il se déplace quand même
	ld		hl,SPRH1_Y	; on recupère l'adresse du sprite hard
	inc		(hl)			; on décrementente l'interieur pour donner un effert de recul
	ld		hl,SPRH0_Y	; on recupère l'adresse du sprite hard
	inc		(hl)			; on décrementente l'interieur pour donner un effert de recul
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_goldorak),de

; on utilise un compteur pour gérer la vitesse d'enchainement des sprite booom
	ld		a,(BoomGoldorakTimerAdr)
	inc		a
	ld		(BoomGoldorakTimerAdr),a
	cp		a,6
	ret		nz
	xor		a
	ld		(BoomGoldorakTimerAdr),a
	
	ld		c,BANK16_BOOM_SPRH
	RST 	UPPER_ROM_CONNEXION
	RST		ASIC_CONNEXION
	ld		hl,(BoomGoldorakSprhRomAdr)
	push	hl
	ld		de,SPRH0_ADR
	ld		bc,#100
	LDIR
	pop		hl
	inc		h
	ld		a,h
	cp		a,#c5
	jr		z,goldorak_detruit
	ld		(BoomGoldorakSprhRomAdr),hl
	xor		a
; on eteind le sprite hard de goldorak
	ld		(valeur_zoom_sprh1),a
	ld		(SPRH1_ZOOM),a
	ld		a,zoom_mode0_1
	ld		(SPRH0_ZOOM),a
	ld		(valeur_zoom_sprh0),a
	call	rom_off
	ret
goldorak_detruit
	xor		a
; on eteind le sprite hard de goldorak
	ld		(valeur_zoom_sprh0),a
	ld		(SPRH0_ZOOM),a
	
	ld		(event_goldorak_boom),a
	ld		(event_goldorak_boom+1),a
	ld		(event_goldorak_boom+2),a
	ret

; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////  MORT DE NORMAL GOLDORAK  ///////////////////////
; ///////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////	
normal_goldorak_boom_init
; test de l'initialisation de la destruction de goildorak
	ld		a,(BoomGoldorakEtp)
	cp		a,0
	jp		nz,animation_normal_goldorak_boom
	inc		a
	ld		(BoomGoldorakEtp),a
	ld		a,1
	ld		(GoldorakMort),a
; configuration des variables pour l'envoie vers la routine principale
	ld		hl,SPRH0_Y
	ld		(SPRH_Y),hl
	ld		hl,BOOM2_SPRH_ROM_ADR
	ld		(BoomGoldorakSprhRomAdr),hl
	xor		a
	ld		(BoomGoldorakTimerAdr),a
; suppression du test de touche de goldorak
	ld		(event_test_de_goldorak),a
	ld		(event_test_de_goldorak+1),a
	ld		(event_test_de_goldorak+2),a
; creation de l'évenement goldorak boom	
	ld		a,_CALL			; call
	ld		(event_normal_goldorak_boom),a
	ld		hl,normal_goldorak_boom
	ld		(event_normal_goldorak_boom+1),hl
; on bloque la boucle de rachaichissement des sprite de goldorak
	ld		a,_CALL							; JP pas_de_scroll_hard
	ld		(event_boucle_2_joueurs),a
	ld		hl,boucle_principale
	ld		(event_boucle_2_joueurs+1),hl
	
	
	ld 		a,SFX_BOOM	;Sound effect number (>=1)
    ld 		c,0					;channel (0-2)
    ld 		b,0 					;Inverted volume (0-16)
    call 	PLY_AKG_PlaySoundEffect
	ret
	
normal_goldorak_boom
	RST		ASIC_CONNEXION
	ld		a,(BoomGoldorakEtp)
	cp		a,0
	jp		nz,animation_normal_goldorak_boom
	inc		a
	ld		(BoomGoldorakEtp),a
	ret
animation_normal_goldorak_boom
; il se déplace quand même
	ld		hl,SPRH1_Y	; on recupère l'adresse du sprite hard
	inc		(hl)			; on décrementente l'interieur pour donner un effert de recul
	ld		hl,SPRH3_Y	; on recupère l'adresse du sprite hard
	inc		(hl)			; on décrementente l'interieur pour donner un effert de recul
	ld		hl,SPRH2_Y	; on recupère l'adresse du sprite hard
	inc		(hl)			; on décrementente l'interieur pour donner un effert de recul
	
	
	ld		hl,SPRH0_Y	; on recupère l'adresse du sprite hard
	inc		(hl)			; on décrementente l'interieur pour donner un effert de recul
	ld		e,(hl)
	inc		hl
	ld		d,(hl)
	ld		(posy_goldorak),de

; on utilise un compteur pour gérer la vitesse d'enchainement des sprite booom
	ld		a,(BoomGoldorakTimerAdr)
	inc		a
	ld		(BoomGoldorakTimerAdr),a
	cp		a,6
	ret		nz
	xor		a
	ld		(BoomGoldorakTimerAdr),a
	
	ld		c,BANK16_BOOM_SPRH
	RST 	UPPER_ROM_CONNEXION
	RST		ASIC_CONNEXION
	ld		hl,(BoomGoldorakSprhRomAdr)
	push	hl
	ld		de,SPRH0_ADR
	ld		bc,#100
	LDIR
	pop		hl
	push	hl
	inc		h
	ld		de,SPRH2_ADR
	ld		bc,#100
	LDIR
	
	pop		hl
	inc		h
	ld		a,h
	cp		a,#d0
	jr		z,normal_goldorak_detruit
	inc		h
	ld		(BoomGoldorakSprhRomAdr),hl
	
; on eteind le sprite hard de goldorak
	xor		a
	ld		(valeur_zoom_sprh1),a
	ld		(SPRH1_ZOOM),a
	ld		(valeur_zoom_sprh3),a
	ld		(SPRH3_ZOOM),a
	
	ld		a,zoom_mode0_1
	ld		(SPRH0_ZOOM),a
	ld		(valeur_zoom_sprh0),a
	ld		(SPRH2_ZOOM),a
	ld		(valeur_zoom_sprh2),a
	call	rom_off
	ret
normal_goldorak_detruit
	xor		a
; on eteind le sprite hard de goldorak
	ld		(valeur_zoom_sprh0),a
	ld		(SPRH0_ZOOM),a
	ld		(valeur_zoom_sprh1),a
	ld		(SPRH1_ZOOM),a
	ld		(valeur_zoom_sprh2),a
	ld		(SPRH2_ZOOM),a
	ld		(valeur_zoom_sprh3),a
	ld		(SPRH3_ZOOM),a
	ld		(event_normal_goldorak_boom),a
	ld		(event_normal_goldorak_boom+1),a
	ld		(event_normal_goldorak_boom+2),a
	
	jp		fin_du_level ; fin du level à partir du moment où goldorak est détruit
	
	ret







