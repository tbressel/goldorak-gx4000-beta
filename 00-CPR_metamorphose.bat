C:
cd C:\Users\Utilisateur\Documents\GoldorackGX\
rasm_w32 contenu_cartouche\maptiles\goldo1.asm -ob contenu_cartouche\maptiles\goldo1.prg
rasm_w32 contenu_cartouche\maptiles\goldo2.asm -ob contenu_cartouche\maptiles\goldo2.prg
rasm_w32 contenu_cartouche\maptiles\goldo3.asm -ob contenu_cartouche\maptiles\goldo3.prg
rasm_w32 contenu_cartouche\maptiles\goldo4.asm -ob contenu_cartouche\maptiles\goldo4.prg
rasm_w32 contenu_cartouche\maptiles\goldo5.asm -ob contenu_cartouche\maptiles\goldo5.prg
rasm_w32 contenu_cartouche\maptiles\goldo6.asm -ob contenu_cartouche\maptiles\goldo6.prg
rasm_w32 contenu_cartouche\maptiles\goldo7.asm -ob contenu_cartouche\maptiles\goldo7.prg
rasm_w32 contenu_cartouche\maptiles\goldo8.asm -ob contenu_cartouche\maptiles\goldo8.prg



rasm_w32 01-CPR_initialisation.asm -sw -sq -o ./goldoGX
C:\Users\Utilisateur\Documents\GoldorackGX\WinAPE20B2\WinApe.exe  /sym:goldogx.sym goldogx.cpr
cmd


