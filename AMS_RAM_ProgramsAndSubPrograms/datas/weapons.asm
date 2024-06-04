; //////////////////////////////////////////////////////////////////
; /////////////////////  ARMES DU JEU   /////////////////////////
; //////////////////////////////////////////////////////////////////

flag_fireA					ds		1,0
adr_type_arme				ds		2,0
pointeur_type_arme			ds		2,0
id_arme						ds		1,0

flag_armes					ds		1,0
etp_arme1					ds		1,0
etp_arme2					DS		1,0
etp_arme3					DS		1,0
etp_arme4					ds		1,0
etp_arme5					ds		1,0
etp_arme6					ds		1,0
etp_arme7					ds		1,0

; Fulguro poing
counter_pre_poing			ds		1,0
etp_pre_poing				ds		1,0
flag_fulguro				ds		1,0
etp_direction_fulguro		ds		1,0

; plantiron
etp_anim_planitron			ds		1,0
adr_anim_planitron			ds		2,0

; planitron 2
etp_anim_planitron2			ds		1,0
adr_anim_planitron2			ds		2,0
timer_planitron2			ds		1,0

; Astero Hache
etp_anim_clavicogyres		ds		1,0
adr_anim_clavicogyres		ds		2,0
timer_clavicogyres			ds		1,0

sprh_arme_de_base           ds      2,0
sprh_arme_de_base2           ds      2,0
sprh_arme_de_base3           ds      2,0
etp_animation_pulvonium     ds      1,0



; dans l'ordre de la droite vers la gauche la valeur des bits à 1 corresponds à une arme actuve dans cet ordre :
; ArmesDisponible				db			%01111111

;BIT 0 -> missile gamme (lvl 1 2 3)
;BIT 1 -> planitron1
;BIT 2 -> planitron 2
;BIT 3 -> fulguropoing
;BIT 4 -> cornofulgure (lvl 1 2 3 )
;BIT 5 -> clavicogyre
;BIT 6 -> pulvonium
;BIT 7 -> rien,

ArmesDisponible				db			%00000001


