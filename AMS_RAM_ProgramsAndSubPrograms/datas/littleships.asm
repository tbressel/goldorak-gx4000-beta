

; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////	
adr_tbl_points_soucoupe				ds		2,0
posy_soucoupe						ds		2,0
posx_soucoupe						ds		2,0




Tbl_etp_soucoupes
	etp_soucoupe1				ds		1,0
	etp_soucoupe2				ds		1,0
	etp_soucoupe3				ds		1,0
	etp_soucoupe4				ds		1,0
	etp_soucoupe5				ds		1,0
	etp_soucoupe6				ds		1,0
	
Tbl_VALEUR_TIMER_soucoupes				; mini tableau qui gere le départ de 3 soucoupes basique
		db	32,16,1,32,16,1
	
Tbl_timer_depart_soucoupes
	timer_depart_soucoupe1		ds		1,0
	timer_depart_soucoupe2		ds		1,0
	timer_depart_soucoupe3		ds		1,0
	timer_depart_soucoupe4		ds		1,0
	timer_depart_soucoupe5		ds		1,0
	timer_depart_soucoupe6		ds		1,0

Tbl_timer_BOOM_soucoupe
	timer_BOOM_soucoupe1		ds		1,0
	timer_BOOM_soucoupe2		ds		1,0
	timer_BOOM_soucoupe3		ds		1,0
	timer_BOOM_soucoupe4		ds		1,0
	timer_BOOM_soucoupe5		ds		1,0
	timer_BOOM_soucoupe6		ds		1,0

AdrPointeur_DeplacementSoucoupe1	ds		2,0
AdrPointeur_DeplacementSoucoupe2	ds		2,0
AdrPointeur_DeplacementSoucoupe3	ds		2,0
AdrPointeur_DeplacementSoucoupe4	ds		2,0
AdrPointeur_DeplacementSoucoupe5	ds		2,0
AdrPointeur_DeplacementSoucoupe6	ds		2,0

Valeur_DeplacementSoucoupe1		ds		1,0
Valeur_DeplacementSoucoupe2		ds		1,0
Valeur_DeplacementSoucoupe3		ds		1,0
Valeur_DeplacementSoucoupe4		ds		1,0
Valeur_DeplacementSoucoupe5		ds		1,0
Valeur_DeplacementSoucoupe6		ds		1,0
	

adr_soucoupe_tourne_tg						ds		2,0

adr_soucoupe_tourne_tg1						ds		2,0
adr_soucoupe_tourne_tg2						ds		2,0
adr_soucoupe_tourne_tg3						ds		2,0
adr_sprh_tourne_tg							ds		2,0	
flag_tourne_sprh_next_tg					ds		1,0
compteur_etape_orientation_soucoupe_tg		ds		1,0
compteur_cycle_orientation_soucoupe_tg	 	ds 		1,0




adr_soucoupe_tourne_td						ds		2,0

adr_soucoupe_tourne_td4						ds		2,0
adr_soucoupe_tourne_td5						ds		2,0
adr_soucoupe_tourne_td6						ds		2,0
adr_sprh_tourne_td							ds		2,0	
flag_tourne_sprh_next_td					ds		1,0
compteur_etape_orientation_soucoupe_td		ds		1,0
compteur_cycle_orientation_soucoupe_td	 	ds 		1,0




vitesse_soucoupe		ds		1,0
count_anim_soucoupe		ds		1,0
pointeur_tbl_level		ds		2,0
adr_item_ROM			ds		2,0
pointeur_tbl_point		ds		2,0




EtpTirEnnemis_4			ds		1,0
AttenteTirEnnemis_4		ds		1,0
EtpTirEnnemis_1			ds		1,0
AttenteTirEnnemis_1		ds		1,0
DirectionYTirEnnemis	ds		2,0
DirectionXTirEnnemis	ds		2,0
posy_soucoupe_tir		ds		2,0
posx_soucoupe_tir		ds		2,0



Pointeur_TblNombreDeSoucoupes		ds		2,0
pointeur_vague_fin					ds		2,0
Pointeur_TblTypeDeSoucoupe			ds		2,0
Pointeur_TblHorizVertiBasDroite		ds		2,0
Pointeur_TblHorizVertiBasGauche		ds		2,0




; //////////////////////////////////////////////////////////////////
; /////////////////////  SOUCOUPES DU JEU   /////////////////////////
; //////////////////////////////////////////////////////////////////
TBL_CONFIG_DES_SOUCOUPES
	id_soucoupe					ds		1,0
	adr_soucoupe_event			ds		2,0
	soucoupe_X					ds		2,0
	soucoupe_Y					ds		2,0
	adr_soucoupe				ds		2,0
	SPRH_ADR					ds		2,0
	SPRH_X						ds		2,0
	SPRH_Y						ds		2,0
	SPRH_ZOOM					ds		2,0
	valeur_zoom_sprh			ds		2,0
	etp_soucoupe				ds		2,0
	adr_timer_depart_soucoupe	ds		2,0
	adr_timer_BOOM_soucoupe		ds		2,0
	val_pts_item				ds		1,0
	no_id_joueur				ds		1,0
	points_de_vie				ds		1,0
	type_de_direction			ds		2,0
	pointeur_deplacement		ds		2,0
	valeur_decompte_deplacement ds		2,0
	
; 'NOM DU TABLEAU'	
	; identite de la soucoupe
	; adresse de la routine 'soucoupe' |||| position X de soucoupe
	; position Y de soucoupe
	; type de soucoupe |||| adresse sprite ASIC
	; Adresse posX ASIC |||| adresse posY ASIC ||||, adresse Zoom ASIC
	; valleur du zoom |||| etape d'explosion de la soucoupe |||| timer de depart de la soucoupe
	; vitesse de l'esplosion
	; resultat de la valeur de l'item |||| identité du joueur par defaut||| Points de vie
	; type de déplacement, pointeur de déplacement
	; valeur du decompte du déplacement
TblConfigSoucoupe1
	db	1											
	dw	0,32,-40											
	dw	0,SPRH6_ADR		
	dw	SPRH6_X,SPRH6_Y,SPRH6_ZOOM					
	dw	valeur_zoom_sprh6,etp_soucoupe1,timer_depart_soucoupe1		
	dw	timer_BOOM_soucoupe1										
	db	0,JOUEUR1,0
	dw	0,AdrPointeur_DeplacementSoucoupe1
	dw	Valeur_DeplacementSoucoupe1
TblConfigSoucoupe2
	db	2							; id de la soucoupe
	dw	0,56,-40					; soucoupe Y
	dw	0,SPRH7_ADR
	dw	SPRH7_X,SPRH7_Y,SPRH7_ZOOM
	dw	valeur_zoom_sprh7,etp_soucoupe2,timer_depart_soucoupe2
	dw	timer_BOOM_soucoupe2
	db	0,JOUEUR1,0					; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe2
	dw	Valeur_DeplacementSoucoupe2
TblConfigSoucoupe3
	db	3							; id de la soucoupe
	dw	0,80,-40					; soucoupe X
	dw	0,SPRH8_ADR
	dw	SPRH8_X,SPRH8_Y,SPRH8_ZOOM
	dw	valeur_zoom_sprh8,etp_soucoupe3,timer_depart_soucoupe3
	dw	timer_BOOM_soucoupe3
	db	0,JOUEUR1,0									; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe3
	dw	Valeur_DeplacementSoucoupe3
TblConfigSoucoupe4
	db	4					; id de la soucoupe
	dw	0,423,-40				; soucoupe X
	dw	0,SPRH9_ADR
	dw	SPRH9_X,SPRH9_Y,SPRH9_ZOOM
	dw	valeur_zoom_sprh9,etp_soucoupe4,timer_depart_soucoupe4
	dw	timer_BOOM_soucoupe4	
	db	0,JOUEUR1,0									; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe4
	dw	Valeur_DeplacementSoucoupe4
TblConfigSoucoupe5
	db	5					; id de la soucoupe
	dw	0,400,-40				; soucoupe X
	dw	0,SPRH10_ADR
	dw	SPRH10_X,SPRH10_Y,SPRH10_ZOOM
	dw	valeur_zoom_sprh10,etp_soucoupe5,timer_depart_soucoupe5
	dw	timer_BOOM_soucoupe5	
	db	0,JOUEUR1,0									; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe5
	dw	Valeur_DeplacementSoucoupe5
TblConfigSoucoupe6
	db	6					; id de la soucoupe
	dw	0,375,-40				; soucoupe X
	dw	0,SPRH11_ADR
	dw	SPRH11_X,SPRH11_Y,SPRH11_ZOOM
	dw	valeur_zoom_sprh11,etp_soucoupe6,timer_depart_soucoupe6
	dw	timer_BOOM_soucoupe6
	db	0,JOUEUR1,0									; resultat de la valeur de l'item
	dw	0,AdrPointeur_DeplacementSoucoupe6
	dw	Valeur_DeplacementSoucoupe6
