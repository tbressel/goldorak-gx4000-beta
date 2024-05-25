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


; Cout_Cornofulgure
; 	;	l,h,e,d,c
; 	db	0,5,5,0,0		; Cornofulgure
; Cout_Pulvonium	
; 	db	0,7,0,0,0		; Pulvonium
; Cout_Clavicogyre
; 	db	0,6,0,0,0		; Clavicogyre
; Cout_Planitron1
; 	db	0,2,0,0,0		; Planitron 1
; Cout_Planitron2
; 	db	0,2,0,0,0		; Planitron 2
; Cout_Fulguropoint
; 	db	0,4,5,0,0		; Fulguropoint