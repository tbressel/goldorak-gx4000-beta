org &8000


PlaySample:
ld		hl,#4000
              INC     HL
       
        INC     HL
       
        INC     HL
        LD      A,(HL)                  ; Vérifier nbre de bits échantillon
        INC     HL
       
      
        LD      DE,PlaySample4Bits
        CP      '4'
        RET     NZ
PlaySampleSet:
        LD      (PlaySampleRout+1),DE
        LD      E,(HL)                  ; Récupère longueur échantillon
        INC     HL
        LD      D,(HL)
        INC     HL
        DI
        LD      A,2
        LD      C,0
        CALL    WriteRegPsg
        LD      A,3
        LD      C,0
        CALL    WriteRegPsg
        LD      A,7
        LD      C,#3D                   ; Activer seulement deuxième canal son
        CALL    WriteRegPsg
PlaySampleRout:
        CALL    0
        INC     HL
        DEC     DE
        LD      A,D
        OR      E
        JR      NZ,PlaySampleRout
        LD      C,D
        LD      A,9
        CALL    WriteRegPsg
        EI
        RET

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
        LD      B,#F4
        OUT     (C),A
        LD      B,#F6
        IN      A,(C)
        OR      #C0
        OUT     (C),A
        AND     #3F
        OUT     (C),A
        LD      B,#F4
        OUT     (C),C
        LD      B,#F6
        LD      C,A
        OR      #80
        OUT     (C),A
        OUT     (C),C
        RET

BufSaveRegPsg:
        DS      14                  ; Buffer sauvegarde regs. du PSG
