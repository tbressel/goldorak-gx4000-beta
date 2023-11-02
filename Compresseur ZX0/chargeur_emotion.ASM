;ECRAN2-prs lg=&04AD
;ECRAN1-titre lg=&115C

data_ecran_prs	EQU &6000
data_ecran_titre	EQU &64B0

	ORG &7610
	EI

	CALL aff_palette

	LD HL,data_ecran_prs
	LD DE,&C000
	CALL DECOMPACTAGE

	LD A,50
	CALL DELAY

	LD HL,data_ecran_titre
	LD DE,&C000
	CALL DECOMPACTAGE

	RET


;-----[palette]-----
aff_palette
	XOR A
	CALL &BC0E
	LD BC,0
	CALL &BC38
	XOR A
	LD HL,aff_couleurs_data
affcouleurs
	PUSH AF
	PUSH HL
	LD B,(HL)
	LD C,B
	CALL &BC32
	POP HL
	INC HL
	POP AF
	INC A
	CP 16
	JR NZ,affcouleurs
	RET
aff_couleurs_data
DEFB 0,21,24,15,15,6,3,26,23,14,2,1,9,4,8,17

;------------------------------------------------------------------------------
; DELAY SUBROUTINE (0.05s to 12.75s)
; A = Timeout / 50ms
;------------------------------------------------------------------------------
DELAY
		LD B,15			; 15 x 1/300th ms (HALT) = 50ms
DELAY_2
		HALT			; Waits 1/300th s
		DJNZ DELAY_2	; Loop for 50ms
		DEC A
		JR NZ,DELAY		; Loop for A x 50ms
		RET


;------------------------------------------------------------------------------
; Decompactage ZX0
;------------------------------------------------------------------------------
DECOMPACTAGE
; HL = adresse source (compacte)
; DE = adresse destination
DepkZX0:
	ld	bc,#ffff			; preserve default offset 1
	push	bc
	inc	bc
	ld	a,#80
dzx0s_literals:
	call	dzx0s_elias		; obtain length
	ldir					; copy literals
	add	a,a					; copy from last offset or new offset?
	jr	c,dzx0s_new_offset
	call	dzx0s_elias		; obtain length
dzx0s_copy:
	ex	(sp),hl				; preserve source,restore offset
	push	hl				; preserve offset
	add	hl,de				; calculate destination - offset
	ldir					; copy from offset
	pop	hl					; restore offset
	ex	(sp),hl				; preserve offset,restore source
	add	a,a					; copy from literals or new offset?
	jr	nc,dzx0s_literals
dzx0s_new_offset:
	call	dzx0s_elias		; obtain offset MSB
	ld b,a
	pop	af					; discard last offset
	xor	a					; adjust for negative offset
	sub	c
	RET	Z		; Plus d'octets à traiter = fini

	ld	c,a
	ld	a,b
	ld	b,c
	ld	c,(hl)				; obtain offset LSB
	inc	hl
	rr	b					; last offset bit becomes first length bit
	rr	c
	push	bc				; preserve new offset
	ld	bc,1				; obtain length
	call	nc,dzx0s_elias_backtrack
	inc	bc
	jr	dzx0s_copy
dzx0s_elias:
	inc	c					; interlaced Elias gamma coding
dzx0s_elias_loop:
	add	a,a
	jr	nz,dzx0s_elias_skip
	ld	a,(hl)				; load another group of 8 bits
	inc	hl
	rla
dzx0s_elias_skip:
	ret 	c
dzx0s_elias_backtrack:
	add	a,a
	rl	c
	rl	b
	jr	dzx0s_elias_loop
