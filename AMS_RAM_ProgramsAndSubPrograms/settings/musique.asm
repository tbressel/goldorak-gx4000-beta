; player et musique

PLY_AKG_MANAGE_SOUND_EFFECTS = 1

PLAYER_ADR_RAM		equ	#0090		; adresse à reporter manuellement dans creation_cartouche.asm
LONGUEUR_PLAYER		equ	#0c50
MUSIC_ADR_RAM		equ #0AC0		; toutes les musiques du jeu
LONGUEUR_MUSIC		equ	#3000       ;#14cc


; player dans la cartouche : problème de double label avec un assemblage des  .asm
; le l'ai convertir en binair dans mon fichier .bat, avec en entête org #8300
; le fichier .bin est mis dans la bank 28
; ce player étant le même que celui de la bank 3, j'ai pris l'adresse du 
; label PLY_AKG_Play en RAM (#02A7) et soustrait de l'adresse de départ (#0090)
; J'obtient ainsi la distance entre le début du player et le label 

PLY_AKG_PlayROM				equ		#8300+#02A7+-#0090
PLY_AKG_InitROM				equ		#8300+#01DD+-#0090


MUSIC_BIGBOSS1			equ		0			
MUSIC_LVL_1				equ		1			; Level 1
MUSIC_GAME_OVER			equ		2			; Game Over
MUSIC_BOSS				equ		3			; Level 3
MUSIC_CREDITS			equ		4			; magasin
MUSIC_LVL_2				equ		5			; Level 2
MUSIC_LVL_3				equ		6			; Level 3
MUSIC_LVL_4				equ		7			; Level 4
MUSIC_LVL_5				equ		8			; Level 5
MUSIC_LVL_6				equ		9			; Level 6
MUSIC_LVL_7				equ		10			; Level 7	
MUSIC_LVL_8				equ		11			; Level 8
MUSIC_LVL_WIN			equ		12			; Level d'un boss
MUCIS_NO_MUSIC			equ		13			; pas de musique


; id des soundeffects
SFX_WEAPONS_CHANGE		equ	7


SFX_GAMMA_LVL1			equ	1
SFX_GAMMA_LVL2			equ	2
SFX_GAMMA_LVL3			equ	3
SFX_PLANITRON 			equ 4
SFX_FULGORO_POINT		equ 5
SFX_CLAVICOGYRE			equ 6
SFX_GET_ITEM			equ 7
SFX_DAMMAGE				equ 8
SFX_BOOM				equ 9
SFX_BOOM_GOLGOTH		equ 10
SFX_CORNOFULGURE		equ 11
SFX_ATTACK				equ 12

SFX_VOLUME				equ 5
SFX_CHANNEL				equ 2
SFX_CHANNEL_EXPLODE_GOLGOTH				equ 2
