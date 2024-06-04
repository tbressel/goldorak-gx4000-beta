; ////////////////////////////////////////////////////////////////
fireB

ld a,(flag_on_joue_avec_alcorak)
or a
jp nz,retour_test_des_tirs
		attente_fireB
			RST		ASIC_DECONNEXION
			ld		a,(counter_fireB)
			inc		a
			ld		(counter_fireB),a
			cp		a,5
			jp		z,fin_attente_fireB
			jp		retour_test_des_tirs
				fin_attente_fireB
					ld		c,BANK_ROM_18
					rst		UPPER_ROM_CONNEXION
					call	fin_attente_fireB_ROM
					call	rom_off
					jp		retour_test_des_tirs
						bcl_affiche_bouton
							push	bc
							push	de
							ldi:ldi:ldi
							pop		de
							call 	ligne_inf_4000
							pop		bc
							djnz	bcl_affiche_bouton
							ret

pre_init_fulguro_poing
	ld		a,(counter_pre_poing)
	inc		a
	ld		(counter_pre_poing),a
	cp		a,4
	ret		nz
	xor		a
	ld		(counter_pre_poing),a
	ld		a,(etp_pre_poing)
	cp		a,0
	jr		z,pre_anim_fulguro_poing
	cp		a,2
	jp		z,pre_anim_fulguro_poing_2
	cp		a,4
	jp		z,pre_anim_fulguro_poing_fin
	inc		a
	ld		(etp_pre_poing),a
	ret
		pre_anim_fulguro_poing
			inc		a
			ld		(etp_pre_poing),a
			ld		c,BANK_ROM_18
			rst		UPPER_ROM_CONNEXION
			call	pre_anim_fulguro_poing_ROM
			call	rom_off
			ret		
				pre_anim_fulguro_poing_2
					inc		a
					ld		(etp_pre_poing),a
					ld		c,BANK_ROM_18
					rst		UPPER_ROM_CONNEXION
					call	pre_anim_fulguro_poing_2_ROM
					ld		c,BANK9_GOLDORAK_SPRH
					RST 	UPPER_ROM_CONNEXION									; on se connection à la rom où se situes les sprites hard de cette arme
					ld		hl,sprh_fulguro_poing
					ld		de,SPRH4_ADR
					ld		bc,#200
					LDIR		
					call	rom_off
					jp		ASIC_DECONNEXION
					
						pre_anim_fulguro_poing_fin
							xor	a
							ld	(etp_pre_poing),a
							ld	(event_arme_fireB),a
							ld	(event_arme_fireB+1),a
							ld	(event_arme_fireB+2),a
							ld	(flag_fulguro),a
							ret
							
pre_init_fulguro_poing_retour
		ld		c,BANK_ROM_18
		rst		UPPER_ROM_CONNEXION
		call	pre_init_fulguro_poing_retour_ROM
		call	rom_off
		ret



	