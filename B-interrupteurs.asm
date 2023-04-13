
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
; ////////////////////        INTERRUPTEURS      ///////////////////
; //////////////////////////////////////////////////////////////////
; //////////////////////////////////////////////////////////////////
asic_on
	di
	ld		bc,#7F00+%10111000		; sauvegardé AVANT le out (execution)
	ld		a,c						; car en cas d'interruption les registres aurons
	ld		(valeur_asic),a			; été sauvegardé et rétablit, prêt à être "out"
	out 	(c),c
	ei
	ret
asic_off
	di
	ld 		bc,#7F00+%10100000
	ld		a,c
	ld		(valeur_asic),a
	out	 	(c),c
	ei
	ret
	
rom_on								; devenu RST 0   #20
	di
	; sélèction de la ROM
	ld		a,#80						; si ld c,10
	add		a,c							; on ajoute #80 au numéros de la ROM
	ld		c,a							; le reg C contient la valeur de sélection de la ROM
	ld		b,#DF
	ld		(rom_sectionnee),bc
	out		(c),c						; on execute la sélèction de la ROM
	ld		bc,#7F00+%10000100				; ROM inf connectée, ROM sup déconnectée, MODE 0
	ld		(etat_de_la_rom),bc
	out		(c),c						; on exécute la connexion de la ROM sélectionnée.
	ei
	ret
rom_off	
	di
	ld		bc,#7F00+%10001100				; ROM inf déconnectée, ROM sup déconnectée, MODE 0
	ld		(etat_de_la_rom),bc
	out		(c),c						; on exécute la connexion de la ROM sélectionnée.
	ei
	ret

music_on
	ld		a,_CALL
	ld		(event_play_music),a
	ld		hl,PLY_AKG_Play
	ld		(event_play_music+1),hl
	ret

music_off
	call	PLY_AKG_Stop
	xor		a
	ld		(event_play_music),a
	ld		(event_play_music+1),a
	ld		(event_play_music+2),a
	ret	

scrolling_off
	ld		a,_JP							; JP pas_de_scroll_hard
	ld		(event_stop_scroll),a
	ld		hl,pas_de_scroll_hard
	ld		(event_stop_scroll+1),hl
	ret
	
scrolling_on
	xor		a				; JP pas_de_scroll_hard
	ld		(event_stop_scroll),a
	ld		(event_stop_scroll+1),a
	ld		(event_stop_scroll+2),a
	ret

rom_on_EI
	; sélèction de la ROM
	ld		a,#80						; si ld c,10
	add		a,c							; on ajoute #80 au numéros de la ROM
	ld		c,a							; le reg C contient la valeur de sélection de la ROM
	ld		b,#DF
	ld		(rom_sectionnee),bc
	out		(c),c						; on execute la sélèction de la ROM
	ld		bc,#7F00+%10000100				; ROM inf connectée, ROM sup déconnectée, MODE 0
	ld		(etat_de_la_rom),bc
	out		(c),c						; on exécute la connexion de la ROM sélectionnée.
	ret
	
	