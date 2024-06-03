 org #c000
include "./datas/waves.asm"
; include "./datas/waves_test.asm"
include "./datas/moves.asm"
include "./datas/hud.asm"
include "./hud/powerup.asm"

include		"09_bis-armes_fireA_ROM.asm"
include		"11_bis-vagues_ennemis_ROM.asm"
include		"19_bis-scene_de_fin_ROM.asm"
include     "17_bis-bigboss_animations_ROM.asm"





updateAlcorakPuzzle_ROM
xor a
	ld		(SPRH4_ZOOM),a
		ld		(SPRH5_ZOOM),a
		ld		(valeur_zoom_sprh4),a
		ld		(valeur_zoom_sprh5),a

    ld hl,(puzzlePosX)
    
    ld (SPRH8_X),hl
    ld (SPRH9_X),hl
    ld (SPRH10_X),hl
    ld (SPRH11_X),hl


    ld de,-32
    add hl,de
    ld (SPRH12_X),hl
    ld (SPRH13_X),hl

    ld de,64
    add hl,de
    ld (SPRH14_X),hl
    ld (SPRH15_X),hl

    ld hl,(puzzlePosY)
    ld (SPRH8_Y),hl

    ld de,16    
    add hl,de
    ld (SPRH9_Y),hl

    ld de,16    
    add hl,de
    ld (SPRH10_Y),hl
    ld (SPRH12_Y),hl
    ld (SPRH14_Y),hl

    ld de,16    
    add hl,de
    ld (SPRH11_Y),hl
    ld (SPRH13_Y),hl
    ld (SPRH15_Y),hl
    ret


updateBigboss_final__XY_ROM
	ld (SPRH6_Y),hl
	ld (SPRH7_Y),hl
	ld (SPRH8_Y),hl
	ld	bc,16
	add	hl,bc
	ld (SPRH11_Y),hl
	ld (SPRH9_Y),hl
	ld (SPRH12_Y),hl
	ld	bc,16
	add	hl,bc
	ld (SPRH13_Y),hl
	ld (SPRH10_Y),hl
	ld (SPRH14_Y),hl			
	ex hl,de
	ld (SPRH6_X),hl
	ld (SPRH11_X),hl
	ld (SPRH13_X),hl
	ld	bc,64
	add	hl,bc
	ld (SPRH7_X),hl
	ld (SPRH9_X),hl
	ld (SPRH10_X),hl
	ld	bc,64
	add	hl,bc
	ld (SPRH8_X),hl
	ld (SPRH12_X),hl
	ld (SPRH14_X),hl
	ex hl,de
	ret


updateBigboss_replace_XY2_ROM
	ld 		(SPRH6_Y),hl
	ld 		(SPRH7_Y),hl
	ld 		(SPRH8_Y),hl
	ld		bc,16
	add		hl,bc
	ld 		(SPRH9_Y),hl
	ld 		(SPRH10_Y),hl
	ld 		(SPRH11_Y),hl
	ld		bc,16
	add		hl,bc
	ld 		(SPRH12_Y),hl
	ld 		(SPRH13_Y),hl
	ld 		(SPRH14_Y),hl			
	ex 		hl,de
	ld 		(SPRH6_X),hl
	ld 		(SPRH9_X),hl
	ld 		(SPRH12_X),hl
	ld		bc,64
	add		hl,bc
	ld 		(SPRH7_X),hl
	ld 		(SPRH10_X),hl
	ld 		(SPRH13_X),hl
	ld		bc,64
	add		hl,bc
	ld 		(SPRH8_X),hl
	ld 		(SPRH11_X),hl
	ld 		(SPRH14_X),hl
	ex 		hl,de
	ret
