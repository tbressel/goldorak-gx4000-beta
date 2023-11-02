#! /bin/bash

RASM_PATH="/home/thomasbressel/Documents/Projet/Projets/Amstrad/2023_goldorak-gx4000/v4.0-alpha/"
ACE_PATH="/home/thomasbressel/Documents/Projet/Projets/Amstrad/2023_goldorak-gx4000/AceDL_Linux_BND/"

$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldo1.asm -ob ./CPR_ASSETS/maptiles/goldo1.prg
$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldo2.asm -ob ./CPR_ASSETS/maptiles/goldo2.prg
$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldo3.asm -ob ./CPR_ASSETS/maptiles/goldo3.prg
$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldo4.asm -ob ./CPR_ASSETS/maptiles/goldo4.prg
$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldo5.asm -ob ./CPR_ASSETS/maptiles/goldo5.prg
$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldo6.asm -ob ./CPR_ASSETS/maptiles/goldo6.prg
$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldo7.asm -ob ./CPR_ASSETS/maptiles/goldo7.prg
$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldo8.asm -ob ./CPR_ASSETS/maptiles/goldo8.prg
$RASM_PATH/rasm.exe ./CPR_ASSETS/maptiles/goldospace.asm -ob ./CPR_ASSETS/maptiles/goldospace.prg

$RASM_PATH/rasm.exe CPR_ROM_Programs/01-CPR_initialisation.asm -sw -sq -o ./goldoGX -rasm -ec

$ACE_PATH/AceDL ../goldogx.cpr ../goldogx.rasm