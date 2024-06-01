; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////                MISSILES 1 TYPE 1           ////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
missileG1_1_ROM
	ld		a,(EtpMissileG1_1)
	cp		a,0
	jr		z,Init_MissileG1_1
	cp		a,1
	jr		z,UpdateMissileG1_1
		Init_MissileG1_1
			ld		a,(CompteurMissileG1_1)
			inc		a
			ld		(CompteurMissileG1_1),a
			cp		a,CADANCE_TIR_2_GOLGOTH1
			ret		nz
			xor		a
			ld		(CompteurMissileG1_1),a

			ld		a,(EtpMissileG1_1)
			inc		a
			ld		(EtpMissileG1_1),a

			ld		hl,TIR_GOLGOTH1_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH10_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl

			ld		hl,(posX_Golgoth)
			ld		de,32+16
			add		hl,de
			ld		(posX_MissileG1_1),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		(posY_MissileG1_1),hl
			call	UpdateMissileG1_1
			ld		a,zoom_mode0_1
			ld		(SPRH10_ZOOM),a
			ld		(valeur_zoom_sprh10),a
			ld		a,1
			ld		(flag_updateMissileG1_1),a
			ret
				UpdateMissileG1_1
					xor		a
					ld		(flag_updateMissileG1_1),a
					ld		hl,(posX_MissileG1_1)
					ld		(SPRH10_X),hl
					ld		(posX_Missile),hl
					ld		hl,(posY_MissileG1_1)
					ld		(SPRH10_Y),hl
					; inc		hl
					inc		hl
					ld		(posY_MissileG1_1),hl
					ld		(SPRH10_Y),hl
					ld		(posY_Missile),hl
					bit		0,h
					jp		nz,Fin_MissileG1_1
					call test_collisions_avec_les_tirs_ennemisG
					; call test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG1_1
							xor		a
							ld		(EtpMissileG1_1),a
							ld		(flag_updateMissileG1_1),a
							ld		(SPRH10_ZOOM),a
							ld		(valeur_zoom_sprh10),a
							ret

; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
missileG1_2_ROM
	ld		a,(EtpMissileG1_2)
	cp		a,0
	jr		z,Init_MissileG1_2
	cp		a,1
	jr		z,UpdateMissileG1_2
		Init_MissileG1_2
			ld		a,(CompteurMissileG1_2)
			inc		a
			ld		(CompteurMissileG1_2),a
			cp		a,CADANCE_TIR_1_GOLGOTH1
			ret		nz
			xor		a
			ld		(CompteurMissileG1_2),a

			ld		a,(EtpMissileG1_2)
			inc		a
			ld		(EtpMissileG1_2),a

			ld		hl,TIR_GOLGOTH1_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH11_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl

			ld		hl,(posX_Golgoth)
			ld		de,32+16
			add		hl,de
			ld		(posX_MissileG1_2),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		(posY_MissileG1_2),hl
			call	UpdateMissileG1_2
			ld		a,zoom_mode0_1
			ld		(SPRH11_ZOOM),a
			ld		(valeur_zoom_sprh11),a
			ld		a,1
			ld		(flag_updateMissileG1_2),a
			ret
				UpdateMissileG1_2
					xor		a
					ld		(flag_updateMissileG1_2),a
					ld		hl,(posX_MissileG1_2)
					ld		(SPRH11_X),hl
					ld		(posX_Missile),hl
					ld		hl,(posY_MissileG1_2)
					ld		(SPRH11_Y),hl
					; inc		hl
					inc		hl
					inc		hl
					ld		(posY_MissileG1_2),hl
					ld		(SPRH11_Y),hl
					ld		(posY_Missile),hl
					bit		0,h
					jp		nz,Fin_MissileG1_2
					call 	test_collisions_avec_les_tirs_ennemisG
					; call	test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG1_2
							xor		a
							ld		(EtpMissileG1_2),a
							ld		(flag_updateMissileG1_2),a
							ld		(SPRH11_ZOOM),a
							ld		(valeur_zoom_sprh11),a
							ret
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
missileG1_3_ROM
	ld		a,(EtpMissileG1_3)
	cp		a,0
	jr		z,Init_MissileG1_3
	cp		a,1
	jr		z,UpdateMissileG1_3
		Init_MissileG1_3
			ld		a,(CompteurMissileG1_3)
			inc		a
			ld		(CompteurMissileG1_3),a
			cp		a,CADANCE_TIR_3_GOLGOTH1
			ret		nz
			xor		a
			ld		(CompteurMissileG1_3),a

			ld		a,(EtpMissileG1_3)
			inc		a
			ld		(EtpMissileG1_3),a

			ld		hl,TIR_GOLGOTH1_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH12_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl

			ld		hl,(posX_Golgoth)
			ld		de,32+16
			add		hl,de
			ld		(posX_MissileG1_3),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		(posY_MissileG1_3),hl
			call	UpdateMissileG1_3
			ld		a,zoom_mode0_1
			ld		(SPRH12_ZOOM),a
			ld		(valeur_zoom_sprh12),a
			ld		a,1
			ld		(flag_updateMissileG1_3),a
			ret
				UpdateMissileG1_3
					xor		a
					ld		(flag_updateMissileG1_3),a
					ld		hl,(posX_MissileG1_3)
					ld		(SPRH12_X),hl
					ld		(posX_Missile),hl
					ld		hl,(posY_MissileG1_3)
					ld		(SPRH12_Y),hl
					; inc		hl
					inc		hl
					inc		hl
					inc		hl
					ld		(posY_MissileG1_3),hl
					ld		(SPRH12_Y),hl
					ld		(posY_Missile),hl
					bit		0,h
					jp		nz,Fin_MissileG1_3

					call test_collisions_avec_les_tirs_ennemisG
					; call test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG1_3
							xor		a
							ld		(EtpMissileG1_3),a
							ld		(flag_updateMissileG1_3),a
							ld		(SPRH12_ZOOM),a
							ld		(valeur_zoom_sprh12),a
							ret
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
missileG1_4_ROM
	ld		a,(EtpMissileG1_4)
	cp		a,0
	jr		z,Init_MissileG1_4
	cp		a,1
	jr		z,UpdateMissileG1_4
		Init_MissileG1_4
			ld		a,(CompteurMissileG1_4)
			inc		a
			ld		(CompteurMissileG1_4),a
			cp		a,CADANCE_TIR_4_GOLGOTH1
			ret		nz
			xor		a
			ld		(CompteurMissileG1_4),a

			ld		a,(EtpMissileG1_4)
			inc		a
			ld		(EtpMissileG1_4),a

			ld		hl,TIR_GOLGOTH1_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH13_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl

			ld		hl,(posX_Golgoth)
			ld		de,32+16
			add		hl,de
			ld		(posX_MissileG1_4),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		(posY_MissileG1_4),hl
			call	UpdateMissileG1_4
			ld		a,zoom_mode0_1
			ld		(SPRH13_ZOOM),a
			ld		(valeur_zoom_sprh13),a
			ld		a,1
			ld		(flag_updateMissileG1_4),a
			ret
				UpdateMissileG1_4
					xor		a
					ld		(flag_updateMissileG1_4),a
					ld		hl,(posX_MissileG1_4)
					ld		(SPRH13_X),hl
					ld		(posX_Missile),hl
					ld		hl,(posY_MissileG1_4)
					ld		(SPRH13_Y),hl
					; inc		hl
					inc		hl
					inc		hl
					inc		hl
					inc		hl
					ld		(posY_MissileG1_4),hl
					ld		(SPRH13_Y),hl
					ld		(posY_Missile),hl
					bit		0,h
					jp		nz,Fin_MissileG1_4
					call 	test_collisions_avec_les_tirs_ennemisG
					; call 	test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG1_4
							xor		a
							ld		(EtpMissileG1_4),a
							ld		(flag_updateMissileG1_4),a
							ld		(SPRH13_ZOOM),a
							ld		(valeur_zoom_sprh13),a
							ret

; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////                GOLGOTH 2          /////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////

missileG2_1_ROM
	ld		a,(EtpMissileG2_1)
	cp		a,0
	jr		z,Init_MissileG2_1
	cp		a,1
	jr		z,UpdateMissileG2_1
		Init_MissileG2_1
			ld		a,(CompteurMissileG2_1)
			inc		a
			ld		(CompteurMissileG2_1),a
			cp		a,CADANCE_TIR_1_GOLGOTH2
			ret		nz
			xor		a
			ld		(CompteurMissileG2_1),a
			ld		a,(EtpMissileG2_1)
			inc		a
			ld		(EtpMissileG2_1),a
			ld		hl,TIR_GOLGOTH2_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH10_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl
			ld		hl,(posX_Golgoth)
			ld		de,32+16
			add		hl,de
			ld		(posX_MissileG2_1),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		(posY_MissileG2_1),hl
			call	UpdateMissileG2_1
			ld		a,zoom_mode0_1
			ld		(SPRH10_ZOOM),a
			ld		(valeur_zoom_sprh10),a
			ld		a,1
			ld		(flag_updateMissileG2_1),a
			ret
				UpdateMissileG2_1
					xor		a
					ld		(flag_updateMissileG2_1),a
					ld		hl,(posX_MissileG2_1)
					ld		(SPRH10_X),hl
					ld		(posX_Missile),hl
					ld		hl,(posY_MissileG2_1)
					ld		(SPRH10_Y),hl
					inc		hl
					; inc		hl
					ld		(posY_MissileG2_1),hl
					ld		(SPRH10_Y),hl
					ld		(posY_Missile),hl
					bit		0,h
					jp		nz,Fin_MissileG2_1
					call 	test_collisions_avec_les_tirs_ennemisG
					; call 	test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG2_1
							xor		a
							ld		(EtpMissileG2_1),a
							ld		(flag_updateMissileG2_1),a
							ld		(SPRH10_ZOOM),a
							ld		(valeur_zoom_sprh10),a
							ret
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
missileG2_2_ROM
	ld		a,(EtpMissileG2_2)
	cp		a,0
	jr		z,Init_MissileG2_2
	cp		a,1
	jr		z,UpdateMissileG2_2
		Init_MissileG2_2
			ld		a,(CompteurMissileG2_2)
			inc		a
			ld		(CompteurMissileG2_2),a
			cp		a,CADANCE_TIR_3_GOLGOTH2
			ret		nz
			xor		a
			ld		(CompteurMissileG2_2),a

			ld		a,(EtpMissileG2_2)
			inc		a
			ld		(EtpMissileG2_2),a

			ld		hl,TIR_GOLGOTH2_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH11_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl

			ld		hl,(posX_Golgoth)
			ld		de,32+16
			add		hl,de
			ld		(posX_MissileG2_2),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		(posY_MissileG2_2),hl
			call	UpdateMissileG2_2
			ld		a,zoom_mode0_1
			ld		(SPRH11_ZOOM),a
			ld		(valeur_zoom_sprh11),a
			ld		a,1
			ld		(flag_updateMissileG2_2),a
			ret
				UpdateMissileG2_2
					xor		a
					ld		(flag_updateMissileG2_2),a
				; Mise à jours des coordonnées X
					ld		hl,(posX_MissileG2_2)
					ld		(SPRH11_X),hl
					dec		hl
					dec		hl
					dec		hl
					dec		hl
					ld		(SPRH11_X),hl
					ld		(posX_MissileG2_2),hl
					ld		(posX_Missile),hl

				; Mise à jours des coordonnées Y
					ld		hl,(posY_MissileG2_2)
					ld		(SPRH11_Y),hl
					inc		hl
					inc		hl
					inc		hl
					ld		(posY_MissileG2_2),hl
					ld		(SPRH11_Y),hl
					ld		(posY_Missile),hl
					bit		0,h
					jp		nz,Fin_MissileG2_2

					call 	test_collisions_avec_les_tirs_ennemisG
					; call 	test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG2_2
							xor		a
							ld		(EtpMissileG2_2),a
							ld		(flag_updateMissileG2_2),a
							ld		(SPRH11_ZOOM),a
							ld		(valeur_zoom_sprh11),a
							ret

; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
missileG2_3_ROM
	ld		a,(EtpMissileG2_3)
	cp		a,0
	jr		z,Init_MissileG2_3
	cp		a,1
	jr		z,UpdateMissileG2_3
		Init_MissileG2_3
			ld		a,(CompteurMissileG2_3)
			inc		a
			ld		(CompteurMissileG2_3),a
			cp		a,CADANCE_TIR_4_GOLGOTH2
			ret		nz
			xor		a
			ld		(CompteurMissileG2_3),a

			ld		a,(EtpMissileG2_3)
			inc		a
			ld		(EtpMissileG2_3),a

			ld		hl,TIR_GOLGOTH2_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH12_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl

			ld		hl,(posX_Golgoth)
			ld		de,32+16
			add		hl,de
			ld		(posX_MissileG2_3),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		(posY_MissileG2_3),hl
			call	UpdateMissileG2_3
			ld		a,zoom_mode0_1
			ld		(SPRH12_ZOOM),a
			ld		(valeur_zoom_sprh12),a
			ld		a,1
			ld		(flag_updateMissileG2_3),a
			ret
				UpdateMissileG2_3
					xor		a
					ld		(flag_updateMissileG2_3),a
				; Mise à jours des coordonnées X
					ld		hl,(posX_MissileG2_3)
					ld		(SPRH12_X),hl
					inc		hl
					inc		hl
					inc		hl
					ld		(SPRH12_X),hl
					ld		(posX_MissileG2_3),hl
					ld		(posX_Missile),hl

				; Mise à jours des coordonnées Y
					ld		hl,(posY_MissileG2_3)
					ld		(SPRH12_Y),hl
					inc		hl
					inc		hl
					; inc		hl
					; inc		hl
					ld		(posY_MissileG2_3),hl
					ld		(SPRH12_Y),hl
					ld		(posY_Missile),hl


					bit		0,h
					jp		nz,Fin_MissileG2_3
					call 	test_collisions_avec_les_tirs_ennemisG
					; call 	test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG2_3
							xor		a
							ld		(EtpMissileG2_3),a
							ld		(flag_updateMissileG2_3),a
							ld		(SPRH12_ZOOM),a
							ld		(valeur_zoom_sprh12),a
							ret

; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////                GOLGOTH 3          /////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////

missileG3_1_ROM
	ld		a,(EtpMissileG3_1)
	cp		a,0
	jr		z,Init_MissileG3_1
	cp		a,1
	jr		z,UpdateMissileG3_1
		Init_MissileG3_1
			ld		a,(CompteurMissileG3_1)
			inc		a
			ld		(CompteurMissileG3_1),a
			cp		a,CADANCE_TIR_1_GOLGOTH2
			ret		nz
			xor		a
			ld		(CompteurMissileG3_1),a
			ld		a,(EtpMissileG3_1)
			inc		a
			ld		(EtpMissileG3_1),a
			ld		hl,TIR_GOLGOTH3_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH13_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl
			ld		hl,(posX_Golgoth)
			ld		de,32
			add		hl,de
			ld		(posX_MissileG3_1),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		de,16+16
			add		hl,de
			ld		(posY_MissileG3_1),hl
			call	UpdateMissileG3_1
			ld		a,zoom_mode0_1
			ld		(SPRH13_ZOOM),a
			ld		(valeur_zoom_sprh13),a
			ld		a,1
			ld		(flag_updateMissileG3_1),a
			ret
				UpdateMissileG3_1
					xor		a
					ld		(flag_updateMissileG3_1),a
					ld		hl,(posX_MissileG3_1)
					ld		(SPRH13_X),hl
					ld		(posX_Missile),hl
					ld		hl,(posY_MissileG3_1)
					ld		(SPRH13_Y),hl
					inc		hl
					inc		hl
					ld		(posY_MissileG3_1),hl
					ld		(SPRH13_Y),hl
					ld		(posY_Missile),hl
					bit		0,h
					jp		nz,Fin_MissileG3_1
					call 	test_collisions_avec_les_tirs_ennemisG
					; call 	test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG3_1
							xor		a
							ld		(EtpMissileG3_1),a
							ld		(flag_updateMissileG3_1),a
							ld		(SPRH13_ZOOM),a
							ld		(valeur_zoom_sprh13),a
							ret
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
missileG3_2_ROM
	ld		a,(EtpMissileG3_2)
	cp		a,0
	jr		z,Init_MissileG3_2
	cp		a,1
	jr		z,UpdateMissileG3_2
		Init_MissileG3_2
			ld		a,(CompteurMissileG3_2)
			inc		a
			ld		(CompteurMissileG3_2),a
			cp		a,CADANCE_TIR_3_GOLGOTH2
			ret		nz
			xor		a
			ld		(CompteurMissileG3_2),a

			ld		a,(EtpMissileG3_2)
			inc		a
			ld		(EtpMissileG3_2),a

			ld		hl,TIR_GOLGOTH3_SPRH_ADR_ROM+#100
			ld		(MissileAdrRom),hl
			ld		hl,SPRH14_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl

			ld		hl,(posX_Golgoth)
			ld		de,32
			add		hl,de
			ld		(posX_MissileG3_2),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		de,16+16
			add		hl,de
			ld		(posY_MissileG3_2),hl
			call	UpdateMissileG3_2
			ld		a,zoom_mode0_1
			ld		(SPRH14_ZOOM),a
			ld		(valeur_zoom_sprh14),a
			ld		a,1
			ld		(flag_updateMissileG3_2),a
			ret
				UpdateMissileG3_2
					xor		a
					ld		(flag_updateMissileG3_2),a
				; Mise à jours des coordonnées X
					ld		hl,(posX_MissileG3_2)
					ld		(SPRH14_X),hl
					dec		hl
					dec		hl
					dec		hl
					dec		hl
					ld		(SPRH14_X),hl
					ld		(posX_MissileG3_2),hl
					ld		(posX_Missile),hl

				; Mise à jours des coordonnées Y
					ld		hl,(posY_MissileG3_2)
					ld		(SPRH14_Y),hl
					inc		hl
					inc		hl
					inc		hl
					ld		(posY_MissileG3_2),hl
					ld		(SPRH14_Y),hl
					ld		(posY_Missile),hl
					bit		0,h
					jp		nz,Fin_MissileG3_2

					call 	test_collisions_avec_les_tirs_ennemisG
					; call 	test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG3_2
							xor		a
							ld		(EtpMissileG3_2),a
							ld		(flag_updateMissileG3_2),a
							ld		(SPRH14_ZOOM),a
							ld		(valeur_zoom_sprh14),a
							ret

; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
; ////////////////////////////////////////////////////////////////////////////////////////////
missileG3_3_ROM
	ld		a,(EtpMissileG3_3)
	cp		a,0
	jr		z,Init_MissileG3_3
	cp		a,1
	jr		z,UpdateMissileG3_3
		Init_MissileG3_3
			ld		a,(CompteurMissileG3_3)
			inc		a
			ld		(CompteurMissileG3_3),a
			cp		a,CADANCE_TIR_4_GOLGOTH3
			ret		nz
			xor		a
			ld		(CompteurMissileG3_3),a

			ld		a,(EtpMissileG3_3)
			inc		a
			ld		(EtpMissileG3_3),a

			ld		hl,TIR_GOLGOTH3_SPRH_ADR_ROM
			ld		(MissileAdrRom),hl
			ld		hl,SPRH15_ADR
			ld		(MissileSprh),hl
			ld		hl,#100
			ld		(MissileLongeur),hl

			ld		hl,(posX_Golgoth)
			ld		de,32
			add		hl,de
			ld		(posX_MissileG3_3),hl
			ld		de,16
			add		hl,de
			ld		hl,(posY_Golgoth)
			ld		de,16+16
			add		hl,de
			ld		(posY_MissileG3_3),hl
			call	UpdateMissileG3_3
			ld		a,zoom_mode0_1
			ld		(SPRH15_ZOOM),a
			ld		(valeur_zoom_sprh15),a
			ld		a,1
			ld		(flag_updateMissileG3_3),a
			ret
				UpdateMissileG3_3
					xor		a
					ld		(flag_updateMissileG3_3),a
				; Mise à jours des coordonnées X
					ld		hl,(posX_MissileG3_3)
					ld		(SPRH15_X),hl
					inc		hl
					inc		hl
					inc		hl
					ld		(SPRH15_X),hl
					ld		(posX_MissileG3_3),hl
					ld		(posX_Missile),hl

				; Mise à jours des coordonnées Y
					ld		hl,(posY_MissileG3_3)
					ld		(SPRH15_Y),hl
					inc		hl
					inc		hl
					inc		hl
					inc		hl
					ld		(posY_MissileG3_3),hl
					ld		(SPRH15_Y),hl
					ld		(posY_Missile),hl

					bit		0,h
					jp		nz,Fin_MissileG3_3
					call 	test_collisions_avec_les_tirs_ennemisG
					; call 	test_collisions_avec_les_tirs_ennemisD
					ret
						Fin_MissileG3_3
							xor		a
							ld		(EtpMissileG3_3),a
							ld		(flag_updateMissileG3_3),a
							ld		(SPRH15_ZOOM),a
							ld		(valeur_zoom_sprh15),a
							ret
