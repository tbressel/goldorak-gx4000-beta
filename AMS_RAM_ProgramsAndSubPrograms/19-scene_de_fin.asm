alcorak

    ld a,(endingSceneSpritesStep)
    cp a,0
    jr z,initSceneSprites
    cp a,1
    jr z,displaySceneSprites
    cp a,2
    jp z,isGoldorakMoves
    cp a,3
    jp z,alcorakMoves
    cp a,4
    jp z,isAlcorakTouchGoldorak
    cp a,5
    jp z,actarusSpeaking
    cp a,6
    jp z,goAheadBoth



; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////   INITIALISATION DES SRPITES    ///////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
initSceneSprites
    inc a
    ld (endingSceneSpritesStep),a

; Copie des sprites de l'alcorak et des portraits
    CALL ASIC_CONNEXION
    ld c,BANK15_PORTRAITS
    CALL UPPER_ROM_CONNEXION

    ld hl,ALCORAK_HAUTBAS_SPRH_ROM_ADR
    ld de,SPRH4_ADR
    ld bc,#400
    LDIR
    ld hl,PORTRAIT_ACTARUS_HAUT
    ld de,SPRH8_ADR
    ld bc,#200
    LDIR
    ld hl,PORTRAIT_ACTARUS_BAS
    ld de,SPRH10_ADR
    ld bc,#200
    LDIR
    ld hl,PORTRAIT_ALCOR_HAUT
    ld de,SPRH12_ADR
    ld bc,#200
    LDIR
    ld hl,PORTRAIT_ALCOR_BAS
    ld de,SPRH14_ADR
    ld bc,#200
    LDIR


; Copie de la palette des portraits
    ld c,BANK8_FONTES
    CALL UPPER_ROM_CONNEXION
    ld hl,PALETTE_ACTARUS_ALCOR
    ld de,PALETTE_SPRH
    ld bc,32
    LDIR

    call rom_off
    jp ASIC_DECONNEXION
    



; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////     AFFICHAGE DES SRPITES       ///////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
displaySceneSprites
    inc a
    ld (endingSceneSpritesStep),a

    CALL ASIC_CONNEXION
    ld c,BANK_ROM_2
    call UPPER_ROM_CONNEXION
    call displaySceneSprites_ROM
    call rom_off
    jp ASIC_DECONNEXION
    


; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////  SI GOLDORAK DOIT SE REPLACER   ///////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////


isGoldorakMoves
    CALL ASIC_CONNEXION
; on verifie de quel coté de l'écran se situe goldorak
    ld hl,(SPRH0_X)
    ld de,220
    sbc hl,de
    jr  c,goldorakMovesLeft 
    ld a,(endingSceneSpritesStep)
    inc a
    ld (endingSceneSpritesStep),a
    ret
return_goldorakMoves
    call goldorakMovesUpdate
    ret
goldorakMovesLeft
    ld hl,(posx_goldorak)
    inc hl : inc hl
    ld (posx_goldorak),hl
    jr return_goldorakMoves
goldorakMovesUpdate	
	ld		hl,(posx_goldorak)
	ld		(SPRH0_X),hl			; sprite 0 X
	ld		(#6010),hl			; sprite 2 X
	ld		de,32+32
	add		hl,de
	ld		(#6008),hl			; sprite 1 X
	ld		(#6018),hl			; sprite 3 X
	ld		hl,(posy_goldorak)
	ld		(SPRH0_Y),hl			; sprite 0 Y
	ld		(#600A),hl			; sprite 1 Y
	ld		de,16
	add 	hl,de
	ld		(#6012),hl			; sprite 2 Y
	ld		(#601A),hl			; sprite 3 Y
	ret



; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////   ALCORAK REJOIND GOLDORAK      ///////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////

alcorakMoves

     ld c,BANK_ROM_2
    call UPPER_ROM_CONNEXION
    call alcorakMoves_ROM
    call rom_off
    ret




; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////   SI LES DEUX SOUCOUPES SE CHEVAUCHENT   ////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////


isAlcorakTouchGoldorak
 CALL ASIC_CONNEXION
  ld c,BANK_ROM_2
    call UPPER_ROM_CONNEXION
    call isAlcorakTouchGoldorak_ROM
    call rom_off
    ret





; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////   SI LES DEUX SOUCOUPES SE CHEVAUCHENT   ////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////


actarusSpeaking
    inc a
    ld (endingSceneSpritesStep),a
    call	RAM_COPY_SAMPLES_FIN
	ld		a,_CALL
	ld		(event_playsample),a
	ld		hl,Sample
	ld		(event_playsample+1),hl
    xor      a
    ld       (switchtheend),a
    ret


switchtheend ds 1,0

goAheadBoth
    ld c,BANK_ROM_2
    call UPPER_ROM_CONNEXION
    call goAheadBoth_ROM
    call rom_off
    ret


endingSceneSpritesStep ds 1,0
alocorak_posY ds 2,0
alocorak_posX ds 2,0
isShipsAreGone ds 1,0

