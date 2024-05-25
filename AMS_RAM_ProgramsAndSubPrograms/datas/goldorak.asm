GoldorakMort				ds		1,0



AdrAnimGoldorakRet			ds			2,0
flag_deja_affiche			ds			1,0
flag_retournement			ds			1,0
EtpRetournement				ds			1,0
Compteur_Retournement		ds			1,0
Pointeur_Vitesse_Retournement		DS		2,0


courbe_sprh4			ds		2,0
courbe_sprh5			ds		2,0

BoomGoldorakEtp				ds		1,0
BoomGoldorakTimerAdr		ds		1,0
BoomGoldorakSprhRomAdr		ds		2,0


sprh_a_charger			ds	1,0
direction_goldorak		ds	1,0
level_en_cours			ds	1,0
fini					ds	1,0

count_anim_goldorak			ds		1,0
points_attaque				ds		1,0
vitesse_goldorak			ds		1,0

sprh_goldorak				ds		2,0
sprh_goldorak2				ds		2,0
flag_percute				ds		1,0

posy_goldorak				ds		2,0
posx_goldorak				ds		2,0



nbr_de_retournement				ds 	1,0
display_tbl_retournement_top	ds	2,0
display_tbl_retournement_bot	ds	2,0
pointer_tbl_retournement 		ds 	2,0



Tbl_Vitesse_Retournement

	db		-16
	db		-8

	db		DISTANCE_RETOURNEMENT_AVANCER,DISTANCE_RETOURNEMENT_AVANCER_moins,DISTANCE_RETOURNEMENT_RECULER_moins
	db		DISTANCE_RETOURNEMENT_RECULER,16,8
	db		DISTANCE_RETOURNEMENT_RECULER_moins,DISTANCE_RETOURNEMENT_RECULER_moins
	db		DISTANCE_RETOURNEMENT_AVANCER

