; //////////////////////////////////////////////////////////////////
; /////////////////////        HUD            //////////////////////
; //////////////////////////////////////////////////////////////////
JOUEUR1	= 1
JOUEUR2 = 2
NBR_DE_VIE_DEPART = 3


; Localisation des boutons du tableau de bord
HUD_BOUTON1_ADR			equ		#504B ;HUD_J1_ADR_ECRAN+#100B
HUD_BOUTON2_ADR			equ		HUD_BOUTON1_ADR+3
HUD_BOUTON3_ADR			equ		HUD_BOUTON1_ADR+6
HUD_BOUTON4_ADR			equ		HUD_BOUTON1_ADR+9
HUD_BOUTON5_ADR			equ		#506A ;HUD_J1_ADR_ECRAN+#102A
HUD_BOUTON6_ADR			equ		HUD_BOUTON5_ADR+3
HUD_BOUTON7_ADR			equ		HUD_BOUTON5_ADR+6
HUD_BOUTON8_ADR			equ		HUD_BOUTON5_ADR+9
HUD_BOUTON_ON_ADR		equ		#4183 ;#42c3 
HUD_BOUTON_AFF_ADR		equ		#41a1 ;#7961 ;#42e1 
HUD_LARGEUR_BOUTTON		equ		3
HUD_HAUTEUR_BOUTTON		equ		10

; scoring du mode 1 joueur
HUD_SCORE_UNITE_ADR						equ		#4000+#0132
HUD_SCORE_DIZAINNE_ADR					equ		HUD_SCORE_UNITE_ADR+-2
HUD_SCORE_CENTAINE_ADR					equ		HUD_SCORE_DIZAINNE_ADR+-2
HUD_SCORE_MILLIER_ADR					equ		HUD_SCORE_CENTAINE_ADR+-2
HUD_SCORE_DIZAINE_DE_MILLIER_ADR		equ		HUD_SCORE_MILLIER_ADR+-2

; scoring du joueur 1 en mode 2 joueurs
HUD_SCOREJ1_UNITE_ADR					equ		#4000+#00A3
HUD_SCOREJ1_DIZAINNE_ADR				equ		HUD_SCOREJ1_UNITE_ADR+-2
HUD_SCOREJ1_CENTAINE_ADR				equ		HUD_SCOREJ1_DIZAINNE_ADR+-2
HUD_SCOREJ1_MILLIER_ADR					equ		HUD_SCOREJ1_CENTAINE_ADR+-2
HUD_SCOREJ1_DIZAINE_DE_MILLIER_ADR		equ		HUD_SCOREJ1_MILLIER_ADR+-2

; scoring du joueur 2 en mode 2 joueurs
HUD_SCOREJ2_UNITE_ADR					equ		#4000+#0123
HUD_SCOREJ2_DIZAINNE_ADR				equ		HUD_SCOREJ2_UNITE_ADR+-2
HUD_SCOREJ2_CENTAINE_ADR				equ		HUD_SCOREJ2_DIZAINNE_ADR+-2
HUD_SCOREJ2_MILLIER_ADR					equ		HUD_SCOREJ2_CENTAINE_ADR+-2
HUD_SCOREJ2_DIZAINE_DE_MILLIER_ADR		equ		HUD_SCOREJ2_MILLIER_ADR+-2


; scoring du mode 1 joueur Magasin d'arme
HUD_SCORE_SHOP_UNITE_ADR						equ		#c0cc
HUD_SCORE_SHOP_DIZAINNE_ADR					equ		HUD_SCORE_SHOP_UNITE_ADR+-2
HUD_SCORE_SHOP_CENTAINE_ADR					equ		HUD_SCORE_SHOP_DIZAINNE_ADR+-2
HUD_SCORE_SHOP_MILLIER_ADR					equ		HUD_SCORE_SHOP_CENTAINE_ADR+-2
HUD_SCORE_SHOP_DIZAINE_DE_MILLIER_ADR		equ		HUD_SCORE_SHOP_MILLIER_ADR+-2

; scoring mode 2 joueur crocofest
SCORE_J1_SCR							equ		#C10C


HUD_FONTE_OK				equ		#e960
SCORE_FONTE_OK				equ		#d6a0 

HUD_DEPART_FONTES				equ		#D6A0
HUD_FONTE1_ROM_ADR				equ		HUD_DEPART_FONTES
HUD_FONTE2_ROM_ADR				equ		HUD_DEPART_FONTES+#500
HUD_FONTE3_ROM_ADR				equ		HUD_DEPART_FONTES+#A00
HUD_FONTE4_ROM_ADR				equ		HUD_DEPART_FONTES+#F00
HUD_VIEJ1_ECRAN_ADR				equ		#4112

HUD_NRJJ1_ECRAN_ADR				equ		#514C   ;494C				; jusqu'a #4955
HUD_NRJJ2_ECRAN_ADR				equ		#496A				; jusqu'a #4955
HUD_NRJ_PIXEL_NOIR				equ		#c0
HUD_NRJ_PIXEL_VERT				equ		#c3
HUD_NRJ_PIXEL_BLEU				equ		#fc
HUD_FONTE_HAUTEUR				equ		8

HUD_DEPART_POWER_UP1			equ		#5173
HUD_DEPART_POWER_UP2			equ		#5170
HUD_POWERUP_PIXEL_NOIR			equ		#c0
HUD_POWERUP_PIXEL_ORANGE		equ		#33
HUD_POWERUP_PIXEL_JAUNE			equ		#F3

VITESSE_PERTE_POWER_UP			equ		128

; ////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////
; ////////////////////// AFFICHAGE DU HUD ////////////////////////
; ////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////

HUD_ALCORAK_ADR_ROM			equ	#DD00
HUD_J1_ADR_ROM			equ	#C000
HUD_GOLDORAK_ADR_ECRAN		equ	#4040   ;#7800
HUD_ALCORAK_ADR_ECRAN		equ	#4840   ;#7800
HUD_J1_HAUTEUR			equ	45
HUD_LONGEUR				equ	16*4			; 16 lignes de 4 octets