C:
cd C:/Users/Zisquier/Documents\Projets\Amstrad\2023_goldorak-gx4000\v0.1-beta
rasm_x64 CPR_ASSETS\maptiles\goldo1.asm -ob CPR_ASSETS\maptiles\goldo1.prg
rasm_x64 CPR_ASSETS\maptiles\goldo2.asm -ob CPR_ASSETS\maptiles\goldo2.prg
rasm_x64 CPR_ASSETS\maptiles\goldo3.asm -ob CPR_ASSETS\maptiles\goldo3.prg
rasm_x64 CPR_ASSETS\maptiles\goldo4.asm -ob CPR_ASSETS\maptiles\goldo4.prg
rasm_x64 CPR_ASSETS\maptiles\goldo5.asm -ob CPR_ASSETS\maptiles\goldo5.prg
rasm_x64 CPR_ASSETS\maptiles\goldo6.asm -ob CPR_ASSETS\maptiles\goldo6.prg
rasm_x64 CPR_ASSETS\maptiles\goldo7.asm -ob CPR_ASSETS\maptiles\goldo7.prg
rasm_x64 CPR_ASSETS\maptiles\goldo8.asm -ob CPR_ASSETS\maptiles\goldo8.prg
rasm_x64 CPR_ASSETS\maptiles\goldospace.asm -ob CPR_ASSETS\maptiles\goldospace.prg


rasm_x64 .\CPR_ROM_Programs\01-CPR_initialisation.asm -sw -sq -o ../WinAPE20B2_betatest_goldorack/GoldorakGX4000_v0.1beta

C:/Users/Zisquier/Documents/Projets/Amstrad/2023_goldorak-gx4000/WinAPE20B2_betatest_goldorack/WinApe.exe /sym:C:/Users/Zisquier/Documents/Projets/Amstrad/2023_goldorak-gx4000/WinAPE20B2_betatest_goldorack/GoldorakGX4000_v0.1beta.sym C:/Users/Zisquier/Documents/Projets/Amstrad/2023_goldorak-gx4000/WinAPE20B2_betatest_goldorack/GoldorakGX4000_v0.1beta.cpr


cmd

::rasm_x64 ./CPR_ROM_Programs/01-CPR_initialisation.asm -sw -sq -o ./goldoGX -rasm -ec



