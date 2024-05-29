include "core.asm"
include "weapons.asm"
include "golgoths.asm"
include "mainships.asm"
include "littleships.asm"
include "goldorak.asm"
include "alcorak.asm"






	
	nbr_de_points				ds		1,0
	nbr_de_vie					ds		1,0
	points_sante				ds		1,0
	
	
	pointeur_tbl_NRJ_bar		ds		2,0
Tbl_NRJ_bar
	dw		HUD_NRJJ1_ECRAN_ADR,HUD_NRJJ1_ECRAN_ADR+1,HUD_NRJJ1_ECRAN_ADR+2,HUD_NRJJ1_ECRAN_ADR+3,HUD_NRJJ1_ECRAN_ADR+4
	dw		HUD_NRJJ1_ECRAN_ADR+5,HUD_NRJJ1_ECRAN_ADR+6,HUD_NRJJ1_ECRAN_ADR+7,HUD_NRJJ1_ECRAN_ADR+8,HUD_NRJJ1_ECRAN_ADR+9

Tbl_NRJ_bar2
	dw		HUD_NRJJ2_ECRAN_ADR,HUD_NRJJ2_ECRAN_ADR+1,HUD_NRJJ2_ECRAN_ADR+2,HUD_NRJJ2_ECRAN_ADR+3,HUD_NRJJ2_ECRAN_ADR+4
	dw		HUD_NRJJ2_ECRAN_ADR+5,HUD_NRJJ2_ECRAN_ADR+6,HUD_NRJJ2_ECRAN_ADR+7,HUD_NRJJ2_ECRAN_ADR+8,HUD_NRJJ2_ECRAN_ADR+9

PowerupBar_ECRAN			ds		2,0
compteur_powerup_niv1		ds		1,0
compteur_powerup_niv2		ds		1,0
CompteurFramePowerUp	ds		1,0
flag_PowerUP	ds		1,0
etp_powerup		ds		1,0
pointeur_tbl_PowerUP_bar	ds		2,0
Tbl_POWERUP_bar
	dw		HUD_DEPART_POWER_UP1+-3,HUD_DEPART_POWER_UP1+-2,HUD_DEPART_POWER_UP1+-1,HUD_DEPART_POWER_UP1
	dw		HUD_DEPART_POWER_UP2+-3,HUD_DEPART_POWER_UP2+-2,HUD_DEPART_POWER_UP2+-1,HUD_DEPART_POWER_UP2

	
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////




posy2						ds		2,0
posx2						ds		2,0
timer						ds		1,0
flag_1up					ds		1,0
flag_goldomode				ds		1,0

bloc_tile					ds		1,0
no_ligne_tile				ds		1,0
BoomSprhRomAdr				ds		 	2,0
timer_BOOM					ds		1,0
pts_BOOM					ds		2,0
points_a_ajouter			ds		2,0
pointeur_tbl_regHUD			ds		2,0

pointeur_chiffre_SCR		ds		2,0
largeur_texte				ds		2,0
pointeur_tbl_vignettes		ds		2,0
adr_chiffre					ds		2,0
largeur_chiffre				ds		1,0

flag_bomb					ds		1,0
etp_scroll_soft_hud			ds		1,0
flag_fireAB					ds		1,0
counter_fireB				ds		1,0
pointeur_bouton				ds		2,0
etp_arrimage				ds		1,0
nbr_de_vie_j2				ds		1,0
HUD_VIEJ1_ECRAN_ADR_SCR		ds		2,0
id_joueur					ds		1,0

pointeur_tbl_NRJ_bar2		ds		2,0

counter_poid_fort			ds		1,0
counter_poid_faible			ds		1,0

anim_arme_a_charger			ds		2,0




flag_SoldeOk			ds	1,0


timer_fade_out			ds	1,0
adr_sample				ds	2,0
sample_counter			ds	1,0
longueur_sample			ds	2,0


Tbl_sprh_direction
dw		0,0,0
Tbl_sprh_direction2
dw		0,0,0	
; 10 000 	: L
; 1 000  	: H
; 100		: E
; 10		: D
; 1			: C	

Counter_score
	;   L,H,E,D,C
	db	0,0,0,0,0
Counter_score2
	;   L,H,E,D,C
	db	0,0,0,0,0

HUD_SCORE_UNITE_ADR_hud							ds		2,0
HUD_SCORE_DIZAINNE_ADR_hud						ds		2,0
HUD_SCORE_CENTAINE_ADR_hud						ds		2,0
HUD_SCORE_MILLIER_ADR_hud						ds		2,0
HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hud			ds		2,0

val_HUD_SCORE_UNITE_ADR_hudJ1					ds		2,0
val_HUD_SCORE_DIZAINNE_ADR_hudJ1				ds		2,0
val_HUD_SCORE_CENTAINE_ADR_hudJ1				ds		2,0
val_HUD_SCORE_MILLIER_ADR_hudJ1					ds		2,0
val_HUD_SCORE_DIZAINE_DE_MILLIER_ADR_hudJ1		ds		2,0


MemoireTamponJoueur_1			ds			8*10,0





sfx_arme						ds		1,0

ArmesDisponible				db			%00000001
;ArmesDisponible				db			%11111111



	
	
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////
; /////////  TABLEAU DES TYPES VAGUES QUI SE SUCCEDENT DANS LE LEVEL 1 ////////
; /////////////////////////////////////////////////////////////////////////////
; /////////////////////////////////////////////////////////////////////////////

; pour le moment ce tableau indiqué 'level 1' est utilisé pour tous les autres level
; chaque TBL_NBR_SOUCOUPES propose 12 vagues successive d'ennemis avant l'apparition du BOSS
; on peut mettre autant de TBL_NBR_SOUCOUPES que l'on souhaite selon la longueur de la map
	
TBL_VAGUES_LEVEL_1
	DW		TBL_NBR_SOUCOUPES
; ----> signale un boss de fin
	DW		#FFFE				
; ----> signale la fin du level	
	DW		#FFFF				
	
TBL_VAGUES_LEVEL_2
 	DW		TBL_NBR_SOUCOUPES2
	DW		#FFFE				
	DW		#FFFF				

TBL_VAGUES_LEVEL_3
	DW		TBL_NBR_SOUCOUPES3
	DW		#FFFE				
	DW		#FFFF				


TBL_VAGUES_LEVEL_4
 	DW		TBL_NBR_SOUCOUPES4
	DW		#FFFE				
	DW		#FFFF				

TBL_VAGUES_LEVEL_5
 	DW		TBL_NBR_SOUCOUPES5
	DW		#FFFE				
	DW		#FFFF

TBL_VAGUES_LEVEL_6
 	DW		TBL_NBR_SOUCOUPES6
	DW		#FFFE				
	DW		#FFFF	

TBL_VAGUES_LEVEL_7
 	DW		TBL_NBR_SOUCOUPES7
	DW		#FFFE				
	DW		#FFFF	

TBL_VAGUES_LEVEL_8
 	DW		TBL_NBR_SOUCOUPES8
	DW		#FFFE				
	DW		#FFFF				













Adresse_pallette_screen		ds		#20,0
PointeurTblCurseurMenu		ds		2,0
choix_menu					ds		1,0
CompteurAttente				ds		1,0
AdrTexteEcran				ds		2,0

;BufCurseurMenu				ds		#8110
NoLigneDeTexte				ds		1,0
AdrTypeDeFonte				ds		1,0
etp_anim_actarus			ds		1,0
duree_animation_actarus		ds		1,0
sprh_actuarus				ds		2,0



