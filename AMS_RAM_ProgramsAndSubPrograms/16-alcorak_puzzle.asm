alcorak_puzzle

    call ASIC_CONNEXION

    ld a,(alcorakPuzzleStep)
    or a
    jr z,initAlcorakPuzzle

    jr toggleAlcorakDisplay

initAlcorakPuzzle
    inc a
    ld (alcorakPuzzleStep),a

; connection de la bank
    ld c,BANK15_PUZZLE
    call UPPER_ROM_CONNEXION

; permet de stocker l'adresse de la pièce du laquelle on pointe
    ld hl,alcorakPuzzleArray
    ld (alcorakPuzzlePointer),hl

    ld hl,ALCORAK_PUZZLE_START
    ld de,SPRH8_ADR
    ld bc,#800
    LDIR
    call rom_off


    ld a,1
    ld (isAlcorakDsiplay),a

    ld a,8
    ld (toggleAlcorakStep),a

    ld      hl,200
    ld      (puzzlePosX),hl
    ld      hl,50
    ld      (puzzlePosY),hl

    call    updateAlcorakPuzzle

    jp ASIC_DECONNEXION
    

toggleAlcorakDisplay


    ld  a,(level_en_cours)
    cp  a,4
    jr  z,on_zap_goldorakMove
    cp  a,8
    jr  z,on_zap_goldorakMove
    ld hl,(posy_goldorak)
    dec hl
    ld (posy_goldorak),hl  
    call goldorakMovesUpdate

on_zap_goldorakMove

    ld a,(toggleAlcorakStep)
    dec a
    ld (toggleAlcorakStep),a
    ret nz

   ld a,8
    ld (toggleAlcorakStep),a

    call ASIC_CONNEXION

    ld a,(isAlcorakDsiplay)
   or a
    jr nz,turnAlcorakOff

    jr turnAlcorakOn 

turnAlcorakOff
    xor a
     ld (isAlcorakDsiplay),a
    jr  switchAlcorakPuzzle
turnAlcorakOn

    ld a,1
    ld (isAlcorakDsiplay),a

    ld  a,zoom_mode0_1

  jr  switchAlcorakPuzzle

switchAlcorakPuzzle

ld (zoom_state),a

; je créer un pointeur qui va cibler mon tableau d'adresse
    ld hl,zoomValueArray
    ld (zoomValueArrayPointer),hl

; je récupère le numero du level en cours
    ld a,(level_en_cours)

; je m'en sert de compteur : exemple si je suis au level 3, je devrait boucler 3 fois pour lire les 3 première adresse et allumer les 3 premier sprite
    ld b,a
; je récupère mon pointeur
    ld hl,(zoomValueArrayPointer)
zoomValuePuzzleLoop
; je recupère dans DE la valeur contenu à l'adresse du pointeur
    ld e,(hl)
    inc hl
    ld d,(hl)  ; DE contient l'adresse à laquelle je doit envoyer ma valeur

    ld a,(zoom_state)
    ld (de),a

    inc hl

    dec b
    jr nz, zoomValuePuzzleLoop




    jp ASIC_DECONNEXION
    


updateAlcorakPuzzle

ld      c,BANK_ROM_2
call    UPPER_ROM_CONNEXION
call    updateAlcorakPuzzle_ROM
call    rom_off
ret

