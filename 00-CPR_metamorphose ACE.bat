C:
cd C:\Users\stagiaire\Documents\Projets\Amstrad\2023_goldorak-gx4000\v4.0-alpha
rasm_x64 CPR_ASSETS\maptiles\goldo1.asm -ob CPR_ASSETS\maptiles\goldo1.prg
rasm_x64 CPR_ASSETS\maptiles\goldo2.asm -ob CPR_ASSETS\maptiles\goldo2.prg
rasm_x64 CPR_ASSETS\maptiles\goldo3.asm -ob CPR_ASSETS\maptiles\goldo3.prg
rasm_x64 CPR_ASSETS\maptiles\goldo4.asm -ob CPR_ASSETS\maptiles\goldo4.prg
rasm_x64 CPR_ASSETS\maptiles\goldo5.asm -ob CPR_ASSETS\maptiles\goldo5.prg
rasm_x64 CPR_ASSETS\maptiles\goldo6.asm -ob CPR_ASSETS\maptiles\goldo6.prg
rasm_x64 CPR_ASSETS\maptiles\goldo7.asm -ob CPR_ASSETS\maptiles\goldo7.prg
rasm_x64 CPR_ASSETS\maptiles\goldo8.asm -ob CPR_ASSETS\maptiles\goldo8.prg
rasm_x64 CPR_ASSETS\maptiles\goldospace.asm -ob CPR_ASSETS\maptiles\goldospace.prg



rasm_x64 .\CPR_ROM_Programs\01-CPR_initialisation.asm -sw -sq -o ./goldoGX -rasm -ec
C:\Users\stagiaire\Documents\Projets\Amstrad\2023_goldorak-gx4000\AceDL\AceDL.exe goldogx.cpr goldogx.rasm
cmd


