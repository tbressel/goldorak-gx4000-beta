
   
PlaySampleSet:
		ld		hl,(adr_sample)			; adresse de début du sample
	    LD      de,(longueur_sample)                  ; Récupère longueur échantillon
		LD      A,2						; registre 2 du PSG
        LD      C,0						; valeur à lui envoyer
        CALL    WriteRegPsg				; PSG, Go !
        LD      A,3						; registre 3 du PSG
        LD      C,0						; valeur à lui envoyer
        CALL    WriteRegPsg				; PSG, Go !
        LD      A,7						; registre 7 du PSG
        LD      C,#3D                   ; Activer seulement deuxième canal son
        CALL    WriteRegPsg				; PSG, Go !
		
		
PlaySampleRout:
        CALL    PlaySample4Bits
        INC     HL
        DEC     DE
        LD      A,D
        OR      E
        JR      NZ,PlaySampleRout
        LD      C,D
        LD      A,9
        CALL    WriteRegPsg
		ret
        

PlaySample4Bits:
        LD      A,(HL)
        RRC     A
        RRC     A
        RRC     A
        RRC     A
        AND     #0F
        LD      C,A
        LD      A,9
        CALL    WriteRegPsg
        LD      B,4
PlaySample4Bits2:
        DJNZ    PlaySample4Bits2
        LD      A,(HL)
        AND     #0F
        LD      C,A
        RRC     A
        RRC     A
        RRC     A
        RRC     A
        LD      A,9
        CALL    WriteRegPsg
        LD      B,4
PlaySample4Bits3:
        DJNZ    PlaySample4Bits3
	    RET

;
; Ecriture d'un registre du PSG
; A = numéro de registre
; C = valeur
;
WriteRegPsg:
	; di
        ; LD      B,#F4
        ; OUT     (C),A
        ; LD      B,#F6
        ; IN      A,(C)
        ; OR      #C0
        ; OUT     (C),A
        ; AND     #3F
        ; OUT     (C),A
        ; LD      B,#F4
        ; OUT     (C),C
        ; LD      B,#F6
        ; LD      C,A
        ; OR      #80
        ; OUT     (C),A
        ; OUT     (C),C
	; 	ei
        ; RET


di
ld b,#F4 : out (c),a : ld a,#C0
ld b,#F6 : out (c),a : out (c),0
ld b,#F4 : out (c),c : ld a,#80
ld b,#F6 : out (c),a : out (c),0
ei
ret
; di
; ld de,#C080
; ld hl,#F4F6
; ld b,h : out (c),a
; ld b,l : out (c),d : out (c),0
; ld b,h : out (c),c
; ld b,l : out (c),e : out (c),0
; ei
; ret

BufSaveRegPsg:
        DS      14                  ; Buffer sauvegarde regs. du PSG
