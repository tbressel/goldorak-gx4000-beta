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

    CALL ASIC_DECONNEXION
    call rom_off
    ret



; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////     AFFICHAGE DES SRPITES       ///////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
displaySceneSprites
    inc a
    ld (endingSceneSpritesStep),a

    CALL ASIC_CONNEXION

; placement du portrait d'actarus
    ld hl,8
    ld (SPRH8_X),hl
    ld (SPRH10_X),hl
    ld de,4
    ld (SPRH8_Y),de
    ld (SPRH9_Y),de
    ld bc,32
    add hl,bc
    ld (SPRH9_X),hl
    ld (SPRH11_X),hl
    ld bc,16
    ex hl,de
    add hl,bc
    ld (SPRH10_Y),hl
    ld (SPRH11_Y),hl
    ex de,hl

; placement du portrait d'actarus
    ld hl,440
    ld (SPRH12_X),hl
    ld (SPRH14_X),hl
    ld de,4
    ld (SPRH12_Y),de
    ld (SPRH13_Y),de
    ld bc,32
    add hl,bc
    ld (SPRH13_X),hl
    ld (SPRH15_X),hl
    ld bc,16
    ex hl,de
    add hl,bc
    ld (SPRH14_Y),hl
    ld (SPRH15_Y),hl
    ex de,hl

; placement de l'Alcorak
    ld hl,200
    ld (alocorak_posX),hl
    ld de,220
    ld (alocorak_posY),de

    call alcorakMovesUpdate

; affichage des srpites
    ld a,zoom_mode0_1
    ld (SPRH4_ZOOM),a : ld	(valeur_zoom+4),a
    ld (SPRH5_ZOOM),a : ld	(valeur_zoom+5),a
    ld (SPRH6_ZOOM),a : ld	(valeur_zoom+6),a
    ld (SPRH7_ZOOM),a : ld	(valeur_zoom+7),a

    ld a,zoom_mode1_1

    ld (SPRH8_ZOOM),a    : ld	(valeur_zoom+8),a
    ld (SPRH9_ZOOM),a       : ld	(valeur_zoom+9),a
    ld (SPRH10_ZOOM),a  : ld	(valeur_zoom+10),a
    ld (SPRH11_ZOOM),a  : ld	(valeur_zoom+11),a
    ld (SPRH12_ZOOM),a  : ld	(valeur_zoom+12),a
    ld (SPRH13_ZOOM),a  : ld	(valeur_zoom+13),a
    ld (SPRH14_ZOOM),a  : ld	(valeur_zoom+14),a
    ld (SPRH15_ZOOM),a  : ld	(valeur_zoom+15),a
    CALL ASIC_DECONNEXION
    ret


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
; on décremente la position Y de l'alcorak 
    ld de,(alocorak_posY)
    dec de
    ld (alocorak_posY),de

; on calcule pour savoir de quel coté on va déplacer l'Alcorak en fonction du placement de Goldorak à l'écran
    ld bc,(posx_goldorak)
    ld hl,220               ; coordonnée qui correspond au milieu X de l'écran
    sbc hl,bc
    jr nc,alcorakTurnLeft   ; si 220 - pox_goldorak n'est pas négatif alors l'alcorak va à gauche
    jr alcorakTurnRight

return_alcorakTurn
; on met à jour les coordonnées des sprites hard avec la position calculée
    call alcorakMovesUpdate

; on continu de bouger jusqu'à ce que Y de l'alcorak soit supérieur a Y de Goldorak
    ld de,(posy_goldorak)
    ld hl,(alocorak_posY)
    sbc hl,de
    ret nc

; Si Y de l'alcorak est supérieur a Y de Goldorak on passe à l'étape suivante
    ld a,(endingSceneSpritesStep)
    inc a
    ld (endingSceneSpritesStep),a
    ret


alcorakTurnLeft
    ld hl,(alocorak_posX)
    dec hl
    ld (alocorak_posX),hl
    jr return_alcorakTurn

alcorakTurnRight
    ld hl,(alocorak_posX)
    inc hl
    ld (alocorak_posX),hl
    jr return_alcorakTurn



; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////   SI LES DEUX SOUCOUPES SE CHEVAUCHENT   ////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////


isAlcorakTouchGoldorak
 CALL ASIC_CONNEXION

; on calcule pour savoir qui les soucoupe ne se chevauchent pas
    ld hl,(SPRH0_X) ; position X de l'ail gauche de goldorak     
    ld de,(SPRH5_X) ; position X de l'ail droite de l'alcorak
    
    ld bc,64        ; on va chercher la coordonnée 64 pixel plus loin à droite
    ex de,hl
    add hl,bc
    ex hl,de

    sbc hl,de        
    jr c,alcorakMovesLeft

    ; ld de,(SPRH1_X) ; position X de l'ail droite de goldorak     
    ; ld hl,(SPRH4_X) ; position X de l'ail gauche de l'alcorak
    ; sbc hl,de        
    ; jr c,alcorakMovesRight


    ; si les soucoupes ne se chavauche pas on passe à l'étape suivante
    ld a,(endingSceneSpritesStep)
    inc a
    ld (endingSceneSpritesStep),a
    ret

return_alcorakMoves
; on met à jour les coordonnées des sprites hard avec la position calculée
    ld  hl,(alocorak_posX)
    ld  de,(alocorak_posY)

    call alcorakMovesUpdate
    ret

alcorakMovesLeft
    ld hl,(alocorak_posX)
    dec hl : dec hl
    ld (alocorak_posX),hl
    jr return_alcorakMoves

alcorakMovesRight
    ld hl,(alocorak_posX)
    inc hl : inc hl
    ld (alocorak_posX),hl
    jr return_alcorakMoves

; placement de l'Alcorak
alcorakMovesUpdate
        CALL ASIC_CONNEXION

    ld (SPRH4_X),hl
    ld (SPRH6_X),hl
 
    ld (SPRH4_Y),de
    ld (SPRH5_Y),de
    ld bc,64
    add hl,bc
    ld (SPRH5_X),hl
    ld (SPRH7_X),hl
    ld bc,16
    ex hl,de
    add hl,bc
    ld (SPRH6_Y),hl
    ld (SPRH7_Y),hl
    ex de,hl
ret


; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////   SI LES DEUX SOUCOUPES SE CHEVAUCHENT   ////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////


actarusSpeaking
    inc a
    ld (endingSceneSpritesStep),a
    call sample_on
    ld a,0
    ld (switchtheend),a
    ret


switchtheend ds 1,0

goAheadBoth

ld a,(switchtheend)
cp a,0
call z,theEndOfThisGame


    ; ld a,(isShipsAreGone)
    ; cp a,1
    ; jp z,theEndOfThisGame

    ld a,1
    ld (fini),a

; on fait partir l'alcorak vers le haut
    ld hl,(alocorak_posX)
    dec hl : dec hl
    dec hl : dec hl
    ld (alocorak_posX),hl  

    ld de,(alocorak_posY)
    dec de : dec de
    dec de : dec de
    dec de : dec de
    ld (alocorak_posY),de 
    call alcorakMovesUpdate

; on fait partir goldorak
    ld hl,(posx_goldorak)
    inc hl : inc hl
    inc hl : inc hl
    ld (posx_goldorak),hl  

      ld hl,(posy_goldorak)
    dec hl : dec hl
    dec hl : dec hl
    dec hl : dec hl
    ld (posy_goldorak),hl  
    call goldorakMovesUpdate


; ld hl,(alocorak_posY)
; ld bc,32
; ld de,0
; add hl,bc

; ex hl,de
; sbc hl,de
; ex hl,de
; jr nc,alcorakIsGone

; ld hl,(posy_goldorak)
; ld bc,32
; ld de,0
; add hl,bc
; ex hl,de
; sbc hl,de
; ex hl,de
; jr nc,goldorakIsGone



    ret

; goldorakIsGone
;     ld a,1
;     ld (isShipsAreGone),a
;     ret

; alcorakIsGone
;     ld a,1
;     ld (isShipsAreGone),a
;     ret


theEndOfThisGame
    inc a
    ld (switchtheend),a
    xor a
    ld (flag_bigboss),a
	; ld 		(event_alcorak),a
	; ld		(event_alcorak+1),a	
	; ld		(event_alcorak+2),a


                    ld		a,_CALL						; call
					ld		(event_fade_out),a
					ld		hl,fondu_de_sortie
					ld		(event_fade_out+1),hl
    ret


endingSceneSpritesStep ds 1,0
alocorak_posY ds 2,0
alocorak_posX ds 2,0
isShipsAreGone ds 1,0

