; //////////////////////////////////////////////////////////////////////
; La routine nouvelle_vague sert à faire générer des call soucoupeX dans le boucle_test_vague
; elle utilise le deuxieme jeu de registre pour lire depuis TypeSoucoupe pour copier
; la configuration des soucoupe vers TblConfigsoucoupe qui est la configuration des 
; sprite qui les heberge
nouvelle_vague
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	call	nouvelle_vague_ROM
	call	rom_off
	ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
fin_de_la_vague	
	ld		c,BANK_ROM_2
	rst		UPPER_ROM_CONNEXION
	rst		ASIC_CONNEXION
	call	fin_de_la_vague_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
boss_de_fin
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	boss_de_fin_ROM
	call	rom_off
	ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
golgoth_1
	rst		ASIC_CONNEXION
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	golgoth_1_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Update_Golgoth_1
			ld		a,(flag_MortGolgoth)
			cp		a,1
			jp		z,Update_MortGolgoth1
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			rst		ASIC_CONNEXION
			ld		hl,(GolgothAdrRom)
			ld		de,(GolgothSprh)
			ld		bc,(GolgothLongeur)
			LDIR
			rst		ASIC_DECONNEXION
			call	rom_off
			ret
				Update_MortGolgoth1
					ld		c,BANK16_BOOM_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(GolgothBoomAdrRom)
					ld		de,(GolgothSprh)
					ld		bc,(GolgothLongeur)
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
missileG1_1
	rst		ASIC_CONNEXION
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	missileG1_1_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret	
		missileG1_2
			rst		ASIC_CONNEXION
			ld		c,BANK_ROM_18
			rst		UPPER_ROM_CONNEXION
			call	missileG1_2_ROM
			call	rom_off
			rst		ASIC_DECONNEXION
			ret	
				missileG1_3
					rst		ASIC_CONNEXION
					ld		c,BANK_ROM_18
					rst		UPPER_ROM_CONNEXION
					call	missileG1_3_ROM
					call	rom_off
					rst		ASIC_DECONNEXION
					ret		
						missileG1_4
							rst		ASIC_CONNEXION
							ld		c,BANK_ROM_18
							rst		UPPER_ROM_CONNEXION
							call	missileG1_4_ROM
							call	rom_off
							rst		ASIC_DECONNEXION
							ret	
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////								
Update_missileG1_1
	ld		a,(flag_updateMissileG1_1)
	cp		a,0
	RET		Z
	ld		c,BANK10_GOLGOTH_SPRH
	rst		UPPER_ROM_CONNEXION
	rst		ASIC_CONNEXION
	ld		hl,(MissileAdrRom)
	ld		de,(MissileSprh)
	ld		bc,(MissileLongeur)
	LDIR
	rst		ASIC_DECONNEXION
	call	rom_off
	ret
		Update_missileG1_2
			ld		a,(flag_updateMissileG1_2)
			cp		a,0
			RET		Z
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			rst		ASIC_CONNEXION
			ld		hl,(MissileAdrRom)
			ld		de,(MissileSprh)
			ld		bc,(MissileLongeur)
			LDIR
			rst		ASIC_DECONNEXION
			call	rom_off
			ret
				Update_missileG1_3
					ld		a,(flag_updateMissileG1_3)
					cp		a,0
					RET		Z
				
					ld		c,BANK10_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(MissileAdrRom)
					ld		de,(MissileSprh)
					ld		bc,(MissileLongeur)
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
						Update_missileG1_4
							ld		a,(flag_updateMissileG1_4)
							cp		a,0
							RET		Z
						
							ld		c,BANK10_GOLGOTH_SPRH
							rst		UPPER_ROM_CONNEXION
							rst		ASIC_CONNEXION
							ld		hl,(MissileAdrRom)
							ld		de,(MissileSprh)
							ld		bc,(MissileLongeur)
							LDIR
							rst		ASIC_DECONNEXION
							call	rom_off
							ret

; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
golgoth_2
	rst		ASIC_CONNEXION
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	golgoth_2_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Update_Golgoth_2
			ld		a,(flag_MortGolgoth)
			cp		a,1
			jp		z,Update_MortGolgoth2
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			rst		ASIC_CONNEXION
			ld		hl,(GolgothAdrRom)
			ld		de,(GolgothSprh)
			ld		bc,(GolgothLongeur)
			LDIR
			rst		ASIC_DECONNEXION
			call	rom_off
			ret
				Update_MortGolgoth2
					ld		c,BANK16_BOOM_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(GolgothBoomAdrRom)
					ld		de,(GolgothSprh)
					ld		bc,(GolgothLongeur)
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
missileG2_1
	rst		ASIC_CONNEXION
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	missileG2_1_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret		
		missileG2_2
			rst		ASIC_CONNEXION
			ld		c,BANK_ROM_18
			rst		UPPER_ROM_CONNEXION
			call	missileG2_2_ROM
			call	rom_off
			rst		ASIC_DECONNEXION
			ret	
				missileG2_3
					rst		ASIC_CONNEXION
					ld		c,BANK_ROM_18
					rst		UPPER_ROM_CONNEXION
					call	missileG2_3_ROM
					call	rom_off
					rst		ASIC_DECONNEXION
					ret	
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////				
Update_missileG2_1
	ld		a,(flag_updateMissileG2_1)
	cp		a,0
	RET		Z
	ld		c,BANK10_GOLGOTH_SPRH
	rst		UPPER_ROM_CONNEXION
	rst		ASIC_CONNEXION
	ld		hl,(MissileAdrRom)
	ld		de,(MissileSprh)
	ld		bc,(MissileLongeur)
	LDIR
	rst		ASIC_DECONNEXION
	call	rom_off
	ret	
		Update_missileG2_2
			ld		a,(flag_updateMissileG2_2)
			cp		a,0
			RET		Z
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			rst		ASIC_CONNEXION
			ld		hl,(MissileAdrRom)
			ld		de,(MissileSprh)
			ld		bc,(MissileLongeur)
			LDIR
			rst		ASIC_DECONNEXION
			call	rom_off
			ret	
				Update_missileG2_3
					ld		a,(flag_updateMissileG2_3)
					cp		a,0
					RET		Z
					ld		c,BANK10_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(MissileAdrRom)
					ld		de,(MissileSprh)
					ld		bc,(MissileLongeur)
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret	
					
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
golgoth_3
	rst		ASIC_CONNEXION
	ld		a,(EtpGolgoth)
	cp		a,0
	call	z,Init_Golgoth_3
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	golgoth_3_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Init_Golgoth_3
			inc		a
			ld		(EtpGolgoth),a
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			ld		hl,GOLGOTH3_SPRH_ADR_ROM
			ld		de,SPRH6_ADR
			ld		bc,#400
			LDIR
			ld		hl,GOLGOTH3_SPRH_ADR_ROM_TETE_C
			ld		de,SPRH10_ADR
			ld		bc,#200
			LDIR		
			ld		hl,GOLGOTH3_SPRH_ADR_ROM_QUEUE_C
			ld		de,SPRH12_ADR
			ld		bc,#100
			LDIR
			ret
				Update_Golgoth_3
					ld		a,(flag_MortGolgoth)
					cp		a,1
					jp		z,Update_MortGolgoth3
					ld		c,BANK10_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(Golgoth_Tete_AdrRom)
					ld		de,(Golgoth_Tete_Sprh)
					ld		bc,#200
					LDIR
					ld		hl,(Golgoth_Queue_AdrRom)
					ld		de,(Golgoth_Queue_Sprh)
					ld		bc,#100
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
						Update_MortGolgoth3
							ld		c,BANK16_BOOM_SPRH
							rst		UPPER_ROM_CONNEXION
							rst		ASIC_CONNEXION
							ld		hl,(GolgothBoomAdrRom)
							ld		de,(GolgothSprh)
							ld		bc,(GolgothLongeur)
							LDIR
							rst		ASIC_DECONNEXION
							call	rom_off
							ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
missileG3_1
	ld		a,(FlagGolgoth_Ferme)
	cp		a,ouvert
	ret		Z
	rst		ASIC_CONNEXION
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	missileG3_1_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret		
		missileG3_2
				ld		a,(FlagGolgoth_Ferme)
	cp		a,ouvert
	ret		Z
			rst		ASIC_CONNEXION
			ld		c,BANK_ROM_18
			rst		UPPER_ROM_CONNEXION
			call	missileG3_2_ROM
			call	rom_off
			rst		ASIC_DECONNEXION
			ret	
				missileG3_3
					ld		a,(FlagGolgoth_Ferme)
	cp		a,ouvert
	ret		Z
					rst		ASIC_CONNEXION
					ld		c,BANK_ROM_18
					rst		UPPER_ROM_CONNEXION
					call	missileG3_3_ROM
					call	rom_off
					rst		ASIC_DECONNEXION
					ret	
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////				
Update_missileG3_1

	ld		a,(FlagGolgoth_Ferme)
	cp		a,ouvert
	ret		Z
	ld		a,(flag_updateMissileG3_1)
	cp		a,0
	RET		Z
	ld		c,BANK10_GOLGOTH_SPRH
	rst		UPPER_ROM_CONNEXION
	rst		ASIC_CONNEXION
	ld		hl,(MissileAdrRom)
	ld		de,(MissileSprh)
	ld		bc,(MissileLongeur)
	LDIR
	rst		ASIC_DECONNEXION
	call	rom_off
	ret	
		Update_missileG3_2
			ld		a,(FlagGolgoth_Ferme)
	cp		a,ouvert
	ret		Z
			ld		a,(flag_updateMissileG3_2)
			cp		a,0
			RET		Z
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			rst		ASIC_CONNEXION
			ld		hl,(MissileAdrRom)
			ld		de,(MissileSprh)
			ld		bc,(MissileLongeur)
			LDIR
			rst		ASIC_DECONNEXION
			call	rom_off
			ret	
				Update_missileG3_3
					ld		a,(FlagGolgoth_Ferme)
	cp		a,ouvert
	ret		Z
					ld		a,(flag_updateMissileG3_3)
					cp		a,0
					RET		Z
					ld		c,BANK10_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(MissileAdrRom)
					ld		de,(MissileSprh)
					ld		bc,(MissileLongeur)
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret	
					
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
golgoth_4
	rst		ASIC_CONNEXION
	ld		a,(EtpGolgoth)
	cp		a,0
	call	z,Init_Golgoth_4
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	golgoth_4_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Init_Golgoth_4
			inc		a
			ld		(EtpGolgoth),a
			ld		c,BANK12_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			ld		hl,GOLGOTH4_SPRH_ADR_ROM
			ld		de,SPRH6_ADR
			ld		bc,#800
			LDIR
			ret
				Update_Golgoth_4
					ld		a,(flag_MortGolgoth)
					cp		a,1
					jp		z,Update_MortGolgoth4
					ld		c,BANK12_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
										
					ld		hl,(GolgothAdrRom)
					ld		de,(GolgothSprh)
					ld		bc,(GolgothLongeur)
					LDIR
					ld		a,(FlagAnimGolgoth4_marche)
					cp		a,0
					jr		z,.zap_update
					
					ld		hl,(GolgothAdrRom_MarcheG)
					ld		de,SPRH10_ADR
					ld		bc,#100
					LDIR
					ld		hl,(GolgothAdrRom_MarcheG)
					ld		de,#200
					add		hl,de
					ld		de,SPRH12_ADR
					ld		bc,#100
					LDIR
					ld		hl,(GolgothAdrRom_MarcheD)
					ld		de,SPRH11_ADR
					ld		bc,#100
					LDIR
					ld		hl,(GolgothAdrRom_MarcheD)
					ld		de,#200
					add		hl,de
					ld		de,SPRH13_ADR
					ld		bc,#100
					LDIR
					
					.zap_update
						rst		ASIC_DECONNEXION
						call	rom_off
						ret
							Update_MortGolgoth4
								ld		c,BANK16_BOOM_SPRH
								rst		UPPER_ROM_CONNEXION
								rst		ASIC_CONNEXION
								ld		hl,(GolgothBoomAdrRom)
								ld		de,(GolgothSprh)
								ld		bc,(GolgothLongeur)
								LDIR
								rst		ASIC_DECONNEXION
								call	rom_off
								ret
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////	
golgoth_5
	rst		ASIC_CONNEXION
	ld		a,(EtpGolgoth)
	cp		a,0
	call	z,Init_Golgoth_5
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	golgoth_5_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Init_Golgoth_5
			inc		a
			ld		(EtpGolgoth),a
			ld		c,BANK13_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			ld		hl,GOLGOTH5_SPRH_ADR_ROM
			ld		de,SPRH6_ADR
			ld		bc,#600
			LDIR
			ret
				Update_Golgoth_5
					ld		a,(flag_MortGolgoth)
					cp		a,1
					jp		z,Update_MortGolgoth5
					ld		c,BANK13_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
				
					ld		a,(FlagGolgoth_Ferme)
					cp		a,ouvert
					jp		z,.Golgoth_Ouvert
					
					ld		a,(Etp_Anim_Golgoth)
					cp		a,1
					jr		z,.Update_In1
					cp		a,2
					jr		z,.Update_In2
					
				.Update_In1
					ld		hl,(GolgothAdrRom)
					ld		de,(GolgothSprh)
					ld		bc,(GolgothLongeur)
					LDIR
					jr		.zap_update
				.Update_In2
					ld		hl,(GolgothAdrRom)
					ld		de,(GolgothSprh)
					ld		bc,(GolgothLongeur)
					LDIR	
					ld		hl,(GolgothAdrRom2)
					ld		de,(GolgothSprh2)
					ld		bc,(GolgothLongeur)
					LDIR	
					jr		.zap_update
			
						.Golgoth_Ouvert
							ld		a,(Etp_Anim_Golgoth_Ouvert)
							cp		a,0
							jr		z,..Update_In1
							cp		a,8
							jr		z,..Update_In2
							cp		a,16
							jr		z,.Fin_Update
								..Update_In1
									inc		a
									ld		(Etp_Anim_Golgoth_Ouvert),a
									ld		hl,GOLGOTH5_SPRH_ADR_ROM_ANIM_OUT1
									ld		de,SPRH6_ADR
									ld		bc,#600
									LDIR
									jr		.zap_update
								..Update_In2
									inc		a
									ld		(Etp_Anim_Golgoth_Ouvert),a
									ld		hl,GOLGOTH5_SPRH_ADR_ROM_ANIM_OUT2
									ld		de,SPRH6_ADR
									ld		bc,#600
									LDIR	
									jr		.zap_update
								.Fin_Update	
										ld a,zoom_mode0_1
										ld (SPRH13_ZOOM),a : ld (valeur_zoom_sprh13), a
										ld (SPRH14_ZOOM),a : ld (valeur_zoom_sprh14), a
										ld (SPRH15_ZOOM),a : ld (valeur_zoom_sprh15), a
									ld		c,BANK_ROM_18
									rst		UPPER_ROM_CONNEXION		
									call	Deplacement_Golgoth5							
									jr		.zap_update
					
					
					.zap_update
						rst		ASIC_DECONNEXION
						call	rom_off
						ret
							Update_MortGolgoth5
								ld		c,BANK16_BOOM_SPRH
								rst		UPPER_ROM_CONNEXION
								rst		ASIC_CONNEXION
								ld		hl,(GolgothBoomAdrRom)
								ld		de,(GolgothSprh)
								ld		bc,(GolgothLongeur)
								LDIR
								rst		ASIC_DECONNEXION
								call	rom_off
								ret

; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
golgoth_6
	rst		ASIC_CONNEXION
	ld		a,(EtpGolgoth)
	cp		a,0
	call	z,Init_Golgoth_6
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	golgoth_6_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Init_Golgoth_6
			inc		a
			ld		(EtpGolgoth),a
			ld		c,BANK11_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			ld		hl,GOLGOTH6_SPRH_ADR_ROM
			ld		de,SPRH6_ADR
			ld		bc,#500
			LDIR
			
			ret
				Update_Golgoth_6
					ld		a,(flag_MortGolgoth)
					cp		a,1
					jp		z,Update_MortGolgoth6
					ld		c,BANK11_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(GolgothAdrRom)
					ld		de,(GolgothSprh)
					ld		bc,#500
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
						Update_MortGolgoth6
							ld		c,BANK16_BOOM_SPRH
							rst		UPPER_ROM_CONNEXION
							rst		ASIC_CONNEXION
							ld		hl,(GolgothBoomAdrRom)
							ld		de,(GolgothSprh)
							ld		bc,(GolgothLongeur)
							LDIR
							rst		ASIC_DECONNEXION
							call	rom_off
							ret
							
							
							
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
golgoth_7
	rst		ASIC_CONNEXION
	ld		a,(EtpGolgoth)
	cp		a,0
	call	z,Init_Golgoth_7
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	golgoth_7_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Init_Golgoth_7
			inc		a
			ld		(EtpGolgoth),a
			ld		c,BANK10_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			ld		hl,GOLGOTH7_SPRH_ADR_ROM
			ld		de,SPRH6_ADR
			ld		bc,#600
			LDIR	
			ld	hl,Tbl_Golgoth7_localisation
			ld	(pointeur_Tbl_Localisation_Golgoth7),hl	
			ret
				Update_Golgoth_7
					ld		a,(flag_MortGolgoth)
					cp		a,1
					jp		z,Update_MortGolgoth7
					ld		c,BANK10_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(GolgothAdrRom)
					ld		de,(GolgothSprh)
					ld		bc,#600
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
						Update_MortGolgoth7
							ld		c,BANK16_BOOM_SPRH
							rst		UPPER_ROM_CONNEXION
							rst		ASIC_CONNEXION
							ld		hl,(GolgothBoomAdrRom)
							ld		de,(GolgothSprh)
							ld		bc,(GolgothLongeur)
							LDIR
							rst		ASIC_DECONNEXION
							call	rom_off
							ret
							

; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////
golgoth_8
	rst		ASIC_CONNEXION
	ld		a,(EtpGolgoth)
	cp		a,0
	call	z,Init_Golgoth_8
	ld		c,BANK_ROM_18
	rst		UPPER_ROM_CONNEXION
	call	golgoth_8_ROM
	call	rom_off
	rst		ASIC_DECONNEXION
	ret
		Init_Golgoth_8
			inc		a
			ld		(EtpGolgoth),a
			ld		c,BANK12_GOLGOTH_SPRH
			rst		UPPER_ROM_CONNEXION
			ld		hl,GOLGOTH8_SPRH_ADR_ROM
			ld		de,SPRH6_ADR
			ld		bc,#800
			LDIR
			ret
				Update_Golgoth_8
					ld		a,(flag_MortGolgoth)
					cp		a,1
					jp		z,Update_MortGolgoth8
					ld		c,BANK12_GOLGOTH_SPRH
					rst		UPPER_ROM_CONNEXION
					rst		ASIC_CONNEXION
					ld		hl,(Golgoth_Corp_AdrRom)
					ld		de,SPRH6_ADR
					ld		bc,#400
					LDIR
					ld		hl,(Golgoth_Tete_AdrRom)
					ld		de,SPRH10_ADR
					ld		bc,#400
					LDIR
					rst		ASIC_DECONNEXION
					call	rom_off
					ret
						Update_MortGolgoth8
							ld		c,BANK16_BOOM_SPRH
							rst		UPPER_ROM_CONNEXION
							rst		ASIC_CONNEXION
							ld		hl,(GolgothBoomAdrRom)
							ld		de,(GolgothSprh)
							ld		bc,(GolgothLongeur)
							LDIR
							rst		ASIC_DECONNEXION
							call	rom_off
							ret
							