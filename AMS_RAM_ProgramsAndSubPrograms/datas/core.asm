; //////////////////////////////////////////////////////////////////
; /////////////////////        MOTEUR DU JEU    ////////////////////
; //////////////////////////////////////////////////////////////////
; connexion asic, rom et mode
valeur_asic					ds		1,0
rom_sectionnee				ds		2,0
etat_de_la_rom				ds		2,0
etat_du_mode				ds		2,0
mode						ds		1,0
etat_roms_mode				ds		2,0
resultat_test_de_touche		ds		1,0
resultat_test_de_touche_cpcplus		ds		1,0

no_de_la_musique		ds			1,0
isMusicOn			ds			1,0	


bank_du_hud_a_goldo_ou_alco ds      2,0
flag_on_joue_avec_alcorak   ds      1,0
bank_goldo_ou_alco          ds      1,0
bank_level					ds		2,0
bank_tileset				ds		2,0
adr_screen_level			ds		2,0
pointeur_de_tile			ds		2,0
flipscroll					ds		1,0
pallette_level				ds		2,0
pointeur_TblPosCurseur		ds		2,0
Sprh_Cursor					ds		2,0
Selection_ArmeCurseur		ds		2,0
flag_Curseur				ds		1,0
retenue_poidfort			ds		1,0
Adr_CaseEcran				ds		2,0
Curseur_Choix				ds		1,0
ChoixNouvelleArme			ds		1,0
adr_hud_font				ds		2,0





valeur_zoom
valeur_zoom_sprh0		ds	1,0
valeur_zoom_sprh1		ds	1,0
valeur_zoom_sprh2		ds	1,0
valeur_zoom_sprh3		ds	1,0
valeur_zoom_sprh4		ds	1,0
valeur_zoom_sprh5		ds	1,0
valeur_zoom_sprh6		ds	1,0
valeur_zoom_sprh7		ds	1,0
valeur_zoom_sprh8		ds	1,0
valeur_zoom_sprh9		ds	1,0
valeur_zoom_sprh10		ds	1,0
valeur_zoom_sprh11		ds	1,0
valeur_zoom_sprh12		ds	1,0
valeur_zoom_sprh13		ds	1,0
valeur_zoom_sprh14		ds	1,0
valeur_zoom_sprh15		ds	1,0


valeur_retard				ds		1,0
valeur_crtc					ds		2,0
valeur_offset				ds		2,0
pointeur_ecran				ds		2,0
vitesse_scroll				ds		1,0
etape_vitesse				ds		1,0
flag_crtc					ds		1,0


