
; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
; //////////////// ENVOIE DES FICHIERS DANS LES ROMS ////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////




; ///////////////////////////////////////////////////////////////////////////////
; ////////////////////////////// LE PROGRAMME  //////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
bank 1
	include"../AMS_RAM_ProgramsAndSubPrograms/04-Programme.asm"
bank 2
	include"../CPR_ROM_SubPrograms/04_bis-Programme_ROM.asm"

; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////// LA MUSIQUE //////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////	

; la bank 3 est assemblé à la fin dufichier Programme.asm






; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////////////// LES TILESETS ////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
bank 5
		incbin "../CPR_ASSETS/gfx/tileset1.imp"   ; contient le niveau 1 et 2
bank 6
		incbin "../CPR_ASSETS/gfx/tileset2.imp"	;  tileset des niveaux 3,4,5
bank 7
		incbin "../CPR_ASSETS/gfx/tileset4.imp"; tileset des niveaux 6, 7 et 8

; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////// LES HUDS & PALETTES /////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
bank 8
org	#C000
	incbin "../CPR_ASSETS/gfx/hudtoto.imp"
	incbin "../CPR_ASSETS/gfx/button.imp"
org	DEPART_PALETTES	
; title screen
	org PALETTE_TITLE_SCREEN
		; DW		#000,#008,#0F0,#8F0,#FF0,#FFF,#FF8,#888,#080,#555,#44A,#00F,#aaa,#03A,#80F,#888
		dw #000,#080,#0F0,#008,#00F,#08F,#0FF,#8F0,#808,#888,#80F,#FF0,#F08,#FF8,#F8F,#FFF
; le scenario
	org PALETTE_SCENARIO
		DW		#FFF,#000,#666,#006,#40f,#b0d,#f3f,#cb7,#ee7,#060,#0e0,#9f4,#b67,#e57,#48c,#5ff
; game over
	org PALETTE_GAME_OVER
		DW 		#000,#020,#050,#080,#0F0,#001,#002,#004,#005,#008,#08F,#0FF,#8F0,#80F,#F8F,#FFF
; sprites hard
	org PALETTE_SPRITE_HARD
		dw 		#0f0,#000,#00b,#ff0,#f3f,#72f,#fff,#b0d,#0a0,#9f4,#ff7,#d08,#666,#48c,#07f
; decors  (le level par defaut)
	org PALETTE_DECORS
	dw #000,#0F0,#00F,#07F,#121,#251,#3A2,#700,#8F0,#B00,#D70,#EA3,#ED3,#FF3,#F0F,#FEF



; la fin
	org PALETTE_FIN
		dw #000,#080,#001,#003,#004,#006,#01D,#1D2,#6D2,#606,#61D,#BD2,#BD8,#B9D,#BDD,#FFE
; entre les level
	org PALETTE_INTERLEVEL
	dw #000,#000,#0F0,#008,#00F,#0FF,#8F0,#808,#888,#80F,#FF0,#FF8,#F8F,#FFF,#FFF,#FFF

; hud
	org PALETTE_HUD
		db #ff,#0f,#00,#00,#66,#06,#77,#07
		db #99,#09,#bb,#0b,#dd,#0d,#05,#08
		db #07,#08,#00,#06,#70,#05,#c0,#00
		db #d2,#07,#d4,#0d,#8c,#04,#ff,#05
; menu
	org	PALETTE_MENU
	db #00,#00,#06,#00,#0f,#00,#60,#00
	db #68,#06,#f0,#00,#88,#08,#06,#06
	db #0f,#06,#6f,#06,#f0,#06,#06,#0f
	db #6f,#0f,#f0,#0f,#f6,#0f,#ff,#0f
; credit
	org PALETTE_CREDIT
	dw #000,#0F0,#00F,#0FF,#8F0,#808,#888,#80F,#FF0,#F08,#FF8,#F8F,#FFF,#FFF,#FFF,#FFF
; metamorphose
	org PALETTE_METAMORPHOSE
; db #00,#00,#bb,#0a,#ff,#0f,#e0,#00
; db #f0,#0a,#f0,#0f,#b0,#0b,#00,#0f
; db #78,#07,#56,#05,#7e,#0e,#0f,#00
; db #0c,#00,#08,#00,#90,#00,#f8,#06

dw #000,#080,#0F0,#008,#00F,#08F,#0FF,#8F0,#808,#888,#80F,#FF0,#FF8,#F8F,#FFF,#FFF




; shop
org PALETTE_SHOP
dw #000,#080,#0F0,#008,#00F,#08F,#8F0,#808,#888,#80F,#FF0,#F08,#FF8,#F8F,#FFF,#FFF

; crocofest

org	PALETTE_ACTARUS_ALCOR
db #44,#08,#f0,#00,#00,#00,#0b,#00
db #f0,#0f,#3f,#0f,#2f,#07,#ff,#0f
db #0d,#0b,#80,#02,#f4,#09,#d8,#0f
db #31,#03,#77,#07,#d8,#0b,#7f,#00

; FONTE
	org HUD_DEPART_FONTES
	incbin "../CPR_ASSETS/gfx/fontesok.bin"

	incbin "../CPR_ASSETS/gfx/fonthud.bin"

	incbin "../CPR_ASSETS/gfx/ferme.imp"

; ///////////////////////////////////////////////////////////////////////////////
; ////////////////////// TOUTES LES SPRITES HARD ////////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////
bank 9
	incbin "../CPR_ASSETS/sprites_hard/goldora1.spr"			; sprites Goldorak
bank 10
	incbin "../CPR_ASSETS/sprites_hard/golgoth1.spr"			; golgoth 1,2,3,4,6 + soucoupes
bank 11
	incbin "../CPR_ASSETS/sprites_hard/golgoth2.spr"		; golgoth 7 et 8 (à rajouter) + items et explosion simple à virer
bank 12
	incbin "../CPR_ASSETS/sprites_hard/golgoth3.spr"
bank 13
	incbin "../CPR_ASSETS/sprites_hard/mere1.spr"

bank 15
	incbin "../CPR_ASSETS/sprites_hard/goldora2.spr"			; sprite retournement 
bank 16
 	incbin "../CPR_ASSETS/sprites_hard/explose.spr"		; explosions
	

	
; ///////////////////////////////////////////////////////////////////////////////
; /////////////////////////////// LES ECRANS TITRE  /////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////	
bank 17
	org #c000
		incbin "../CPR_ASSETS/gfx/titlego1.zx0"
	org #d700
		incbin "../CPR_ASSETS/gfx/titlego2.zx0"
	org #e5c0
		incbin "../CPR_ASSETS/gfx/scenario_fond.zx0"
	org #ee40
		incbin "../CPR_ASSETS/gfx/scenario_vignettes1.zx0"
Bank 18
	include "../CPR_ROM_SubPrograms/04_bis-Programme_ROM_suite.asm"

	
Bank 19
	org #c000
		incbin "../CPR_ASSETS/gfx/endgo1.zx0"
	org #E000
		incbin "../CPR_ASSETS/gfx/endgo2.zx0"
bank 20
	org #c000
		incbin "../CPR_ASSETS/gfx/routes.scr"

		
Bank 4
	org #C000
	incbin "../CPR_ASSETS/gfx/menu.scr.zx0"
	org #CF58
	incbin "../CPR_ASSETS/gfx/meta.scr.ZX0"
	org	#E350
	incbin "../CPR_ASSETS/gfx/shop.zx0"
	
; ///////////////////////////////////////////////////////////////////////////////
; ///////////////////////  MAPTILES DES 7 ROUTES  ///////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////		

; !!!!!  8000 / 16000 octets d'utilisé seulement !!!!!!
bank 21
	incbin "../CPR_ASSETS/maptiles/goldo1.prg"

	;  org #df40
		incbin "../CPR_ASSETS/gfx/gameovergo1.zx0"


; !!!!!  9600 / 16000 octets d'utilisé seulement !!!!!!
bank 22
	incbin "../CPR_ASSETS/maptiles/goldo2.prg"

		; org #e580
		 incbin "../CPR_ASSETS/gfx/gameovergo2.zx0"
bank 23
	incbin "../CPR_ASSETS/maptiles/goldo3.prg"
bank 24
	incbin "../CPR_ASSETS/maptiles/goldo4.prg"
bank 25
	incbin "../CPR_ASSETS/maptiles/goldo5.prg"
bank 26
	incbin "../CPR_ASSETS/maptiles/goldo6.prg"
bank 27
	incbin "../CPR_ASSETS/maptiles/goldo7.prg"
bank 14
	incbin "../CPR_ASSETS/maptiles/goldo8.prg"
	
; ///////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////  SAMPLES  ///////////////////////////////
; ///////////////////////////////////////////////////////////////////////////////	
bank 28
	incbin "../CPR_ASSETS/sound/metamorphose.spl"
bank 29
	incbin "../CPR_ASSETS/sound/idargos.spl"
bank 30
	incbin "../CPR_ASSETS/sound/ovetaire.spl"
bank 31
	incbin "../CPR_ASSETS/sound/go.spl"
	incbin "../CPR_ASSETS/maptiles/goldospace.prg"

