alcorakPuzzleArray
    dw ALCORAK_PUZZLE_3, ALCORAK_PUZZLE_4, ALCORAK_PUZZLE_5, ALCORAK_PUZZLE_6
    dw ALCORAK_PUZZLE_7, ALCORAK_PUZZLE_8, ALCORAK_PUZZLE_2,ALCORAK_PUZZLE_1
    dw #FFFF

alcorakPuzzleStep ds 1,0
alcorakPuzzlePointer ds 2,0


puzzlePosX ds 2,0
puzzlePosY ds 2,0
isAlcorakDsiplay ds 1,0
toggleAlcorakStep ds 1,0
zoomValueArrayPointer ds 2,0
zoom_state ds 1,0


zoomValueArray
    dw  valeur_zoom_sprh10, valeur_zoom_sprh11, valeur_zoom_sprh12, valeur_zoom_sprh13, valeur_zoom_sprh14, valeur_zoom_sprh15, valeur_zoom_sprh9, valeur_zoom_sprh8