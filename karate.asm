Ideal
; ===========================================================================
  SEGMENT seg000 PARA PUBLIC STACK 'STACK'
    db  24*01024 dup (1) ; was 400h. binary load at 720:0
  ENDS seg000 
; ===========================================================================
; Segment type:	Pure code

segment		seg001 byte public 'CODE'
		assume cs:seg001
		assume es:nothing, ss:seg000, ds:seg001
; =============== S U B	R O U T	I N E =======================================
		public start
proc		start far
		;mov ax,04 ; my
		;int 10h	  ; my
		
		push	ds
		sub	ax, ax
		push	ax
		mov	ax, cs
		mov	ds, ax
		assume ds:seg001
		mov	[codeSegm], ax
		lea	bx, [ds:0BAD0h] ; 0BAD0h
		nop
		shr	bx, 1
		shr	bx, 1
		shr	bx, 1
		shr	bx, 1
		add	ax, bx
		mov	[freeSegm], ax
		mov	ax, 0B800h
		mov	es, ax
		assume es:nothing
		call	sub_13844
		call	sub_1065B
		call	restoreTimerInt
		
		mov	ax, 3
		int	19h		; was: int 10h - VIDEO - SET	VIDEO MODE ; now reset
					; AL = mode
		push	ds
		mov	ax, 40h	; '@'
		mov	ds, ax
		assume ds:nothing
		and	[byte ptr ds:17h], 0DFh
		pop	ds

endp		start ;	sp-analysis failed
		assume ds:nothing
		retf
; ---------------------------------------------------------------------------

codeSegm	dw 0			; ...
freeSegm	dw 0			; ...
			db 0
byte_10441	db 1			; ...
byte_10442	db 1			; ...
word_10443	dw 0			; ...
word_10445	dw 0			; ...
word_10447	dw 0			; ...
word_10449	dw 0			; ...

;================
; DO NOT SHIFT THIS OFFSET, IT HARDCODED SOMEWHERE. i didnt find it
unk_1044B:
		db 0			; ...
unk_1044C:
		db 0			; ...
;
;================


word_1044D	dw 0			; ...
word_1044F	dw 0			; ...
word_10451	dw 0			; ...
word_10453	dw 9			; ...
unk_10455	db    9
			db    0
word_10457	dw 9			; ...
		db    9
		db    0
byte_1045B	db 1			; ...
byte_1045C	db 1			; ...
		db    0
		db    0
unk_1045F	db    0
		db    0
		db    0
		db    0
		db    0
byte_10464	db 0			; ...
byte_10465	db 0			; ...
byte_10466	db 0			; ...
byte_10467	db 0			; ...
byte_10468	db 0			; ...
word_10469	dw 0			; ...
word_1046B	dw 0			; ...
word_1046D	dw 0			; ...
word_1046F	dw 0			; ...
byte_10471	db 0			; ...
			db    0
word_10473	dw 0			; ...
unk_10475	db    0
			db    0
			db    0
			db    0
unk_10479	db    0
			db    0
			db    0
			db    0
			db    0
byte_1047E	db 0
unk_1047F	db    0
			db    0
			db    0
			db    0
			db    0
			db    0

unk_10485	db    0
		db    0
byte_10487	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1048F	db 0			; ...
byte_10490	db 0			; ...
byte_10491	db 0			; ...
byte_10492	db 0			; ...
byte_10493	db 0			; ...
byte_10494	db 0			; ...
byte_10495	db 0			; ...
byte_10496	db 0			; ...
byte_10497	db 0			; ...
byte_10498	db 0			; ...
byte_10499	db 0			; ...
byte_1049A	db 0			; ...
byte_1049B	db 0			; ...
byte_1049C	db 0			; ...
byte_1049D	db 0			; ...
byte_1049E	db 0			; ...
byte_1049F	db 0			; ...

unk_104A0	db    0
byte_104A1	db 0			; ...
byte_104A2	db 0			; ...
byte_104A3	db 0			; ...
byte_104A4	db 0			; ...
byte_104A5	db 0			; ...
byte_104A6	db 0			; ...
byte_104A7	db 0			; ...
byte_104A8	db 0			; ...
byte_104A9	db 0			; ...

unk_104AA	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_104B1	db 0			; ...
		db    0
byte_104B3	db 0			; ...
		db    0
byte_104B5	db 0			; ...
unk_104B6	db    0
byte_104B7	db 0			; ...
		db    0
byte_104B9	db 0			; ...
		db    0
byte_104BB	db 0			; ...
		db    0
byte_104BD	db 0			; ...
		db    0
byte_104BF	db 0			; ...
		db    0
byte_104C1	db 0			; ...
		db    0
byte_104C3	db 0			; ...
		db    0
byte_104C5	db 0			; ...
		db    0
byte_104C7	db 0			; ...
		db    0
byte_104C9	db 0			; ...
		db    0
byte_104CB	db 0			; ...
byte_104CC	db 0			; ...
byte_104CD	db 0			; ...
		db    0
byte_104CF	db 0			; ...
byte_104D0	db 0			; ...
byte_104D1	db 0			; ...

		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_104DD	db    0
		db    0
		db    0
unk_104E0	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_104E8	db    0
		db    0
unk_104EA	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_104F0	db 0
byte_104F1	db 0			; ...
		db 0
unk_104F3	db    0
		db    0
		db    0
		db    0
byte_104F7	db 0			; ...
byte_104F8	db 0			; ...
		db    0
		db    0
		db    0
unk_104FC	db    0
unk_104FD	db    0
byte_104FE	db 0			; ...
byte_104FF	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
byte_10505	db 0			; ...
byte_10506	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1050C	db 0			; ...
byte_1050D	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_10514	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1051B	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_10522	db 0			; ...
byte_10523	db 0			; ...
byte_10524	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1052D	db 0			; ...
byte_1052E	db 0			; ...
byte_1052F	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_10538	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1053F	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1054B	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		



byte_10557	db 0			; ...
byte_10558	db 0			; ...
byte_10559	db 0			; ...
byte_1055A	db 0			; ...
byte_1055B	db 0			; ...
byte_1055C	db 0			; ...
byte_1055D	db 0			; ...
byte_1055E	db 0			; ...
byte_1055F	db 0			; ...
byte_10560	db 0			; ...
byte_10561	db 0			; ...
byte_10562	db 0			; ...
		db    0
		db    0
		db    0
byte_10566	db 0			; ...
byte_10567	db 0			; ...
byte_10568	db 0			; ...
byte_10569	db 0			; ...
byte_1056A	db 0			; ...
byte_1056B	db 0			; ...
byte_1056C	db 0			; ...
byte_1056D	db 0			; ...
		db    0
byte_1056F	db 0			; ...
byte_10570	db 0			; ...
byte_10571	db 0			; ...
		db    0
		db    0
byte_10574	db 0			; ...
byte_10575	db 0			; ...
byte_10576	db 0			; ...
byte_10577	db 0			; ...
byte_10578	db 0			; ...
byte_10579	db 0			; ...
byte_1057A	db 0			; ...
byte_1057B	db 0			; ...
byte_1057C	db 0			; ...
byte_1057D	db 0			; ...
byte_1057E	db 0			; ...
byte_1057F	db 0			; ...
byte_10580	db 0			; ...
byte_10581	db 0			; ...
byte_10582	db 0			; ...
byte_10583	db 0			; ...
byte_10584	db 0			; ...
byte_10585	db 0			; ...
byte_10586	db 0			; ...
word_10587	dw 0			; ...
byte_10589	db 0			; ...
byte_1058A	db 0			; ...
byte_1058B	db 0			; ...
byte_1058C	db 0			; ...
byte_1058D	db 0			; ...
byte_1058E	db 0			; ...
byte_1058F	db 0			; ...
		db    0
		db    0
byte_10592	db 0			; ...
byte_10593	db 0			; ...
		db    0
byte_10595	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1059F	db 0			; ...
		db    0
byte_105A1	db 0			; ...
byte_105A2	db 0			; ...
byte_105A3	db 0			; ...
byte_105A4	db 0			; ...
byte_105A5	db 0			; ...
byte_105A6	db 0			; ...
byte_105A7	db 0			; ...
byte_105A8	db 0			; ...
byte_105A9	db 0			; ...
byte_105AA	db 0			; ...
byte_105AB	db 0			; ...
byte_105AC	db 0			; ...
		db    0
byte_105AE	db 0			; ...
byte_105AF	db 0			; ...
		db    0
byte_105B1	db 0			; ...
byte_105B2	db 0			; ...
		db    0
		db    0
byte_105B5	db 0			; ...
byte_105B6	db 0			; ...
byte_105B7	db 0			; ...
		db    0
		db    0
byte_105BA	db 0			; ...
		db    0
		db    0
		db    0
		db    0
unk_105BF	db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_105E2	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1060A	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_10632	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1065A	db 0			; ...
; =============== S U B	R O U T	I N E =======================================
proc		sub_1065B near		; ...

		call	sub_16939
		mov	[ds:byte_1065A], 0
		mov	di, 6
loc_10666:				; ...
		mov	al, 2Dh	; '-'
		mov	[ds:byte_1050D+di], al
		mov	[ds:byte_10514+di], al
		mov	[ds:byte_1051B+di], al
		sub	al, al
		mov	[ds:byte_10506+di], al
		mov	[ds:byte_104FF+di], al
		mov	[ds:byte_104F8+di], al
		mov	[ds:byte_104F1+di], al
		dec	di
		jns	short loc_10666
		mov	al, 1
		mov	[ds:byte_10522], al
		mov	[ds:byte_10523], al
		sub	al, al
		mov	[ds:byte_10465], al
		mov	[ds:byte_10466], al
		mov	ax, sp
		mov	[ds:savedSP], ax
		call	sub_12E09
		mov	[ds:byte_10467], 1
loc_106A6:				; ...
		cli
		mov	ax, [ds:savedSP]
		mov	sp, ax
		sti
		call	sub_13CBD
		call	sub_13594
		call	sub_113E2	; paint	screen?
		jmp	loc_10866
endp		sub_1065B
; ---------------------------------------------------------------------------
aInternationalK	db 'INTERNATIONAL KARATE     1986 SYSTEM 3',0
aGraphicsArcher	db 'GRAPHICS ARCHER MACLEAN',0
; =============== S U B	R O U T	I N E =======================================
proc		sub_106F8 near		; ...
		mov	al, [ds:byte_10522]
		cmp	al, 0
		jz	short loc_10706
		mov	al, [ds:byte_105AB]
		cmp	al, 0
		jnz	short $+2
loc_10706:				; ...
		inc	[ds:byte_10464]
		jnz	short loc_10710
		inc	[ds:byte_105AA]
loc_10710:				; ...
		inc	[ds:byte_10538]
		inc	[ds:byte_104A4]
		inc	[ds:byte_105A4]
		mov	al, [ds:byte_10496]
		cmp	al, 0
		jz	short loc_10727
		dec	[ds:byte_10496]
loc_10727:				; ...
		mov	al, [ds:byte_105B5]
		cmp	al, 0
		jz	short loc_1073F
		dec	[ds:byte_105B5]
		jnz	short loc_1073F
		mov	dl, [ds:byte_105B6]
		sub	dh, dh
		mov	si, dx
		call	sub_13E75
loc_1073F:				; ...
		mov	al, [ds:byte_1048F]
		cmp	al, 5
		jnz	short $+2
loc_10746:				; ...
		sub	al, al
		mov	[ds:byte_10579], al
		mov	[ds:byte_1057A], al
		mov	al, [ds:byte_1048F]
		cmp	al, 1
		jnz	short loc_1077C
		mov	al, [ds:byte_104B7]
		cmp	al, 1Ch
		jz	short loc_1077C
		cmp	[ds:byte_16321], 0
		jz	short loc_1077C
		dec	[ds:byte_10571]
		jnz	short loc_1077C
		mov	al, [ds:byte_104A1]
		cmp	al, 0
		jz	short loc_1077C
		clc
		sbb	al, 1
		das
		mov	[ds:byte_104A1], al
		mov	al, 3Ch	; '<'
		mov	[ds:byte_10571], al
loc_1077C:				; ...
		nop
endp		sub_106F8 ; sp-analysis	failed
		retn
; =============== S U B	R O U T	I N E =======================================
proc		sub_1077E near		; ...
		mov	di, 1
		mov	dx, di
		mov	[ds:byte_105B2], dl
		mov	al, 0FFh
		mov	[ds:byte_105AE], al
loc_1078C:				; ...
		mov	dl, [ds:byte_105B2]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104A2+di]
		cmp	al, [ds:byte_105AC+di]
		pushf
		mov	[ds:byte_105AC+di], al
		popf
		jz	short loc_107B1
		mov	[ds:byte_105AF], al
		mov	al, [ds:byte_104C7+di]
		mov	[ds:byte_105B1], al
		call	sub_1080C
loc_107B1:				; ...
		dec	[ds:byte_105B2]
		jns	short loc_1078C
		mov	dl, [ds:byte_105AE]
		sub	dh, dh
		mov	si, dx
		cmp	si, 80h	; 'Ä'
		jnb	short locret_107C8
		jmp	sub_13E75
; ---------------------------------------------------------------------------
locret_107C8:				; ...
		retn
endp		sub_1077E
; ---------------------------------------------------------------------------
byte_107C9	db 0Ah			; ...
		db    7
		db    6
		db  12h
		db  14h
		db  15h
		db  16h
		db  20h
		db  2Fh	; /
		db  2Bh	; +
		db  27h	; '
		db 0FFh
byte_107D5	db 1			; ...
		db    1
		db    1
		db    2
		db    2
		db    2
		db    1
		db    2
		db 0FFh
		db 0FFh
		db 0FFh
byte_107E0	db 0FFh			; ...
		db 0FFh
		db 0FFh
		db    0
		db    0
		db    2
		db    0
		db    2
		db    5
		db    3
		db    4
byte_107EB	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    4
		db    5
		db    4
		db    0
		db    0
		db    0
byte_107F6	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    2
		db    0
		db    2
		db    0
		db    0
		db    0
byte_10801	db 0FFh			; ...
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db    5
		db    3
		db    4
; =============== S U B	R O U T	I N E =======================================
proc		sub_1080C near		; ...
		sub	di, di
		mov	al, [ds:byte_105AF]
loc_10811:				; ...
		cmp	al, [ds:byte_107C9+di]
		jz	short loc_1081E
		inc	di
		cmp	di, 0Bh
		jb	short loc_10811
		retn
; ---------------------------------------------------------------------------
loc_1081E:				; ...
		mov	al, [ds:byte_1048F]
		cmp	al, 1
		jnz	short loc_10853
		mov	al, [ds:byte_10497]
		cmp	al, 0
		jnz	short loc_1083A
		mov	al, [ds:byte_105B1]
		and	al, 4Dh
		jz	short locret_10865
		mov	al, [ds:byte_107D5+di]
		jmp	short loc_10862
; ---------------------------------------------------------------------------
		align 2
loc_1083A:				; ...
		mov	al, [ds:byte_107EB+di]
		cmp	al, 0
		jz	short loc_1084C
		mov	[ds:byte_105B5], al
		mov	al, [ds:byte_107F6+di]
		mov	[ds:byte_105B6], al
loc_1084C:				; ...
		mov	al, [ds:byte_107E0+di]
		jmp	short loc_10862
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10853:				; ...
		mov	al, [ds:byte_1048F]
		cmp	al, 2
		jz	short loc_1085E
		cmp	al, 5
		jnz	short locret_10865
loc_1085E:				; ...
		mov	al, [ds:byte_10801+di]
loc_10862:				; ...
		mov	[ds:byte_105AE], al
locret_10865:				; ...
		retn
endp		sub_1080C
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1065B
loc_10866:				; ...
		cmp	[ds:byte_12CFA], 2
		jz	short loc_10896
		cmp	[ds:byte_12CFA], 1
		jz	short loc_10888
		dec	[ds:byte_10467]
		jnz	short loc_10896
		mov	[ds:byte_10467], 1
		call	sub_1382B
		call	sub_1382B
		jmp	short loc_10896
; END OF FUNCTION CHUNK	FOR sub_1065B
; ---------------------------------------------------------------------------
		align 2
; START	OF FUNCTION CHUNK FOR sub_1065B
loc_10888:				; ...
		dec	[ds:byte_10467]
		jnz	short loc_10896
		mov	[ds:byte_10467], 4
		call	sub_1382B
loc_10896:				; ...
		mov	al, [ds:byte_1048F]
		cmp	al, 1
		jnz	short loc_108A3
		call	sub_108D7	; players paint?
		jmp	short loc_108D5
; END OF FUNCTION CHUNK	FOR sub_1065B
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1065B
loc_108A3:				; ...
		cmp	al, 2
		jnz	short loc_108AD
		call	sub_108F8
		jmp	short loc_108D5
; END OF FUNCTION CHUNK	FOR sub_1065B
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1065B
loc_108AD:				; ...
		cmp	al, 3
		jnz	short loc_108B7
		call	sub_10B1F
		jmp	short loc_108D5
; END OF FUNCTION CHUNK	FOR sub_1065B
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1065B
loc_108B7:				; ...
		cmp	al, 4
		jnz	short loc_108C1
		call	sub_10E63
		jmp	short loc_108D5
; END OF FUNCTION CHUNK	FOR sub_1065B
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1065B
loc_108C1:				; ...
		cmp	al, 5
		jnz	short loc_108CB
		call	sub_1099A
		jmp	short loc_108D5
; END OF FUNCTION CHUNK	FOR sub_1065B
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1065B
loc_108CB:				; ...
		cmp	al, 6
		jnz	short loc_108D5
		call	sub_11BEA
		jmp	loc_106A6
; ---------------------------------------------------------------------------
loc_108D5:				; ...
		jmp	short loc_10866
; END OF FUNCTION CHUNK	FOR sub_1065B
; =============== S U B	R O U T	I N E =======================================
proc		sub_108D7 near		; ...
		call	sub_11001
		jb	short locret_108F7
		call	sub_11449
		call	sub_11334
		call	sub_1139C
		call	sub_126D9
		call	sub_1077E
		mov	al, [ds:byte_10497]
		cmp	al, 0
		jz	short locret_108F7
		mov	al, 2
		mov	[ds:byte_1048F], al
locret_108F7:				; ...
		retn
endp		sub_108D7
; =============== S U B	R O U T	I N E =======================================
proc		sub_108F8 near		; ...
		sub	al, al
		mov	[ds:byte_104A4], al
		mov	[ds:byte_10560], al
		mov	dl, [ds:byte_10557]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_10491], dl
		mov	al, [ds:byte_1055F]
		mov	[ds:byte_104B1+di], al
		call	sub_1166D
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_1094F
		mov	dl, [ds:byte_10493]
		sub	dh, dh
		mov	di, dx
		cmp	di, 0
		jz	short loc_10933
		dec	[ds:byte_1059F]
		jmp	short loc_10937
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10933:				; ...
		inc	[ds:byte_1059F]
loc_10937:				; ...
		call	sub_178C3
		mov	al, [ds:byte_1059F]
		cmp	al, 42h	; 'B'
		jnb	short loc_10966
		cmp	al, 36h	; '6'
		jz	short loc_10966
		sub	al, al
		mov	[ds:byte_10574], al
		mov	al, 32h	; '2'
		mov	[ds:byte_104A4], al
loc_1094F:				; ...
		mov	al, [ds:byte_10574]
		cmp	al, 2
		jb	short loc_10976
		mov	dl, [ds:byte_10493]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_10498+di]
		cmp	al, 2
		jb	short loc_10976
loc_10966:				; ...
		mov	al, 2
		mov	[ds:byte_10574], al
		mov	al, 20h	; ' '
		mov	[ds:byte_10560], al
		sub	al, al
		mov	[ds:byte_104B9+di], al
loc_10976:				; ...
		call	sub_11466
		call	sub_1126A
		call	sub_1139C
		call	sub_1077E
		mov	al, [ds:byte_104A4]
		cmp	al, 96h	; 'ñ'
		jb	short loc_10976
		call	sub_11001
		jb	short locret_10996
		call	sub_111F8
		mov	al, 1
		mov	[ds:byte_1048F], al
locret_10996:				; ...
		retn
endp		sub_108F8
; ---------------------------------------------------------------------------
byte_10997	db 0Ah,	0Fh, 14h	; ...
; =============== S U B	R O U T	I N E =======================================
proc		sub_1099A near		; ...
		sub	al, al
		mov	[ds:byte_10490], al
loc_1099F:				; ...
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_10465+di]
		cmp	al, 0
		jnz	short loc_109B2
		jmp	loc_10AFB
; ---------------------------------------------------------------------------
loc_109B2:				; ...
		mov	dx, di
		mov	[ds:byte_10491], dl
		mov	ax, di
		mov	[ds:byte_104A7+di], al
		mov	[ds:byte_1052D], al
		mov	al, 10h
		mov	[ds:byte_10538], al
		mov	dl, [ds:byte_1058F]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_10997+si]
		mov	[ds:byte_10585], al
		sub	al, al
		mov	[ds:byte_10497], al
		mov	[ds:byte_1058E], al
		mov	[ds:byte_10586], al
		mov	[ds:byte_10592], al
		mov	[ds:byte_104A4], al
		mov	[ds:byte_10584], al
		mov	[ds:byte_104A2+di], al
		mov	[ds:byte_104B1+di], al
		mov	al, 44h	; 'D'
		mov	[ds:byte_104A5+di], al
		sub	al, al
		call	sub_1166D
		mov	al, 8
		call	sub_16E7D
loc_10A01:				; ...
		call	sub_17243
		call	sub_170FA
		call	sub_16F56
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		call	sub_16C3D
		call	sub_16C46
		call	sub_17395
		call	sub_1139C
		call	sub_11479
		mov	al, [ds:byte_104A4]
		cmp	al, 50h	; 'P'
		jb	short loc_10A01
loc_10A26:				; ...
		call	sub_11479
		call	sub_11380
		mov	al, [ds:byte_104A4]
		cmp	al, 0C8h ; '»'
		jb	short loc_10A26
		mov	al, 1
		mov	[ds:byte_1058D], al
loc_10A38:				; ...
		call	sub_11479
		call	sub_17243
		call	sub_170FA
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		call	sub_16C3D
		call	sub_17F3A
		call	sub_16C46
		call	sub_17395
		call	sub_1139C
		mov	al, [ds:byte_10586]
		cmp	al, 0
		jnz	short loc_10AB7
		mov	al, [ds:byte_10585]
		cmp	al, 0
		jnz	short loc_10A38
		mov	al, 20h	; ' '
		mov	[ds:byte_10580], al
		mov	[ds:byte_10561], al
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_10491], dl
		sub	al, al
		mov	[ds:byte_1049A], al
		mov	[ds:byte_104A4], al
		mov	[ds:byte_104B1+di], al
		mov	[ds:byte_1058D], al
		mov	al, 0Ah
		call	sub_16E7D
		call	sub_17A72
loc_10A8F:				; ...
		call	sub_116DF
		call	sub_17243
		call	sub_170FA
		call	sub_16F56
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		call	sub_16C3D
		call	sub_16C46
		call	sub_17395
		call	sub_1139C
		mov	al, [ds:byte_104A4]
		cmp	al, 80h	; 'Ä'
		jb	short loc_10A8F
		jmp	short loc_10AFB
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10AB7:				; ...
		mov	al, 1
		mov	[ds:byte_10497], al
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_10491], dl
		mov	[ds:byte_104A4], dl
		mov	si, 11h
		mov	al, [ds:byte_1058B]
		xor	al, [ds:byte_104A7+di]
		cmp	al, 0
		jz	short loc_10ADD
		mov	si, 12h
loc_10ADD:				; ...
		mov	ax, si
		mov	[ds:byte_104B1+di], al
		call	sub_1166D
loc_10AE6:				; ...
		call	sub_1147C
		call	sub_11380
		call	sub_1077E
		mov	al, [ds:byte_104A4]
		cmp	al, 80h	; 'Ä'
		jb	short loc_10AE6
		sub	al, al
		mov	[ds:byte_1058D], al
loc_10AFB:				; ...
		inc	[ds:byte_10490]
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		cmp	di, 2
		jnb	short loc_10B0F
		jmp	loc_1099F
; ---------------------------------------------------------------------------
loc_10B0F:				; ...
		sub	al, al
		mov	[ds:byte_1058D], al
		mov	[ds:byte_10497], al
		call	sub_110D8
		jmp	sub_11427
endp		sub_1099A
; ---------------------------------------------------------------------------
byte_10B1D	db 0			; ...
		db 1
; =============== S U B	R O U T	I N E =======================================
proc		sub_10B1F near		; ...
; FUNCTION CHUNK AT 0C5E SIZE 00000014 BYTES
; FUNCTION CHUNK AT 0C73 SIZE 00000065 BYTES
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jnz	short loc_10B4D
		mov	al, 10h
		mov	[ds:byte_10538], al
		call	sub_170FA
		call	sub_1131D
		call	sub_1139C
		mov	al, 1
		mov	[ds:byte_10574], al
		mov	al, [ds:byte_104A1]
		cmp	al, 0
		jz	short loc_10B45
		jmp	loc_10BD3
; ---------------------------------------------------------------------------
loc_10B45:				; ...
		mov	al, 30h	; '0'
		mov	[ds:byte_104A2], al
		mov	[ds:byte_104A3], al
loc_10B4D:				; ...
		sub	di, di
		call	sub_124D8
		mov	di, 1
loc_10B55:				; ...
		mov	al, [ds:byte_104A2+di]
		cmp	al, 27h	; '''
		jb	short loc_10B61
		cmp	al, 30h	; '0'
		jb	short loc_10B8D
loc_10B61:				; ...
		mov	al, [ds:byte_10568]
		and	al, 4
		shr	al, 1
		shr	al, 1
		xor	al, [ds:byte_10B1D+di]
		mov	[ds:byte_104A7+di], al
		mov	al, [ds:byte_104A5+di]
		cmp	al, 10h
		jnb	short loc_10B83
		mov	al, 10h
		mov	[ds:byte_104A5+di], al
		jmp	short loc_10B8D
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10B83:				; ...
		cmp	al, 88h	; 'à'
		jb	short loc_10B8D
		mov	al, 88h	; 'à'
		mov	[ds:byte_104A5+di], al
loc_10B8D:				; ...
		dec	di
		jns	short loc_10B55
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_10B9C
		jmp	loc_10CC3
; ---------------------------------------------------------------------------
loc_10B9C:				; ...
		mov	al, [ds:byte_10498]
		cmp	al, [ds:byte_10499]
		jb	short loc_10BE1
		jnz	short loc_10BDC
		mov	al, [ds:byte_10575]
		cmp	al, [ds:byte_10576]
		jb	short loc_10BE1
		jnz	short loc_10BDC
		mov	al, [ds:byte_10577]
		cmp	al, [ds:byte_10578]
		jb	short loc_10BE1
		jnz	short loc_10BDC
		mov	dl, [ds:byte_10582]
		sub	dh, dh
		mov	si, dx
		cmp	si, 80h	; 'Ä'
		jb	short loc_10BE4
		mov	[ds:byte_10490], 0
		jmp	loc_10C7D
; ---------------------------------------------------------------------------
loc_10BD3:				; ...
		mov	al, [ds:byte_10498]
		cmp	al, [ds:byte_10499]
		jb	short loc_10BE1
loc_10BDC:				; ...
		sub	si, si
		jmp	short loc_10BE4
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10BE1:				; ...
		mov	si, 1
loc_10BE4:				; ...
		mov	dx, si
		mov	[ds:byte_10490], dl
		mov	[ds:byte_10491], dl
		mov	al, 31h	; '1'
		mov	[ds:byte_104A2+si], al
		inc	[ds:byte_104A5+si]
		inc	si
		mov	ax, si
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
		mov	si, 19h
		call	sub_11435
		call	sub_1135D
		mov	si, 32h	; '2'
		call	sub_11435
		mov	al, 7
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	si, dx
		mov	al, 30h	; '0'
		mov	[ds:byte_104A2+si], al
		dec	[ds:byte_104A5+si]
		call	sub_1135D
		mov	si, 19h
		call	sub_11435
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		mov	al, [ds:byte_104A1]
		cmp	al, 0
		jz	short loc_10C7D
		mov	[ds:byte_10580], al
		mov	al, 0Ah
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
		mov	al, 1
		mov	[ds:byte_10561], al
loc_10C59:				; ...
		sub	al, al
		mov	[ds:byte_1049A], al
		mov	al, [ds:byte_104A1]
		cmp	al, 0
		jz	short loc_10C7D
		clc
		sbb	al, 1
		das
		mov	[ds:byte_104A1], al
		call	sub_17A72
		call	sub_17A49
		call	sub_11F83
		mov	si, 4
		call	sub_11435
		jmp	short loc_10C59
; ---------------------------------------------------------------------------
loc_10C7D:				; ...
		mov	si, 32h	; '2'
		call	sub_11435
		mov	al, [ds:byte_10465]
		or	al, [ds:byte_10466]
		jz	short loc_10CBD
		mov	al, [ds:byte_10465]
		cmp	al, 0
		jz	short loc_10CA3
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	si, dx
		cmp	si, 0
		jnz	short loc_10CB0
		jmp	short loc_10CC0
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10CA3:				; ...
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	si, dx
		cmp	si, 0
		jnz	short loc_10CC0
loc_10CB0:				; ...
		mov	ax, si
		xor	al, 1
		mov	[ds:byte_105A1], al
		mov	al, 6
		mov	[ds:byte_1048F], al
		retn
; ---------------------------------------------------------------------------
loc_10CBD:				; ...
		call	sub_11BEA
loc_10CC0:				; ...
		jmp	sub_110D8
; ---------------------------------------------------------------------------
loc_10CC3:				; ...
		sub	al, al
		mov	[ds:byte_1049A], al
		mov	al, 2
		mov	[ds:byte_10574], al
		mov	al, 10h
		mov	[ds:byte_10561], al
		mov	[ds:byte_10580], al
		mov	al, [ds:byte_10493]
		mov	[ds:byte_10491], al
		mov	[ds:byte_10490], al
		mov	al, [ds:byte_104A1]
		cmp	al, 0
		jnz	short loc_10CFD
		mov	al, 30h	; '0'
		mov	[ds:byte_104A2], al
		mov	[ds:byte_104A3], al
		mov	al, 4
		call	sub_16E7D
		mov	al, 4Bh	; 'K'
		mov	[ds:byte_10496], al
		call	sub_11369
		jmp	short loc_10D0B
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10CFD:				; ...
		mov	dl, [ds:byte_10493]
		sub	dh, dh
		mov	di, dx
		mov	al, 30h	; '0'
		mov	[ds:byte_104A2+di], al
loc_10D0B:				; ...
		mov	al, [ds:byte_1059F]
		cmp	al, 3Ch	; '<'
		jb	short loc_10D43
		jnz	short loc_10D4E
		mov	al, [ds:byte_10577]
		cmp	al, [ds:byte_10578]
		jb	short loc_10D43
		jnz	short loc_10D4E
		mov	al, [ds:byte_104CB]
		or	al, [ds:byte_104CC]
		jnz	short loc_10D33
loc_10D28:				; ...
		sub	al, al
		mov	[ds:byte_10465], al
		mov	[ds:byte_10466], al
		jmp	loc_1105E
; ---------------------------------------------------------------------------
loc_10D33:				; ...
		mov	al, 10h
		call	sub_16E7D
		mov	al, 64h	; 'd'
		mov	[ds:byte_10496], al
		call	sub_11369
		jmp	short loc_10DC0
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10D43:				; ...
		mov	al, 2
		call	sub_16E7D
		mov	si, 1
		jmp	short loc_10D55
; ---------------------------------------------------------------------------
		nop
loc_10D4E:				; ...
		mov	al, 1
		call	sub_16E7D
		sub	si, si
loc_10D55:				; ...
		mov	dx, si
		mov	[ds:byte_10491], dl
		mov	[ds:byte_10490], dl
		inc	[ds:byte_104CF+si]
		mov	al, [ds:byte_1059F]
		cmp	al, 42h	; 'B'
		jnb	short loc_10D71
		cmp	al, 36h	; '6'
		jz	short loc_10D71
		jmp	short loc_10D8C
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_10D71:				; ...
		mov	al, 4Bh	; 'K'
		mov	[ds:byte_10496], al
		call	sub_11369
		sub	al, al
		mov	[ds:byte_1049A], al
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		call	sub_17A72
		mov	al, 0Ah
		call	sub_16E7D
loc_10D8C:				; ...
		mov	al, 32h	; '2'
		mov	[ds:byte_10496], al
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	si, dx
		mov	al, 31h	; '1'
		mov	[ds:byte_104A2+si], al
		inc	[ds:byte_104A5+si]
		call	sub_11369
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	si, dx
		mov	al, 30h	; '0'
		mov	[ds:byte_104A2+si], al
		dec	[ds:byte_104A5+si]
		mov	al, 4Bh	; 'K'
		mov	[ds:byte_10496], al
		call	sub_11369
loc_10DC0:				; ...
		mov	al, [ds:byte_10492]
		cmp	al, 5
		jnb	short loc_10DE0
		mov	al, 50h	; 'P'
		mov	[ds:byte_10561], al
		mov	[ds:byte_10580], al
		mov	al, [ds:byte_104CF]
		cmp	al, 2
		jnb	short loc_10E2A
		mov	al, [ds:byte_104D0]
		cmp	al, 2
		jnb	short loc_10E32
		jmp	sub_110D8
; ---------------------------------------------------------------------------
loc_10DE0:				; ...
		sub	al, al
		mov	[ds:byte_10561], al
		mov	[ds:byte_10580], al
		mov	al, [ds:byte_104CF]
		cmp	al, [ds:byte_104D0]
		jb	short loc_10E32
		jnz	short loc_10E2A
		mov	al, [ds:byte_1049B]
		cmp	al, [ds:byte_1049E]
		jz	short loc_10E00
		jnb	short loc_10E2A
		jb	short loc_10E32
loc_10E00:				; ...
		mov	al, [ds:byte_1049C]
		cmp	al, [ds:byte_1049F]
		jz	short loc_10E0D
		jnb	short loc_10E2A
		jb	short loc_10E32
loc_10E0D:				; ...
		mov	al, 10h
		call	sub_16E7D
		mov	al, 4Bh	; 'K'
		mov	[ds:byte_10496], al
		call	sub_11369
		mov	al, 0Eh
		call	sub_16E7D
		mov	al, 0C8h ; '»'
		mov	[ds:byte_10496], al
		call	sub_11369
		jmp	loc_10D28
; ---------------------------------------------------------------------------
loc_10E2A:				; ...
		mov	al, 0Ch
		call	sub_16E7D
		jmp	short loc_10E37
; ---------------------------------------------------------------------------
		align 2
loc_10E32:				; ...
		mov	al, 0Dh
		call	sub_16E7D
loc_10E37:				; ...
		mov	al, 64h	; 'd'
		mov	[ds:byte_10496], al
		call	sub_11369
		mov	al, [ds:byte_10580]
		cmp	al, 0
		jz	short loc_10E60
		sub	al, al
		mov	[ds:byte_1049A], al
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		call	sub_17A72
		mov	al, 0Ah
		call	sub_16E7D
		sub	al, al
		mov	[ds:byte_10580], al
		jmp	short loc_10E37
; ---------------------------------------------------------------------------
loc_10E60:				; ...
		jmp	loc_11073
endp		sub_10B1F ; sp-analysis	failed
; =============== S U B	R O U T	I N E =======================================
proc		sub_10E63 near		; ...
		sub	al, al
		mov	[ds:byte_10491], al
		mov	[ds:byte_10490], al
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
loc_10E73:				; ...
		mov	al, [ds:byte_10465+di]
		cmp	al, 0
		jnz	short loc_10E7E
		jmp	loc_10FE7
; ---------------------------------------------------------------------------
loc_10E7E:				; ...
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_10491], dl
		mov	al, [ds:byte_10490]
		xor	al, 1
		mov	[ds:byte_1052D], al
		sub	al, al
		mov	[ds:byte_1057C], al
		mov	[ds:byte_1057B], al
		mov	al, 54h	; 'T'
		mov	[ds:byte_104A5], al
		mov	[ds:byte_104A6], al
		sub	al, al
		mov	[ds:byte_104A7+di], al
		mov	al, 34h	; '4'
		mov	[ds:byte_104A2+di], al
		mov	si, 0Eh
		call	sub_11348
		mov	si, 64h	; 'd'
		call	sub_11435
		mov	al, 7
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
		mov	si, 19h
		call	sub_11435
		mov	al, 8
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
		mov	si, 64h	; 'd'
		call	sub_11435
		call	sub_11348
		call	sub_18087
		and	al, 3Fh
		or	al, 0Fh
		sub	ah, ah
		mov	si, ax
		call	sub_11435
		sub	al, al
		mov	[ds:byte_104A4], al
		call	sub_11485
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_10491], dl
		mov	al, [ds:byte_104B1+di]
		mov	[ds:byte_1057F], al
		mov	al, 0Fh
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
loc_10F13:				; ...
		call	sub_11485
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104B1+di]
		cmp	al, [ds:byte_1057F]
		jnz	short loc_10F3D
		mov	al, [ds:byte_104A4]
		cmp	al, 64h	; 'd'
		jb	short loc_10F13
		mov	al, 9
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
		jmp	loc_10FCD
; ---------------------------------------------------------------------------
loc_10F3D:				; ...
		mov	dl, [ds:byte_104A4]
		sub	dh, dh
		mov	si, dx
		mov	[byte ptr ds:word_10469], dl
		cmp	si, 28h	; '('
		mov	al, 1
		jnb	short loc_10F5F
		shr	[byte ptr ds:word_10469], 1
		shr	[byte ptr ds:word_10469], 1
		mov	al, 0Ah
		clc
		sbb	al, [byte ptr ds:word_10469]
loc_10F5F:				; ...
		mov	[ds:byte_1057C], al
		mov	al, 35h	; '5'
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_104A2+di], al
loc_10F70:				; ...
		call	sub_11348
		mov	si, 2
		call	sub_13E75
		inc	[ds:byte_1057B]
		mov	dl, [ds:byte_1057B]
		sub	dh, dh
		mov	si, dx
		call	sub_11435
		mov	al, [ds:byte_1057B]
		cmp	al, [ds:byte_1057C]
		jb	short loc_10F70
		mov	al, 34h	; '4'
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_104A2+di], al
		call	sub_11348
		mov	si, 2
		call	sub_13E75
		mov	si, 32h	; '2'
		call	sub_11435
		sub	al, al
		mov	[ds:byte_1049A], al
		mov	al, [ds:byte_1057C]
		cmp	al, 0Ah
		jb	short loc_10FBC
		mov	al, 20h	; ' '
loc_10FBC:				; ...
		mov	[ds:byte_10561], al
		mov	[ds:byte_10580], al
		mov	al, 0Ah
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
loc_10FCD:				; ...
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		call	sub_17A72
		mov	si, 64h	; 'd'
		call	sub_11435
		mov	al, 7
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
loc_10FE7:				; ...
		inc	[ds:byte_10490]
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	di, dx
		cmp	di, 2
		jnb	short loc_10FFB
		jmp	loc_10E73
; ---------------------------------------------------------------------------
loc_10FFB:				; ...
		call	sub_110D8
		jmp	sub_11427
endp		sub_10E63
; =============== S U B	R O U T	I N E =======================================
proc		sub_11001 near		; ...
		mov	al, [ds:byte_104A1]
		cmp	al, 0
		jz	short loc_1102E
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_1101E
		mov	al, [ds:byte_1059F]
		cmp	al, 42h	; 'B'
		jnb	short loc_1102E
		cmp	al, 36h	; '6'
		jz	short loc_1102E
		clc
		retn
; ---------------------------------------------------------------------------
loc_1101E:				; ...
		mov	al, [ds:byte_10498]
		cmp	al, 4
		jnb	short loc_1102E
		mov	al, [ds:byte_10499]
		cmp	al, 4
		jnb	short loc_1102E
		clc
		retn
; ---------------------------------------------------------------------------
loc_1102E:				; ...
		mov	al, 3
		mov	[ds:byte_1048F], al
		stc
		retn
endp		sub_11001
; ---------------------------------------------------------------------------
byte_11035	db 0			; ...
		db    0
		db    0
		db    1
		db    1
		db    1
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
byte_1104D	db 1			; ...
		db 0
byte_1104F	db 3			; ...
		db 0
byte_11051	db 0			; ...
		db 3
byte_11053	db 7			; ...
		db    7
		db    7
		db    7
byte_11057	db 1			; ...
		db    1
		db    4
		db    1
		db    5
		db    1
		db    1
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_10B1F
loc_1105E:				; ...
		sub	al, al
		mov	si, 5
loc_11063:				; ...
		mov	[ds:byte_1049B+si], al
		dec	si
		jns	short loc_11063
		mov	[ds:byte_10492], al
		mov	[ds:byte_10581], al
		jmp	short sub_110D8
; END OF FUNCTION CHUNK	FOR sub_10B1F
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_10B1F
loc_11073:				; ...
		mov	dl, [ds:byte_10490]
		sub	dh, dh
loc_11079:
		mov	si, dx
		mov	dl, [ds:byte_1104D+si]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_1104F+si]
		sub	ah, ah
		mov	si, ax
		sub	al, al
		mov	[ds:byte_10465+di], al
		mov	[ds:byte_1049B+si], al
		mov	[ds:byte_1049C+si], al
		mov	[ds:byte_1049D+si], al
		mov	dl, [ds:byte_10490]
		sub	dh, dh
		mov	si, dx
		mov	dl, [ds:byte_11051+si]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_1049C+di]
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		mov	[byte ptr ds:word_10469], al
		mov	al, [ds:byte_1049B+di]
		cmp	al, 0
		jz	short loc_110C7
		clc
		adc	al, 0Ah
loc_110C7:				; ...
		sub	ah, ah
		mov	si, ax
		mov	al, [ds:byte_11035+si]
		mov	[ds:byte_10492], al
		mov	[ds:byte_10581], al
		mov	[ds:byte_10562], al
; END OF FUNCTION CHUNK	FOR sub_10B1F
; =============== S U B	R O U T	I N E =======================================
proc		sub_110D8 near		; ...
		sub	al, al
		mov	si, 1
loc_110DD:				; ...
		mov	[ds:byte_10575+si], al
		mov	[ds:byte_10577+si], al
		mov	[ds:byte_10498+si], al
		mov	[ds:byte_104CB+si], al
		dec	si
		jns	short loc_110DD
		mov	[ds:byte_10574], al
		mov	[ds:byte_10561], al
		mov	[ds:byte_10497], al
		mov	[ds:byte_10491], al
		call	sub_17790
		mov	al, 1
		mov	[ds:byte_10491], al
		call	sub_17790
		mov	al, 3Ch	; '<'
		mov	[ds:byte_1059F], al
		call	sub_178C3
		mov	al, [ds:byte_10465]
		or	al, [ds:byte_10466]
		jnz	short loc_1113D
		sub	al, al
		mov	[ds:byte_10492], al
		mov	[ds:byte_10581], al
		mov	di, 5
loc_11123:				; ...
		mov	[ds:byte_1049B+di], al
		dec	di
		jns	short loc_11123
		inc	[ds:byte_10562]
		mov	al, [ds:byte_10562]
		cmp	al, 4
		jb	short loc_1113D
		call	sub_11427
		mov	al, 2
		mov	[ds:byte_10562], al
loc_1113D:				; ...
		mov	dl, [ds:byte_1056D]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_11053+di]
		mov	[ds:byte_105B7], al
		sub	al, al
		mov	[ds:byte_1049A], al
		mov	[ds:byte_10491], al
		call	sub_17A72
		sub	al, al
		mov	[ds:byte_1049A], al
		inc	[ds:byte_10491]
		call	sub_17A72
		mov	al, [ds:byte_10562]
		cmp	al, 5
		jnb	short loc_11177
		mov	al, [ds:byte_10492]
		and	al, 3
		cmp	al, 2
		jnz	short loc_11177
		inc	[ds:byte_10562]
loc_11177:				; ...
		mov	al, 19h
		mov	[ds:byte_10571], al
		mov	al, 30h	; '0'
		mov	[ds:byte_104A1], al
		mov	al, [ds:byte_10492]
		clc
		adc	al, 1
		daa
		jb	short loc_1118D
		mov	[ds:byte_10492], al
loc_1118D:				; ...
		inc	[ds:byte_10581]
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_111B1
		mov	al, 60h	; '`'
		mov	[ds:byte_104A1], al
		mov	dl, [ds:byte_10492]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_11057+si]
		mov	[ds:byte_1048F], al
		jmp	short loc_111ED
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_111B1:				; ...
		mov	al, 4
		cmp	al, [ds:byte_10581]
		jnz	short loc_111C1
		mov	al, 4
		mov	[ds:byte_1048F], al
		jmp	short loc_111ED
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_111C1:				; ...
		mov	al, 8
		cmp	al, [ds:byte_10581]
		jnb	short loc_111E8
		sub	al, al
		mov	[ds:byte_10581], al
		mov	al, 5
		mov	[ds:byte_1048F], al
		mov	al, [ds:byte_10492]
		cmp	al, 9
		jb	short loc_111ED
		mov	al, [ds:byte_1058F]
		cmp	al, 2
		jnb	short loc_111ED
		inc	[ds:byte_1058F]
		jmp	short loc_111ED
; ---------------------------------------------------------------------------
		align 2
loc_111E8:				; ...
		mov	al, 1
		mov	[ds:byte_1048F], al
loc_111ED:				; ...
		call	sub_111F8
		mov	al, 0FFh
		mov	[ds:byte_10582], al
		retn
endp		sub_110D8
; ---------------------------------------------------------------------------
byte_111F6	db 34h			; ...
		db 6Ch
; =============== S U B	R O U T	I N E =======================================
proc		sub_111F8 near		; ...
		mov	al, 1
		mov	[ds:byte_10491], al
loc_111FD:				; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		sub	al, al
		mov	[ds:byte_104A2+di], al
endp		sub_111F8 ; sp-analysis	failed
		mov	[ds:byte_1052D], al
		mov	[ds:byte_104B7+di], al
		mov	[ds:byte_104B9+di], al
		mov	[ds:byte_10497], al
		mov	[ds:byte_10560], al
		mov	[ds:byte_1055F], al
		mov	[ds:byte_104C9+di], al
loc_11223:
		mov	[ds:byte_104C7+di], al
		mov	[ds:byte_104C3+di], al
		mov	ax, di
		mov	[ds:byte_104A7+di], al
		call	sub_18087
		and	al, 3
		clc
		adc	al, [ds:byte_111F6+di]
		mov	[ds:byte_104A5+di], al
		mov	si, 1Ch
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_11254
		mov	al, [ds:byte_104A1]
		cmp	al, 90h	; 'ê'
		jnb	short loc_11254
		sub	si, si
loc_11254:				; ...
		mov	ax, si
		mov	[ds:byte_104B1+di], al
		call	sub_115F6
		sub	al, al
		mov	[ds:byte_104B1+di], al
		dec	[ds:byte_10491]
		jns	short loc_111FD
		retn
; =============== S U B	R O U T	I N E =======================================
proc		sub_1126A near		; ...
		call	sub_170FA
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_11279
		jmp	short loc_112D7
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_11279:				; ...
		mov	al, 7
		mov	dl, [ds:byte_104A4]
		sub	dh, dh
		mov	si, dx
		cmp	si, 82h	; 'Ç'
		jnb	short loc_112CE
		mov	al, [ds:byte_1056F]
		call	sub_170C3
		call	sub_1709B
		mov	al, [ds:byte_104A4]
		cmp	al, 32h	; '2'
		jb	short loc_112AF
		mov	al, [ds:byte_1049A]
		cmp	al, 0
		jnz	short loc_112BD
		mov	al, [ds:byte_10493]
		mov	[ds:byte_10491], al
		call	sub_17A72
		call	sub_17790
		jmp	short loc_112BD
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_112AF:				; ...
		mov	dl, [ds:byte_10493]
		sub	dh, dh
		mov	si, dx
		inc	si
		mov	ax, si
		jmp	short loc_112CE
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_112BD:				; ...
		mov	dl, [ds:byte_10497]
		sub	dh, dh
		mov	si, dx
		mov	al, 5
		cmp	si, 1
		jz	short loc_112CE
		mov	al, 6
loc_112CE:				; ...
		call	sub_16E7D
		call	sub_16F56
		jmp	short sub_1131D
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_112D7:				; ...
		mov	al, [ds:byte_104A1]
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		jnz	short loc_112E6
		mov	al, 1
loc_112E6:				; ...
		mov	[ds:byte_10580], al
		mov	[ds:byte_10561], al
		mov	al, 0Ah
		mov	dl, [ds:byte_104A4]
		sub	dh, dh
		mov	si, dx
		cmp	si, 64h	; 'd'
		jnb	short loc_11301
		mov	al, [ds:byte_10493]
		clc
		adc	al, 1
loc_11301:				; ...
		call	sub_16E7D
		mov	al, [ds:byte_1049A]
		cmp	al, 0
		jnz	short loc_11314
		mov	al, [ds:byte_10493]
		mov	[ds:byte_10491], al
		call	sub_17A72
loc_11314:				; ...
		call	sub_16F56
		call	sub_17A72
		jmp	short sub_1131D
endp		sub_1126A
; ---------------------------------------------------------------------------
		db 90h
; =============== S U B	R O U T	I N E =======================================
proc		sub_1131D near		; ...
		mov	al, [ds:byte_1052D]
		xor	al, 1
		mov	[ds:byte_10491], al
		call	sub_16C46
		mov	al, [ds:byte_1052D]
		mov	[ds:byte_10491], al
		call	sub_16C46
		jmp	sub_17395
endp		sub_1131D
; =============== S U B	R O U T	I N E =======================================
proc		sub_11334 near		; ...
		call	sub_170FA
		mov	al, [ds:byte_104B7]
		cmp	al, 1Ch
		jnz	short sub_1131D
		mov	al, 3
		call	sub_16E7D
		call	sub_16F56
		jmp	short sub_1131D
endp		sub_11334
; =============== S U B	R O U T	I N E =======================================
proc		sub_11348 near		; ...
		call	sub_170FA
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		call	sub_16C46
		call	sub_174CC
		call	sub_17395
		jmp	short sub_1139C
endp		sub_11348
; ---------------------------------------------------------------------------
		db 90h
; =============== S U B	R O U T	I N E =======================================
proc		sub_1135D near		; ...
		call	sub_170FA
		call	sub_16F56
		call	sub_1131D
		jmp	short sub_1139C
endp		sub_1135D
; ---------------------------------------------------------------------------
		db 90h
; =============== S U B	R O U T	I N E =======================================
proc		sub_11369 near		; ...
		call	sub_170FA
		call	sub_16F56
		call	sub_1131D
		call	sub_1139C
		call	sub_135A9
		mov	al, [ds:byte_10496]
		cmp	al, 0
		jnz	short sub_11369
		retn
endp		sub_11369
; =============== S U B	R O U T	I N E =======================================
proc		sub_11380 near		; ...
		call	sub_17243
		call	sub_170FA
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		call	sub_16C3D
		call	sub_16C46
		call	sub_17395
		jmp	short sub_1139C
endp		sub_11380
; ---------------------------------------------------------------------------
		nop
loc_11398:				; ...
		add	al, 0
; ---------------------------------------------------------------------------
		db    5
		db    6
; =============== S U B	R O U T	I N E =======================================
proc		sub_1139C near		; ...
		mov	dl, [ds:byte_104D1]
		sub	dh, dh
		mov	di, dx
		mov	dl, [byte ptr ds:loc_11398+di]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_10497]
		cmp	al, 0
		jz	short loc_113B6
		mov	si, 8
loc_113B6:				; ...
		mov	dx, si
		cmp	dl, [ds:byte_10538]
		jnb	short sub_1139C
		mov	al, [ds:byte_10497]
		cmp	al, 0
		jz	short sub_113CB
		call	sub_1382B
		call	sub_1382B
endp		sub_1139C ; sp-analysis	failed
; =============== S U B	R O U T	I N E =======================================
proc		sub_113CB near		; ...
		call	sub_1382B
		inc	[ds:byte_1052F]
		mov	al, [ds:byte_1052E]
		and	al, 1
		xor	al, 1
		mov	[ds:byte_1052E], al
		call	sub_17902
		jmp	sub_11F83
endp		sub_113CB
; =============== S U B	R O U T	I N E =======================================
proc		sub_113E2 near		; ...
; FUNCTION CHUNK AT 395A SIZE 00000023 BYTES
		sub	al, al
		sub	di, di
loc_113E6:				; ...
		mov	[ds:byte_10524+di], al
		inc	di
		cmp	di, 88h	; 'à'
		jnb	short loc_113F5
		mov	[ds:byte_10468+di], al
loc_113F5:				; ...
		cmp	di, 95h	; 'ï'
		jb	short loc_113E6
		mov	al, 20h	; ' '
		mov	di, 27h	; '''
loc_11400:				; ...
		mov	[ds:byte_105BA+di], al
		mov	[ds:byte_1060A+di], 0
		dec	di
		jns	short loc_11400
		call	sub_17736
		call	sub_17831
		call	sub_17790
		call	sub_110D8
		call	sub_17902
		call	sub_178C3
		call	sub_11F83
		call	sub_113CB
		jmp	loc_13D5A
endp		sub_113E2
; =============== S U B	R O U T	I N E =======================================
proc		sub_11427 near		; ...
		mov	al, [ds:byte_1056D]
		clc
		adc	al, 1
		and	al, 3
		mov	[ds:byte_1056D], al
		jmp	sub_17736
endp		sub_11427
; =============== S U B	R O U T	I N E =======================================
proc		sub_11435 near		; ...
		mov	al, [ds:byte_10464]
loc_11438:				; ...
		cmp	al, [ds:byte_10464]
		jz	short loc_11438
		push	ax
		push	si
		call	sub_135A9
		pop	si
		pop	ax
		dec	si
		jnz	short sub_11435
		retn
endp		sub_11435
; =============== S U B	R O U T	I N E =======================================
proc		sub_11449 near		; ...
		call	sub_11485
		mov	al, [ds:byte_1052E]
		mov	[ds:byte_10491], al
		call	sub_121A4
		call	sub_116DF
		mov	al, [ds:byte_1052E]
		xor	al, 1
		mov	[ds:byte_10491], al
		call	sub_121A4
		jmp	sub_116DF
endp		sub_11449
; =============== S U B	R O U T	I N E =======================================
proc		sub_11466 near		; ...
		call	sub_11485
		mov	al, 1
		mov	[ds:byte_10491], al
		call	sub_116DF
		sub	al, al
		mov	[ds:byte_10491], al
		jmp	sub_116DF
endp		sub_11466
; =============== S U B	R O U T	I N E =======================================
proc		sub_11479 near		; ...
		call	sub_11485
endp		sub_11479 ; sp-analysis	failed
; =============== S U B	R O U T	I N E =======================================
proc		sub_1147C near		; ...
		mov	al, [ds:byte_10490]
		mov	[ds:byte_10491], al
		jmp	sub_116DF
endp		sub_1147C
; =============== S U B	R O U T	I N E =======================================
proc		sub_11485 near		; ...
		call	sub_135A9
		sub	di, di
		mov	dx, di
		mov	[ds:byte_10491], dl
		mov	al, [ds:byte_10465+di]
		cmp	al, 0
		jnz	short loc_1149B
		jmp	loc_1154E
; ---------------------------------------------------------------------------
loc_1149B:				; ...
		mov	al, [ds:byte_12CC3+di]
		sub	ah, ah
		xor	al, 0FFh
		mov	si, ax
		and	al, 0Fh
		mov	[ds:byte_10593+di], al
		mov	[ds:byte_1057D], al
		mov	ax, si
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		and	al, 1
		mov	[ds:byte_10595+di], al
		mov	ax, si
		and	al, 10h
		xor	al, 10h
		or	al, [ds:byte_1057D]
		mov	[ds:byte_1057E], al
		mov	al, [ds:byte_104BB+di]
		cmp	al, 0
		jnz	short loc_1151D
		mov	ax, di
		xor	al, 1
		mov	di, ax
		mov	al, [ds:byte_104C5+di]
		cmp	al, 0
		jz	short loc_1151D
		call	sub_124D8
		sub	ah, ah
		mov	di, ax
		mov	al, [ds:byte_1156E+di]
		cmp	al, 0
		jz	short loc_1151D
		mov	al, [ds:byte_10566]
		cmp	al, 8
		jnb	short loc_1151D
		mov	dl, [ds:byte_1057E]
		sub	dh, dh
		mov	si, dx
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104A7+di]
		cmp	al, 0
		jz	short loc_11516
		mov	al, [ds:byte_115D6+si]
		jmp	short loc_11542
; ---------------------------------------------------------------------------
		align 2
loc_11516:				; ...
		mov	al, [ds:byte_115B6+si]
		jmp	short loc_11542
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1151D:				; ...
		mov	dl, [ds:byte_1057E]
		sub	dh, dh
		mov	si, dx
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104A7+di]
		xor	al, [ds:byte_104A9+di]
		jnz	short loc_1153E
		mov	al, [ds:byte_11576+si]
		jmp	short loc_11542
; ---------------------------------------------------------------------------
		align 2
loc_1153E:				; ...
		mov	al, [ds:byte_11596+si]
loc_11542:				; ...
		mov	[ds:byte_104B1+di], al
		cmp	al, 0
		jz	short loc_1154E
		mov	[ds:byte_104CB+di], al
loc_1154E:				; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		cmp	di, 0
		jnz	short locret_1156D
		inc	di
		mov	dx, di
		mov	[ds:byte_10491], dl
		mov	al, [ds:byte_10465+di]
		cmp	al, 0
		jz	short locret_1156D
		jmp	loc_1149B
; ---------------------------------------------------------------------------
locret_1156D:				; ...
		retn
endp		sub_11485
; ---------------------------------------------------------------------------
byte_1156E	db 0			; ...
		db    1
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
byte_11576	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    4
		db    2
		db    3
		db    0
		db    6
		db    8
		db    7
		db    0
		db    5
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ch
		db  0Ah
		db  0Bh
		db    0
		db  0Eh
		db  10h
		db  0Fh
		db    0
		db  0Dh
		db    9
		db    0
byte_11596	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    6
		db    8
		db    7
		db    0
		db    4
		db    2
		db    3
		db    0
		db    5
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Eh
		db  10h
		db  0Fh
		db    0
		db  0Ch
		db  0Ah
		db  0Bh
		db    0
		db  0Dh
		db    9
		db    0
byte_115B6	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    4
		db    2
		db    3
		db    0
		db    6
		db  14h
		db  14h
		db    0
		db    5
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ch
		db  0Ah
		db  0Bh
		db    0
		db    6
		db  14h
		db  14h
		db    0
		db  0Dh
		db    9
		db    0
byte_115D6	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    6
		db  14h
		db  14h
		db    0
		db    4
		db    2
		db    3
		db    0
		db    5
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    6
		db  14h
		db  14h
		db    0
		db  0Ch
		db  0Ah
		db  0Bh
		db    0
		db  0Dh
		db    9
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_115F6 near		; ...
		mov	al, [ds:byte_10497]
		cmp	al, 0
		jz	short loc_1160F
		mov	dl, [ds:byte_10493]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_10560]
		mov	[ds:byte_104B1+si], al
		jmp	short loc_1166E
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1160F:				; ...
		mov	al, [ds:byte_104B1+di]
		cmp	al, 0
		jnz	short loc_1166E
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	si, dx
		inc	[ds:byte_104C1+si]
		cmp	[ds:byte_104C1+si], 80h	; 'Ä'
		jnb	short loc_1163C
		mov	dl, [ds:byte_10492]
		sub	dh, dh
		mov	si, dx
		cmp	si, 3
		jnb	short loc_11672
		sub	al, al
		jmp	short loc_11672
; ---------------------------------------------------------------------------
		align 2
loc_1163C:				; ...
		push	ax
		call	sub_18087
		sub	ah, ah
		mov	si, ax
		pop	ax
		cmp	si, 10h
		jnb	short loc_11672
		mov	al, 15h
		mov	[ds:byte_104B7+di], al
		sub	ah, ah
		mov	si, ax
		call	sub_18087
		and	ax, 3Fh
		add	al, 10h
		mov	[ds:byte_104C1+di], al
		call	sub_18087
		and	ax, 30h
		mov	[ds:byte_104CD+di], al
		jmp	short loc_1167A
endp		sub_115F6
; ---------------------------------------------------------------------------
		db 90h
; =============== S U B	R O U T	I N E =======================================
proc		sub_1166D near		; ...
		nop
loc_1166E:				; ...
		mov	[ds:byte_104C1+di], al
loc_11672:				; ...
		mov	[ds:byte_104B7+di], al
		sub	ah, ah
		mov	si, ax
loc_1167A:				; ...
		mov	al, [ds:byte_11970+si]
		mov	[ds:byte_104B3+di], al
		mov	[ds:byte_104B5+di], al
		mov	al, 1
		mov	[ds:byte_104B9+di], al
		sub	al, al
		mov	[ds:byte_104BD+di], al
		mov	[ds:byte_104BF+di], al
		mov	[ds:byte_104BB+di], al
		mov	[ds:byte_104A9+di], al
		mov	[ds:byte_104C7+di], al
		mov	[ds:byte_104C9+di], al
		retn
endp		sub_1166D
; ---------------------------------------------------------------------------
byte_116A7	db 17h			; ...
		db  16h
		db  14h
		db  14h
		db    0
		db  0Fh
		db  19h
		db  1Ah
		db  14h
		db  19h
		db  11h
		db  22h	; "
		db  14h
		db  12h
		db  22h	; "
		db  12h
		db  20h
		db  0Fh
		db  1Eh
		db  17h
		db  16h
		db  1Bh
		db  1Ch
		db  16h
		db    0
		db  14h
		db  16h
		db  12h
		db  13h
		db  13h
		db  11h
		db  17h
		db  23h	; #
		db  14h
		db    0
		db    0
		db  13h
		db  12h
		db  1Ah
		db  1Dh
		db  14h
		db  1Ah
		db  21h	; !
		db  22h	; "
		db  17h
		db  15h
		db  22h	; "
		db  23h	; #
		db  14h
		db  14h
		db  19h
		db  19h
		db  19h
		db  19h
		db    0
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_116DF near		; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104C3+di]
		cmp	al, 0
		jz	short loc_116F0
		retn
; ---------------------------------------------------------------------------
loc_116F0:				; ...
		mov	al, [ds:byte_104A7+di]
		and	al, 1
		mov	[ds:byte_104A7+di], al
		mov	al, [ds:byte_10465+di]
		and	al, 1
		mov	[ds:byte_10465+di], al
		cmp	al, 0
		jz	short loc_11739
		mov	al, [ds:byte_104B1+di]
		cmp	al, [ds:byte_104B7+di]
		jz	short loc_11718
		sub	al, al
		mov	[ds:byte_104B9+di], al
loc_11718:				; ...
		mov	al, [ds:byte_104B9+di]
		cmp	al, 0
		jnz	short loc_1172E
		mov	al, [ds:byte_104BF+di]
		cmp	al, 0
		jz	short loc_1172E
		mov	al, 1
		mov	[ds:byte_104BD+di], al
loc_1172E:				; ...
		mov	al, [ds:byte_104BD+di]
		cmp	al, 0
		jz	short loc_11739
		jmp	loc_11882
; ---------------------------------------------------------------------------
loc_11739:				; ...
		mov	al, [ds:byte_104B5+di]
		mov	[ds:byte_104B3+di], al
		mov	al, [ds:byte_104B7+di]
		cmp	al, 0
		jnz	short loc_1174C
loc_11749:				; ...
		call	sub_115F6
loc_1174C:				; ...
		mov	dl, [ds:byte_104B7+di]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104B3+di]
		cmp	al, [ds:byte_11971+si]
		jb	short loc_11760
		jmp	short loc_11749
; ---------------------------------------------------------------------------
loc_11760:				; ...
		mov	dl, [ds:byte_104B3+di]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_11994+si]
		cmp	al, 36h	; '6'
		jb	short loc_11772
		sub	al, al
loc_11772:				; ...
		mov	[ds:byte_104A2+di], al
		mov	al, [ds:byte_104C7+di]
		mov	[ds:byte_104C9+di], al
		mov	al, [ds:byte_11B23+si]
		mov	[ds:byte_104C7+di], al
		and	al, 4
		mov	[ds:byte_104BF+di], al
		mov	al, [ds:byte_104C7+di]
		and	al, 40h
		mov	[ds:byte_104C5+di], al
		mov	al, [ds:byte_10465+di]
		cmp	al, 0
		jnz	short loc_117A1
		jmp	loc_1183B
; ---------------------------------------------------------------------------
loc_117A1:				; ...
		mov	al, [ds:byte_104C7+di]
		and	al, 8
		jz	short loc_117F7
		mov	al, [ds:byte_104B1+di]
		cmp	al, [ds:byte_104B7+di]
		jz	short loc_117DB
		mov	al, [ds:byte_104BB+di]
		cmp	al, 0
		jz	short loc_117F7
		sub	al, al
		mov	[ds:byte_104BB+di], al
		mov	[ds:byte_104BD+di], al
		mov	[ds:byte_104BF+di], al
		mov	dl, [ds:byte_104B3+di]
		sub	dh, dh
		mov	si, dx
		inc	si
		mov	ax, si
		mov	[ds:byte_104B5+di], al
		jmp	loc_116F0
; ---------------------------------------------------------------------------
loc_117DB:				; ...
		mov	al, [ds:byte_104BB+di]
		cmp	al, 80h	; 'Ä'
		jnb	short locret_117F6
		cmp	al, 0
		jnz	short loc_117EA
		call	sub_118BD
loc_117EA:				; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	si, dx
		inc	[ds:byte_104BB+si]
locret_117F6:				; ...
		retn
; ---------------------------------------------------------------------------
loc_117F7:				; ...
		mov	al, [ds:byte_104C7+di]
		and	al, 10h
		jz	short loc_1183B
		mov	al, [ds:byte_104B9+di]
		cmp	al, 0
		jnz	short loc_1183B
		mov	al, [ds:byte_104B7+di]
		cmp	al, 3
		jz	short loc_1181B
		cmp	al, 7
		jz	short loc_1181E
		mov	al, [ds:byte_104B1+di]
		cmp	al, 0
		jz	short loc_1183B
loc_1181B:				; ...
		jmp	loc_11749
; ---------------------------------------------------------------------------
loc_1181E:				; ...
		mov	al, 3
		mov	dl, [ds:byte_104A7+di]
		sub	dh, dh
		mov	si, dx
		cmp	si, 0
		jnz	short loc_1182F
		mov	al, 0FDh ; '˝'
loc_1182F:				; ...
		clc
		adc	al, [ds:byte_104A5+di]
		mov	[ds:byte_104A5+di], al
		jmp	loc_11749
; ---------------------------------------------------------------------------
loc_1183B:				; ...
		mov	al, [ds:byte_104C7+di]
		and	al, 2
		jz	short loc_11853
		mov	al, [ds:byte_104A7+di]
		xor	al, 1
		mov	[ds:byte_104A7+di], al
		mov	al, 1
		mov	[ds:byte_104A9+di], al
loc_11853:				; ...
		mov	al, [ds:byte_104C7+di]
		and	al, 1
		jz	short loc_11861
		mov	dx, di
		mov	[ds:byte_1052D], dl
loc_11861:				; ...
		mov	al, [ds:byte_104C7+di]
		and	al, 20h
		jz	short loc_1186F
		mov	al, 1
		mov	[ds:byte_104C3+di], al
loc_1186F:				; ...
		call	sub_118BD
		mov	dl, [ds:byte_104B3+di]
		sub	dh, dh
		mov	si, dx
		inc	si
		mov	ax, si
		mov	[ds:byte_104B5+di], al
		retn
; ---------------------------------------------------------------------------
loc_11882:				; ...
		mov	dl, [ds:byte_104B3+di]
		sub	dh, dh
		mov	si, dx
		dec	si
		mov	ax, si
		mov	[ds:byte_104B3+di], al
		mov	dl, [ds:byte_104B7+di]
		sub	dh, dh
		mov	si, dx
		cmp	al, [ds:byte_11970+si]
		jnb	short loc_118A2
		jmp	loc_11749
; ---------------------------------------------------------------------------
loc_118A2:				; ...
		mov	dl, [ds:byte_104B3+di]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_11994+si]
		mov	[ds:byte_104A2+di], al
		mov	al, [ds:byte_104BD+di]
		xor	al, [ds:byte_104A7+di]
		jmp	short loc_118C9
endp		sub_116DF
; ---------------------------------------------------------------------------
		db 90h
; =============== S U B	R O U T	I N E =======================================
proc		sub_118BD near		; ...
		mov	dl, [ds:byte_104B3+di]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104A7+di]
loc_118C9:				; ...
		cmp	al, 0
		jz	short loc_118F3
		clc
		mov	al, [ds:byte_104A5+di]
		sbb	al, [ds:byte_11A5C+si]
		mov	[ds:byte_104A5+di], al
		mov	dl, [ds:byte_104A2+di]
		sub	dh, dh
		mov	si, dx
		clc
		adc	al, 24h	; '$'
		mov	[byte ptr ds:word_1046B], al
		clc
		sbb	al, [ds:byte_116A7+si]
		mov	[byte ptr ds:word_10469], al
		jmp	short loc_11911
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_118F3:				; ...
		mov	al, [ds:byte_104A5+di]
		add	al, [ds:byte_11A5C+si]
		mov	[ds:byte_104A5+di], al
		mov	[byte ptr ds:word_10469], al
		mov	dl, [ds:byte_104A2+di]
		sub	dh, dh
		mov	si, dx
		add	al, [ds:byte_116A7+si]
		mov	[byte ptr ds:word_1046B], al
loc_11911:				; ...
		mov	al, 10h
		cmp	al, [byte ptr ds:word_10469]
		jb	short loc_1193E
		mov	al, [ds:byte_104A7+di]
		cmp	al, 0
		jnz	short loc_1192A
		mov	al, 10h
		mov	[ds:byte_104A5+di], al
		jmp	short loc_11961
; ---------------------------------------------------------------------------
		align 2
loc_1192A:				; ...
		mov	al, 10h
		add	al, [ds:byte_116A7+si]
		clc
		sbb	al, 24h	; '$'
		jnb	short loc_11937
		sub	al, al
loc_11937:				; ...
		mov	[ds:byte_104A5+di], al
		jmp	short loc_11961
; ---------------------------------------------------------------------------
		align 2
loc_1193E:				; ...
		mov	al, 0AEh ; 'Æ'
		cmp	al, [byte ptr ds:word_1046B]
		jnb	short loc_11961
		mov	al, [ds:byte_104A7+di]
		cmp	al, 0
		jnz	short loc_1195B
		mov	al, 0AEh ; 'Æ'
		sub	al, [ds:byte_116A7+si]
		mov	[ds:byte_104A5+di], al
		jmp	short loc_11961
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1195B:				; ...
		mov	al, 8Ah	; 'ä'
		mov	[ds:byte_104A5+di], al
loc_11961:				; ...
		mov	al, [ds:byte_104A5+di]
		cmp	al, 0F0h ; ''
		jb	short locret_1196F
		sub	al, al
		mov	[ds:byte_104A5+di], al
locret_1196F:				; ...
		retn
endp		sub_118BD
; ---------------------------------------------------------------------------
byte_11970	db 0			; ...
byte_11971	db 2			; ...
		db    8
		db  0Ch
		db  11h
		db  17h
		db  1Bh
		db  1Fh
		db  24h	; $
		db  29h	; )
		db  30h	; 0
		db  38h	; 8
		db  3Eh	; >
		db  42h	; B
		db  47h	; G
		db  4Ch	; L
		db  54h	; T
		db  5Ch	; \
		db  64h	; d
		db  6Ch	; l
		db  74h	; t
		db  78h	; x
		db  88h	; à
		db  89h	; â
		db  8Ah	; ä
		db  8Bh	; ã
		db  8Eh	; é
		db  92h	; í
		db  96h	; ñ
		db 0A4h	; §
		db 0A5h	; •
		db 0A7h	; ß
		db 0AFh	; Ø
		db 0BBh	; ª
		db 0C0h	; ¿
		db 0C7h	; «
byte_11994	db 0			; ...
		align 2
		db  1Eh
		db  17h
		db  17h
		db  17h
		db  1Eh
		db    0
		db  0Fh
		db  14h
		db  0Fh
		db    0
		db    1
		db    2
		db    3
		db  0Ch
		db    0
		db  0Dh
		db    6
		db  10h
		db    6
		db  0Dh
		db    0
		db  21h	; !
		db  20h
		db  21h	; !
		db    0
		db  11h
		db  12h
		db  11h
		db    0
		db  0Ch
		db    3
		db    2
		db    1
		db    0
		db  1Fh
		db  0Fh
		db  14h
		db  0Fh
		db    0
		db  1Eh
		db  17h
		db  16h
		db  16h
		db  17h
		db  1Eh
		db    0
		db  1Eh
		db  19h
		db  1Ah
		db  1Bh
		db  1Ch
		db  1Dh
		db  1Eh
		db    0
		db  0Dh
		db    7
		db  0Eh
		db    7
		db  0Dh
		db    0
		db  0Dh
		db  15h
		db  0Dh
		db    0
		db  1Fh
		db  11h
		db  12h
		db  11h
		db    0
		db  1Fh
		db  0Dh
		db  15h
		db  0Dh
		db    0
		db    8
		db    5
		db    9
		db  0Ah
		db  0Bh
		db    7
		db  0Dh
		db    0
		db  1Eh
		db  1Dh
		db  1Ch
		db  1Bh
		db  1Ah
		db  19h
		db  1Eh
		db    0
		db  2Ch	; ,
		db  2Dh	; -
		db  2Eh	; .
		db  2Fh	; /
		db  2Fh	; /
		db  2Fh	; /
		db  2Fh	; /
		db  2Fh	; /
		db  28h	; (
		db  29h	; )
		db  2Ah	; *
		db  2Bh	; +
		db  2Bh	; +
		db  2Bh	; +
		db  2Bh	; +
		db  2Bh	; +
		db  24h	; $
		db  24h	; $
		db  25h	; %
		db  26h	; &
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db  13h
		db  13h
		db  13h
		db  13h
		db  32h	; 2
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  32h	; 2
		db    0
		db    0
		db    0
		db  1Fh
		db  1Fh
		db    0
		db    1
		db    2
		db    3
		db  0Ch
		db  0Ch
		db    3
		db    2
		db    1
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db  30h	; 0
		db    1
		db  0Ch
		db    0
		db  28h	; (
		db  29h	; )
		db  2Ah	; *
		db  2Bh	; +
		db  2Bh	; +
		db  2Bh	; +
		db  2Bh	; +
		db  2Bh	; +
		db    0
		db  22h	; "
		db  22h	; "
		db  23h	; #
		db  18h
		db  23h	; #
		db  18h
		db  23h	; #
		db    0
		db    0
		db    0
		db    0
		db  17h
		db  17h
		db  17h
		db  1Eh
		db    0
		db  19h
		db  1Ah
		db  1Bh
		db  1Ch
		db  1Dh
		db  1Eh
		db    0
		db    0
byte_11A5C	db 0			; ...
		db    0
		db    0
		db    2
		db    1
		db    0
		db    0
		db    0
		db    3
		db    3
		db    2
		db 0FAh	; ˙
		db    4
		db    5
		db    4
		db    3
		db    0
		db    0
		db 0FAh	; ˙
		db    0
		db    0
		db    6
		db    0
		db    2
		db 0FBh	; ˚
		db    2
		db 0FEh	; ˛
		db    4
		db    0
		db 0FCh	; ¸
		db    0
		db    0
		db 0FDh	; ˝
		db 0FCh	; ¸
		db 0FBh	; ˚
		db 0FCh	; ¸
		db    0
		db  11h
		db    3
		db    0
		db 0FDh	; ˝
unk_11A85	db    0
		db    5
		db    5
		db    4
		db    3
		db    2
		db    2
		db    5
		db    6
		db    7
		db    8
		db    7
		db    7
		db    7
		db    0
		db    0
		db 0FAh	; ˙
		db 0FFh
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  19h
		db    0
		db    0
		db 0FCh	; ¸
		db    0
		db    5
		db    0
		db    0
		db    0
		db    4
		db 0FFh
		db 0FFh
		db    8
		db 0F5h	; ı
		db 0FFh
		db    2
		db    0
		db 0FBh	; ˚
		db 0FAh	; ˙
		db 0F9h	; ˘
		db 0F8h	; ¯
		db 0F9h	; ˘
		db 0F9h	; ˘
		db 0F9h	; ˘
		db    0
		db    4
		db    4
		db    2
		db    2
		db    0
		db    0
		db    0
		db    0
		db 0FAh	; ˙
		db 0F8h	; ¯
		db 0FCh	; ¸
		db 0FAh	; ˙
		db    0
		db    0
		db    0
		db    0
		db 0FDh	; ˝
		db 0FEh	; ˛
		db 0FCh	; ¸
		db 0FBh	; ˚
		db 0FEh	; ˛
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Eh
		db    0
		db    4
		db    5
		db    4
		db    3
		db    0
		db 0FDh	; ˝
		db 0FCh	; ¸
		db 0FBh	; ˚
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db    0
		db    0
		db    0
		db    3
		db    0
		db 0FDh	; ˝
		db 0FAh	; ˙
		db 0FAh	; ˙
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FDh	; ˝
		db    0
		db    0
		db    0
		db    6
		db    7
		db    8
		db    7
		db    7
		db    7
		db    0
byte_11B23	db 10h			; ...
		db  10h
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db  45h	; E
		db    9
		db    0
		db  10h
		db    0
		db  10h
		db  10h
		db  10h
		db  10h
		db  44h	; D
		db  40h	; @
		db    8
		db    0
		db    0
		db  10h
		db  45h	; E
		db    8
		db    0
		db  10h
		db  45h	; E
		db    8
		db    0
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  41h	; A
		db  43h	; C
		db    8
		db    0
		db  10h
		db  45h	; E
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db  10h
		db    0
		db    0
		db    1
		db    1
		db    0
		db    0
		db  10h
		db  10h
		db  45h	; E
		db  41h	; A
		db    8
		db    0
		db    0
		db  10h
		db  45h	; E
		db    8
		db    0
		db  10h
		db  41h	; A
		db  42h	; B
		db    8
		db    0
		db  10h
		db  41h	; A
		db  42h	; B
		db    8
		db    0
		db  10h
		db    0
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db    8
		db    0
		db    0
		db  10h
		db    0
		db    0
		db    1
		db    1
		db    0
		db    0
		db  10h
		db  10h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  20h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  20h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  20h
		db    1
		db    0
		db    0
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db    0
		db    2
		db    0
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  20h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  20h
		db    0
		db    0
		db    0
		db    0
		db  10h
		db    0
		db    1
		db    1
		db    0
		db    0
		db  10h
		db  10h
; =============== S U B	R O U T	I N E =======================================
proc		sub_11BEA near		; ...
		mov	al, [ds:byte_10465]
		or	al, [ds:byte_10466]
		jnz	short loc_11BF6
		jmp	loc_11D00
; ---------------------------------------------------------------------------
loc_11BF6:				; ...
		mov	al, 7
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
		mov	si, 14h
		call	sub_11435
		mov	al, 0Eh
		call	sub_16E7D
		call	sub_16F56
		call	sub_1731A
		mov	si, 64h	; 'd'
		call	sub_11435
		sub	di, di
		sub	al, al
loc_11C1C:				; ...
		mov	[ds:byte_104FF+di], al
		inc	di
		cmp	di, 6
		jb	short loc_11C1C
		sub	di, di
		mov	al, [ds:byte_105A1]
		cmp	al, 0
		jz	short loc_11C32
		mov	di, 3
loc_11C32:				; ...
		mov	al, 1
		mov	[ds:byte_10505], al
		mov	al, [ds:byte_1049C+di]
		mov	[ds:byte_104FE], al
		mov	al, [ds:byte_1049B+di]
		mov	[ds:byte_104F7], al
		mov	al, [ds:byte_105A3]
		mov	[ds:byte_1050C], al
		mov	si, 5
		mov	di, 6
		call	sub_12165
		jb	short loc_11C59
		jmp	loc_11CF5
; ---------------------------------------------------------------------------
loc_11C59:				; ...
		call	sub_1212E
		sub	di, di
loc_11C5E:				; ...
		mov	al, [ds:byte_104FF+di]
		cmp	al, 0
		jnz	short loc_11C6F
		inc	di
		cmp	di, 6
		jb	short loc_11C5E
		jmp	loc_11CF5
; ---------------------------------------------------------------------------
loc_11C6F:				; ...
		mov	dx, di
		mov	[ds:byte_105A2], dl
		mov	dl, [ds:byte_105A1]
		sub	dh, dh
		mov	si, dx
		sub	al, al
		mov	[ds:byte_104A7+si], al
		mov	al, 14h
		mov	[ds:byte_104A5+si], al
		mov	al, 30h	; '0'
		mov	[ds:byte_104A2+si], al
		mov	ax, si
		xor	al, 1
		mov	si, ax
		mov	al, 0B0h ; '∞'
		mov	[ds:byte_104A5+si], al
		call	sub_11D1F
		call	sub_11D46
		mov	dl, [ds:byte_105A1]
		sub	dh, dh
		mov	si, dx
		mov	al, 31h	; '1'
		mov	[ds:byte_104A2+si], al
		inc	[ds:byte_104A5+si]
		call	sub_170FA
		call	sub_1131D
		call	sub_1139C
		call	sub_12028
		mov	si, 28h	; '('
		call	sub_11435
		mov	al, 30h	; '0'
		mov	dl, [ds:byte_105A1]
		sub	dh, dh
		mov	si, dx
		mov	[si+0A2h], al
		dec	[ds:byte_104A5+si]
		call	sub_170FA
		call	sub_1131D
		call	sub_1139C
		call	sub_12028
loc_11CE3:				; ...
		sub	al, al
		mov	[ds:byte_105AA], al
loc_11CE8:				; ...
		call	sub_135A9
		mov	al, [ds:byte_105AA]
		cmp	al, 2
		jb	short loc_11CE8
		call	sub_18090
loc_11CF5:				; ...
		sub	al, al
		mov	[ds:byte_10465], al
		mov	[ds:byte_10466], al
		retn
; ---------------------------------------------------------------------------
byte_11CFE	db 14h			; ...
		db  88h	; à
; ---------------------------------------------------------------------------
loc_11D00:				; ...
		mov	di, 1
loc_11D03:				; ...
		mov	ax, di
		mov	[ds:byte_104A7+di], al
		mov	al, 30h	; '0'
		mov	[ds:byte_104A2+di], al
		mov	al, [ds:byte_11CFE+di]
		mov	[ds:byte_104A5+di], al
		dec	di
		jns	short loc_11D03
		call	sub_11D1F
		jmp	short loc_11CE3
endp		sub_11BEA
; =============== S U B	R O U T	I N E =======================================
proc		sub_11D1F near		; ...
		call	sub_170FA
		call	sub_1131D
		call	sub_1139C
		call	sub_18090
		jmp	sub_12028
endp		sub_11D1F
; ---------------------------------------------------------------------------
word_11D2E	dw 120Ch		; ...
		dw 130Ch
		dw 140Ch
		dw 150Ch
		dw 160Ch
		dw 170Ch
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_11D46 near		; ...
		call	sub_13594
		mov	[ds:byte_105A8], 0Fh
		sub	al, al
		mov	[ds:byte_105AA], al
		mov	[ds:byte_105A4], al
		mov	[ds:byte_105A9], al
		call	sub_11EBC
		mov	al, [ds:byte_105A6]
		mov	[ds:byte_105A7], al
		mov	al, 41h	; 'A'
		mov	[ds:byte_105A5], al
		mov	al, [ds:byte_105A2]
		cmp	al, 6
		jb	short loc_11D71
		jmp	loc_11E6E
; ---------------------------------------------------------------------------
loc_11D71:				; ...
		shl	al, 1
		sub	ah, ah
		mov	di, ax
		mov	bx, [ds:word_11D2E+di]
		mov	[ds:word_10473], bx
loc_11D7F:				; ...
		mov	al, [ds:byte_105AA]
		cmp	al, 0Ah
		jb	short loc_11D89
		jmp	loc_11E6E
; ---------------------------------------------------------------------------
loc_11D89:				; ...
		call	sub_11EBC
		mov	al, [ds:byte_105A6]
		cmp	al, 0
		jnz	short loc_11DA0
		mov	al, [ds:byte_105A7]
		cmp	al, 0
		jz	short loc_11D9D
		jmp	loc_11E37
; ---------------------------------------------------------------------------
loc_11D9D:				; ...
		jmp	short loc_11DEF
; ---------------------------------------------------------------------------
		nop
loc_11DA0:				; ...
		mov	al, 1
		mov	[ds:byte_105A7], al
		mov	al, [ds:byte_105A4]
		cmp	al, 5
		jb	short loc_11DEF
		sub	al, al
		mov	[ds:byte_105A4], al
		mov	al, [ds:byte_105A8]
		and	al, 4
		jnz	short loc_11DD0
		call	sub_13594
		mov	[ds:byte_105A8], 0Fh
		dec	[ds:byte_105A5]
		mov	al, [ds:byte_105A5]
		cmp	al, 41h	; 'A'
		jnb	short loc_11DEC
		mov	al, 5Ah	; 'Z'
		jmp	short loc_11DEC
; ---------------------------------------------------------------------------
		align 2
loc_11DD0:				; ...
		mov	al, [ds:byte_105A8]
		and	al, 8
		jnz	short loc_11DEF
		inc	[ds:byte_105A5]
		mov	al, [ds:byte_105A5]
		cmp	al, 5Bh	; '['
		jb	short loc_11DEC
		mov	al, 41h	; 'A'
		call	sub_13594
		mov	[ds:byte_105A8], 0Fh
loc_11DEC:				; ...
		mov	[ds:byte_105A5], al
loc_11DEF:				; ...
		mov	al, [ds:byte_105A5]
		mov	dl, [ds:byte_105A9]
		sub	dh, dh
		mov	di, dx
		mov	dx, [ds:word_10473]
		add	dx, di
		mov	[ds:byte_11E93+di], al
		mov	bh, [ds:byte_10464]
		and	bh, 1Fh
		jnz	short loc_11E1E
		mov	bl, 3
		mov	bh, [ds:byte_10464]
		and	bh, 20h
		jz	short loc_11E1A
		mov	bl, 1
loc_11E1A:				; ...
		mov	[ds:byte_11EBB], bl
loc_11E1E:				; ...
		mov	bl, [ds:byte_11EBB]
		mov	[ds:byte_12CC1], bl
		call	sub_180BF
		mov	[ds:byte_12CC1], 3
		mov	si, 1
		call	sub_11435
		jmp	loc_11D7F
; ---------------------------------------------------------------------------
loc_11E37:				; ...
		sub	al, al
		mov	[ds:byte_105A7], al
		mov	dl, [ds:byte_105A9]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_105A5]
		mov	dx, [ds:word_10473]
		add	dx, di
		mov	[ds:byte_11E93+di], al
		call	sub_180BF
		mov	al, 41h	; 'A'
		mov	[ds:byte_105A5], al
		sub	al, al
		mov	[ds:byte_105A4], al
		mov	[ds:byte_10464], al
		inc	[ds:byte_105A9]
		mov	al, [ds:byte_105A9]
		cmp	al, 3
		jnb	short loc_11E6E
		jmp	short loc_11DEF
; ---------------------------------------------------------------------------
loc_11E6E:				; ...
		sub	di, di
		mov	dl, [ds:byte_105A2]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_11E93+di]
		mov	[ds:byte_1050D+si], al
		inc	di
		mov	al, [ds:byte_11E93+di]
		mov	[ds:byte_10514+si], al
		inc	di
		mov	al, [ds:byte_11E93+di]
		mov	[ds:byte_1051B+si], al
		retn
endp		sub_11D46
; ---------------------------------------------------------------------------
byte_11E93	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_11EBB	db 3			; ...
; =============== S U B	R O U T	I N E =======================================
proc		sub_11EBC near		; ...
		mov	dl, [ds:byte_105A1]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_12CC3+di]
		xor	al, 0FFh
		and	ax, 1Fh
		mov	si, ax
		and	al, 0Fh
		mov	[ds:byte_105A8], al
		mov	ax, si
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		mov	[ds:byte_105A6], al
		retn
endp		sub_11EBC
; =============== S U B	R O U T	I N E =======================================
proc		sub_11EE2 near		; ...
		cmp	al, 80h	; 'Ä'
		jnb	short loc_11EF1
		cmp	al, 6
		jnb	short locret_11F13
		sub	ah, ah
		mov	si, ax
		jmp	short loc_11EF4
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_11EF1:				; ...
		mov	si, 6
loc_11EF4:				; ...
		mov	al, [ds:byte_11F14+si]
		sub	ah, ah
		mov	si, ax
		mov	di, 0Bh
loc_11EFF:				; ...
		mov	al, [ds:byte_11F1C+si]
		mov	dx, [ds:word_10473]
		add	dx, di
		call	sub_180BF
		inc	si
		inc	di
		cmp	di, 11h
		jb	short loc_11EFF
locret_11F13:				; ...
		retn
endp		sub_11EE2
; ---------------------------------------------------------------------------
byte_11F14	db 0			; ...
		db  0Ch
		db  18h
		db  24h	; $
		db  30h	; 0
		db  3Ch	; <
		db  48h	; H
		db  48h	; H
byte_11F1C	db 57h			; ...
		db  48h	; H
		db  49h	; I
		db  54h	; T
		db  45h	; E
		db  20h
		db  20h
		db  20h
		db  42h	; B
		db  45h	; E
		db  4Ch	; L
		db  54h	; T
		db  59h	; Y
		db  45h	; E
		db  4Ch	; L
		db  4Ch	; L
		db  4Fh	; O
		db  57h	; W
		db  20h
		db  20h
		db  42h	; B
		db  45h	; E
		db  4Ch	; L
		db  54h	; T
		db  47h	; G
		db  52h	; R
		db  45h	; E
		db  45h	; E
		db  4Eh	; N
		db  20h
		db  20h
		db  20h
		db  42h	; B
		db  45h	; E
		db  4Ch	; L
		db  54h	; T
		db  50h	; P
		db  55h	; U
		db  52h	; R
		db  50h	; P
		db  4Ch	; L
		db  45h	; E
		db  20h
		db  20h
		db  42h	; B
		db  45h	; E
		db  4Ch	; L
		db  54h	; T
		db  42h	; B
		db  52h	; R
		db  4Fh	; O
		db  57h	; W
		db  4Eh	; N
		db  20h
		db  20h
		db  20h
		db  42h	; B
		db  45h	; E
		db  4Ch	; L
		db  54h	; T
		db  42h	; B
		db  4Ch	; L
		db  41h	; A
		db  43h	; C
		db  4Bh	; K
		db  20h
		db  20h
		db  20h
		db  42h	; B
		db  45h	; E
		db  4Ch	; L
		db  54h	; T
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
byte_11F70	db 0			; ...
		db  0Ch
		db  18h
		db  24h	; $
		db  30h	; 0
		db  3Ch	; <
byte_11F76	db 6			; ...
		db  12h
		db  18h
		db  26h	; &
		db  40h	; @
		db  40h	; @
		db  32h	; 2
		db  0Fh
		db    7
		db  0Dh
		db    4
		db    8
		db    1
; =============== S U B	R O U T	I N E =======================================
proc		sub_11F83 near		; ...
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_11F8D
		retn
; ---------------------------------------------------------------------------
loc_11F8D:				; ...
		sub	di, di
		mov	al, [ds:byte_10465]
		cmp	al, 0
		jnz	short loc_11F99
		mov	di, 3
loc_11F99:				; ...
		mov	al, [ds:byte_1049C+di]
		and	al, 0F0h
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		mov	[byte ptr ds:word_10469], al
		mov	al, [ds:byte_1049B+di]
		cmp	al, 10h
		jb	short loc_11FB4
		mov	al, 9
loc_11FB4:				; ...
		and	al, 0Fh
		shl	al, 1
		shl	al, 1
		shl	al, 1
		shl	al, 1
		or	al, [byte ptr ds:word_10469]
		sub	di, di
loc_11FC4:				; ...
		cmp	al, [ds:byte_11F76+di]
		jb	short loc_11FD2
		cmp	di, 5
		jnb	short loc_11FD2
		inc	di
		jmp	short loc_11FC4
; ---------------------------------------------------------------------------
loc_11FD2:				; ...
		mov	dx, di
		mov	[ds:byte_105A3], dl
		mov	dl, [ds:byte_11F70+di]
		sub	dh, dh
		mov	si, dx
		sub	di, di
loc_11FE2:				; ...
		mov	al, [ds:byte_11F1C+si]
		mov	dx, 10Eh
		add	dx, di
		call	showSymbol
		inc	si
		inc	di
		cmp	di, 0Ch
		jb	short loc_11FE2
		retn
endp		sub_11F83
; ---------------------------------------------------------------------------
byte_11FF6	db 'P'                  ; ...
		db  4Fh	; O
		db  53h	; S
		db  20h
		db  20h
		db  4Eh	; N
		db  41h	; A
		db  4Dh	; M
		db  45h	; E
		db  20h
		db  20h
		db  42h	; B
		db  45h	; E
		db  4Ch	; L
		db  54h	; T
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  20h
		db  53h	; S
		db  43h	; C
		db  4Fh	; O
		db  52h	; R
		db  45h	; E
		db  20h
		db  20h
		db  20h
; =============== S U B	R O U T	I N E =======================================
proc		sub_12013 near		; ...
		sub	di, di
loc_12015:				; ...
		mov	al, [ds:byte_11FF6+di]
		mov	dx, 1006h
		add	dx, di
		call	sub_180BF
		inc	di
		cmp	di, 1Ch
		jb	short loc_12015
		retn
endp		sub_12013
; =============== S U B	R O U T	I N E =======================================
proc		sub_12028 near		; ...
		call	sub_12013
		mov	ax, 1206h
		mov	[ds:word_10473], ax
		sub	si, si
		mov	dx, si
		mov	[ds:byte_10495], dl
loc_12039:				; ...
		mov	al, [ds:byte_10495]
		add	al, 31h	; '1'
		mov	di, 1
		mov	dx, [ds:word_10473]
		add	dx, di
		call	sub_180BF
		mov	di, 6
		mov	dl, [ds:byte_10495]
		sub	dh, dh
		mov	si, dx
		mov	al, [si+10Dh]
		mov	dx, [ds:word_10473]
		add	dx, di
		call	sub_180BF
		inc	di
		mov	al, [si+114h]
		mov	dx, [ds:word_10473]
		add	dx, di
		call	sub_180BF
		inc	di
		mov	al, [si+11Bh]
		mov	dx, [ds:word_10473]
		add	dx, di
		call	sub_180BF
		mov	al, [si+0F1h]
		or	al, [si+0F8h]
		jnz	short loc_1208D
		mov	al, 0FFh
		jmp	short loc_12091
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1208D:				; ...
		mov	al, [si+106h]
loc_12091:				; ...
		call	sub_11EE2
		mov	al, 20h	; ' '
		mov	[byte ptr ds:word_10469], al
		mov	dl, [ds:byte_10495]
		sub	dh, dh
		mov	si, dx
		mov	di, 14h
		mov	al, [si+0F1h]
		call	sub_120DF
		mov	al, [si+0F8h]
		call	sub_120DF
		sub	al, al
		call	sub_120DF
		dec	di
		mov	al, 30h	; '0'
		mov	dx, [ds:word_10473]
		add	dx, di
		call	sub_180BF
		inc	di
		add	[ds:word_10473], 100h
		inc	[ds:byte_10495]
		mov	dl, [ds:byte_10495]
		sub	dh, dh
		mov	si, dx
		cmp	si, 6
		jnb	short locret_120DE
		jmp	loc_12039
; ---------------------------------------------------------------------------
locret_120DE:				; ...
		retn
endp		sub_12028
; =============== S U B	R O U T	I N E =======================================
proc		sub_120DF near		; ...
		mov	[byte ptr ds:word_1046B], al
		and	al, 0F0h
		jnz	short loc_120EC
		mov	al, [byte ptr ds:word_10469]
		jmp	short loc_12100
; ---------------------------------------------------------------------------
		align 2
loc_120EC:				; ...
		mov	al, 30h	; '0'
		mov	[byte ptr ds:word_10469], al
		mov	al, [byte ptr ds:word_1046B]
		and	al, 0F0h
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		add	al, 30h	; '0'
loc_12100:				; ...
		mov	dx, [ds:word_10473]
		add	dx, di
		call	sub_180BF
		inc	di
		mov	al, [byte ptr ds:word_1046B]
		and	al, 0Fh
		jnz	short loc_12117
		mov	al, [byte ptr ds:word_10469]
		jmp	short loc_12123
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_12117:				; ...
		mov	al, 30h	; '0'
		mov	[byte ptr ds:word_10469], al
		mov	al, [byte ptr ds:word_1046B]
		and	al, 0Fh
		add	al, 30h	; '0'
loc_12123:				; ...
		mov	dx, [ds:word_10473]
		add	dx, di
		call	sub_180BF
		inc	di
		retn
endp		sub_120DF
; =============== S U B	R O U T	I N E =======================================
proc		sub_1212E near		; ...
		mov	al, 6
		mov	[ds:byte_10471], al
loc_12133:				; ...
		sub	al, al
		mov	[ds:byte_10495], al
loc_12138:				; ...
		mov	dl, [ds:byte_10495]
		sub	dh, dh
		mov	si, dx
		mov	dl, [ds:byte_10495]
		sub	dh, dh
		mov	di, dx
		inc	di
		call	sub_12165
		jnb	short loc_12151
		call	sub_1217A
loc_12151:				; ...
		inc	[ds:byte_10495]
		mov	al, [ds:byte_10495]
		cmp	al, [ds:byte_10471]
		jb	short loc_12138
		dec	[ds:byte_10471]
		jnz	short loc_12133
		retn
endp		sub_1212E
; =============== S U B	R O U T	I N E =======================================
proc		sub_12165 near		; ...
		mov	al, [ds:byte_104F1+si]
		cmp	al, [ds:byte_104F1+di]
		jb	short locret_12179
		jnz	short locret_12179
		mov	al, [ds:byte_104F8+si]
		cmp	al, [ds:byte_104F8+di]
locret_12179:				; ...
		retn
endp		sub_12165
; =============== S U B	R O U T	I N E =======================================
proc		sub_1217A near		; ...
		mov	al, 7
		mov	[byte ptr ds:word_10469], al
loc_1217F:				; ...
		mov	al, [ds:byte_104F1+si]
		push	ax
		mov	al, [ds:byte_104F1+di]
		mov	[ds:byte_104F1+si], al
		pop	ax
		mov	[ds:byte_104F1+di], al
		mov	ax, di
		add	al, 7
		mov	di, ax
		mov	ax, si
		add	al, 7
		mov	si, ax
		dec	[byte ptr ds:word_10469]
		jnz	short loc_1217F
		retn
endp		sub_1217A
; =============== S U B	R O U T	I N E =======================================
proc		sub_121A4 near		; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_10493], dl
		mov	ax, di
		xor	al, 1
		mov	[ds:byte_10557], al
		mov	al, [ds:byte_10465+di]
		cmp	al, 0
		jz	short loc_121C0
		retn
; ---------------------------------------------------------------------------
loc_121C0:				; ...
		call	sub_124D8
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104B7+di]
		cmp	al, 0
		jz	short loc_121DC
		mov	al, [ds:byte_104C7+di]
		and	al, 10h
		jnz	short loc_121DC
		retn
; ---------------------------------------------------------------------------
loc_121DC:				; ...
		mov	dl, [ds:byte_10557]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104B7+si]
		sub	ah, ah
		mov	si, ax
		mov	al, [ds:byte_123AD+si]
		cmp	al, 80h	; 'Ä'
		jb	short loc_121F7
		jmp	loc_122C7
; ---------------------------------------------------------------------------
loc_121F7:				; ...
		mov	dl, [ds:byte_10557]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104BB+si]
		cmp	al, 8
		jb	short loc_1220A
		jmp	loc_122C7
; ---------------------------------------------------------------------------
loc_1220A:				; ...
		mov	al, [ds:byte_10566]
		cmp	al, 9
		jb	short loc_12214
		jmp	loc_122E0
; ---------------------------------------------------------------------------
loc_12214:				; ...
		mov	dl, [ds:byte_10557]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104B7+si]
		cmp	al, 5
		nop
		nop
		jz	short loc_1222C
		cmp	al, 0Ch
		nop
		nop
		jnz	short loc_12274
loc_1222C:				; ...
		mov	al, [ds:byte_10566]
		cmp	al, 8
		jnb	short loc_12274
		call	sub_18087
		mov	dl, [ds:byte_10562]
		sub	dh, dh
		mov	si, dx
		cmp	al, [ds:byte_1237D+si]
		jb	short loc_12274
		and	al, 7
		mov	[byte ptr ds:word_10469], al
		mov	al, [ds:byte_10568]
		and	al, 4
		jz	short loc_1225A
		mov	al, [ds:byte_10568]
		and	al, 3
		xor	al, 3
		jmp	short loc_1225F
; ---------------------------------------------------------------------------
		align 2
loc_1225A:				; ...
		mov	al, [ds:byte_10568]
		and	al, 3
loc_1225F:				; ...
		shl	al, 1
		shl	al, 1
		shl	al, 1
		adc	al, [byte ptr ds:word_10469]
		sub	ah, ah
		mov	si, ax
		mov	al, [ds:byte_12403+si]
		jmp	loc_1235F
; ---------------------------------------------------------------------------
loc_12274:				; ...
		mov	dl, [ds:byte_10562]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_10571]
		call	sub_18087
		cmp	al, [ds:byte_12389+si]
		jb	short loc_122E0
		mov	dl, [ds:byte_10568]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_123A5+si]
		cmp	al, 0
		jnz	short loc_1229B
		jmp	short loc_12302
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1229B:				; ...
		mov	dl, [ds:byte_10557]
		sub	dh, dh
		mov	si, dx
		mov	dl, [ds:byte_104B7+si]
		sub	dh, dh
		mov	di, dx
		mov	si, 8
		call	sub_124AC
		mov	al, [ds:byte_123AD+di]
		cmp	al, 0
		jz	short loc_122C0
		mov	al, [ds:byte_123D7+si]
		jmp	loc_1235F
; ---------------------------------------------------------------------------
loc_122C0:				; ...
		mov	al, [ds:byte_123CF+si]
		jmp	loc_1235F
; ---------------------------------------------------------------------------
loc_122C7:				; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104B7+di]
		cmp	al, 0
		jz	short loc_122D8
		retn
; ---------------------------------------------------------------------------
loc_122D8:				; ...
		mov	al, [ds:byte_104C1+di]
		cmp	al, 30h	; '0'
		jnb	short loc_122F2
loc_122E0:				; ...
		call	sub_18087
		mov	dl, [ds:byte_10562]
		sub	dh, dh
		mov	si, dx
		cmp	al, [ds:byte_12383+si]
		jnb	short loc_122F2
		retn
; ---------------------------------------------------------------------------
loc_122F2:				; ...
		mov	dl, [ds:byte_10568]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_12395+si]
		cmp	al, 0
		jz	short loc_1231D
loc_12302:				; ...
		mov	si, 0Ch
		call	sub_124AC
		mov	al, [ds:byte_10566]
		cmp	al, 8
		jnb	short loc_12316
		mov	al, [ds:byte_123EB+si]
		jmp	short loc_1235F
; ---------------------------------------------------------------------------
		align 2
loc_12316:				; ...
		mov	al, [ds:byte_123DF+si]
		jmp	short loc_1235F
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1231D:				; ...
		mov	al, [ds:byte_10566]
		cmp	al, 0Ah
		jb	short loc_12331
		mov	si, 0Ch
		call	sub_124AC
		mov	al, [ds:byte_123F7+si]
		jmp	short loc_1235F
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_12331:				; ...
		mov	dl, [ds:byte_10566]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_124A1+si]
		mov	[byte ptr ds:word_10469], al
		mov	dl, [ds:byte_10562]
		sub	dh, dh
		mov	di, dx
		mov	dl, [ds:byte_1238F+di]
		sub	dh, dh
		mov	si, dx
		call	sub_124AC
		mov	ax, si
		add	al, [byte ptr ds:word_10469]
		mov	di, ax
		mov	al, [ds:byte_12423+di]
loc_1235F:				; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_104B1+di], al
		call	sub_115F6
		sub	al, al
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	[ds:byte_104B1+di], al
		retn
endp		sub_121A4
; ---------------------------------------------------------------------------
byte_1237D	db 0F0h			; ...
		db 0A0h	; †
		db  60h	; `
		db  20h
		db  10h
		db    0
byte_12383	db 0E8h			; ...
		db 0D0h	; –
		db  80h	; Ä
		db  40h	; @
		db  10h
		db  10h
byte_12389	db 0E0h			; ...
		db 0D0h	; –
		db  60h	; `
		db  40h	; @
		db  20h
		db  10h
byte_1238F	db 0Ch			; ...
		db  0Ah
		db    8
		db    8
		db    6
		db    6
byte_12395	db 0			; ...
		db    0
		db    1
		db    1
		db    1
		db    1
		db    0
		db    0
		db    1
		db    0
		db    1
		db    1
		db    1
		db    1
		db    0
		db    1
byte_123A5	db 0			; ...
		db    1
		db    0
		db    1
		db    1
		db    0
		db    1
		db    0
byte_123AD	db 0FFh			; ...
		db 0FFh
		db    0
		db 0FFh
		db    0
		db    1
		db    0
		db 0FFh
		db    0
		db    0
		db 0FFh
		db    0
		db    1
		db    0
		db    1
		db    0
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
byte_123CF	db 5			; ...
		db    5
		db  1Bh
		db  10h
		db  14h
		db  14h
		db    6
		db  1Eh
byte_123D7	db 1			; ...
		db    1
		db  10h
		db  1Bh
		db    1
		db  10h
		db    1
		db  0Ch
byte_123DF	db 19h			; ...
		db  19h
		db  10h
		db  1Bh
		db  19h
		db  19h
		db  19h
		db  19h
		db  19h
		db  19h
		db  0Dh
		db  1Ah
byte_123EB	db 19h			; ...
		db  19h
		db  19h
		db  0Dh
		db    8
		db  0Eh
		db  0Eh
		db  0Dh
		db  1Bh
		db  19h
		db    8
		db  1Ah
byte_123F7	db 1Dh			; ...
		db  1Ah
		db  1Ah
		db  1Ah
		db  0Ah
		db    9
		db  1Dh
		db  1Dh
		db  0Ah
		db  1Bh
		db  1Ah
		db  1Ah
byte_12403	db 9			; ...
		db  0Ah
		db    5
		db    6
		db    2
		db  0Fh
		db  1Eh
		db  0Ch
		db  21h	; !
		db  21h	; !
		db  22h	; "
		db  22h	; "
		db    6
		db  21h	; !
		db  10h
		db    9
		db  19h
		db    8
		db  10h
		db  0Dh
		db  1Dh
		db  0Eh
		db  0Dh
		db  10h
		db  21h	; !
		db  21h	; !
		db  21h	; !
		db  22h	; "
		db  10h
		db  0Dh
		db    8
		db  22h	; "
byte_12423	db 0Eh			; ...
		db  0Eh
		db  1Bh
		db  10h
		db  0Ah
		db  1Bh
		db  1Bh
		db  1Ah
		db  10h
		db  0Ch
		db  1Bh
		db  10h
		db  1Bh
		db  0Ch
		db  0Ch
		db  1Bh
		db  1Bh
		db  0Ah
		db  10h
		db  1Bh
		db  0Ah
		db    2
		db  1Bh
		db  0Ch
		db  1Eh
		db    2
		db  0Ch
		db    5
		db  1Bh
		db  0Bh
		db  0Ch
		db  0Bh
		db    2
		db  10h
		db  1Bh
		db    2
		db  1Eh
		db    2
		db    6
		db    5
		db  0Bh
		db    4
		db  1Bh
		db  1Ah
		db    5
		db    6
		db    5
		db  10h
		db    9
		db    4
		db    6
		db  0Ch
		db  0Bh
		db  0Fh
		db  1Eh
		db    6
		db  0Bh
		db    5
		db  0Ch
		db  1Ah
		db    9
		db  0Ch
		db  0Fh
		db    5
		db    6
		db    2
		db    5
		db  1Eh
		db  1Dh
		db  10h
		db  0Ah
		db    4
		db  1Dh
		db    9
		db    5
		db    9
		db    5
		db    6
		db  0Ah
		db  1Ah
		db  0Ch
		db  0Fh
		db  1Ah
		db    4
		db    9
		db    9
		db    5
		db    5
		db  1Ah
		db  0Fh
		db  1Dh
		db    6
		db  0Ch
		db  1Ah
		db    9
		db  1Bh
		db    9
		db  0Ah
		db  1Ah
		db    9
		db  1Ah
		db  1Dh
		db  0Fh
		db    9
		db    5
		db  1Ah
		db  0Ah
		db  1Bh
		db  1Ah
		db  1Dh
		db  1Ah
		db  1Ah
		db    9
		db    9
		db  1Ah
		db  0Ah
		db  0Ah
		db  1Bh
		db  1Ah
		db  1Ah
		db  1Ah
		db  0Ah
		db  0Ah
		db  1Bh
		db  1Ah
		db  1Ah
byte_124A1	db 0			; ...
		db  0Ch
		db  18h
		db  24h	; $
		db  30h	; 0
		db  3Ch	; <
		db  48h	; H
		db  54h	; T
		db  60h	; `
		db  6Ch	; l
		db  6Ch	; l
; =============== S U B	R O U T	I N E =======================================
proc		sub_124AC near		; ...
		push	ax
		mov	ax, [ds:word_10469]
		push	ax
		mov	[ds:word_10469], si
loc_124B5:				; ...
		call	sub_18087
		and	al, 1Fh
		cmp	al, [byte ptr ds:word_10469]
		jb	short loc_124CE
		and	al, 0Fh
		and	al, [ds:byte_10464]
		cmp	al, [byte ptr ds:word_10469]
		jb	short loc_124CE
		jmp	short loc_124B5
; ---------------------------------------------------------------------------
loc_124CE:				; ...
		sub	ah, ah
		mov	si, ax
		pop	ax
		mov	[ds:word_10469], ax
		pop	ax
		retn
endp		sub_124AC
; =============== S U B	R O U T	I N E =======================================
proc		sub_124D8 near		; ...
		push	si
		mov	dx, di
		mov	[ds:byte_1056B], dl
		mov	ax, di
		xor	al, 1
		mov	[ds:byte_1056C], al
		mov	dl, [ds:byte_1056B]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104A5+di]
		mov	dl, [ds:byte_104A7+di]
		sub	dh, dh
		mov	si, dx
		cmp	si, 0
		jz	short loc_12508
		clc
		adc	al, 24h	; '$'
		cmc
		sbb	al, 0Ch
		jmp	short loc_1250A
; ---------------------------------------------------------------------------
		align 2
loc_12508:				; ...
		add	al, 0Ch
loc_1250A:				; ...
		mov	[ds:byte_10569], al
		mov	dl, [ds:byte_1056C]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104A5+di]
		mov	dl, [ds:byte_104A7+di]
		sub	dh, dh
		mov	si, dx
		cmp	si, 0
		jz	short loc_1252D
		add	al, 24h	; '$'
		sub	al, 0Ch
		jmp	short loc_1252F
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1252D:				; ...
		add	al, 0Ch
loc_1252F:				; ...
		mov	[ds:byte_1056A], al
		mov	si, 1
		mov	al, [ds:byte_10569]
		clc
		sbb	al, [ds:byte_1056A]
		mov	[ds:byte_10567], al
		jnb	short loc_12544
		sub	si, si
loc_12544:				; ...
		mov	ax, si
		shl	al, 1
		mov	dl, [ds:byte_1056B]
		sub	dh, dh
		mov	di, dx
		or	al, [ds:byte_104A7+di]
		shl	al, 1
		mov	dl, [ds:byte_1056C]
		sub	dh, dh
		mov	di, dx
		or	al, [ds:byte_104A7+di]
		mov	[ds:byte_10568], al
		mov	al, [ds:byte_10567]
		cmp	al, 80h	; 'Ä'
		jb	short loc_12570
		xor	al, 0FFh
		add	al, 1
loc_12570:				; ...
		mov	[ds:byte_10567], al
		shr	al, 1
		shr	al, 1
		mov	[ds:byte_10566], al
		pop	si
		mov	dl, [ds:byte_1056B]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_10568]
		retn
endp		sub_124D8
; ---------------------------------------------------------------------------
byte_12587	db 0Bh			; ...
		db  0Eh
		db  10h
		db  12h
		db  14h
		db  15h
		db  16h
		db  20h
		db 0FFh
byte_12590	db 22h			; ...
		db  23h	; #
		db  21h	; !
		db  1Eh
		db  17h
		db  1Bh
		db  1Ch
		db  24h	; $
byte_12598	db 20h			; ...
		db  30h	; 0
		db  20h
		db  30h	; 0
		db  10h
		db  0Ch
		db  20h
		db    3
byte_125A0	db 6			; ...
		db 7, 5, 6, 5, 4, 6, 4
byte_125A8	db 3			; ...
		db    3
		db    3
		db    3
		db    3
		db    2
		db    3
		db    2
byte_125B0	db 10h			; ...
		db 2, 8, 4, 8, 2, 10h, 4
byte_125B8	db 5			; ...
		db 1, 4, 2, 4, 1, 5, 2
byte_125C0	db 5			; ...
		db 1, 4, 2, 4, 1, 5, 2
byte_125C8	db 3			; ...
		align 2
		db 2, 1, 2, 0, 3, 1
byte_125D0	db 0			; ...
		align 4
		db 0FCh	; ¸
		db 0FCh	; ¸
		db    6
		db    6
byte_125D8	db 20h			; ...
		db 10h,	8, 4, 2, 1
byte_125DE	db 11h			; ...
		db  12h
		db  12h
		db  11h
		db  11h
		db  12h
		db  12h
		db  11h
		db  11h
		db  12h
		db  12h
		db  11h
		db  11h
		db  13h
		db  13h
		db  11h
		db  11h
		db  12h
		db  12h
		db  11h
		db  11h
		db  1Fh
		db  1Fh
		db  11h
		db  11h
		db  12h
		db  12h
		db  11h
		db  11h
		db  1Fh
		db  1Fh
		db  11h
byte_125FE	db 0			; ...
		db    1
		db    2
		db    3
		db 0FFh
		db    4
		db    5
		db    6
		db    7
		db    8
		db    9
		db  0Ah
		db  0Bh
		db  0Ch
		db  0Dh
		db  0Eh
		db  0Fh
		db  10h
		db  11h
		db  12h
		db  13h
		db  14h
		db  15h
		db  16h
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db  17h
		db    0
		db  18h
		db  19h
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db 0FFh
		db 0FFh
byte_12637	db 0Dh			; ...
		db  0Eh
		db  0Ah
		db  12h
		db    4
		db  16h
		db  0Bh
		db  0Bh
		db  0Ah
		db  10h
		db    4
		db  12h
		db    9
		db  0Ah
		db  0Ah
		db  0Ch
		db    4
		db  0Dh
		db    9
		db  0Ah
		db  0Bh
		db  0Dh
		db    7
		db    5
		db  0Ch
		db  0Dh
		db  0Dh
		db  0Ch
		db  0Bh
		db  0Bh
		db  80h	; Ä
		db  0Ch
		db  12h
		db  11h
		db  11h
		db  11h
		db    7
		db  0Ch
		db  10h
		db  0Fh
		db  0Dh
		db  10h
		db  0Bh
		db  0Ch
		db  0Ah
		db  12h
		db    9
		db  80h	; Ä
		db  80h	; Ä
		db  16h
		db  0Dh
		db  0Bh
		db  0Bh
		db  0Bh
		db  80h	; Ä
		db  0Ch
		db    5
		db    3
		db    3
		db    3
		db  80h	; Ä
		db  0Ch
		db  11h
		db  0Fh
		db  0Dh
		db  0Fh
		db    9
		db  0Ah
		db    7
		db  0Eh
		db    3
		db  11h
		db    7
		db  0Ah
		db  0Bh
		db    9
		db    9
		db  80h	; Ä
		db    8
		db  11h
		db  12h
		db  11h
		db  10h
		db  12h
		db  0Ah
		db  0Ah
		db  0Eh
		db  10h
		db    3
		db  10h
		db    6
		db  0Eh
		db  0Fh
		db  12h
		db  0Fh
		db  12h
		db  80h	; Ä
		db    7
		db    6
		db  0Eh
		db    4
		db  0Eh
		db  80h	; Ä
		db  13h
		db  0Fh
		db  14h
		db    3
		db  14h
		db  80h	; Ä
		db  80h	; Ä
		db  0Ah
		db  12h
		db    3
		db  16h
		db  0Bh
		db  0Ch
		db    8
		db  10h
		db    4
		db  10h
		db    7
		db  0Ah
		db  0Ah
		db  0Dh
		db  0Bh
		db  0Ch
		db  0Ah
		db  0Ah
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db    9
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  0Bh
		db    9
		db  0Ah
		db  0Fh
		db    6
		db  0Eh
		db  80h	; Ä
		db  80h	; Ä
		db  0Ah
		db  0Fh
		db  0Ch
		db  12h
		db  80h	; Ä
		db    9
		db    8
		db  80h	; Ä
		db    7
		db  80h	; Ä
		db  80h	; Ä
		db  0Fh
		db  0Ah
		db  0Fh
		db  0Ch
		db  12h
; =============== S U B	R O U T	I N E =======================================
proc		sub_126D9 near		; ...
		sub	al, al
		mov	[ds:byte_10497], al
		mov	al, 1
		mov	[byte ptr ds:word_10469], al
		mov	dl, [ds:byte_1052E]
		sub	dh, dh
		mov	si, dx
loc_126EB:				; ...
		mov	dx, si
		mov	[ds:byte_10491], dl
		mov	di, 8
loc_126F4:				; ...
		mov	al, [ds:byte_104A2+si]
		cmp	al, [ds:byte_12587+di]
		jz	short loc_12710
		dec	di
		jns	short loc_126F4
loc_12701:				; ...
		mov	ax, si
		xor	al, 1
		mov	si, ax
		dec	[byte ptr ds:word_10469]
		jns	short loc_126EB
		jmp	locret_12938
; ---------------------------------------------------------------------------
loc_12710:				; ...
		mov	dx, si
		mov	[ds:byte_10493], dl
		mov	dx, di
		mov	[ds:byte_10494], dl
		mov	al, [ds:byte_104BB+si]
		cmp	al, 2
		jb	short loc_12726
		jmp	short loc_12701
; ---------------------------------------------------------------------------
loc_12726:				; ...
		mov	al, [ds:byte_10493]
		xor	al, 1
		mov	[ds:byte_10557], al
		sub	ah, ah
		mov	si, ax
		mov	al, [ds:byte_104A2+si]
		sub	ah, ah
		mov	di, ax
		mov	al, [ds:byte_125FE+di]
		cmp	al, 80h	; 'Ä'
		jb	short loc_12745
		jmp	locret_12938
; ---------------------------------------------------------------------------
loc_12745:				; ...
		cmp	al, 18h
		jnz	short loc_12758
		mov	dl, [ds:byte_10494]
		sub	dh, dh
		mov	si, dx
		cmp	si, 3
		jnz	short loc_12758
		mov	al, 1Ah
loc_12758:				; ...
		mov	[ds:byte_10558], al
		mov	dl, [ds:byte_10493]
		sub	dh, dh
		mov	di, dx
		call	sub_124D8
		and	al, 3
		mov	[ds:byte_1055A], al
		mov	al, [ds:byte_10558]
		cmp	al, 13h
		jnz	short loc_12782
		mov	al, [ds:byte_10568]
		cmp	al, 0
		jz	short loc_1277D
		cmp	al, 7
		jnz	short loc_12782
loc_1277D:				; ...
		sub	al, al
		mov	[ds:byte_10558], al
loc_12782:				; ...
		mov	dl, [ds:byte_10494]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_125A0+si]
		mov	[ds:byte_1055B], al
		mov	al, [ds:byte_125A8+si]
		mov	[ds:byte_1055C], al
		mov	dl, [ds:byte_10494]
		sub	dh, dh
		mov	di, dx
		mov	dl, [ds:byte_10493]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104A7+si]
		cmp	al, 0
		jz	short loc_127BD
		mov	al, [ds:byte_104A5+si]
		add	al, 24h	; '$'
		sub	al, [ds:byte_12590+di]
		jmp	short loc_127C5
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_127BD:				; ...
		mov	al, [ds:byte_104A5+si]
		add	al, [ds:byte_12590+di]
loc_127C5:				; ...
		mov	[ds:byte_1055D], al
		sub	al, al
		mov	[ds:byte_10495], al
loc_127CD:				; ...
		mov	dl, [ds:byte_10495]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_125D8+di]
		mov	dl, [ds:byte_10494]
		sub	dh, dh
		mov	si, dx
		and	al, [ds:byte_12598+si]
		jnz	short loc_127EA
		jmp	loc_1292A
; ---------------------------------------------------------------------------
loc_127EA:				; ...
		mov	al, [ds:byte_10558]
		shl	al, 1
		mov	[byte ptr ds:word_10469], al
		shl	al, 1
		add	al, [byte ptr ds:word_10469]
		add	al, [ds:byte_10495]
		mov	[byte ptr ds:word_1046B], al
		sub	ah, ah
		mov	di, ax
		mov	al, [ds:byte_12637+di]
		cmp	al, 80h	; 'Ä'
		jb	short loc_1280E
		jmp	loc_1292A
; ---------------------------------------------------------------------------
loc_1280E:				; ...
		mov	[byte ptr ds:word_10469], al
		mov	dl, [ds:byte_10557]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104A7+si]
		cmp	al, 0
		jz	short loc_1282E
		mov	al, [ds:byte_104A5+si]
		add	al, 24h	; '$'
		sub	al, [byte ptr ds:word_10469]
		jmp	short loc_12836
; ---------------------------------------------------------------------------
		align 2
loc_1282E:				; ...
		mov	al, [ds:byte_104A5+si]
		add	al, [byte ptr ds:word_10469]
loc_12836:				; ...
		mov	[ds:byte_1055E], al
		mov	dl, [ds:byte_1055A]
		sub	dh, dh
		mov	si, dx
		cmp	si, 1
		jnz	short loc_12850
		mov	al, [ds:byte_1055D]
		sub	al, [ds:byte_1055E]
		jmp	short loc_12883
; ---------------------------------------------------------------------------
		align 2
loc_12850:				; ...
		mov	ax, si
		cmp	al, 0
		jnz	short loc_12864
		mov	al, [ds:byte_1055D]
		sub	al, [ds:byte_1055E]
		add	al, [ds:byte_1055B]
		jmp	short loc_12883
; ---------------------------------------------------------------------------
		align 2
loc_12864:				; ...
		cmp	si, 2
		jnz	short loc_12873
		mov	al, [ds:byte_1055E]
		sub	al, [ds:byte_1055D]
		jmp	short loc_12883
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_12873:				; ...
		cmp	si, 3
		jnz	short loc_1288A
		mov	al, [ds:byte_1055E]
		sub	al, [ds:byte_1055D]
		add	al, [ds:byte_1055B]
loc_12883:				; ...
		mov	[ds:byte_10559], al
		cmp	al, 80h	; 'Ä'
		jb	short loc_1288D
loc_1288A:				; ...
		jmp	loc_1292A
; ---------------------------------------------------------------------------
loc_1288D:				; ...
		cmp	al, [ds:byte_1055B]
		jz	short loc_1289B
		jnb	short loc_1288A
		cmp	al, [ds:byte_1055C]
		jb	short loc_128B9
loc_1289B:				; ...
		mov	dl, [ds:byte_10494]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_125B8+si]
		mov	[ds:byte_10561], al
		mov	al, [ds:byte_125C8+si]
		mov	[ds:byte_1056F], al
		mov	al, 1
		mov	[ds:byte_10497], al
		jmp	short loc_128D4
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_128B9:				; ...
		mov	dl, [ds:byte_10494]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_125B0+si]
		mov	[ds:byte_10561], al
		mov	al, [ds:byte_125C0+si]
		mov	[ds:byte_1056F], al
		mov	al, 2
		mov	[ds:byte_10497], al
loc_128D4:				; ...
		sub	al, al
		mov	[ds:byte_1049A], al
		mov	al, [ds:byte_10493]
		mov	[ds:byte_10582], al
		mov	[ds:byte_1052D], al
		mov	al, [ds:byte_10497]
		mov	[ds:byte_10574], al
		mov	al, [ds:byte_10494]
		shl	al, 1
		shl	al, 1
		add	al, [ds:byte_1055A]
		sub	ah, ah
		mov	di, ax
		mov	al, [ds:byte_125DE+di]
		mov	[ds:byte_1055F], al
		mov	dl, [ds:byte_10493]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104A5+di]
		shr	al, 1
		shr	al, 1
		mov	dl, [ds:byte_1055A]
		sub	dh, dh
		mov	si, dx
		add	al, [ds:byte_125D0+si]
		cmp	al, 20h	; ' '
		jb	short loc_12920
		mov	al, 20h	; ' '
loc_12920:				; ...
		cmp	al, 1
		jnb	short loc_12926
		mov	al, 1
loc_12926:				; ...
		mov	[ds:byte_10570], al
		retn
; ---------------------------------------------------------------------------
loc_1292A:				; ...
		inc	[ds:byte_10495]
		mov	al, [ds:byte_10495]
		cmp	al, 6
		jnb	short locret_12938
		jmp	loc_127CD
; ---------------------------------------------------------------------------
locret_12938:				; ...
		retn
endp		sub_126D9
; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_12940	db 0			; ...
word_12941	dw 0			; ...
byte_12943	db 0			; ...
menuCurY	db 0			; ...
aCalibrate	db  43h	; C		; ...
		db  41h	; A
		db  4Ch	; L
		db  49h	; I
		db  42h	; B
		db  52h	; R
		db  41h	; A
		db  54h	; T
		db  45h	; E
		db  20h
		db  4Ah	; J
		db  4Fh	; O
		db  59h	; Y
		db  53h	; S
		db  54h	; T
		db  49h	; I
		db  43h	; C
		db  4Bh	; K
		db  20h
		db  23h	; #
byte_12959	db 31h			; ...
		db    0
aUpperLeft	db '           UPPER  LEFT           ',0 ; ...
aCenter		db '             CENTER              ',0 ; ...
aLowerRight	db '           LOWER RIGHT           ',0 ; ...
aPleaseHoldStic	db 'Please hold stick at position shown',0 ; ...
aPushActionButt	db 'Push action button and then release',0 ; ...
aHoldStickAtThi	db 'Hold stick at this position until',0 ; ...
aPositionReques	db 'position request',0 ; ...
aChanges	db 'changes',0          ; ...
aNowCalibrating	db ' *  NOW CALIBRATING JOYSTICK  *  ',0 ; ...
aJoystickNowCal	db '    JOYSTICK NOW CALIBRATED!     ',0 ; ...
aPleaseRepeatUs	db 'Please repeat using next position',0 ; ...
aPressQToQuit	db 'Press "Q" to QUIT',0 ; ...
word_12ABC	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_12ADC	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_12CBC	db 7Fh			; ...
byte_12CBD	db 7Fh			; ...
byte_12CBE	db 7Fh			; ...
savedSP		dw 0			; ...
byte_12CC1	db 3			; ...
byte_12CC2	db 0			; ...
byte_12CC3	db 0			; ...
byte_12CC4	db 0			; ...
word_12CC5	dw 0FFFFh		; ...
byte_12CC7	db 0			; ...
byte_12CC8	db 0			; ...
byte_12CC9	db 0			; ...
byte_12CCA	db 0			; ...
byte_12CCB	db 47h			; ...
		db 48h,	49h, 4Bh, 4Dh, 4Fh, 50h, 51h
byte_12CD3	db 37h			; ...
		db 38h,	39h, 34h, 36h, 31h, 32h, 33h
byte_12CDB	db 55h			; ...
		db 49h,	4Fh, 4Ah, 4Bh, 4Eh, 4Dh, 3Ch
byte_12CE3	db 75h,	69h, 6Fh, 6Ah, 6Bh, 6Eh, 6Dh, 2Ch ; ...
byte_12CEB	db 5			; ...
		db 1, 9, 4, 8, 6, 2, 0Ah, 10h
word_12CF4	dw 0			; ...
byte_12CF6	db 0			; ...
byte_12CF7	db 8			; ...
byte_12CF8	db 1			; ...
currLvl		db 0			; ...
byte_12CFA	db 1			; ...
aSystem3	db 'SYSTEM 3',0         ; ...
aPresents	db 'PRESENTS',0         ; ...
aC1989		db '(c) 1989',0         ; ...
aSoftwareLtd	db 'SOFTWARE LTD',0     ; ...
aOptions	db 'OPTIONS',0          ; ...
aInternational	db 'INTERNATIONAL',0    ; ...
aKarate		db 'KARATE',0           ; ...
aChampionship	db 'CHAMPIONSHIP',0
aStartAtAustral	db 'START AT AUSTRALIA',0 ; ...
aStartAtEgypt	db 'START AT EGYPT',0   ; ...
aOfJoysticks	db '# OF JOYSTICKS:',0  ; ...
aNone		db 'NONE',0             ; ...
aOne		db 'ONE ',0             ; ...
aTwo		db 'TWO ',0             ; ...
aCalibrateJoy_0	db 'CALIBRATE JOYSTICK',0 ; ...
aUseCompositeMo	db 'USE COMPOSITE MONITOR',0 ; ...
aUseRgbMonitor	db 'USE RGB MONITOR      ',0 ; ...
aSound		db 'SOUND:',0           ; ...
aOn		db 'ON ',0              ; ...
aOff		db 'OFF',0              ; ...
aMusic		db 'MUSIC:',0           ; ...
aSpeed		db 'SPEED:',0           ; ...
aSlow		db 'SLOW  ',0           ; ...
aMedium		db 'MEDIUM',0           ; ...
aFast		db 'FAST  ',0           ; ...
aMainMenu	db 'MAIN MENU',0        ; ...
; =============== S U B	R O U T	I N E =======================================
proc		sub_12E09 near		; ...
		call	sub_13CBD
		mov	al, [ds:byte_1065A]
		mov	[ds:byte_1056D], al
		inc	al
		cmp	al, 8
		jnz	short loc_12E1A
		mov	al, 0
loc_12E1A:				; ...
		mov	[ds:byte_1065A], al
		mov	[ds:currLvl], 0
		call	loadLevel
		call	sub_13895
		call	sub_1387A
		mov	bl, 3
		mov	dx, 1110h
		lea	si, [aSystem3]	; "SYSTEM 3"
		call	printString
		mov	bl, 3
		mov	dx, 1310h
		lea	si, [aPresents]	; "PRESENTS"
		call	printString
		mov	bl, 3
		mov	dx, 150Ah
		lea	si, [aInternational] ; "INTERNATIONAL"
		call	printString
		mov	bl, 3
		mov	dx, 1518h
		lea	si, [aKarate]	; "KARATE"
		call	printString
		mov	bl, 3
		mov	dx, 1805h
		lea	si, [aC1989]	; "(c) 1989"
		call	printString
		mov	bl, 3
		mov	dx, 180Eh
		lea	si, [aSystem3]	; "SYSTEM 3"
		call	printString
		mov	bl, 3
		mov	dx, 1817h
		lea	si, [aSoftwareLtd] ; "SOFTWARE LTD"
		call	printString
		mov	si, 0FAh ; '˙'
		call	sub_1394B
mainMenuProc:				; ...
		mov	[ds:byte_12943], 0
		call	sub_1387A
		mov	bl, 3
		mov	dx, 0Dh
		mov	[ds:word_12CF4], 1
		lea	si, [aInternational] ; "INTERNATIONAL"
		call	printString
		mov	[ds:word_12CF4], 0
		mov	bl, 3
		mov	dx, 111h
		lea	si, [aKarate]	; "KARATE"
		call	printString
		mov	bl, 3
		mov	dx, 110Ah
		lea	si, [aStartAtAustral] ;	"START AT AUSTRALIA"
		call	printString
		mov	bl, 3
		mov	dx, 130Ah
		lea	si, [aStartAtEgypt] ; "START AT	EGYPT"
		call	printString
		mov	bl, 3
		mov	dx, 150Ah
		lea	si, [aOptions]	; "OPTIONS"
		call	printString
		mov	[ds:menuCurY], 0
		mov	[ds:byte_12CF8], 1
		mov	[ds:byte_16320], 0FFh
loc_12EE4:				; ...
		call	sub_131F9
		mov	dl, [ds:byte_10441]
		mov	dh, [ds:byte_10442]
		call	sub_135A9
		cmp	[ds:byte_10441], dl
		jnz	short loc_12EFE
		cmp	[ds:byte_10442], dh
		jz	short loc_12F00
loc_12EFE:				; ...
		push	ax
		pop	ax
loc_12F00:				; ...
		mov	ax, [ds:word_12CC5]
		mov	[ds:word_12CC5], 0
		cmp	al, 38h	; '8'
		jz	short loc_12F2D
		cmp	al, 32h	; '2'
		jz	short loc_12F20
		cmp	ah, 1Ch		; enter	pressed?
		jz	short loc_12F3A
		cmp	ah, 48h	; 'H'   ; up ?
		jz	short loc_12F2D
		cmp	ah, 50h	; 'P'   ; down?
		jnz	short loc_12EE4
loc_12F20:				; ...
		cmp	[ds:menuCurY], 2
		jz	short loc_12EE4
		inc	[ds:menuCurY]
		jmp	short loc_12EE4
; ---------------------------------------------------------------------------
loc_12F2D:				; ...
		cmp	[ds:menuCurY], 0
		jz	short loc_12EE4
		dec	[ds:menuCurY]
		jmp	short loc_12EE4
; ---------------------------------------------------------------------------
loc_12F3A:				; ...
		mov	bl, [ds:menuCurY]
		sub	bh, bh
		shl	bx, 1
		mov	ax, [ds:off_12F48+bx]
		jmp	ax
endp		sub_12E09
; ---------------------------------------------------------------------------
off_12F48	dw offset autstraliaProc ; ...
		dw offset egyptProc
		dw offset setupProc
; ---------------------------------------------------------------------------
setupProc:				; ...
		call	sub_1387A
		call	showOptionsMnu
		mov	[ds:menuCurY], 0
		mov	[ds:byte_12CF8], 1
		mov	[ds:byte_16320], 0FFh
loc_12F63:				; ...
		call	sub_13185
		mov	dl, [ds:byte_10441]
		mov	dh, [ds:byte_10442]
		call	sub_135A9
		cmp	[ds:byte_10441], dl
		jnz	short loc_12F7D
		cmp	[ds:byte_10442], dh
		jz	short loc_12F82
loc_12F7D:				; ...
		push	ax
		call	showOptionsMnu
		pop	ax
loc_12F82:				; ...
		mov	ax, [ds:word_12CC5]
		mov	[ds:word_12CC5], 0
		cmp	al, 38h	; '8'
		jz	short loc_12FC1
		cmp	al, 32h	; '2'
		jz	short loc_12FA2
		cmp	ah, 1Ch
		jz	short loc_12FE0
		cmp	ah, 48h	; 'H'
		jz	short loc_12FC1
		cmp	ah, 50h	; 'P'
		jnz	short loc_12F63
loc_12FA2:				; ...
		cmp	[ds:menuCurY], 6
		jz	short loc_12F63
		inc	[ds:menuCurY]
		cmp	[ds:byte_12CF6], 0
		jnz	short loc_12F63
		cmp	[ds:menuCurY], 1
		jnz	short loc_12F63
		inc	[ds:menuCurY]
		jmp	short loc_12F63
; ---------------------------------------------------------------------------
loc_12FC1:				; ...
		cmp	[ds:menuCurY], 0
		jz	short loc_12F63
		dec	[ds:menuCurY]
		cmp	[ds:byte_12CF6], 0
		jnz	short loc_12F63
		cmp	[ds:menuCurY], 1
		jnz	short loc_12F63
		dec	[ds:menuCurY]
		jmp	short loc_12F63
; ---------------------------------------------------------------------------
loc_12FE0:				; ...
		mov	bl, [ds:menuCurY]
		sub	bh, bh
		shl	bx, 1		; multile 2
		mov	ax, [ds:setupMnuOffset+bx]
		jmp	ax
; ---------------------------------------------------------------------------
setupMnuOffset	dw offset nofJoyProc	; ...
		dw offset loc_13051
		dw offset loc_13070
		dw offset loc_1307B
		dw offset loc_13086
		dw offset loc_13091
		dw offset mainMenuProc
; ---------------------------------------------------------------------------
autstraliaProc:				; ...
		mov	[ds:currLvl], 0
		mov	[ds:byte_12CF8], 0
		jmp	short loc_13013
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
egyptProc:				; ...
		mov	[ds:currLvl], 4
		mov	[ds:byte_12CF8], 0
loc_13013:				; ...
		cmp	[ds:byte_12CF6], 0
		jz	short locret_1303A
		cmp	[ds:byte_1045B], 0
		jz	short loc_13026
		sub	di, di
		call	sub_132CA
loc_13026:				; ...
		cmp	[ds:byte_12CF6], 1
		jz	short locret_1303A
		cmp	[ds:byte_1045C], 0
		jz	short locret_1303A
		mov	di, 1
		call	sub_132CA
locret_1303A:				; ...
		retn
; ---------------------------------------------------------------------------
nofJoyProc:				; ...
		inc	[ds:byte_12CF6]
		cmp	[ds:byte_12CF6], 3
		jnz	short loc_1304B
		mov	[ds:byte_12CF6], 0
loc_1304B:				; ...
		call	showOptionsMnu
		jmp	loc_12F63
; ---------------------------------------------------------------------------
loc_13051:				; ...
		cmp	[ds:byte_12CF6], 0
		jz	short loc_1306A
		sub	di, di
		call	sub_132CA
		cmp	[ds:byte_12CF6], 1
		jz	short loc_1306A
		mov	di, 1
		call	sub_132CA
loc_1306A:				; ...
		call	showOptionsMnu
		jmp	loc_12F63
; ---------------------------------------------------------------------------
loc_13070:				; ...
		xor	[ds:byte_12CF7], 8
		call	showOptionsMnu
		jmp	loc_12F63
; ---------------------------------------------------------------------------
loc_1307B:				; ...
		xor	[ds:byte_10441], 1
		call	showOptionsMnu
		jmp	loc_12F63
; ---------------------------------------------------------------------------
loc_13086:				; ...
		xor	[ds:byte_10442], 1
		call	showOptionsMnu
		jmp	loc_12F63
; ---------------------------------------------------------------------------
loc_13091:				; ...
		inc	[ds:byte_12CFA]
		cmp	[ds:byte_12CFA], 3
		jnz	short loc_130A1
		mov	[ds:byte_12CFA], 0
loc_130A1:				; ...
		call	showOptionsMnu
		jmp	loc_12F63
; =============== S U B	R O U T	I N E =======================================
proc		showOptionsMnu near	; ...
		mov	[ds:byte_12943], 0
		mov	bl, 3
		mov	dx, 110Ah
		lea	si, [aOfJoysticks] ; "#	OF JOYSTICKS:"
		call	printString
		cmp	[ds:byte_12CF6], 0
		jz	short loc_130D4
		cmp	[ds:byte_12CF6], 1
		jz	short loc_130CD
		lea	si, [aTwo]	; "TWO "
		jmp	short loc_130D8
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_130CD:				; ...
		lea	si, [aOne]	; "ONE "
		jmp	short loc_130D8
; ---------------------------------------------------------------------------
		nop
loc_130D4:				; ...
		lea	si, [aNone]	; "NONE"
loc_130D8:				; ...
		mov	bl, 3
		mov	dx, 1119h
		call	printString
		mov	bl, 3
		cmp	[ds:byte_12CF6], 0
		jnz	short loc_130EB
		mov	bl, 2
loc_130EB:				; ...
		mov	dx, 120Ah
		lea	si, [aCalibrateJoy_0] ;	"CALIBRATE JOYSTICK"
		call	printString
		lea	si, [aUseCompositeMo] ;	"USE COMPOSITE MONITOR"
		cmp	[ds:byte_12CF7], 0
		jz	short loc_13104
		lea	si, [aUseRgbMonitor] ; "USE RGB	MONITOR	     "
loc_13104:				; ...
		mov	bl, 3
		mov	dx, 130Ah
		call	printString
		mov	bl, 3
		mov	dx, 140Ah
		lea	si, [aSound]	; "SOUND:"
		call	printString
		mov	bl, 3
		mov	dx, 1410h
		lea	si, [aOn]	; "ON "
		cmp	[ds:byte_10441], 0
		jnz	short loc_1312C
		lea	si, [aOff]	; "OFF"
loc_1312C:				; ...
		call	printString
		mov	bl, 3
		mov	dx, 150Ah
		lea	si, [aMusic]	; "MUSIC:"
		call	printString
		mov	bl, 3
		mov	dx, 1510h
		lea	si, [aOn]	; "ON "
		cmp	[ds:byte_10442], 0
		jnz	short loc_1314F
		lea	si, [aOff]	; "OFF"
loc_1314F:				; ...
		call	printString
		mov	bl, 3
		mov	dx, 160Ah
		lea	si, [aSpeed]	; "SPEED:"
		call	printString
		mov	bl, 3
		mov	dx, 1610h
		mov	al, [ds:byte_12CFA]
		sub	ah, ah
		mov	si, ax
		shl	si, 1
		mov	si, [ds:speedStrOffset+si]
		call	printString
		mov	bl, 3
		mov	dx, 170Ah
		lea	si, [aMainMenu]	; "MAIN	MENU"
		jmp	printString
endp		showOptionsMnu
; ---------------------------------------------------------------------------
speedStrOffset	dw offset aSlow		; ...
					; "SLOW	 "
		dw offset aMedium	; "MEDIUM"
		dw offset aFast		; "FAST	 "
; =============== S U B	R O U T	I N E =======================================
proc		sub_13185 near		; ...
		mov	bl, [ds:menuCurY]
		sub	bh, bh
		mov	al, [ds:byte_131F2+bx]
		shl	al, 1
		shl	al, 1
		shl	al, 1
		add	al, 2Eh	; '.'
		mov	bl, [ds:byte_12943]
		mov	[ds:byte_12943], al
		cmp	al, bl
		jz	short locret_131E3
		cmp	bl, 0
		jz	short loc_131C0
		sub	bh, bh
		sub	bx, 2Eh	; '.'
		mov	cx, 7
loc_131AF:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		add	di, 11h
		shr	bx, 1
		sub	ax, ax
		stosw
		inc	bx
		loop	loc_131AF
loc_131C0:				; ...
		mov	bl, [ds:byte_12943]
		sub	bh, bh
		sub	bx, 2Eh	; '.'
		mov	cx, 7
		lea	si, [unk_131E4]
loc_131D0:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		add	di, 11h
		shr	bx, 1
		lodsw
		and	ax, 5555h
		stosw
		inc	bx
		loop	loc_131D0
locret_131E3:				; ...
		retn
endp		sub_13185
; ---------------------------------------------------------------------------
unk_131E4	db 0F0h	; 		; ...
		db    0
		db 0FFh
		db    0
		db 0FFh
		db 0F0h	; 
		db 0FFh
		db 0FFh
		db 0FFh
		db 0F0h	; 
		db 0FFh
		db    0
		db 0F0h	; 
		db    0
byte_131F2	db 11h			; ...
		db  12h
		db  13h
		db  14h
		db  15h
		db  16h
		db  17h
; =============== S U B	R O U T	I N E =======================================
proc		sub_131F9 near		; ...
		mov	bl, [ds:menuCurY]
		sub	bh, bh
		mov	al, [ds:byte_13266+bx]
		shl	al, 1
		shl	al, 1
		shl	al, 1
		add	al, 2Eh	; '.'
		mov	bl, [ds:byte_12943]
		mov	[ds:byte_12943], al
		cmp	al, bl
		jz	short locret_13257
		cmp	bl, 0
		jz	short loc_13234
		sub	bh, bh
		sub	bx, 2Eh	; '.'
		mov	cx, 7
loc_13223:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		add	di, 11h
		shr	bx, 1
		sub	ax, ax
		stosw
		inc	bx
		loop	loc_13223
loc_13234:				; ...
		mov	bl, [ds:byte_12943]
		sub	bh, bh
		sub	bx, 2Eh	; '.'
		mov	cx, 7
		lea	si, [unk_13258]
loc_13244:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		add	di, 11h
		shr	bx, 1
		lodsw
		and	ax, 5555h
		stosw
		inc	bx
		loop	loc_13244
locret_13257:				; ...
		retn
endp		sub_131F9
; ---------------------------------------------------------------------------
unk_13258	db 0F0h	; 		; ...
		db    0
		db 0FFh
		db    0
		db 0FFh
		db 0F0h	; 
		db 0FFh
		db 0FFh
		db 0FFh
		db 0F0h	; 
		db 0FFh
		db    0
		db 0F0h	; 
		db    0
byte_13266	db 11h			; ...
		db  13h
		db  15h
; =============== S U B	R O U T	I N E =======================================
proc		sub_13269 near		; ...
		mov	dx, 201h
		sub	bx, bx
		sub	cx, cx
		sub	si, si
		cli
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		jmp	short loc_13277
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_13277:				; ...
		jmp	short loc_1327A
; ---------------------------------------------------------------------------
		align 2
loc_1327A:				; ...
		jmp	short loc_1327D
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1327D:				; ...
		nop
loc_1327E:				; ...
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	ax, 3
		jz	short loc_13293
		rcr	ax, 1
		adc	bx, 0
		add	cx, ax
		inc	si
		jz	short loc_13290
		jmp	short loc_1327E
; ---------------------------------------------------------------------------
loc_13290:				; ...
		sti
		clc
		retn
; ---------------------------------------------------------------------------
loc_13293:				; ...
		sti
		stc
		retn
endp		sub_13269
; =============== S U B	R O U T	I N E =======================================
proc		sub_13296 near		; ...
		mov	dx, 201h
		sub	bx, bx
		sub	cx, cx
		sub	si, si
		cli
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		jmp	short loc_132A4
; ---------------------------------------------------------------------------
		nop
loc_132A4:				; ...
		jmp	short loc_132A7
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_132A7:				; ...
		jmp	short loc_132AA
; ---------------------------------------------------------------------------
		nop
loc_132AA:				; ...
		nop
loc_132AB:				; ...
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	ax, 0Ch
		jz	short loc_132C4
		rcr	ax, 1
		rcr	ax, 1
		rcr	ax, 1
		adc	bx, 0
		add	cx, ax
		inc	si
		jz	short loc_132C1
		jmp	short loc_132AB
; ---------------------------------------------------------------------------
loc_132C1:				; ...
		sti
		clc
		retn
; ---------------------------------------------------------------------------
loc_132C4:				; ...
		sti
		stc
		retn
endp		sub_13296
; ---------------------------------------------------------------------------
byte_132C7	db 10h			; ...
		db 40h
byte_132C9	db 0			; ...
; =============== S U B	R O U T	I N E =======================================
proc		sub_132CA near		; ...
		push	di
		call	sub_1387A
		pop	di
		mov	[ds:byte_1045B+di], 0
		mov	al, [ds:byte_132C7+di]
		mov	[ds:byte_132C9], al
		cmp	di, 0
		jz	short loc_132E6
		call	sub_13296
		jmp	short loc_132E9
; ---------------------------------------------------------------------------
		nop
loc_132E6:				; ...
		call	sub_13269
loc_132E9:				; ...
		jb	short loc_132F1
		mov	[ds:byte_1045B+di], 1
		retn
; ---------------------------------------------------------------------------
loc_132F1:				; ...
		mov	ax, di
		add	al, 31h	; '1'
		mov	[ds:byte_12959], al
		shl	di, 1
		mov	[ds:byte_12940], 3
		mov	bl, 1
		mov	dx, 0F08h
		lea	si, [aCalibrate]
		call	printString
		mov	dx, 1103h
		mov	bl, 2
		lea	si, [aUpperLeft] ; "	       UPPER  LEFT	     "
		call	printString
loc_13317:				; ...
		mov	bl, 3
		mov	dx, 1302h
		lea	si, [aPleaseHoldStic] ;	"Please	hold stick at position shown"
		call	printString
		mov	bl, 3
		mov	dx, 1402h
		lea	si, [aPushActionButt] ;	"Push action button and	then release"
		call	printString
		mov	bl, 3
		mov	dx, 1503h
		lea	si, [aHoldStickAtThi] ;	"Hold stick at this position until"
		call	printString
		mov	bl, 3
		mov	dx, 1607h
		lea	si, [aPositionReques] ;	"position request"
		call	printString
		mov	bl, 3
		mov	dx, 1618h
		lea	si, [aChanges]	; "changes"
		call	printString
		mov	bl, 2
		mov	dx, 180Bh
		lea	si, [aPressQToQuit] ; "Press \"Q\" to QUIT"
		call	printString
		call	sub_1339A
		cmp	[ds:word_12941], 0
		jz	short loc_13392
		dec	[ds:byte_12940]
		jz	short locret_13399
		cmp	[ds:byte_12940], 1
		jz	short loc_13384
		mov	bl, 2
		mov	dx, 1103h
		lea	si, [aCenter]	; "		CENTER		    "
		call	printString
		jmp	short loc_13317
; ---------------------------------------------------------------------------
loc_13384:				; ...
		mov	bl, 2
		mov	dx, 1103h
		lea	si, [aLowerRight] ; "		LOWER RIGHT	      "
		call	printString
		jmp	short loc_13317
; ---------------------------------------------------------------------------
loc_13392:				; ...
		shr	di, 1
		mov	[ds:byte_1045B+di], 1
locret_13399:				; ...
		retn
endp		sub_132CA
; =============== S U B	R O U T	I N E =======================================
proc		sub_1339A near		; ...
		mov	[ds:word_12941], 1C20h
loc_133A0:				; ...
		mov	dx, 201h
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		test	[ds:byte_132C9], al
		jz	short loc_133A0
loc_133AA:				; ...
		call	sub_1382B
		mov	ah, 1
		int	16h		; KEYBOARD - CHECK BUFFER, DO NOT CLEAR
					; Return: ZF clear if character	in buffer
					; AH = scan code, AL = character
					; ZF set if no character in buffer
		jz	short loc_133C8
		sub	ax, ax
		int	16h		; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
					; Return: AH = scan code, AL = character
		and	al, 0DFh
		cmp	al, 51h	; 'Q'
		jnz	short loc_133C8
		mov	[ds:byte_1045B], 1
		mov	[ds:word_12941], 1
loc_133C8:				; ...
		dec	[ds:word_12941]
		jnz	short loc_133D1
		jmp	loc_134CB
; ---------------------------------------------------------------------------
loc_133D1:				; ...
		mov	dx, 201h
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		test	[ds:byte_132C9], al
		jnz	short loc_133AA
		mov	bl, 2
		mov	dx, 1103h
		lea	si, [aNowCalibrating] ;	" *  NOW CALIBRATING JOYSTICK  *  "
		call	printString
		mov	dx, 201h
		sub	bx, bx
		sub	cx, cx
		cli
		cmp	di, 0
		jz	short loc_13412
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		jmp	short loc_133F8
; ---------------------------------------------------------------------------
		nop
loc_133F8:				; ...
		jmp	short loc_133FB
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_133FB:				; ...
		jmp	short loc_133FE
; ---------------------------------------------------------------------------
		nop
loc_133FE:				; ...
		nop
loc_133FF:				; ...
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	ax, 0Ch
		jz	short loc_1342C
		rcr	ax, 1
		rcr	ax, 1
		rcr	ax, 1
		adc	bx, 0
		add	cx, ax
		jmp	short loc_133FF
; ---------------------------------------------------------------------------
loc_13412:				; ...
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		jmp	short loc_13416
; ---------------------------------------------------------------------------
		nop
loc_13416:				; ...
		jmp	short loc_13419
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_13419:				; ...
		jmp	short loc_1341C
; ---------------------------------------------------------------------------
		nop
loc_1341C:				; ...
		nop
loc_1341D:				; ...
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	ax, 3
		jz	short loc_1342C
		rcr	ax, 1
		adc	bx, 0
		add	cx, ax
		jmp	short loc_1341D
; ---------------------------------------------------------------------------
loc_1342C:				; ...
		sti
loc_1342D:
		cmp	[ds:byte_12940], 3
		jnz	short loc_1343F
		mov	[ds:word_10443+di], bx
		mov	[word ptr ds:unk_1044B+di], cx
		jmp	short loc_13459
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1343F:				; ...
		cmp	[ds:byte_12940], 2
		jnz	short loc_13451
		mov	[ds:word_10453+di], bx
		mov	[ds:word_10457+di], cx
		jmp	short loc_13459
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_13451:				; ...
		mov	[ds:word_10447+di], bx
		mov	[ds:word_1044F+di], cx
loc_13459:				; ...
		mov	ax, 1Eh
		call	sub_134CF
		cmp	[ds:byte_12940], 1
		jnz	short loc_134BF
		mov	dx, [ds:word_10443+di]
		mov	ax, [ds:word_10453+di]
		sub	ax, dx
		shr	ax, 1
		add	[ds:word_10443+di], ax
		mov	dx, [word ptr ds:unk_1044B+di]
		mov	ax, [ds:word_10457+di]
		sub	ax, dx
		shr	ax, 1
		add	[word ptr ds:unk_1044B+di], ax
		mov	ax, [ds:word_10453+di]
		mov	dx, [ds:word_10447+di]
		sub	dx, ax
		shr	dx, 1
		add	ax, dx
		mov	[ds:word_10447+di], ax
		mov	ax, [ds:word_10457+di]
		mov	dx, [ds:word_1044F+di]
		sub	dx, ax
		shr	dx, 1
		add	ax, dx
		mov	[ds:word_1044F+di], ax
		mov	bl, 1
		mov	dx, 1103h
		lea	si, [aJoystickNowCal] ;	"    JOYSTICK NOW CALIBRATED!	  "
		call	printString
		mov	ax, 1Eh
		call	sub_134CF
		jmp	short loc_134CB
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_134BF:				; ...
		mov	bl, 2
		mov	dx, 1103h
		lea	si, [aPleaseRepeatUs] ;	"Please	repeat using next position"
		call	printString
loc_134CB:				; ...
		call	sub_1387A
		retn
endp		sub_1339A
; =============== S U B	R O U T	I N E =======================================
proc		sub_134CF near		; ...
		mov	dx, 3DAh
loc_134D2:				; ...
		push	ax
loc_134D3:				; ...
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		and	al, 8
		jz	short loc_134D3
loc_134D8:				; ...
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		and	al, 8
		jnz	short loc_134D8
		pop	ax
		dec	ax
		jnz	short loc_134D2
		retn
endp		sub_134CF
; =============== S U B	R O U T	I N E =======================================
proc		sub_134E2 near		; ...
		push	si
		push	bx
		push	di
		mov	bl, dh
		sub	bh, bh
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		mov	bl, dl
		sub	bh, bh
		shl	bx, 1
		add	di, bx
		add	di, [ds:word_12CF4]
		lea	si, [word_181C0]
		mov	bl, al
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		add	si, bx
		mov	bl, [ds:byte_12CC1]
		cmp	bl, 3
		jnz	short loc_13542
		movsw
		add	di, 1FFEh
		movsw
		sub	di, 1FB2h
		movsw
		add	di, 1FFEh
		movsw
		sub	di, 1FB2h
		movsw
loc_1352F:
		add	di, 1FFEh
		movsw
		sub	di, 1FB2h
		movsw
		add	di, 1FFEh
		movsw
		pop	di
		pop	bx
		pop	si
		retn
; ---------------------------------------------------------------------------
loc_13542:				; ...
		sub	bh, bh
		shl	bx, 1
		mov	bx, [ds:word_1358C+bx]
		push	ax
		lodsw
		and	ax, bx
		stosw
		add	di, 1FFEh
		lodsw
		and	ax, bx
		stosw
		sub	di, 1FB2h
		lodsw
		and	ax, bx
		stosw
		add	di, 1FFEh
		lodsw
		and	ax, bx
		stosw
		sub	di, 1FB2h
		lodsw
		and	ax, bx
		stosw
		add	di, 1FFEh
		lodsw
		and	ax, bx
		stosw
		sub	di, 1FB2h
		lodsw
		and	ax, bx
		stosw
		add	di, 1FFEh
		lodsw
		and	ax, bx
		stosw
		pop	ax
		pop	di
		pop	bx
		pop	si
		retn
endp		sub_134E2
; ---------------------------------------------------------------------------
word_1358C	dw 0			; ...
		dw 5555h
		dw 0AAAAh
		dw 0FFFFh
; =============== S U B	R O U T	I N E =======================================
proc		sub_13594 near		; ...
		mov	[ds:byte_12CC9], 0
		mov	[ds:byte_12CCA], 0
		mov	[ds:byte_12CC3], 0
		mov	[ds:byte_12CC4], 0
		retn
endp		sub_13594
; =============== S U B	R O U T	I N E =======================================
proc		sub_135A9 near		; ...
		push	bx
		push	ax
		push	ds
		mov	ax, 40h	; '@'
		mov	ds, ax
		assume ds:nothing
		mov	bl, [ds:18h]
		or	[byte ptr ds:17h], 20h
		pop	ds
		assume ds:nothing
		cmp	[ds:byte_12CCA], 0
		jz	short loc_135CD
		dec	[ds:byte_12CCA]
		jnz	short loc_135CD
		and	[ds:byte_12CC4], 0F0h
loc_135CD:				; ...
		cmp	[ds:byte_12CC9], 0
		jz	short loc_135DF
		dec	[ds:byte_12CC9]
		jnz	short loc_135DF
		and	[ds:byte_12CC3], 0F0h
loc_135DF:				; ...
		mov	ah, 2
		int	16h		; KEYBOARD - GET SHIFT STATUS
					; AL = shift status bits
		mov	ah, al
		cmp	[ds:byte_12CC9], 0
		jnz	short loc_135FA
		and	[ds:byte_12CC3], 0EFh
		and	al, 2
		jz	short loc_135FA
		or	[ds:byte_12CC3], 10h
loc_135FA:				; ...
		cmp	[ds:byte_12CCA], 0
		jnz	short loc_13610
		and	[ds:byte_12CC4], 0EFh
		and	bl, 40h
		jz	short loc_13610
		or	[ds:byte_12CC4], 10h
loc_13610:				; ...
		mov	al, ah
		and	al, 0Fh
		jz	short $+2
getMenuKeyb:				; ...
		mov	ah, 1
		int	16h		; KEYBOARD - CHECK BUFFER, DO NOT CLEAR
					; Return: ZF clear if character	in buffer
					; AH = scan code, AL = character
					; ZF set if no character in buffer
		jnz	short loc_1361F
		jmp	loc_13722
; ---------------------------------------------------------------------------
loc_1361F:				; ...
		sub	ax, ax
		int	16h		; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
					; Return: AH = scan code, AL = character
		mov	[byte ptr ds:word_12CC5], al
		mov	[byte ptr ds:word_12CC5+1], ah
		cmp	ax, 3F00h
		jz	short loc_1364D
		cmp	al, 13h
loc_13631:
		jz	short loc_1364D
		cmp	ax, 4100h
		jnz	short loc_13662
		xor	[ds:byte_10442], 1
		mov	[byte ptr ds:word_12CC5], 0
		mov	[byte ptr ds:word_12CC5+1], 0
		call	sub_1383D
		jmp	loc_13722
; ---------------------------------------------------------------------------
loc_1364D:				; ...
		xor	[byte ptr ds:41h], 1
		mov	[byte ptr ds:word_12CC5], 0
		mov	[byte ptr ds:word_12CC5+1], 0
		call	sub_1383D
		jmp	loc_13722
; ---------------------------------------------------------------------------
loc_13662:				; ...
		cmp	[ds:byte_12CF8], 0
		jnz	short loc_136B4
		cmp	ah, 1
		jz	short loc_13685
		cmp	ax, 3B00h
		jz	short loc_13695
		cmp	ax, 3D00h
		jz	short loc_136A2
		cmp	ax, 4300h
		jnz	short loc_136B4
		cli
		mov	ax, [ds:savedSP]
		mov	sp, ax
		sti
		retn
; ---------------------------------------------------------------------------
loc_13685:				; ...
		call	sub_12E09
		mov	[ds:byte_10465], 0
		mov	[ds:byte_10466], 0
		jmp	short loc_136AC
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_13695:				; ...
		mov	[ds:byte_10465], 1
		mov	[ds:byte_10466], 0
		jmp	short loc_136AC
; ---------------------------------------------------------------------------
		nop
loc_136A2:				; ...
		mov	[ds:byte_10465], 1
		mov	[ds:byte_10466], 1
loc_136AC:				; ...
		mov	[ds:byte_1056D], 0
		jmp	loc_106A6
; ---------------------------------------------------------------------------
loc_136B4:				; ...
		mov	bx, 7
loc_136B7:				; ...
		cmp	ah, [ds:byte_12CCB+bx]
		jz	short loc_136C9
loc_136BD:
		cmp	al, [ds:byte_12CD3+bx]
		jz	short loc_136C9
		dec	bx
		jns	short loc_136B7
		jmp	short loc_136EC
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_136C9:				; ...
		cmp	[ds:byte_12CCA], 0
		jnz	short loc_136EC
		mov	[byte ptr ds:word_12CC5], 0
		mov	al, [ds:byte_12CEB+bx]
		and	[ds:byte_12CC4], 0F0h
		or	[ds:byte_12CC4], al
		mov	[ds:byte_12CCA], 5
		mov	[ds:byte_12CC8], 5
loc_136EC:				; ...
		mov	bx, 7
loc_136EF:				; ...
		cmp	al, [ds:byte_12CDB+bx]
		jz	short loc_13701
		cmp	al, [ds:byte_12CE3+bx]
		jz	short loc_13701
		dec	bx
		jns	short loc_136EF
		jmp	short loc_1371F
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_13701:				; ...
		cmp	[ds:byte_12CC9], 0
		jnz	short loc_1371F
		mov	al, [ds:byte_12CEB+bx]
		and	[ds:byte_12CC3], 0F0h
		or	[ds:byte_12CC3], al
		mov	[ds:byte_12CC9], 5
		mov	[ds:byte_12CC7], 5
loc_1371F:				; ...
		pop	ax
loc_13720:
		pop	bx
		retn
; ---------------------------------------------------------------------------
loc_13722:				; ...
		cmp	[ds:byte_12CF6], 0
		jz	short loc_137A2
		cmp	[ds:byte_1045B], 0
		jnz	short loc_137A5
loc_13730:
		cmp	[ds:byte_12CC7], 0
		jz	short loc_1373E
		dec	[ds:byte_12CC7]
		jmp	short loc_137A5
; ---------------------------------------------------------------------------
		align 2
loc_1373E:				; ...
		push	cx
		push	dx
		mov	dx, 201h
		sub	bx, bx
		sub	cx, cx
		cli
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		jmp	short loc_1374C
; ---------------------------------------------------------------------------
		align 2
loc_1374C:				; ...
		jmp	short loc_1374F
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1374F:				; ...
		jmp	short loc_13752
; ---------------------------------------------------------------------------
		nop
loc_13752:				; ...
		nop
loc_13753:				; ...
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	ax, 3
		jz	short loc_13762
		rcr	ax, 1
		adc	bx, 0
		add	cx, ax
		jmp	short loc_13753
; ---------------------------------------------------------------------------
loc_13762:				; ...
		sti
		mov	[ds:byte_12CC3], 0
		cmp	bx, [ds:word_10443]
		jnb	short loc_13773
		or	[ds:byte_12CC3], 4
loc_13773:				; ...
		cmp	bx, [ds:word_10447]
		jb	short loc_1377E
		or	[ds:byte_12CC3], 8
loc_1377E:				; ...
		cmp	cx, [word ptr ds:unk_1044B]
		jnb	short loc_13789
		or	[ds:byte_12CC3], 1
loc_13789:				; ...
		cmp	cx, [ds:word_1044F]
		jb	short loc_13794
		or	[ds:byte_12CC3], 2
loc_13794:				; ...
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	al, 10h
		cmp	al, 10h
		jz	short loc_137A0
		or	[ds:byte_12CC3], 10h
loc_137A0:				; ...
		pop	dx
		pop	cx
loc_137A2:				; ...
		pop	ax
		pop	bx
		retn
; ---------------------------------------------------------------------------
loc_137A5:				; ...
		cmp	[ds:byte_12CF6], 1
		jz	short loc_137A2
		cmp	[ds:byte_1045C], 0
		jnz	short loc_137A2
		cmp	[ds:byte_12CC8], 0
		jz	short loc_137C0
		dec	[ds:byte_12CC8]
		jmp	short loc_137A2
; ---------------------------------------------------------------------------
loc_137C0:				; ...
		push	cx
		push	dx
		mov	dx, 201h
		sub	bx, bx
		sub	cx, cx
		cli
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		jmp	short loc_137CE
; ---------------------------------------------------------------------------
		align 2
loc_137CE:				; ...
		jmp	short loc_137D1
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_137D1:				; ...
		jmp	short loc_137D4
; ---------------------------------------------------------------------------
		align 2
loc_137D4:				; ...
		nop
loc_137D5:				; ...
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	ax, 0Ch
		jz	short loc_137E8
		rcr	ax, 1
		rcr	ax, 1
		rcr	ax, 1
		adc	bx, 0
		add	cx, ax
		jmp	short loc_137D5
; ---------------------------------------------------------------------------
loc_137E8:				; ...
		sti
		mov	[ds:byte_12CC4], 0
		cmp	bx, [ds:word_10445]
		jnb	short loc_137F9
		or	[ds:byte_12CC4], 4
loc_137F9:				; ...
		cmp	bx, [ds:word_10449]
		jb	short loc_13804
		or	[ds:byte_12CC4], 8
loc_13804:				; ...
		cmp	cx, [ds:word_1044D]
		jnb	short loc_1380F
		or	[ds:byte_12CC4], 1
loc_1380F:				; ...
		cmp	cx, [ds:word_10451]
		jb	short loc_1381A
		or	[ds:byte_12CC4], 2
loc_1381A:				; ...
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		and	al, 40h
		cmp	al, 40h	; '@'
		jz	short loc_13826
		or	[ds:byte_12CC4], 10h
loc_13826:				; ...
		pop	dx
		pop	cx
		pop	ax
		pop	bx
		retn
endp		sub_135A9
; =============== S U B	R O U T	I N E =======================================
proc		sub_1382B near		; ...
		push	dx
		push	ax
		mov	dx, 3DAh
loc_13830:				; ...
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
loc_13831:
		and	al, 8
		jnz	short loc_13830
loc_13835:				; ...
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		and	al, 8
		jz	short loc_13835
		pop	ax
		pop	dx
		retn
endp		sub_1382B
; =============== S U B	R O U T	I N E =======================================
proc		sub_1383D near		; ...
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÕÀÕ OR	03H=spkr ON
					; 1: Tmr 2 data	Õº  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FCh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÕÀÕ OR	03H=spkr ON
					; 1: Tmr 2 data	Õº  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retn
endp		sub_1383D
; =============== S U B	R O U T	I N E =======================================
proc		sub_13844 near		; ...

		mov ax,4 ; my manual hack
		int 010h ; --------------
		
		sub	di, di
		sub	ax, ax
		mov	dx, 2000h
loc_1384B:				; ...
		mov	[ds:word_12ABC+di], ax
		add	ax, 50h	; 'P'
		add	di, 2
		mov	[ds:word_12ABC+di], dx
		add	dx, 50h	; 'P'
		add	di, 2
		cmp	di, 190h
		jb	short loc_1384B
		call	sub_138C9
		call	setTimerInt
		push	es
		mov	ax, 0F000h
		mov	es, ax
		assume es:nothing
		mov	al, [es:0FFFEh]
		pop	es
		assume es:nothing
		mov	[ds:byte_12CC2], al
		retn
endp		sub_13844
; =============== S U B	R O U T	I N E =======================================
proc		sub_1387A near		; ...
		cld
		sub	ax, ax
		mov	bx, 120
loc_13880:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		shr	bx, 1
		mov	cx, 28h	; '('
		rep stosw
		inc	bx
		cmp	bx, 0C8h ; '»'
		jb	short loc_13880
		retn
endp		sub_1387A
; =============== S U B	R O U T	I N E =======================================
proc		sub_13895 near		; ...
		cld
		sub	ax, ax
		mov	bx, 0
loc_1389B:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		shr	bx, 1
		mov	cx, 28h	; '('
		rep stosw
		inc	bx
		cmp	bx, 10h
		jb	short loc_1389B
		retn
endp		sub_13895
; ---------------------------------------------------------------------------
		cld
		sub	ax, ax
		sub	bx, bx
loc_138B4:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		shr	bx, 1
		mov	cx, 28h	; '('
		rep stosw
		inc	bx
		cmp	bx, 0C8h ; '»'
		jb	short loc_138B4
		retn
; =============== S U B	R O U T	I N E =======================================
proc		sub_138C9 near		; ...
		push	es
		mov	dx, [cs:codeSegm]
		mov	es, dx
		lea	si, [word_181C0]
		mov	di, si
		mov	cx, 408h
loc_138DA:				; ...
		lodsb
		inc	si
		mov	ah, al
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		mov	ax, dx
		stosw
		loop	loc_138DA
		pop	es
		retn
endp		sub_138C9
; =============== S U B	R O U T	I N E =======================================
proc		sub_13925 near		; ...
		mov	al, [ds:byte_12CBE]
		rcl	al, 1
		rcl	al, 1
		rcl	al, 1
		rcl	al, 1
loc_13930:
		xor	al, [ds:byte_12CBE]
		rcr	al, 1
		rcr	[ds:byte_12CBC], 1
		rcr	[ds:byte_12CBD], 1
		rcr	[ds:byte_12CBE], 1
		retn
endp		sub_13925
; =============== S U B	R O U T	I N E =======================================
proc		sub_13943 near		; ...
		call	sub_1382B
		jmp	short sub_13925
endp		sub_13943
; ---------------------------------------------------------------------------
		mov	si, 32h	; '2'
; =============== S U B	R O U T	I N E =======================================
proc		sub_1394B near		; ...
		call	sub_13943
		dec	si
		jnz	short sub_1394B
		retn
endp		sub_1394B
; ---------------------------------------------------------------------------
loc_13952:				; ...
		call	sub_1394B
		mov	si, 1
		call	sub_135A9
		mov	al, [ds:byte_12CC3]
		and	al, 10h
		jz	short loc_13952
		mov	[ds:byte_12CC3], 0
		retn
; ---------------------------------------------------------------------------
		cmp	[ds:byte_12CC2], 0FDh ;	'˝'
		jnz	short locret_1398D
		call	sub_1382B
		mov	dx, 3DAh
		mov	al, 0
		out	dx, al		; Video: bits 0-1 control
					; Feature Control outputs FC0 and FC1
		mov	al, 2
		out	dx, al		; Video: bits 0-1 control
					; Feature Control outputs FC0 and FC1
		mov	al, 11h
		out	dx, al		; Video: bits 0-1 control
					; Feature Control outputs FC0 and FC1
		mov	al, bl
		out	dx, al		; Video: bits 0-1 control
					; Feature Control outputs FC0 and FC1
		mov	al, 12h
		out	dx, al		; Video: bits 0-1 control
					; Feature Control outputs FC0 and FC1
		mov	al, bh
		out	dx, al		; Video: bits 0-1 control
					; Feature Control outputs FC0 and FC1
		mov	al, 0
		out	dx, al		; Video: bits 0-1 control
					; Feature Control outputs FC0 and FC1
		mov	al, 0Ah
		out	dx, al		; Video: bits 0-1 control
					; Feature Control outputs FC0 and FC1
locret_1398D:				; ...
		retn
; =============== S U B	R O U T	I N E =======================================
proc		printString near	; ...
		mov	al, [ds:byte_12CC1]
		push	ax
		mov	[ds:byte_12CC1], bl
loc_13996:				; ...
		mov	al, [si]
		cmp	al, 0
		jz	short loc_139A4
		call	sub_134E2
		inc	si
		inc	dl
		jmp	short loc_13996
; ---------------------------------------------------------------------------
loc_139A4:				; ...
		pop	ax
		mov	[ds:byte_12CC1], al
		retn
endp		printString
; ---------------------------------------------------------------------------
		shl	si, 1
		mov	bx, [ds:word_12ABC+si]
		shr	si, 1
		retn
; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
savedTimerAddr	dw 0			; ...
savedTimerSeg	dw 0			; ...
word_139C4	dw 0FFFFh		; ...
word_139C6	dw 0FFFFh		; ...
word_139C8	dw 0FFFFh		; ...
word_139CA	dw 0			; ...
word_139CC	dw 0			; ...
word_139CE	dw 0			; ...
word_139D0	dw 0			; ...
word_139D2	dw 0			; ...
word_139D4	dw 0			; ...
word_139D6	dw 1			; ...
word_139D8	dw 1			; ...
word_139DA	dw 1			; ...
word_139DC	dw 0			; ...
word_139DE	dw 0			; ...
word_139E0	dw 0			; ...
word_139E2	dw 0			; ...
word_139E4	dw 0			; ...
word_139E6	dw 0			; ...
word_139E8	dw 0			; ...
word_139EA	dw 0			; ...
word_139EC	dw 0			; ...
word_139EE	dw 0			; ...
byte_139F0	db 0			; ...
byte_139F1	db 2			; ...
word_139F2	dw 0Ch			; ...
		db 1, 0
byte_139F6	db 1			; ...
word_139F7	dw 0			; ...
word_139F9	dw 0			; ...
word_139FB	dw 0			; ...
word_139FD	dw 0			; ...
word_139FF	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  85h	; Ö
		db  8Eh	; é
		dw 8685h
		dw 7EF9h
		dw 77D8h
		db  1Eh
		db  71h	; q
		db 0C5h	; ≈
		db  6Ah	; j
		db 0C7h	; «
		db  64h	; d
		db  1Fh
		db  5Fh	; _
		db 0C8h	; »
		db  59h	; Y
		db 0BEh	; æ
		db  54h	; T
		db 0FDh	; ˝
		db  4Fh	; O
		db  7Fh	; 
		db  4Bh	; K
		db  43h	; C
		db  47h	; G
		db  43h	; C
		db  43h	; C
		db  7Ch	; |
		db  3Fh	; ?
		db 0ECh	; Ï
		db  3Bh	; ;
		db  8Fh	; è
		db  38h	; 8
		db  62h	; b
		db  35h	; 5
		db  63h	; c
		db  32h	; 2
		db  8Fh	; è
		db  2Fh	; /
		db 0E4h	; ‰
		db  2Ch	; ,
		db  5Fh	; _
		db  2Ah	; *
		db 0FEh	; ˛
		db  27h	; '
		db 0C0h	; ¿
		db  25h	; %
		db 0A1h	; °
		db  23h	; #
		db 0A1h	; °
		db  21h	; !
		db 0BEh	; æ
		db  1Fh
		db 0F6h	; ˆ
		db  1Dh
		db  48h	; H
		db  1Ch
		db 0B1h	; ±
		db  1Ah
		db  32h	; 2
		db  19h
		db 0C8h	; »
		db  17h
		db  72h	; r
		db  16h
		db  30h	; 0
		db  15h
		db 0FFh
		db  13h
		db 0E0h	; ‡
		db  12h
		db 0D1h	; —
		db  11h
		db 0D1h	; —
		db  10h
		db 0DFh	; ﬂ
		db  0Fh
		db 0FBh	; ˚
		db  0Eh
		db  24h	; $
		db  0Eh
		db  59h	; Y
		db  0Dh
		db  99h	; ô
		db  0Ch
		db 0E4h	; ‰
		db  0Bh
		db  39h	; 9
		db  0Bh
		db  98h	; ò
		db  0Ah
		db    0
		db  0Ah
		db  70h	; p
		db    9
		db 0E8h	; Ë
		db    8
		db  68h	; h
		db    8
		db 0F0h	; 
		db    7
		db  7Eh	; ~
		db    7
		db  12h
		db    7
		db 0ACh	; ¨
		db    6
		db  4Ch	; L
		db    6
		db 0F2h	; Ú
		db    5
		db  9Dh	; ù
		db    5
		db  4Ch	; L
		db    5
		db    0
		db    5
		db 0B8h	; ∏
		db    4
		db  74h	; t
		db    4
		db  34h	; 4
		db    4
		db 0F8h	; ¯
		db    3
		db 0BFh	; ø
		db    3
		db  89h	; â
		db    3
		db  56h	; V
		db    3
		db  26h	; &
		db    3
		db 0F9h	; ˘
		db    2
		db 0CEh	; Œ
		db    2
		db 0A6h	; ¶
		db    2
		db  80h	; Ä
		db    2
		db  5Ch	; \
		db    2
		db  3Ah	; :
		db    2
		db  1Ah
		db    2
		db 0FCh	; ¸
		db    1
		db 0DFh	; ﬂ
		db    1
		db 0C4h	; ƒ
		db    1
		db 0ABh	; ´
		db    1
		db  93h	; ì
		db    1
		db  7Ch	; |
		db    1
		db  67h	; g
		db    1
		db  53h	; S
		db    1
		db  40h	; @
		db    1
		db  2Eh	; .
		db    1
		db  1Dh
		db    1
		db  0Dh
		db    1
		db 0FEh	; ˛
		db    0
		db 0F0h	; 
		db    0
		db 0E2h	; ‚
		db    0
		db 0D6h	; ÷
		db    0
		db 0CAh	;  
		db    0
		db 0BEh	; æ
		db    0
		db 0B4h	; ¥
		db    0
		db 0A9h	; ©
		db    0
		db 0A0h	; †
		db    0
		db  97h	; ó
		db    0
		db  8Fh	; è
		db    0
		db  87h	; á
		db    0
		db  7Fh	; 
		db    0
		db  78h	; x
		db    0
		db  71h	; q
		db    0
		db  6Bh	; k
		db    0
		db  65h	; e
		db    0
		db  5Fh	; _
		db    0
		db  5Ah	; Z
		db    0
		db  55h	; U
		db    0
		db  50h	; P
		db    0
		db  4Bh	; K
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		setTimerInt near	; ...
		call	sub_13CBD
		cli
		sub	ax, ax
		push	es
		mov	es, ax
		assume es:nothing
		mov	ax, [es:70h]
		mov	[ds:savedTimerAddr], ax
		mov	ax, [es:72h]
		mov	[ds:savedTimerSeg], ax
		mov	ax, offset timerProc
		mov	[es:70h], ax
		mov	[word ptr es:72h], cs
		pop	es
		assume es:nothing
		sti
		mov	al, 36h	; '6'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, 4DAEh
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		retn
endp		setTimerInt
; =============== S U B	R O U T	I N E =======================================
proc		restoreTimerInt	near	; ...
		cli
		sub	ax, ax
		mov	es, ax
		assume es:nothing
		mov	ax, [ds:savedTimerAddr]
		mov	[es:70h], ax
		mov	ax, [ds:savedTimerSeg]
		mov	[es:72h], ax
		sti
		mov	al, 36h	; '6'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		sub	al, al
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		jmp	sub_13CBD
endp		restoreTimerInt
; ---------------------------------------------------------------------------
timerProc:				; ...
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		push	ds
		mov	ax, [cs:codeSegm]
		mov	ds, ax
		call	sub_106F8
		call	sub_13B76
		pop	ds
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		iret
; =============== S U B	R O U T	I N E =======================================
proc		sub_13B76 near		; ...
; FUNCTION CHUNK AT 397D SIZE 0000000C BYTES
		cmp	[ds:byte_10442], 0
		jz	short loc_13BAF
		sub	di, di
		dec	[ds:byte_139F1]
		jns	short loc_13B8A
		mov	[ds:byte_139F1], 2
loc_13B8A:				; ...
		cmp	[ds:byte_139F1], 2
		jnz	short loc_13B98
		shl	di, 1
		call	sub_13BE0
		shr	di, 1
loc_13B98:				; ...
		inc	di
		cmp	di, 2
		jb	short loc_13B8A
		inc	[ds:word_139EE]
		cmp	[ds:word_139EE], 2
		jb	short loc_13BAF
		mov	[ds:word_139EE], 0
loc_13BAF:				; ...
		cmp	[ds:byte_139F6], 0
		jnz	short loc_13BB9
		jmp	loc_13D7D
; ---------------------------------------------------------------------------
loc_13BB9:				; ...
		cmp	[ds:byte_10442], 0
		jz	short locret_13BDF
		mov	di, [ds:word_139EE]
		shl	di, 1
		mov	ax, [ds:word_139DC+di]
		cmp	ax, 0
		jz	short locret_13BDF
		cmp	[ds:word_139E8+di], 0
		jnz	short loc_13BDC
		sub	ax, ax
		mov	[ds:word_139DC+di], ax
loc_13BDC:				; ...
		call	sub_13F09
locret_13BDF:				; ...
		retn
endp		sub_13B76
; =============== S U B	R O U T	I N E =======================================
proc		sub_13BE0 near		; ...
		cmp	[ds:word_139C4+di], 0FFFFh
		jz	short locret_13BFF
		sub	[ds:word_139D6+di], 1
		js	short loc_13C00
		dec	[ds:word_139E2+di]
		cmp	[ds:word_139E2+di], 0
		jnz	short locret_13BFF
		mov	[ds:word_139E8+di], 0
locret_13BFF:				; ...
		retn
; ---------------------------------------------------------------------------
loc_13C00:				; ...
		jmp	short loc_13C03
; ---------------------------------------------------------------------------
		nop
loc_13C03:				; ...
		mov	bx, [ds:word_139C4+di]
		mov	si, [ds:word_139CA+di]
		mov	bl, [bx+si]
		sub	bh, bh
		cmp	bx, 0FFh
		jz	short loc_13C21
		cmp	bx, 0FEh ; '˛'
		jnz	short loc_13C3F
		call	sub_13CBD
		jmp	loc_13D5A
; ---------------------------------------------------------------------------
loc_13C21:				; ...
		mov	[ds:word_139CA+di], 0
		mov	[ds:word_139D0+di], 0
		mov	[ds:word_139DC+di], 0
		mov	[ds:byte_139F1], 2
		mov	[ds:word_139EE], 0
		retn
; ---------------------------------------------------------------------------
loc_13C3F:				; ...
		mov	al, [byte ptr ds:unk_13F30+bx]
		mov	ah, [ds:byte_13F65+bx]
		sub	ax, 0B685h
		lea	bx, [unk_141FF]
		add	bx, ax
		mov	si, [ds:word_139D0+di]
		mov	al, [bx+si]
		mov	[ds:byte_139F0], al
		and	al, 1Fh
		sub	ah, ah
		mov	[ds:word_139D6+di], ax
		test	[ds:byte_139F0], 40h
		jnz	short loc_13CA4
		inc	[ds:word_139D0+di]
		cmp	[ds:byte_139F0], 80h ; 'Ä'
		jb	short loc_13C85
		inc	si
		mov	al, [bx+si]
		cmp	al, 80h	; 'Ä'
		jb	short loc_13C81
		inc	si
		mov	al, [bx+si]
		inc	[ds:word_139D0+di]
loc_13C81:				; ...
		inc	[ds:word_139D0+di]
loc_13C85:				; ...
		inc	si
		mov	al, [bx+si]
		sub	ah, ah
		mov	si, ax
		shl	si, 1
		mov	ax, [ds:word_139FF+si]
		mov	[ds:word_139DC+di], ax
		mov	ax, [ds:word_139F2+di]
		mov	[ds:word_139E2+di], ax
		mov	[ds:word_139E8+di], 1
loc_13CA4:				; ...
		inc	[ds:word_139D0+di]
		mov	si, [ds:word_139D0+di]
		mov	al, [bx+si]
		cmp	al, 0FFh
		jnz	short locret_13CBC
		mov	[ds:word_139D0+di], 0
		inc	[ds:word_139CA+di]
locret_13CBC:				; ...
		retn
endp		sub_13BE0
; =============== S U B	R O U T	I N E =======================================
proc		sub_13CBD near		; ...
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		push	di
		cli
		mov	[ds:word_139C4], 0FFFFh
		mov	[ds:word_139C6], 0FFFFh
		mov	[ds:word_139C8], 0FFFFh
		mov	[ds:word_139CA], 0
		mov	[ds:word_139CC], 0
		mov	[ds:word_139CE], 0
		mov	[ds:word_139D0], 0
		mov	[ds:word_139D2], 0
		mov	[ds:word_139D4], 0
		mov	[ds:word_139D6], 1
		mov	[ds:word_139D8], 1
		mov	[ds:word_139DA], 1
		mov	[ds:word_139DC], 0
		mov	[ds:word_139DE], 0
		mov	[ds:word_139E0], 0
		mov	[ds:word_139E8], 0
		mov	[ds:word_139EA], 0
		mov	[ds:word_139EC], 0
		mov	[ds:word_139E2], 0
		mov	[ds:word_139E4], 0
		mov	[ds:word_139E6], 0
		mov	[ds:byte_139F1], 2
		mov	[ds:word_139EE], 0
		sub	ax, ax
		call	sub_13F09
		sti
		pop	di
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
endp		sub_13CBD
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_113E2
loc_13D5A:				; ...
		cli
		lea	ax, [unk_13F9A]
		mov	[ds:word_139C4], ax
		lea	ax, [unk_14023]
		mov	[ds:word_139C6], ax
		lea	ax, [byte_14104]
		mov	[ds:word_139C8], ax
		mov	[ds:byte_139F1], 2
		mov	[ds:word_139EE], 0
		sti
		retn
; END OF FUNCTION CHUNK	FOR sub_113E2
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_13B76
loc_13D7D:				; ...
		mov	si, [ds:word_139F7]
		shl	si, 1
		mov	ax, [ds:off_13E5D+si]
		jmp	ax
; END OF FUNCTION CHUNK	FOR sub_13B76
; ---------------------------------------------------------------------------
loc_13D89:				; ...
		mov	ax, [ds:word_139F9]
		cmp	ax, 0
		js	short loc_13DAC
		jz	short loc_13D96
		mov	ax, [ds:word_139FD]
loc_13D96:				; ...
		call	sub_13F09
		add	[ds:word_139FD], 1000h
		dec	[ds:word_139F9]
		jns	short locret_13DAB
		mov	[ds:word_139FD], 4000h
locret_13DAB:				; ...
		retn
; ---------------------------------------------------------------------------
loc_13DAC:				; ...
		mov	ax, [ds:word_139FB]
		cmp	ax, 0
		jz	short loc_13DC8
		and	ax, 1
		jnz	short loc_13DC5
		call	sub_13EE8
		mov	ax, [word ptr ds:unk_13F06]
		and	ax, 1Fh
		jmp	short loc_13DC8
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_13DC5:				; ...
		mov	ax, [ds:word_139FD]
loc_13DC8:				; ...
		call	sub_13F09
		add	[ds:word_139FD], 100h
		dec	[ds:word_139FB]
		jns	short locret_13DDC
		mov	[ds:byte_139F6], 1
locret_13DDC:				; ...
		retn
; ---------------------------------------------------------------------------
loc_13DDD:				; ...
		mov	ax, [ds:word_139F9]
		cmp	ax, 0
		js	short loc_13E05
		jz	short loc_13DEF
		and	ax, 1
		jz	short loc_13DEF
		mov	ax, [ds:word_139FD]
loc_13DEF:				; ...
		call	sub_13F09
		add	[ds:word_139FD], 800h
		dec	[ds:word_139F9]
		jns	short locret_13E04
		mov	[ds:word_139FD], 0
locret_13E04:				; ...
		retn
; ---------------------------------------------------------------------------
loc_13E05:				; ...
		mov	ax, [ds:word_139FB]
		cmp	ax, 0
		jz	short loc_13E10
		mov	ax, [ds:word_139FD]
loc_13E10:				; ...
		call	sub_13F09
		add	[ds:word_139FD], 800h
		dec	[ds:word_139FB]
		jns	short locret_13E24
		mov	[ds:byte_139F6], 1
locret_13E24:				; ...
		retn
; ---------------------------------------------------------------------------
loc_13E25:				; ...
		mov	ax, [ds:word_139F9]
		cmp	ax, 0
		jz	short loc_13E30
		mov	ax, [ds:word_139FD]
loc_13E30:				; ...
		call	sub_13F09
		add	[ds:word_139FD], 800h
		dec	[ds:word_139F9]
		jns	short locret_13E44
		mov	[ds:byte_139F6], 1
locret_13E44:				; ...
		retn
; ---------------------------------------------------------------------------
loc_13E45:				; ...
		mov	si, 10h
		mov	dx, 1FFh
loc_13E4B:				; ...
		call	sub_13ECD
		dec	si
		jnz	short loc_13E4B
		dec	[ds:word_139F9]
		jnz	short locret_13E5C
		mov	[ds:byte_139F6], 1
locret_13E5C:				; ...
		retn
; ---------------------------------------------------------------------------
off_13E5D	dw offset loc_13D89	; ...
		dw offset loc_13DDD
		dw offset loc_13E25
		dw offset loc_13E45
		dw offset loc_13E45
		dw offset loc_13E45
off_13E69	dw offset loc_13E93	; ...
		dw offset loc_13EA6
		dw offset loc_13EB9
		dw offset loc_13EC6
		dw offset loc_13EC6
		dw offset loc_13EC6
; =============== S U B	R O U T	I N E =======================================
proc		sub_13E75 near		; ...
		cmp	[ds:byte_10441], 0
		jz	short locret_13E92
		cmp	si, 6
		jnb	short locret_13E92
		mov	[ds:word_139F7], si
		shl	si, 1
		mov	ax, [ds:off_13E69+si]
		mov	[ds:byte_139F6], 0
		jmp	ax
; ---------------------------------------------------------------------------
locret_13E92:				; ...
		retn
endp		sub_13E75
; ---------------------------------------------------------------------------
loc_13E93:				; ...
		mov	[ds:word_139F9], 6
		mov	[ds:word_139FB], 0Ch
		mov	[ds:word_139FD], 0
		retn
; ---------------------------------------------------------------------------
loc_13EA6:				; ...
		mov	[ds:word_139F9], 6
		mov	[ds:word_139FB], 8
		mov	[ds:word_139FD], 0
		retn
; ---------------------------------------------------------------------------
loc_13EB9:				; ...
		mov	[ds:word_139F9], 8
		mov	[ds:word_139FD], 0
		retn
; ---------------------------------------------------------------------------
loc_13EC6:				; ...
		mov	[ds:word_139F9], 4
		retn
; =============== S U B	R O U T	I N E =======================================
proc		sub_13ECD near		; ...
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÕÀÕ OR	03H=spkr ON
					; 1: Tmr 2 data	Õº  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FEh
		xor	al, 2
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÕÀÕ OR	03H=spkr ON
					; 1: Tmr 2 data	Õº  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		call	sub_13EE8
		mov	cl, [byte ptr ds:unk_13F06]
		mov	ch, [byte ptr ds:unk_13F07]
		and	cx, dx
		add	cx, 20h	; ' '
loc_13EE5:				; ...
		loop	loc_13EE5
		retn
endp		sub_13ECD
; =============== S U B	R O U T	I N E =======================================
proc		sub_13EE8 near		; ...
		mov	al, [ds:byte_13F08]
		rcl	al, 1
		rcl	al, 1
		rcl	al, 1
		rcl	al, 1
		xor	al, [ds:byte_13F08]
		rcr	al, 1
		rcr	[byte ptr ds:unk_13F06], 1
		rcr	[byte ptr ds:unk_13F07], 1
		rcr	[ds:byte_13F08], 1
		retn
endp		sub_13EE8
; ---------------------------------------------------------------------------
unk_13F06	db  7Fh	; 		; ...
unk_13F07	db  7Fh	; 		; ...
byte_13F08	db 7Fh			; ...
; =============== S U B	R O U T	I N E =======================================
proc		sub_13F09 near		; ...
		cmp	ax, 0
		jz	short loc_13F23
		push	ax
		mov	al, 0B6h ; '∂'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		pop	ax
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÕÀÕ OR	03H=spkr ON
					; 1: Tmr 2 data	Õº  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÕÀÕ OR	03H=spkr ON
					; 1: Tmr 2 data	Õº  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		jmp	short locret_13F29
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_13F23:				; ...
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÕÀÕ OR	03H=spkr ON
					; 1: Tmr 2 data	Õº  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FCh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÕÀÕ OR	03H=spkr ON
					; 1: Tmr 2 data	Õº  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
locret_13F29:				; ...
		retn
endp		sub_13F09
; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_13F30	db  85h	; Ö		; ...
		db  16h
		db  88h	; à
		db 0ACh	; ¨
		db  8Dh	; ç
		db  24h	; $
		db  34h	; 4
		db  42h	; B
		db 0D2h	; “
		db  0Ah
		db 0C1h	; ¡
		db  4Ch	; L
		db  52h	; R
		db  62h	; b
		db  76h	; v
		db 0EDh	; Ì
		db 0EBh	; Î
		db  27h	; '
		db  58h	; X
		db 0B8h	; ∏
		db  13h
		db  70h	; p
		db  3Ch	; <
		db  88h	; à
		db 0A0h	; †
		db  65h	; e
		db  87h	; á
		db 0ADh	; ≠
		db 0DBh	; €
		db 0E6h	; Ê
		db 0F3h	; Û
		db  0Ch
		db  25h	; %
		db  43h	; C
		db  85h	; Ö
		db 0C6h	; ∆
		db  29h	; )
		db  5Eh	; ^
		db 0D3h	; ”
		db  34h	; 4
		db  55h	; U
		db  86h	; Ü
		db 0A3h	; £
		db 0B4h	; ¥
		db 0C9h	; …
		db 0DEh	; ﬁ
		db 0F5h	; ı
		db  48h	; H
		db  58h	; X
		db 0AFh	; Ø
		db  6Dh	; m
		db  7Eh	; ~
		db  87h	; á
byte_13F65	db 0B6h			; ...
		db 0B9h	; π
		db 0B6h	; ∂
		db 0B6h	; ∂
		db 0B8h	; ∏
		db 0B9h	; π
		db 0B9h	; π
		db 0B9h	; π
		db 0B6h	; ∂
		db 0B7h	; ∑
		db 0B8h	; ∏
		db 0B7h	; ∑
		db 0B9h	; π
		db 0B9h	; π
		db 0B7h	; ∑
		db 0B7h	; ∑
		db 0B8h	; ∏
		db 0B8h	; ∏
		db 0B8h	; ∏
		db 0B9h	; π
		db 0BAh	; ∫
		db 0B9h	; π
		db 0BAh	; ∫
		db 0B9h	; π
		db 0B9h	; π
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0B9h	; π
		db 0BAh	; ∫
		db 0BBh	; ª
		db 0BBh	; ª
		db 0BBh	; ª
		db 0BBh	; ª
		db 0BBh	; ª
		db 0BCh	; º
		db 0BCh	; º
		db 0BCh	; º
		db 0BDh	; Ω
		db 0BDh	; Ω
		db 0BDh	; Ω
		db 0BDh	; Ω
		db 0BDh	; Ω
		db 0BDh	; Ω
		db 0BDh	; Ω
		db 0BDh	; Ω
		db 0BEh	; æ
		db 0BEh	; æ
		db 0B8h	; ∏
		db 0BEh	; æ
		db 0BEh	; æ
		db 0BEh	; æ
unk_13F9A	db    0			; ...
		db    0
		db    8
		db    8
		db    2
		db    3
		db    2
		db    3
		db    9
		db    9
		db  0Bh
		db  0Bh
		db  0Eh
		db  0Fh
		db  0Fh
		db  0Bh
		db    9
		db    9
		db    2
		db    3
		db    2
		db    3
		db  11h
		db  12h
		db  11h
		db  11h
		db    0
		db    0
		db  14h
		db  14h
		db  16h
		db  16h
		db  14h
		db  14h
		db  16h
		db  16h
		db  19h
		db  19h
		db  1Ah
		db  1Ah
		db  1Bh
		db  1Bh
		db  1Ch
		db  1Ch
		db  1Ch
		db  1Ch
		db  1Eh
		db  1Eh
		db  1Fh
		db  1Fh
		db  1Eh
		db  1Eh
		db  20h
		db  20h
		db  21h	; !
		db  22h	; "
		db  21h	; !
		db  22h	; "
		db  23h	; #
		db  24h	; $
		db  24h	; $
		db  25h	; %
		db  25h	; %
		db  26h	; &
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db  28h	; (
		db  29h	; )
		db  26h	; &
		db  28h	; (
		db  2Ah	; *
		db  2Bh	; +
		db  2Bh	; +
		db  2Bh	; +
		db  2Bh	; +
		db  2Ch	; ,
		db  2Ch	; ,
		db  2Ch	; ,
		db  2Ch	; ,
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Dh	; -
		db  2Eh	; .
		db  23h	; #
		db    0
		db    0
		db  19h
		db  1Ah
		db  1Bh
		db  1Ch
		db  1Ch
		db  1Eh
		db  1Eh
		db  1Fh
		db  1Fh
		db  1Eh
		db  1Eh
		db  20h
		db  20h
		db  21h	; !
		db  22h	; "
		db  21h	; !
		db  22h	; "
		db  14h
		db  14h
		db  16h
		db  16h
		db  16h
		db  2Fh	; /
		db  2Fh	; /
		db  2Fh	; /
		db  2Fh	; /
		db    0
		db    0
		db  11h
		db  12h
		db  11h
		db  12h
		db    2
		db    3
		db    2
		db    3
		db    2
		db  34h	; 4
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
unk_14023	db  31h	; 1		; ...
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  10h
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db  1Dh
		db    0
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db    0
		db    0
		db  33h	; 3
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
byte_14104	db 2 dup(0), 8,	2 dup(0Ch), 2 dup(7), 2	dup(0Ch), 2 dup(7) ; ...
		db 1, 5, 2 dup(6), 1, 5, 2 dup(6), 1, 7, 2 dup(0Ch), 0Dh
		db 5, 2	dup(6),	2 dup(1), 2 dup(0Dh), 2	dup(1),	2 dup(0Dh)
		db 2 dup(5), 2 dup(6), 2 dup(5), 2 dup(6), 2 dup(5), 2 dup(6)
		db 2 dup(5), 2 dup(6), 2 dup(5), 2 dup(6), 2 dup(5), 2 dup(6)
		db 2 dup(5), 2 dup(6), 2 dup(5), 2 dup(6), 2 dup(1), 2 dup(0Dh)
		db 2 dup(1), 2 dup(0Dh), 1, 5, 2 dup(6), 1, 5, 2 dup(6)
		db 1, 7, 2 dup(0Ch), 0Dh, 5, 2 dup(6), 1, 5, 2 dup(6)
		db 1, 5, 2 dup(6), 1, 7, 2 dup(0Ch), 0Dh, 5, 2 dup(6)
		db 0, 3	dup(13h), 4 dup(15h), 2	dup(13h), 4 dup(15h), 2	dup(13h)
		db 4 dup(17h), 4 dup(18h), 4 dup(15h), 2 dup(18h), 2 dup(17h)
		db 2 dup(18h), 2 dup(15h), 13h,	2 dup(15h), 13h, 2 dup(15h)
		db 13h,	2 dup(15h), 13h, 2 dup(15h), 13h, 2 dup(15h), 13h
		db 2 dup(15h), 13h, 2 dup(15h),	13h, 2 dup(15h), 13h, 2	dup(15h)
		db 13h,	2 dup(15h), 13h, 2 dup(15h), 13h, 2 dup(15h), 13h
		db 2 dup(15h), 13h, 2 dup(15h),	2 dup(0), 13h, 2 dup(17h)
		db 2 dup(18h), 2 dup(15h), 2 dup(18h), 2 dup(17h), 2 dup(18h)
		db 2 dup(15h), 13h, 2 dup(15h),	13h, 2 dup(15h), 2 dup(13h)
		db 4 dup(15h), 4 dup(0), 30h, 1, 5, 2 dup(6), 1, 5, 2 dup(6)
		db 1, 7, 2 dup(0Ch), 0Dh, 5, 2 dup(6), 1, 5, 2 dup(6)
		db 1, 5, 2 dup(6), 8, 32h, 5 dup(0), 0FFh
unk_141FF	db  5Fh	; _		; ...
		db  5Fh	; _
		db 0FFh
		db  83h	; É
		db    0
		db  3Fh	; ?
		db    3
		db  41h	; A
		db    3
		db  3Fh	; ?
		db    3
		db  41h	; A
		db  0Fh
		db  3Ah	; :
		db  47h	; G
		db    3
		db  3Fh	; ?
		db    3
		db  44h	; D
		db    3
		db  41h	; A
		db    3
		db  3Fh	; ?
		db    7
		db  41h	; A
		db    3
		db  3Fh	; ?
		db    3
		db  41h	; A
		db    3
		db  3Fh	; ?
		db    3
		db  3Dh	; =
		db    7
		db  3Fh	; ?
		db    7
		db  3Ah	; :
		db  5Fh	; _
		db 0FFh
		db  83h	; É
		db    0
		db  3Fh	; ?
		db    3
		db  41h	; A
		db    3
		db  3Fh	; ?
		db    3
		db  41h	; A
		db  0Fh
		db  3Ah	; :
		db  47h	; G
		db    3
		db  3Fh	; ?
		db    3
		db  44h	; D
		db    3
		db  46h	; F
		db    3
		db  44h	; D
		db    3
		db  41h	; A
		db    3
		db  3Fh	; ?
		db    3
		db  3Fh	; ?
		db    3
		db  3Dh	; =
		db    3
		db  3Fh	; ?
		db    3
		db  3Dh	; =
		db    7
		db  38h	; 8
		db    7
		db  3Ah	; :
		db  5Fh	; _
		db 0FFh
		db  97h	; ó
		db    6
		db  33h	; 3
		db  23h	; #
		db  35h	; 5
		db 0A3h	; £
		db 0FDh	; ˝
		db    0
		db  35h	; 5
		db  3Fh	; ?
		db  2Eh	; .
		db  0Fh
		db  2Eh	; .
		db  23h	; #
		db  35h	; 5
		db 0A3h	; £
		db 0F4h	; Ù
		db    0
		db  35h	; 5
		db  23h	; #
		db  38h	; 8
		db 0A3h	; £
		db 0FDh	; ˝
		db    0
		db  38h	; 8
		db  0Fh
		db  33h	; 3
		db  0Fh
		db  35h	; 5
		db  17h
		db  33h	; 3
		db  25h	; %
		db  31h	; 1
		db 0A1h	; °
		db 0FFh
		db    0
		db  31h	; 1
		db  3Fh	; ?
		db  2Eh	; .
		db  0Fh
		db  2Eh	; .
		db  2Ch	; ,
		db  38h	; 8
		db 0A2h	; ¢
		db 0F0h	; 
		db    0
		db  38h	; 8
		db  2Ch	; ,
		db  3Ah	; :
		db 0A2h	; ¢
		db  81h	; Å
		db    1
		db  3Ah	; :
		db  0Fh
		db  35h	; 5
		db 0FFh
		db  83h	; É
		db    7
		db  52h	; R
		db    3
		db  52h	; R
		db    3
		db  52h	; R
		db    3
		db  50h	; P
		db    3
		db  50h	; P
		db    3
		db  50h	; P
		db    3
		db  4Dh	; M
		db    3
		db  50h	; P
		db    3
		db  4Dh	; M
		db    3
		db  4Dh	; M
		db    3
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db    3
		db  50h	; P
		db    3
		db  50h	; P
		db    3
		db  4Dh	; M
		db    3
		db  50h	; P
		db    3
		db  52h	; R
		db    3
		db  52h	; R
		db    3
		db  52h	; R
		db    3
		db  50h	; P
		db    3
		db  50h	; P
		db    3
		db  50h	; P
		db    3
		db  4Dh	; M
		db    3
		db  50h	; P
		db    3
		db  4Dh	; M
		db    3
		db  4Dh	; M
		db    3
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db    3
		db  4Bh	; K
		db    3
		db  49h	; I
		db    3
		db  49h	; I
		db    3
		db  46h	; F
		db 0FFh
		db 0A1h	; °
		db    8
		db  2Ch	; ,
		db 0A1h	; °
		db 0FEh	; ˛
		db    0
		db  2Ch	; ,
		db  13h
		db  2Eh	; .
		db  24h	; $
		db  33h	; 3
		db 0A2h	; ¢
		db 0E0h	; ‡
		db    0
		db  33h	; 3
		db  0Fh
		db  35h	; 5
		db  0Fh
		db  2Ch	; ,
		db  21h	; !
		db  2Ch	; ,
		db 0A1h	; °
		db 0FEh	; ˛
		db    0
		db  2Ch	; ,
		db  13h
		db  2Eh	; .
		db  23h	; #
		db  38h	; 8
		db 0A3h	; £
		db 0E0h	; ‡
		db    0
		db  38h	; 8
		db  2Ch	; ,
		db  3Ah	; :
		db 0A2h	; ¢
		db  81h	; Å
		db    1
		db  3Ah	; :
		db  0Fh
		db  35h	; 5
		db 0FFh
		db  92h	; í
		db    8
		db  2Eh	; .
		db 0A4h	; §
		db 0A0h	; †
		db    1
		db  2Eh	; .
		db    7
		db  3Ah	; :
		db  2Bh	; +
		db  38h	; 8
		db  83h	; É
		db 0FFh
		db    0
		db  38h	; 8
		db  0Fh
		db  35h	; 5
		db 0A3h	; £
		db    8
		db  33h	; 3
		db  23h	; #
		db  35h	; 5
		db  23h	; #
		db  33h	; 3
		db  23h	; #
		db  31h	; 1
		db    2
		db  33h	; 3
		db 0A4h	; §
		db 0F6h	; ˆ
		db    0
		db  33h	; 3
		db    7
		db  38h	; 8
		db  2Bh	; +
		db  3Ah	; :
		db 0A3h	; £
		db 0A1h	; °
		db    1
		db  3Ah	; :
		db  0Fh
		db  2Eh	; .
		db 0A3h	; £
		db    8
		db  38h	; 8
		db  23h	; #
		db  3Ah	; :
		db  23h	; #
		db  38h	; 8
		db    3
		db  3Ah	; :
		db  23h	; #
		db  3Dh	; =
		db  23h	; #
		db  3Fh	; ?
		db  23h	; #
		db  3Dh	; =
		db    3
		db  3Fh	; ?
		db  23h	; #
		db  41h	; A
		db  23h	; #
		db  44h	; D
		db  23h	; #
		db  41h	; A
		db    3
		db  3Fh	; ?
		db    2
		db  41h	; A
		db 0A4h	; §
		db 0B1h	; ±
		db    1
		db  41h	; A
		db    7
		db  3Ah	; :
		db 0A3h	; £
		db    8
		db  3Fh	; ?
		db  23h	; #
		db  41h	; A
		db  23h	; #
		db  3Fh	; ?
		db    3
		db  3Dh	; =
		db  1Fh
		db  3Ah	; :
		db  47h	; G
		db    7
		db  3Ah	; :
		db  92h	; í
		db    8
		db  3Ah	; :
		db 0A4h	; §
		db 0A0h	; †
		db    2
		db  3Ah	; :
		db    7
		db  46h	; F
		db  2Ah	; *
		db  44h	; D
		db  84h	; Ñ
		db 0BFh	; ø
		db    1
		db  44h	; D
		db  0Fh
		db  41h	; A
		db  17h
		db  3Fh	; ?
		db    7
		db  41h	; A
		db  2Ah	; *
		db  3Fh	; ?
		db  84h	; Ñ
		db  9Fh	; ü
		db    1
		db  3Fh	; ?
		db  0Fh
		db  3Ah	; :
		db 0FFh
		db 0A3h	; £
		db    8
		db  3Fh	; ?
		db    7
		db  41h	; A
		db  23h	; #
		db  3Fh	; ?
		db    7
		db  41h	; A
		db  23h	; #
		db  3Fh	; ?
		db  23h	; #
		db  41h	; A
		db  23h	; #
		db  3Fh	; ?
		db    7
		db  41h	; A
		db    3
		db  3Fh	; ?
		db  24h	; $
		db  41h	; A
		db 0A2h	; ¢
		db  81h	; Å
		db    1
		db  41h	; A
		db  23h	; #
		db  3Dh	; =
		db    3
		db  3Ah	; :
		db  23h	; #
		db  41h	; A
		db    7
		db  44h	; D
		db  23h	; #
		db  41h	; A
		db    7
		db  44h	; D
		db  23h	; #
		db  41h	; A
		db  23h	; #
		db  44h	; D
		db  23h	; #
		db  41h	; A
		db    7
		db  44h	; D
		db    3
		db  41h	; A
		db  23h	; #
		db  46h	; F
		db 0A3h	; £
		db 0A9h	; ©
		db    1
		db  46h	; F
		db  23h	; #
		db  41h	; A
		db    3
		db  3Dh	; =
		db 0FFh
		db  83h	; É
		db  0Bh
		db  4Bh	; K
		db    3
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db    3
		db  4Dh	; M
		db  0Fh
		db  46h	; F
		db  47h	; G
		db    3
		db  4Bh	; K
		db    3
		db  50h	; P
		db    3
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db    7
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db    3
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db    3
		db  49h	; I
		db    7
		db  4Bh	; K
		db    7
		db  46h	; F
		db  83h	; É
		db  0Ch
		db  30h	; 0
		db    7
		db  2Eh	; .
		db    3
		db  2Ch	; ,
		db    7
		db  2Ch	; ,
		db  83h	; É
		db  0Ah
		db  4Dh	; M
		db    3
		db  2Bh	; +
		db 0FFh
		db  83h	; É
		db  0Bh
		db  4Bh	; K
		db    3
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db    3
		db  4Dh	; M
		db  0Fh
		db  46h	; F
		db  47h	; G
		db    3
		db  4Bh	; K
		db    3
		db  50h	; P
		db    3
		db  52h	; R
		db    3
		db  50h	; P
		db    3
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db    3
		db  4Bh	; K
		db    3
		db  49h	; I
		db    3
		db  4Bh	; K
		db    3
		db  49h	; I
		db    7
		db  44h	; D
		db    7
		db  46h	; F
		db  83h	; É
		db  0Ch
		db  30h	; 0
		db    7
		db  2Eh	; .
		db    3
		db  2Ch	; ,
		db    3
		db  2Ch	; ,
		db  83h	; É
		db  0Bh
		db  50h	; P
		db    3
		db  4Dh	; M
		db    3
		db  4Bh	; K
		db 0FFh
		db  83h	; É
		db    1
		db  49h	; I
		db    7
		db  46h	; F
		db    3
		db  46h	; F
		db  83h	; É
		db    4
		db  52h	; R
		db    3
		db  46h	; F
		db  83h	; É
		db    1
		db  46h	; F
		db    3
		db  49h	; I
		db    3
		db  4Bh	; K
		db    3
		db  4Bh	; K
		db    7
		db  49h	; I
		db  83h	; É
		db    4
		db  46h	; F
		db    3
		db  52h	; R
		db  83h	; É
		db    5
		db  52h	; R
		db    3
		db  46h	; F
		db 0FFh
		db  83h	; É
		db    1
		db  49h	; I
		db    7
		db  46h	; F
		db  0Bh
		db  46h	; F
		db    3
		db  46h	; F
		db    3
		db  49h	; I
		db    3
		db  4Bh	; K
		db    3
		db  4Bh	; K
		db  17h
		db  49h	; I
		db 0FFh
		db  83h	; É
		db    1
		db  55h	; U
		db    3
		db  57h	; W
		db    3
		db  55h	; U
		db    3
		db  57h	; W
		db  83h	; É
		db    4
		db  52h	; R
		db  83h	; É
		db    1
		db  52h	; R
		db  83h	; É
		db    4
		db  55h	; U
		db  83h	; É
		db    1
		db  55h	; U
		db    3
		db  57h	; W
		db    3
		db  55h	; U
		db    3
		db  57h	; W
		db    3
		db  55h	; U
		db  83h	; É
		db    4
		db  52h	; R
		db  83h	; É
		db    5
		db  49h	; I
		db  83h	; É
		db    4
		db  55h	; U
		db  83h	; É
		db    5
		db  3Dh	; =
		db 0FFh
		db  83h	; É
		db    9
		db  44h	; D
		db    3
		db  46h	; F
		db    3
		db  46h	; F
		db    3
		db  44h	; D
		db  83h	; É
		db    4
		db  52h	; R
		db  83h	; É
		db    9
		db  46h	; F
		db  83h	; É
		db    4
		db  55h	; U
		db  83h	; É
		db    9
		db  44h	; D
		db  83h	; É
		db    9
		db  46h	; F
		db    3
		db  46h	; F
		db    3
		db  44h	; D
		db    3
		db  46h	; F
		db  83h	; É
		db    4
		db  46h	; F
		db  83h	; É
		db  0Ah
		db  44h	; D
		db  83h	; É
		db    4
		db  55h	; U
		db  83h	; É
		db  0Ah
		db  24h	; $
		db 0FFh
		db  83h	; É
		db    2
		db  12h
		db    7
		db  12h
		db    3
		db  12h
		db  87h	; á
		db    3
		db  3Eh	; >
		db  87h	; á
		db    2
		db  12h
		db 0FFh
		db  83h	; É
		db    2
		db  14h
		db    7
		db  14h
		db    3
		db  14h
		db  87h	; á
		db    3
		db  3Eh	; >
		db  83h	; É
		db    2
		db  14h
		db    3
		db  20h
		db 0FFh
		db  83h	; É
		db    2
		db  16h
		db    7
		db  16h
		db    3
		db  16h
		db  87h	; á
		db    3
		db  3Eh	; >
		db  87h	; á
		db    2
		db  16h
		db 0FFh
		db  83h	; É
		db    2
		db  1Dh
		db    7
		db  1Dh
		db    3
		db  1Dh
		db  87h	; á
		db    3
		db  3Eh	; >
		db  83h	; É
		db    2
		db  1Dh
		db    3
		db  1Dh
		db 0FFh
		db  83h	; É
		db    2
		db  1Bh
		db    7
		db  1Bh
		db    3
		db  1Bh
		db  87h	; á
		db    3
		db  3Eh	; >
		db  83h	; É
		db    2
		db  1Bh
		db    3
		db  27h	; '
		db 0FFh
		db  83h	; É
		db    2
		db  19h
		db    7
		db  19h
		db    3
		db  19h
		db  87h	; á
		db    3
		db  3Eh	; >
		db  87h	; á
		db    2
		db  19h
		db 0FFh
		db  85h	; Ö
		db    2
		db  1Fh
		db    1
		db  1Fh
		db  83h	; É
		db    3
		db  3Eh	; >
		db  87h	; á
		db    2
		db  1Fh
		db    1
		db  22h	; "
		db    1
		db  24h	; $
		db  83h	; É
		db    3
		db  3Eh	; >
		db  81h	; Å
		db    2
		db  29h	; )
		db    1
		db  2Bh	; +
		db 0FFh
		db  85h	; Ö
		db    2
		db  1Ah
		db    1
		db  1Ah
		db  83h	; É
		db    3
		db  3Eh	; >
		db  87h	; á
		db    2
		db  1Ah
		db    1
		db  1Dh
		db    1
		db  1Fh
		db  83h	; É
		db    3
		db  3Eh	; >
		db  81h	; Å
		db    2
		db  24h	; $
		db    1
		db  26h	; &
		db 0FFh
		db  85h	; Ö
		db    2
		db  1Dh
		db    1
		db  1Dh
		db  83h	; É
		db    3
		db  3Eh	; >
		db  87h	; á
		db    2
		db  1Dh
		db    1
		db  20h
		db    1
		db  22h	; "
		db  83h	; É
		db    3
		db  3Eh	; >
		db  81h	; Å
		db    2
		db  27h	; '
		db    1
		db  29h	; )
		db 0FFh
		db  85h	; Ö
		db    2
		db  18h
		db    1
		db  18h
		db  83h	; É
		db    3
		db  3Eh	; >
		db  87h	; á
		db    2
		db  18h
		db    1
		db  1Bh
		db    1
		db  1Dh
		db  83h	; É
		db    3
		db  3Eh	; >
		db  81h	; Å
		db    2
		db  22h	; "
		db    1
		db  24h	; $
		db    5
		db  18h
		db    1
		db  18h
		db  83h	; É
		db    3
		db  3Eh	; >
		db  87h	; á
		db    2
		db  18h
		db    1
		db  1Bh
		db    1
		db  1Dh
		db  83h	; É
		db    3
		db  3Eh	; >
		db  81h	; Å
		db    2
		db  22h	; "
		db    1
		db  24h	; $
		db 0FFh
		db 0A1h	; °
		db  0Ch
		db  2Bh	; +
		db  81h	; Å
		db  10h
		db  3Ch	; <
		db    1
		db  30h	; 0
		db  81h	; Å
		db  0Fh
		db  5Bh	; [
		db  81h	; Å
		db  10h
		db  37h	; 7
		db    1
		db  3Ch	; <
		db  81h	; Å
		db  0Fh
		db  5Bh	; [
		db  81h	; Å
		db  10h
		db  3Ch	; <
		db 0A1h	; °
		db  0Ch
		db  2Bh	; +
		db  81h	; Å
		db  10h
		db  3Ch	; <
		db    1
		db  48h	; H
		db    1
		db  30h	; 0
		db  81h	; Å
		db  0Fh
		db  5Bh	; [
		db  81h	; Å
		db  10h
		db  3Ch	; <
		db  81h	; Å
		db  0Fh
		db  5Bh	; [
		db  81h	; Å
		db  10h
		db  30h	; 0
		db 0FFh
		db  81h	; Å
		db  0Dh
		db  46h	; F
		db    1
		db  48h	; H
		db    3
		db  48h	; H
		db    3
		db  48h	; H
		db    1
		db  48h	; H
		db    1
		db  46h	; F
		db    3
		db  48h	; H
		db    1
		db  48h	; H
		db    1
		db  46h	; F
		db    1
		db  48h	; H
		db    1
		db  4Bh	; K
		db    3
		db  48h	; H
		db    1
		db  46h	; F
		db    1
		db  48h	; H
		db    3
		db  48h	; H
		db    3
		db  48h	; H
		db    1
		db  46h	; F
		db    1
		db  48h	; H
		db    7
		db  43h	; C
		db  47h	; G
		db 0FFh
		db  81h	; Å
		db  0Dh
		db  4Ah	; J
		db    1
		db  4Dh	; M
		db    3
		db  4Fh	; O
		db    3
		db  4Fh	; O
		db    1
		db  4Fh	; O
		db    1
		db  4Dh	; M
		db    1
		db  4Fh	; O
		db    1
		db  52h	; R
		db    1
		db  4Fh	; O
		db    1
		db  52h	; R
		db    3
		db  4Fh	; O
		db    3
		db  4Ah	; J
		db    1
		db  4Ah	; J
		db    1
		db  4Dh	; M
		db    1
		db  4Ah	; J
		db    1
		db  4Dh	; M
		db    3
		db  4Ah	; J
		db    3
		db  48h	; H
		db    7
		db  4Ah	; J
		db  47h	; G
		db 0FFh
		db  85h	; Ö
		db  0Eh
		db  3Ch	; <
		db    5
		db  3Ah	; :
		db    7
		db  3Ch	; <
		db    1
		db  41h	; A
		db    1
		db  3Fh	; ?
		db    1
		db  41h	; A
		db    1
		db  41h	; A
		db    3
		db  3Fh	; ?
		db    5
		db  3Ch	; <
		db    5
		db  3Ah	; :
		db    7
		db  3Ch	; <
		db    1
		db  41h	; A
		db    1
		db  43h	; C
		db    1
		db  46h	; F
		db    1
		db  48h	; H
		db    3
		db  48h	; H
		db 0FFh, 85h, 0Eh, 3Eh,	5, 3Ch,	7, 3Eh,	1, 41h,	1, 43h
		db 1, 41h, 1, 43h, 1, 41h, 1, 43h, 5, 3Eh, 5, 3Ch, 7, 3Eh
		db 1, 48h, 1, 45h, 1, 48h, 1, 4Ah, 1, 4Ah, 1, 4Ah, 0FFh
		db 83h,	0Eh, 41h, 1, 44h, 3, 41h, 1, 3Fh, 7, 41h, 1, 44h
		db 1, 41h, 1, 46h, 1, 44h, 1, 46h, 1, 44h, 3, 41h, 1, 44h
		db 3, 41h, 1, 3Fh, 7, 41h, 1, 4Dh, 1, 4Bh, 1, 4Dh, 1, 4Dh
		db 1, 4Bh, 1, 48h, 0FFh, 83h, 0Eh, 43h,	1, 46h,	3, 43h
		db 1, 41h, 7, 43h, 1, 4Fh, 1, 4Dh, 1, 4Fh, 1, 4Fh, 1, 4Dh
		db 1, 4Fh, 0FFh, 81h, 11h, 48h,	1, 4Dh,	1, 4Bh,	1, 48h
		db 1, 4Bh, 1, 48h, 1, 46h, 1, 4Bh, 1, 48h, 1, 46h, 3, 48h
		db 47h,	0FFh, 81h, 11h,	45h, 1,	4Ah, 1,	48h, 1,	45h, 1
		db 48h,	1, 45h,	1, 43h,	1, 45h,	1, 43h,	1, 41h,	3, 3Eh
		db 47h,	0FFh, 83h, 11h,	4Ah, 1,	4Ah, 1,	48h, 1,	4Ah, 1
		db 4Dh,	1, 4Ah,	1, 48h,	3, 4Ah,	1, 4Ah,	1, 48h,	1, 4Ah
		db 1, 4Dh, 1, 4Ah, 1, 48h, 0FFh, 81h, 11h, 4Bh,	1, 48h
		db 1, 4Bh, 1, 48h, 23h,	4Bh, 3,	4Dh, 22h, 4Fh, 0A0h, 0F0h
		db 3, 4Fh, 22h,	52h, 0A0h, 0F1h, 3, 52h, 22h, 4Fh, 0A0h
		db 0F1h, 3, 4Fh, 3, 4Dh, 1, 4Bh, 1, 48h, 1, 4Bh, 1, 48h
		db 23h,	4Bh, 3,	4Dh, 22h, 4Fh, 0A0h, 0F1h, 3, 4Fh, 22h
		db 4Dh,	0A0h, 0F1h, 3, 4Dh, 22h, 4Bh, 0A0h, 0F1h, 3, 4Bh
		db 3, 48h, 0FFh, 1, 4Ah, 1, 4Dh, 1, 4Ah, 1, 4Dh, 23h, 4Ah
		db 3, 4Dh, 22h,	4Dh, 0A0h, 0F0h, 3, 4Dh, 22h, 4Fh, 0A0h
		db 0F1h, 3, 4Fh, 22h, 4Ah, 0A0h, 0F0h, 3, 4Ah, 3, 4Dh
		db 1, 4Ah, 1, 4Dh, 1, 4Ah, 1, 4Dh, 23h,	4Ah, 3,	4Dh, 22h
		db 4Ah,	0A0h, 0F1h, 3, 4Ah, 22h, 48h, 0A0h, 0F1h, 3, 48h
		db 22h,	46h, 0A0h, 0F1h, 3, 46h, 3, 43h, 0FFh, 0A3h, 12h
		db 3Ah,	0A3h, 0C0h, 0, 3Ah, 0Fh, 3Ch, 3, 3Ch, 3, 3Ah, 23h
		db 3Ah,	0A3h, 0C0h, 0, 3Ah, 0Fh, 3Ch, 3, 3Ch, 3, 3Eh, 23h
		db 3Ah,	0A3h, 0E0h, 0, 3Ah, 0Fh, 37h, 23h, 35h,	0A3h, 0B8h
		db 0, 35h, 1Fh,	37h, 23h, 3Ah, 0A3h, 0C0h, 0, 3Ah, 0Fh
		db 3Ch,	3, 3Ch,	3, 3Fh,	23h, 3Fh, 0A3h,	0E0h, 0, 3Fh, 0Fh
		db 41h,	3, 41h,	3, 43h,	23h, 41h, 0A3h,	0FEh, 0, 41h, 0Fh
		db 3Eh,	23h, 3Ch, 0A3h,	0D0h, 0, 3Ch, 0A1h, 13h, 3Eh, 21h
		db 3Ch,	21h, 3Eh, 21h, 3Ch, 21h, 3Eh, 21h, 3Ch,	21h, 3Eh
		db 21h,	3Ch, 0Fh, 3Eh, 0FFh, 0A1h, 80h,	1, 3Fh,	21h, 41h
		db 0A1h, 80h, 1, 3Fh, 25h, 41h,	0A1h, 80h, 1, 3Fh, 25h
		db 41h,	0A3h, 0F1h, 0, 41h, 3, 3Fh, 3, 3Ch, 0A1h, 80h
		db 1, 41h, 21h,	43h, 0A1h, 80h,	1, 41h,	25h, 43h, 0A1h
		db 80h,	1, 41h,	25h, 43h, 0A3h,	0F1h, 0, 43h, 3, 41h, 3
		db 43h,	0FFh, 1, 43h, 21h, 48h,	1, 46h,	1, 43h,	21h, 48h
		db 1, 46h, 1, 43h, 21h,	48h, 1,	46h, 1,	43h, 21h, 48h
		db 1, 46h, 0A3h, 0FFh, 0, 48h, 3, 46h, 1, 43h, 21h, 48h
		db 1, 46h, 1, 43h, 21h,	48h
		db 1, 46h, 1, 43h, 21h,	48h, 1,	46h, 1,	43h, 21h, 48h
		db 1, 46h, 0A3h, 0F0h, 0, 43h, 3, 45h, 1, 43h, 21h, 41h
		db 1, 3Eh, 1, 46h, 21h,	43h, 1,	41h, 1,	43h, 21h, 41h
		db 1, 3Eh, 1, 46h, 21h,	43h, 1,	41h, 23h, 41h, 0A3h, 0F0h
		db 0, 41h, 33h,	43h, 0,	43h, 0,	42h, 0,	41h, 0,	40h, 0
		db 3Fh,	0, 3Eh,	0, 3Dh,	0, 3Ch,	0, 3Bh,	0, 3Ah,	0, 39h
		db 0, 38h, 0FFh, 0, 24h, 0, 22h, 1, 24h, 0, 27h, 0, 24h
		db 1, 27h, 0, 29h, 0, 27h, 1, 29h, 0, 2Bh, 0, 29h, 1, 2Bh
		db 0, 2Eh, 0, 2Bh, 1, 2Eh, 0, 30h, 0, 2Eh, 1, 30h, 0, 33h
		db 0, 30h, 1, 33h, 0, 35h, 0, 33h, 1, 35h, 0, 37h, 0, 35h
		db 1, 37h, 0, 3Ah, 0, 37h, 1, 3Ah, 0, 3Ch, 0, 3Ah, 1, 3Ch
		db 0, 3Fh, 0, 3Ch, 1, 3Fh, 0, 41h, 0, 3Fh, 1, 41h, 0, 43h
		db 0, 41h, 1, 43h, 0, 46h, 0, 43h, 1, 46h, 0, 48h, 0, 46h
		db 1, 48h, 0FFh, 0, 41h, 0, 3Fh, 0, 3Ch, 0, 3Fh, 0, 43h
		db 0, 3Fh, 0, 3Ch, 0, 3Fh, 0, 41h, 0, 3Fh, 0, 3Ch, 0, 3Fh
		db 0, 43h, 0, 3Fh, 0, 3Ch, 0, 3Fh, 0FFh, 0, 43h, 0, 41h
		db 0, 3Eh, 0, 41h, 0, 46h, 0, 41h, 0, 3Eh, 0, 41h, 0, 43h
		db 0, 41h, 0, 3Eh, 0, 41h, 0, 46h, 0, 41h, 0, 3Eh, 0, 41h
		db 0, 43h, 0, 41h, 0, 3Eh, 0, 41h, 0, 46h, 0, 41h, 0, 3Eh
		db 0, 41h, 0FFh, 0A7h, 0E0h, 0,	46h, 27h, 48h, 0A7h, 0FFh
		db 0, 48h, 27h,	46h, 0,	45h, 0,	44h, 0,	43h, 0,	42h, 0
		db 41h,	0, 40h,	0, 3Fh,	0, 3Eh,	0FFh, 0A7h, 0D0h, 0, 41h
		db 27h,	43h, 0A7h, 0DFh, 0, 43h, 27h, 41h, 3, 3Fh, 3, 41h
		db 0FFh, 1, 41h, 1, 41h, 0A1h, 80h, 1, 3Fh, 1, 41h, 1
		db 41h,	1, 41h,	0A1h, 80h, 1, 3Fh, 1, 41h, 0FFh, 1, 43h
		db 1, 43h, 0A1h, 80h, 1, 41h, 1, 43h, 1, 43h, 1, 43h, 0A1h
		db 80h,	1, 41h,	1, 43h,	0FFh, 0A1h, 0FEh, 0, 41h, 1, 43h
		db 1, 3Fh, 1, 3Ch, 0A1h, 80h, 1, 3Fh, 1, 41h, 0A1h, 80h
		db 1, 41h, 1, 43h, 0FFh, 0A1h, 80h, 1, 41h, 1, 43h, 1
		db 43h,	0A1h, 80h, 1, 41h, 1, 43h, 1, 43h, 0A1h, 80h, 1
		db 41h,	1, 43h,	1, 43h,	0A1h, 80h, 1, 41h, 1, 43h, 1, 43h
		db 0A1h, 80h, 1, 41h, 1, 43h, 1, 43h, 0A1h, 80h, 1, 41h
		db 1, 43h, 1, 43h, 0A1h, 80h, 1, 41h, 1, 43h, 1, 43h, 0A1h
		db 80h,	1, 41h,	1, 43h,	1, 43h,	27h, 43h, 0, 42h, 0, 41h
		db 0, 40h, 0, 3Fh, 0, 3Eh, 0, 3Dh, 0, 3Ch, 0, 3Bh, 0FFh
		db 1, 4Dh, 1, 50h, 1, 4Dh, 1, 50h, 3, 4Dh, 3, 4Bh, 7, 4Dh
		db 47h,	0FFh, 47h, 87h,	0Ch, 30h, 3, 2Eh, 0Bh, 2Ch, 3
		db 30h,	7, 30h,	7, 2Eh,	3, 2Eh,	3, 2Ch,	3, 2Ch,	0FFh, 0BFh
		db 6, 33h, 3Fh,	33h, 3Fh, 33h, 3Fh, 33h, 3Fh, 2Eh, 5 dup(7Fh)
		db 0FFh, 0BFh, 6, 59h, 5 dup(7Fh), 0FFh, 0BFh, 6, 5Eh
		db 5 dup(7Fh), 0FFh, 8 dup(0)
fileHandle	dw 0			; ...
fileBufAddr	db    0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
aPicture	db  50h	; P		; ...
		db  49h	; I
		db  43h	; C
		db  54h	; T
		db  55h	; U
		db  52h	; R
		db  45h	; E
		db  20h
		db  2Eh	; .
unk_14C1D	db    0			; ...
		db 0, 20h, 0
; =============== S U B	R O U T	I N E =======================================
proc		openFile near		; ...
		push	es
		mov	[word ptr ds:unk_14C1D], ax
		mov	ax, [cs:freeSegm]
		mov	es, ax
		assume es:nothing
		push	cs
		pop	ds
		assume ds:seg001
		mov	ah, 3Dh	; '='
		mov	al, 0
		lea	dx, [aPicture]
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read
		mov	[fileHandle], ax
		jnb	short loc_14C49
		push	dx
		push	ax
		mov	ah, 2
		mov	dl, 65h	; 'e'
		int	21h		; DOS -	DISPLAY	OUTPUT
					; DL = character to send to standard output
		pop	ax
		pop	dx
		jmp	short loc_14C88
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_14C49:				; ...
		call	readFile
		mov	bx, [si]
		add	si, 2
		mov	dl, [si]
		inc	si
		sub	ch, ch
loc_14C56:				; ...
		lodsb
		cmp	si, bp
		jb	short loc_14C5E
		call	readFile
loc_14C5E:				; ...
		cmp	al, dl
		jnz	short loc_14C81
		lodsb
		cmp	si, bp
		jb	short loc_14C6A
		call	readFile
loc_14C6A:				; ...
		mov	ah, al
		lodsb
		cmp	si, bp
		jb	short loc_14C74
		call	readFile
loc_14C74:				; ...
		mov	cl, al
		mov	al, ah
loc_14C78:				; ...
		stosb
		dec	bx
		jz	short loc_14C88
		loop	loc_14C78
		jmp	short loc_14C83
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_14C81:				; ...
		stosb
		dec	bx
loc_14C83:				; ...
		cmp	bx, 0
		jnz	short loc_14C56
loc_14C88:				; ...
		mov	ah, 3Eh	; '>'
		mov	bx, [fileHandle]
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		push	cs
		pop	ds
		pop	es
		retn
endp		openFile
; =============== S U B	R O U T	I N E =======================================
proc		readFile near		; ...
		push	ax
		push	bx
		push	cx
		push	dx
		push	es
		push	ds
		push	cs
		push	cs
		pop	ds
		pop	es
loc_14C9E:				; ...
		mov	ah, 3Fh	; '?'
		mov	bx, [fileHandle]
		mov	cx, 200h
		lea	dx, [fileBufAddr]
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		jnb	short loc_14CBB
		push	dx
		push	ax
		mov	ah, 2
		mov	dl, 65h	; 'e'
		int	21h		; DOS -	DISPLAY	OUTPUT
					; DL = character to send to standard output
		pop	ax
		pop	dx
		jmp	short loc_14C9E
; ---------------------------------------------------------------------------
loc_14CBB:				; ...
		lea	si, [fileBufAddr]
		mov	bp, si
		add	bp, ax
		pop	ds
		assume ds:nothing
		pop	es
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
endp		readFile
; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
unk_14CD0	db    3			; ...
		db    0
		db    0
		db    0
unk_14CD4	db    0			; ...
		db    0
		db    3
		db    1
unk_14CD8	db    0			; ...
		db    0
		db    1
		db    3
unk_14CDC	db    0			; ...
		db    0
		db    1
		db    3
word_14CE0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_14EE0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_150E0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_152E0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_154E0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_156E0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_158E0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_15AE0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_15CE0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_15EE0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_160E0	dw 0			; ...
byte_160E2	db 0			; ...
byte_160E3	db 0			; ...
		db 44h
byte_160E5	db 0			; ...
		db 44h
byte_160E7	db 0			; ...
		db 0
word_160E9	dw 0			; ...
word_160EB	dw 60h			; ...
byte_160ED	db 0			; ...
unk_160EE	db    0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_1611E	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_1625E	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_1631E	dw 0			; ...
byte_16320	db 0			; ...
byte_16321	db 1			; ...
byte_16322	db 0D5h			; ...
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0D5h	; ’
byte_16354	db 15h			; ...
byte_16355	db 0FFh			; ...
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db  55h	; U
		db    0
		db    0
byte_16365	db 0FFh			; ...
		db 0FDh	; ˝
		db 0F4h	; Ù
		db 0D0h	; –
		db 0D0h	; –
		db 0D0h	; –
		db 0D0h	; –
		db 0D0h	; –
		db 0D0h	; –
		db 0D0h	; –
		db 0D0h	; –
		db 0D0h	; –
		db 0D0h	; –
		db  50h	; P
		db    0
		db    0
unk_16375	db 0DDh	; ›		; ...
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0D5h	; ’
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D7h	; ◊
		db 0DFh	; ﬂ
		db 0D5h	; ’
unk_1638E	db 0FDh	; ˝		; ...
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  7Dh	; }
		db 0DDh	; ›
		db  5Dh	; ]
		db 0DDh	; ›
		db  5Dh	; ]
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db  5Dh	; ]
		db  5Fh	; _
		db 0FFh
		db  7Fh	; 
		db 0FFh
		db  5Fh	; _
unk_163A7	db 0D7h	; ◊		; ...
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D7h	; ◊
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DDh	; ›
unk_163C0	db 0FDh	; ˝		; ...
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db 0FDh	; ˝
		db  5Dh	; ]
		db 0FFh
		db  5Fh	; _
		db 0DFh	; ﬂ
		db  5Fh	; _
		db  5Dh	; ]
		db  7Dh	; }
		db  7Dh	; }
		db  7Dh	; }
		db  7Dh	; }
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db  5Dh	; ]
		db  5Fh	; _
		db 0DFh	; ﬂ
		db  5Fh	; _
		db 0FFh
		db 0FFh
unk_163D9	db 0FDh	; ˝		; ...
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0DDh	; ›
		db 0DDh	; ›
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FFh
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db  5Dh	; ]
		db 0DDh	; ›
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FFh
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  5Dh	; ]
		db 0FFh
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DDh	; ›
		db  5Fh	; _
		db 0FFh
		db  7Fh	; 
		db 0FFh
		db 0FFh
		db 0FFh
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
unk_16410	db 0FDh	; ˝		; ...
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db  5Dh	; ]
		db 0FDh	; ˝
		db  7Dh	; }
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db  5Dh	; ]
		db 0FFh
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  5Dh	; ]
		db 0FFh
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DDh	; ›
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db  5Fh	; _
		db 0FFh
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
unk_16447	db 0FFh			; ...
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0FFh
		db  5Dh	; ]
		db 0FDh	; ˝
		db  5Dh	; ]
		db 0DDh	; ›
		db  5Dh	; ]
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FFh
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  5Dh	; ]
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FFh
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db  5Dh	; ]
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db  5Fh	; _
		db 0DFh	; ﬂ
unk_1647E	db 0FFh			; ...
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D7h	; ◊
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FFh
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D7h	; ◊
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D7h	; ◊
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0FFh
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0FFh
		db 0D7h	; ◊
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D7h	; ◊
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
unk_164B5	db 0D5h	; ’		; ...
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db  55h	; U
		db  55h	; U
		db  7Fh	; 
		db  7Fh	; 
		db  7Dh	; }
		db  7Dh	; }
		db  7Dh	; }
		db  7Fh	; 
		db  7Fh	; 
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db 0F5h	; ı
		db 0F5h	; ı
		db  55h	; U
		db 0F5h	; ı
		db  75h	; u
		db 0F5h	; ı
		db 0F5h	; ı
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db 0FFh
		db 0FFh
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db  55h	; U
		db  55h	; U
unk_164EC	db 0FFh			; ...
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0D7h	; ◊
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FFh
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0FFh
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0D5h	; ’
unk_16523	db 0DDh	; ›		; ...
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0FFh
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FFh
		db 0DDh	; ›
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db  5Fh	; _
		db 0DDh	; ›
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0D5h	; ’
		db 0FFh
		db  5Dh	; ]
		db  7Dh	; }
		db  7Dh	; }
		db  7Dh	; }
		db  5Dh	; ]
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0FFh
		db 0DDh	; ›
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0D7h	; ◊
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0FFh
		db  5Fh	; _
		db 0FFh
		db  5Fh	; _
		db 0DFh	; ﬂ
		db  5Fh	; _
unk_1655A	db 0FDh	; ˝		; ...
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  7Dh	; }
		db 0DDh	; ›
		db  5Dh	; ]
		db 0DDh	; ›
		db  5Dh	; ]
		db 0FFh
		db 0DDh	; ›
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db  5Fh	; _
		db 0DDh	; ›
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  5Dh	; ]
		db 0FFh
		db  5Dh	; ]
		db  7Dh	; }
		db  7Dh	; }
		db  7Dh	; }
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db  5Dh	; ]
		db 0FFh
		db 0DDh	; ›
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db 0DDh	; ›
		db  5Fh	; _
		db 0FFh
		db  7Fh	; 
		db 0FFh
		db  5Fh	; _
		db 0FFh
		db  5Fh	; _
		db 0FFh
		db  5Fh	; _
		db 0DFh	; ﬂ
		db  5Fh	; _
unk_16591	db 0DDh	; ›		; ...
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FFh
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FFh
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db  5Fh	; _
		db 0D5h	; ’
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0FFh
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db  7Dh	; }
		db 0D5h	; ’
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0D5h	; ’
		db 0FFh
		db  5Dh	; ]
		db 0FDh	; ˝
		db  7Dh	; }
		db 0FDh	; ˝
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0D5h	; ’
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FFh
		db  5Fh	; _
		db 0DFh	; ﬂ
		db  5Fh	; _
		db  7Fh	; 
		db 0DFh	; ﬂ
unk_165C8	db 0FDh	; ˝		; ...
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  7Dh	; }
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db  7Dh	; }
		db  7Dh	; }
		db 0DDh	; ›
		db  5Dh	; ]
		db  7Dh	; }
		db 0DDh	; ›
		db  5Dh	; ]
		db 0DDh	; ›
		db  5Dh	; ]
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db  5Fh	; _
		db 0DFh	; ﬂ
unk_165E1	db    0			; ...
		db    2
		db  0Ah
		db    9
		db    9
		db  0Ah
		db  0Ah
		db  0Ah
		db  3Bh	; ;
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db    7
		db  69h	; i
		db  6Ah	; j
		db  3Ah	; :
		db  3Eh	; >
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  7Fh	; 
		db  7Bh	; {
		db  6Ah	; j
		db 0AAh	; ™
		db 0A9h	; ©
		db    0
		db 0A0h	; †
		db 0A8h	; ®
		db  58h	; X
		db  98h	; ò
		db 0A8h	; ®
		db 0A8h	; ®
		db 0E8h	; Ë
		db  7Bh	; {
		db  9Fh	; ü
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BFh	; ø
		db 0FFh
		db 0FFh
		db 0FFh
		db 0F5h	; ı
		db 0D9h	; Ÿ
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AFh	; Ø
		db  5Fh	; _
		db 0DFh	; ﬂ
		db 0FFh
		db  3Fh	; ?
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  6Fh	; o
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  80h	; Ä
		db  80h	; Ä
byte_16641	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ch
		db  3Dh	; =
		db  1Dh
		db  0Dh
		db  0Dh
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db  1Dh
		db 0FDh	; ˝
		db 0D5h	; ’
		db 0FDh	; ˝
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0CCh	; Ã
		db 0DDh	; ›
		db 0FDh	; ˝
		db  1Dh
		db  0Dh
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db 0D5h	; ’
		db 0FDh	; ˝
		db  1Dh
		db 0FDh	; ˝
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db 0DDh	; ›
		db 0FDh	; ˝
		db 0DDh	; ›
		db 0FDh	; ˝
		db  15h
		db    0
		db    0
		db  0Ch
		db  3Dh	; =
		db  1Dh
		db  0Dh
		db  0Dh
		db    1
		db    0
		db    0
		db 0FCh	; ¸
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FDh	; ˝
		db  55h	; U
		db    0
		db    0
byte_166A1	db 0FCh			; ...
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FDh	; ˝
		db  55h	; U
		db    0
		db    0
		db 0FCh	; ¸
		db 0DDh	; ›
		db 0DDh	; ›
		db 0DDh	; ›
		db 0FDh	; ˝
		db  55h	; U
		db    0
		db    0
byte_166B1	db 0			; ...
		db 0Fh dup(0)
byte_166C1	db 0			; ...
		db 0Fh dup(0)
off_166D1	dw offset unk_16375	; ...
		dw offset unk_16375
		dw offset unk_1638E
		dw offset unk_163A7
		dw offset unk_163C0
		dw offset unk_163D9
		dw offset unk_16410
		dw offset unk_16410
		dw offset unk_1647E
		dw offset unk_16447
		dw offset unk_164EC
		dw offset unk_16523
		dw offset unk_16523
		dw offset unk_1655A
		dw offset unk_16591
		dw offset unk_164B5
		dw offset unk_165C8
byte_166F3	db 18h			; ...
		db  18h
		db  18h
		db  18h
		db  18h
		db  36h	; 6
		db  36h	; 6
		db    0
		db  36h	; 6
		db  36h	; 6
		db  36h	; 6
		db  36h	; 6
		db  36h	; 6
		db  36h	; 6
		db  36h	; 6
		db  36h	; 6
		db  18h
		db    0
byte_16705	db 0			; ...
		db    5
		db  0Ah
		db  0Fh
		db  14h
		db  19h
		db  1Eh
		db  23h	; #
		db  28h	; (
		db  2Dh	; -
byte_1670F	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1671C	db 0			; ...
		db    0
		db    0
		db    0
byte_16720	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_16730	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_1675F	db 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_1676F near		; ...
		sub	si, si
loc_16771:				; ...
		mov	ax, si
		mov	ah, al
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shl	si, 1
		xor	dx, 0FFFFh
		mov	[ds:word_14CE0+si], dx
		shr	si, 1
		inc	si
		cmp	si, 100h
		jb	short loc_16771
		retn
endp		sub_1676F
; =============== S U B	R O U T	I N E =======================================
proc		sub_167C9 near		; ...
		sub	si, si
loc_167CB:				; ...
		call	sub_167DF
		call	sub_1681A
		call	sub_16831
		call	sub_1680A
		inc	si
		cmp	si, 100h
		jb	short loc_167CB
		retn
endp		sub_167C9
; =============== S U B	R O U T	I N E =======================================
proc		sub_167DF near		; ...
		lea	di, [unk_14CD0]
		call	sub_1686A
		shl	si, 1
		mov	[ds:word_152E0+si], dx
		xor	dx, 0FFFFh
		mov	[ds:word_14EE0+si], dx
		xor	dx, 0FFFFh
		call	sub_16848
		mov	[ds:word_154E0+si], dx
		xor	dx, 0FFFFh
		mov	[ds:word_150E0+si], dx
		shr	si, 1
		retn
endp		sub_167DF
; =============== S U B	R O U T	I N E =======================================
proc		sub_1680A near		; ...
		lea	di, [unk_14CDC]
		call	sub_1686A
		shl	si, 1
		mov	[ds:word_15EE0+si], dx
		shr	si, 1
		retn
endp		sub_1680A
; =============== S U B	R O U T	I N E =======================================
proc		sub_1681A near		; ...
		lea	di, [unk_14CD4]
		call	sub_1686A
		shl	si, 1
		mov	[ds:word_156E0+si], dx
		call	sub_16848
		mov	[ds:word_15AE0+si], dx
		shr	si, 1
		retn
endp		sub_1681A
; =============== S U B	R O U T	I N E =======================================
proc		sub_16831 near		; ...
		lea	di, [unk_14CD8]
		call	sub_1686A
		shl	si, 1
		mov	[ds:word_158E0+si], dx
		call	sub_16848
		mov	[ds:word_15CE0+si], dx
		shr	si, 1
		retn
endp		sub_16831
; =============== S U B	R O U T	I N E =======================================
proc		sub_16848 near		; ...
		mov	ax, dx
		mov	cx, 8
loc_1684D:				; ...
		sub	bl, bl
		shr	al, 1
		rcr	ah, 1
		rcr	bl, 1
		shr	al, 1
		rcr	ah, 1
		rcr	bl, 1
		shl	bl, 1
		rcl	dh, 1
		rcl	dl, 1
		shl	bl, 1
		rcl	dh, 1
		rcl	dl, 1
		loop	loc_1684D
		retn
endp		sub_16848
; =============== S U B	R O U T	I N E =======================================
proc		sub_1686A near		; ...
		push	bx
		mov	ax, si
		mov	cx, 4
loc_16870:				; ...
		shl	ax, 1
		shl	ax, 1
		mov	bl, ah
		and	bx, 3
		and	ah, 0FCh
		or	ah, [bx+di]
		loop	loc_16870
		pop	bx
		mov	al, ah
		shr	al, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	ah, 1
		rcr	dh, 1
		shr	al, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	al, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		shr	ah, 1
		rcr	dl, 1
		retn
endp		sub_1686A
; ---------------------------------------------------------------------------
loc_168C5:				; ...
		mov	al, [si]
		mov	cx, 4
loc_168CA:				; ...
		shl	ax, 1
		shl	ax, 1
		mov	bl, ah
		and	bx, 3
		and	ah, 0FCh
		or	ah, [bx+di]
		loop	loc_168CA
		mov	[si], ah
		inc	si
		dec	dx
		jnz	short loc_168C5
		retn
; =============== S U B	R O U T	I N E =======================================
proc		sub_168E2 near		; ...
		cld
		lea	si, [word_18DD0]
		mov	di, 3000h
		mov	cx, 3000h
		push	es
		mov	dx, [cs:freeSegm]
		mov	es, dx
loc_168F5:				; ...
		lodsb
		sub	ah, ah
		shl	ax, 1
		stosw
		loop	loc_168F5
		pop	es
		push	ds
		mov	dx, [cs:freeSegm]
		mov	ds, dx
		push	es
		mov	dx, [cs:codeSegm]
		mov	es, dx
		mov	si, 3000h
		lea	di, [word_18DD0]
		mov	cx, 3000h
		rep movsw
		pop	es
		pop	ds
		sub	si, si
loc_1691E:				; ...
		shl	si, 1
		mov	ax, [ds:word_18A50+si]
		sub	ax, 7C00h
		shl	ax, 1
		add	ax, 7C00h
		mov	[ds:word_18A50+si], ax
		shr	si, 1
		inc	si
		cmp	si, 38h	; '8'
		jb	short loc_1691E
		retn
endp		sub_168E2
; =============== S U B	R O U T	I N E =======================================
proc		sub_16939 near		; ...
		call	sub_168E2
		call	sub_167C9
		call	sub_1676F
		mov	ax, 5560h
		sub	si, si
loc_16947:				; ...
		shl	si, 1
		mov	[ds:word_1611E+si], ax
		shr	si, 1
		inc	si
		cmp	si, 60h	; '`'
		jb	short loc_16947
		mov	ax, 3000h
		mov	si, 60h	; '`'
loc_1695B:				; ...
		shl	si, 1
		mov	[ds:word_1611E+si], ax
		shr	si, 1
		add	ax, 5Ch	; '\'
		inc	si
		cmp	si, 0C8h ; '»'
		jb	short loc_1695B
		retn
endp		sub_16939
; ---------------------------------------------------------------------------
		call	sub_16939
		call	sub_169D1
		call	sub_17736
		call	sub_174CC
		call	sub_17679
		sub	ah, ah
		int	16h		; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
					; Return: AH = scan code, AL = character
		call	sub_17831
		sub	si, si
loc_16986:				; ...
		push	si
		call	sub_170FA
		call	sub_1706A
		mov	al, 0Fh
		call	sub_16E7D
		call	sub_16F56
		mov	al, 5
		call	sub_170C3
		call	sub_1709B
		pop	si
		push	si
		mov	ax, si
		mov	[ds:byte_104A2], al
		mov	[ds:byte_104A3], al
		call	sub_17F3A
		mov	[ds:byte_10491], 1
		call	sub_16C46
		call	sub_17395
		call	sub_17790
		call	sub_178C3
		call	sub_17902
		mov	[ds:byte_1049A], 0
		call	sub_17A72
		call	sub_16A32
		pop	si
		inc	si
		cmp	si, 38h	; '8'
		jb	short loc_16986
		retn
; =============== S U B	R O U T	I N E =======================================
proc		sub_169D1 near		; ...
		mov	[ds:byte_104A8], 1
		mov	[ds:byte_10465], 1
		mov	[ds:byte_10466], 1
		mov	[ds:byte_104A5], 0Ch
		mov	[ds:byte_104A6], 88h ; 'à'
		mov	[ds:byte_10574], 2
		mov	[ds:byte_1059F], 3Ah ; ':'
		mov	[ds:byte_10492], 20h ; ' '
		mov	[ds:byte_104A1], 60h ; '`'
		mov	[ds:byte_10561], 1
		mov	[ds:word_10587], 8Ch ; 'å'
		mov	[ds:byte_10589], 0Ch
		mov	[ds:byte_10585], 1
		mov	[ds:byte_1058D], 1
		mov	[ds:byte_10490], 1
		mov	[ds:byte_1057B], 2
		mov	[ds:byte_1048F], 1
		mov	[ds:byte_104CF], 1
		mov	[ds:byte_104D0], 2
		retn
endp		sub_169D1
; =============== S U B	R O U T	I N E =======================================
proc		sub_16A32 near		; ...
		sub	ah, ah
		int	16h		; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
					; Return: AH = scan code, AL = character
		retn
endp		sub_16A32
; ---------------------------------------------------------------------------
loc_16A37:				; ...
		call	sub_135A9
		mov	al, [ds:byte_12CC3]
		or	al, [ds:byte_12CC4]
		jz	short loc_16A37
		mov	al, [ds:byte_12CC3]
		mov	dx, 1
		call	sub_16A5A
		mov	al, [ds:byte_12CC4]
		mov	dx, 5
		call	sub_16A5A
		sub	ah, ah
		int	16h		; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
					; Return: AH = scan code, AL = character
		retn
; =============== S U B	R O U T	I N E =======================================
proc		sub_16A5A near		; ...
		push	ax
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		cmp	al, 0Ah
		jb	short loc_16A6E
		sub	al, 0Ah
		add	al, 61h	; 'a'
		jmp	short loc_16A70
; ---------------------------------------------------------------------------
		nop
loc_16A6E:				; ...
		add	al, 30h	; '0'
loc_16A70:				; ...
		call	sub_134E2
		inc	dx
		pop	ax
		push	ax
		and	al, 0Fh
		cmp	al, 0Ah
		jb	short loc_16A83
		sub	al, 0Ah
		add	al, 61h	; 'a'
		jmp	short loc_16A85
; ---------------------------------------------------------------------------
		nop
loc_16A83:				; ...
		add	al, 30h	; '0'
loc_16A85:				; ...
		call	sub_134E2
		pop	ax
		retn
endp		sub_16A5A
; ---------------------------------------------------------------------------
		cld
		mov	ax, 5555h
		mov	bx, 10h
loc_16A91:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		shr	bx, 1
		mov	cx, 28h	; '('
		rep stosw
		inc	bx
		cmp	bx, 60h	; '`'
		jb	short loc_16A91
		push	es
		mov	ax, [cs:freeSegm]
		mov	es, ax
		cld
		mov	bx, 60h	; '`'
		mov	bp, 70h	; 'p'
		mov	ax, 5555h
		call	sub_16AC6
		mov	bx, 70h	; 'p'
		mov	bp, 0C8h ; '»'
		mov	ax, 0AAAAh
		call	sub_16AC6
		pop	es
		retn
; =============== S U B	R O U T	I N E =======================================
proc		sub_16AC6 near		; ...
		shl	bx, 1
		mov	di, [ds:word_1611E+bx]
		shr	bx, 1
		mov	cx, 2Eh	; '.'
		rep stosw
		inc	bx
		cmp	bx, bp
		jb	short sub_16AC6
		retn
endp		sub_16AC6
; ---------------------------------------------------------------------------
unk_16AD9	db    0			; ...
		db    0
		db  0Ch
		db    0
		db    0
		db    3
		db  0Fh
		db    3
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db 0C3h	; √
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db    3
		db    0
		db  30h	; 0
		db 0FCh	; ¸
		db  30h	; 0
		db    0
		db  30h	; 0
		db    3
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  0Ch
		db  30h	; 0
		db 0FCh	; ¸
		db  30h	; 0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db 0FCh	; ¸
		db  30h	; 0
		db    3
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ch
		db  3Fh	; ?
		db  0Ch
		db  30h	; 0
		db    0
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db 0FCh	; ¸
		db  30h	; 0
		db    0
		db    0
		db    0
byte_16B39	db 0			; ...
		db  18h
		db  30h	; 0
		db  48h	; H
; =============== S U B	R O U T	I N E =======================================
proc		sub_16B3D near		; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_104A2+di]
		sub	ah, ah
		shl	ax, 1
		mov	di, ax
		mov	di, [ds:word_18A50+di]
		lea	ax, [word_189D0]
		sub	di, 7800h
		add	di, ax
		push	es
		mov	ax, [cs:codeSegm]
		mov	es, ax
		mov	al, [ds:byte_10574]
		cmp	al, 2
		jnb	short loc_16B76
		mov	cx, 18h
		sub	ax, ax
		cld
		rep stosw
		jmp	short loc_16B9C
; ---------------------------------------------------------------------------
		align 2
loc_16B76:				; ...
		mov	al, [ds:byte_10538]
		cmp	al, 7
		mov	al, [ds:byte_1052F]
		and	al, 3
		sub	ah, ah
		mov	si, ax
		mov	dl, [ds:byte_16B39+si]
		sub	dh, dh
		lea	si, [unk_16AD9]
		add	si, dx
		mov	cx, 18h
		cld
loc_16B94:				; ...
		lodsb
		sub	ah, ah
		shl	ax, 1
		stosw
		loop	loc_16B94
loc_16B9C:				; ...
		pop	es
		retn
endp		sub_16B3D
; ---------------------------------------------------------------------------
byte_16B9E	db 0			; ...
		db    0
		db    1
		db    0
		db    1
		db    1
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    1
		db    1
		db    0
		db    1
		db    0
		db    0
		db    0
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_16BDF near		; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	dl, [ds:byte_104CD+di]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104A2+di]
		sub	ah, ah
		shl	ax, 1
		mov	di, ax
		mov	di, [ds:word_18A50+di]
		lea	ax, [word_189D0]
		sub	di, 7800h
		add	di, ax
		mov	ax, 1AAh
		mov	[word ptr ds:byte_10442+di], ax
		mov	ax, 1FEh
		mov	[word ptr ds:unk_1044C+di],	ax
		mov	al, [ds:byte_16B9E+si]
		cmp	al, 0
		jz	short loc_16C30
		cmp	al, 80h	; 'Ä'
		jnb	short loc_16C28
		mov	bx, offset unk_1044C
		mov	ax, 1EEh
		jmp	short loc_16C2E
; ---------------------------------------------------------------------------
		align 2
loc_16C28:				; ...
		mov	ax, 1FEh
		mov	bx, offset byte_10442
loc_16C2E:				; ...
		mov	[bx+di], ax
loc_16C30:				; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	si, dx
		inc	[ds:byte_104CD+si]
		retn
endp		sub_16BDF
; =============== S U B	R O U T	I N E =======================================
proc		sub_16C3D near		; ...
		mov	[ds:word_1631E], 4C00h
		jmp	short loc_16C4C
endp		sub_16C3D
; ---------------------------------------------------------------------------
		nop
; =============== S U B	R O U T	I N E =======================================
proc		sub_16C46 near		; ...
		mov	[ds:word_1631E], 0
loc_16C4C:				; ...
		mov	bl, [ds:byte_10491]
		sub	bh, bh
		mov	al, [ds:byte_104A5+bx]
		shr	al, 1
		mov	[ds:byte_160E3+bx], al
		mov	[byte ptr ds:word_160E9], al
		mov	cl, [ds:byte_104A7+bx]
		mov	[ds:byte_160E7+bx], cl
		mov	bl, [ds:byte_104A2+bx]
		sub	bh, bh
		shl	bx, 1
		mov	bx, [ds:word_189D0+bx]
		lea	ax, [word_189D0]
		sub	bx, 7800h
		add	bx, ax
		lea	si, [unk_160EE]
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		add	dx, si
		cmp	cl, 0
		jnz	short loc_16CBB
		mov	di, 0Bh
loc_16C91:				; ...
		mov	al, [bx+di]
		shl	di, 1
		mov	si, dx
		add	si, di
		mov	[si], al
		shr	di, 1
		mov	bp, ax
		and	al, 0Fh
		mov	[ds:byte_1053F+di], al
		mov	ax, bp
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shl	al, 1
		mov	[ds:byte_1054B+di], al
		dec	di
		jns	short loc_16C91
		jmp	short loc_16CE9
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_16CBB:				; ...
		mov	di, 0Bh
loc_16CBE:				; ...
		mov	al, [bx+di]
		shl	di, 1
		mov	si, dx
		add	si, di
		mov	[si], al
		shr	di, 1
		mov	bp, ax
		and	al, 0Fh
		mov	[ds:byte_1053F+di], al
		mov	ax, bp
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shl	al, 1
		mov	cl, 10h
		sub	cl, al
		mov	[ds:byte_1054B+di], cl
		dec	di
		jns	short loc_16CBE
loc_16CE9:				; ...
		mov	bl, [ds:byte_10491]
		sub	bh, bh
		mov	al, [ds:byte_104A2+bx]
		cmp	al, 2Fh	; '/'
		jz	short loc_16CFB
		cmp	al, 2Bh	; '+'
		jnz	short loc_16D01
loc_16CFB:				; ...
		call	sub_16B3D
		jmp	short loc_16D08
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_16D01:				; ...
		cmp	al, 33h	; '3'
		jnz	short loc_16D08
		call	sub_16BDF
loc_16D08:				; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	si, dx
		mov	dl, [ds:byte_104A2+si]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_18D90+di]
		mov	[ds:byte_160E2], al
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_104A2+si]
		sub	ah, ah
		mov	si, ax
		shl	si, 1
		mov	si, [ds:word_18A50+si]
		lea	ax, [word_189D0]
		sub	si, 7800h
		add	si, ax
		cmp	[ds:word_1631E], 0
		jz	short loc_16D4D
		lea	dx, [word_14EE0]
		jmp	short loc_16D5C
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_16D4D:				; ...
		lea	dx, [word_156E0]
		cmp	[ds:byte_10491], 0
		jz	short loc_16D5C
		add	dx, 200h
loc_16D5C:				; ...
		lea	bp, [word_152E0]
		mov	[word ptr ds:loc_16E5B+2], 284h
		mov	bl, [ds:byte_10491]
		sub	bh, bh
		mov	al, [ds:byte_104A7+bx]
		cmp	al, 0
		jz	short loc_16D90
		lea	bp, [word_154E0]
		mov	[word ptr ds:loc_16E5B+2], 288h
		cmp	[ds:word_1631E], 0
		jz	short loc_16D8C
		add	dx, 200h
		jmp	short loc_16D90
; ---------------------------------------------------------------------------
		align 2
loc_16D8C:				; ...
		add	dx, 400h
loc_16D90:				; ...
		sub	dx, bp
		push	es
		mov	ax, [cs:freeSegm]
		mov	es, ax
		mov	bx, [ds:word_160EB]
		shl	bx, 1
		mov	di, [ds:word_1611E+bx]
		add	di, [ds:word_1631E]
		sub	bx, bx
		sub	ch, ch
loc_16DAB:				; ...
		push	bx
		push	di
		mov	al, [ds:byte_1054B+bx]
		sub	ah, ah
		add	ax, [ds:word_160E9]
		cmp	ax, 58h	; 'X'
		jnb	short loc_16DC7
		add	di, ax
		mov	cl, [ds:byte_1053F+bx]
		cmp	cl, 0
		jnz	short loc_16DCA
loc_16DC7:				; ...
		jmp	loc_16E65
; ---------------------------------------------------------------------------
loc_16DCA:				; ...
		sub	[ds:byte_160E2], cl
loc_16DCE:				; ...
		lodsw
		mov	bx, ax
		mov	ax, [es:di]
		add	bx, bp
		and	ax, [bx]
		add	bx, dx
		or	ax, [bx]
		stosw
		add	di, 5Ah	; 'Z'
		lodsw
		mov	bx, ax
		mov	ax, [es:di]
		add	bx, bp
		and	ax, [bx]
		add	bx, dx
		or	ax, [bx]
		stosw
		add	di, 5Ah	; 'Z'
		lodsw
		mov	bx, ax
		mov	ax, [es:di]
		add	bx, bp
		and	ax, [bx]
		add	bx, dx
		or	ax, [bx]
		stosw
		add	di, 5Ah	; 'Z'
		lodsw
		mov	bx, ax
		mov	ax, [es:di]
		add	bx, bp
		and	ax, [bx]
		add	bx, dx
		or	ax, [bx]
		stosw
		add	di, 5Ah	; 'Z'
		lodsw
		mov	bx, ax
		mov	ax, [es:di]
		add	bx, bp
		and	ax, [bx]
		add	bx, dx
		or	ax, [bx]
		stosw
		add	di, 5Ah	; 'Z'
		lodsw
		mov	bx, ax
		mov	ax, [es:di]
		add	bx, bp
		and	ax, [bx]
		add	bx, dx
		or	ax, [bx]
		stosw
		add	di, 5Ah	; 'Z'
		lodsw
		mov	bx, ax
		mov	ax, [es:di]
		add	bx, bp
		and	ax, [bx]
		add	bx, dx
		or	ax, [bx]
		stosw
		add	di, 5Ah	; 'Z'
		lodsw
		mov	bx, ax
		mov	ax, [es:di]
		add	bx, bp
		and	ax, [bx]
		add	bx, dx
		or	ax, [bx]
		stosw
loc_16E5B:				; ...
		sub	di, 284h
		dec	cx
		jz	short loc_16E65
		jmp	loc_16DCE
; ---------------------------------------------------------------------------
loc_16E65:				; ...
		pop	di
		add	di, 2E0h
		pop	bx
		inc	bx
		cmp	bx, 0Ch
		jnb	short loc_16E7B
		cmp	[ds:byte_160E2], 0
		jz	short loc_16E7B
		jmp	loc_16DAB
; ---------------------------------------------------------------------------
loc_16E7B:				; ...
		pop	es
		retn
endp		sub_16C46
; =============== S U B	R O U T	I N E =======================================
proc		sub_16E7D near		; ...
		cmp	al, [ds:byte_10583]
		jz	short loc_16E89
		mov	[ds:byte_10583], al
		call	sub_1706A
loc_16E89:				; ...
		mov	dl, [ds:byte_10583]
		sub	dh, dh
		mov	di, dx
		cmp	dl, 11h
		jb	short loc_16E99
loc_16E96:				; ...
		jmp	short loc_16EFE
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_16E99:				; ...
		mov	al, [ds:byte_166F3+di]
		cmp	al, 0
		jz	short loc_16E96
		sub	ah, ah
		push	ax
		mov	al, [ds:byte_10583]
		shl	al, 1
		sub	ah, ah
		mov	di, ax
		mov	bx, [ds:off_166D1+di]
		pop	ax
		push	ax
		cmp	al, 18h
		jnz	short loc_16EC3
		mov	ax, 5
		mov	di, 0Bh
		mov	si, 48h	; 'H'
		jmp	short loc_16ECC
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_16EC3:				; ...
		mov	ax, 0Bh
		mov	di, 5
		mov	si, 4Bh	; 'K'
loc_16ECC:				; ...
		mov	[ds:word_10469], ax
		mov	[ds:word_1046B], di
		pop	ax
		mov	di, ax
		mov	ax, 5
		mov	[ds:word_1046F], ax
loc_16EDC:				; ...
		mov	ax, [ds:word_10469]
		mov	[ds:word_1046D], ax
loc_16EE2:				; ...
		mov	al, [bx+di]
		mov	[ds:byte_1670F+si], al
		dec	di
		dec	si
		dec	[ds:word_1046D]
		jnz	short loc_16EE2
		mov	ax, si
		sub	ax, [ds:word_1046B]
		mov	si, ax
		dec	[ds:word_1046F]
		jnz	short loc_16EDC
loc_16EFE:				; ...
		mov	al, [ds:byte_10583]
		cmp	al, 0Ah
		jnz	short locret_16F08
		call	sub_16F09
locret_16F08:				; ...
		retn
endp		sub_16E7D
; =============== S U B	R O U T	I N E =======================================
proc		sub_16F09 near		; ...
		mov	al, [ds:byte_10580]
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		jz	short loc_16F33
		sub	ah, ah
		mov	di, ax
		mov	dl, [ds:byte_16705+di]
		sub	dh, dh
		mov	si, dx
		sub	di, di
loc_16F24:				; ...
		mov	al, [ds:byte_16322+si]
		mov	[ds:byte_16720+di], al
		inc	si
		inc	di
		cmp	di, 5
		jb	short loc_16F24
loc_16F33:				; ...
		mov	al, [ds:byte_10580]
		and	al, 0Fh
		sub	ah, ah
		mov	di, ax
		mov	dl, [ds:byte_16705+di]
		sub	dh, dh
		mov	si, dx
		sub	di, di
loc_16F46:				; ...
		mov	al, [ds:byte_16322+si]
		mov	[ds:byte_16730+di], al
		inc	si
		inc	di
		cmp	di, 5
		jb	short loc_16F46
		retn
endp		sub_16F09
; =============== S U B	R O U T	I N E =======================================
proc		sub_16F56 near		; ...
		mov	si, 0Bh
		mov	al, 0Bh
loc_16F5B:				; ...
		shl	si, 1
		mov	dx, [ds:word_16F70+si]
		shr	si, 1
		lea	bp, [byte_1670F]
		call	sub_16F88
		dec	al
		dec	si
		jns	short loc_16F5B
		retn
endp		sub_16F56
; ---------------------------------------------------------------------------
word_16F70	dw 0F1Dh		; ...
		dw 101Dh
		dw 0F1Eh
		dw 101Eh
		dw 0F1Fh
		dw 101Fh
		dw 0F20h
		dw 1020h
		dw 0F21h
		dw 1021h
		dw 0F22h
		dw 1022h
; =============== S U B	R O U T	I N E =======================================
proc		sub_16F88 near		; ...
		push	ax
		push	di
		push	si
		push	bx
		push	cx
		push	es
		mov	cx, [cs:freeSegm]
		mov	es, cx
		mov	si, bp
		sub	ah, ah
		shl	ax, 1
		shl	ax, 1
		shl	ax, 1
		add	si, ax
		mov	bl, dh
		sub	bh, bh
		sub	dh, dh
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		shl	dx, 1
		add	dx, 8
		shl	bx, 1
		mov	di, [ds:word_1611E+bx]
		add	di, dx
		mov	dx, 5Ah	; 'Z'
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [es:di]
		and	ax, [ds:word_152E0+bx]
		or	ax, [ds:word_15EE0+bx]
		stosw
		add	di, dx
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [es:di]
		and	ax, [ds:word_152E0+bx]
		or	ax, [ds:word_15EE0+bx]
		stosw
		add	di, dx
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [es:di]
		and	ax, [ds:word_152E0+bx]
		or	ax, [ds:word_15EE0+bx]
		stosw
		add	di, dx
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [es:di]
		and	ax, [ds:word_152E0+bx]
		or	ax, [ds:word_15EE0+bx]
		stosw
		add	di, dx
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [es:di]
		and	ax, [ds:word_152E0+bx]
		or	ax, [ds:word_15EE0+bx]
		stosw
		add	di, dx
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [es:di]
		and	ax, [ds:word_152E0+bx]
		or	ax, [ds:word_15EE0+bx]
		stosw
		add	di, dx
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [es:di]
		and	ax, [ds:word_152E0+bx]
		or	ax, [ds:word_15EE0+bx]
		stosw
		add	di, dx
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [es:di]
		and	ax, [ds:word_152E0+bx]
		or	ax, [ds:word_15EE0+bx]
		stosw
		pop	es
		pop	cx
		pop	bx
		pop	si
		pop	di
		pop	ax
		retn
endp		sub_16F88
; =============== S U B	R O U T	I N E =======================================
proc		sub_1706A near		; ...
		push	ax
		push	di
		push	si
		mov	di, 4Fh	; 'O'
loc_17070:				; ...
		mov	si, 0Fh
loc_17073:				; ...
		mov	al, [ds:byte_16355+si]
		mov	[ds:byte_1670F+di], al
		dec	di
		js	short loc_17083
		dec	si
		jns	short loc_17073
		jmp	short loc_17070
; ---------------------------------------------------------------------------
loc_17083:				; ...
		mov	al, [ds:byte_16354]
		mov	[ds:byte_1671C], al
		mov	di, 0Fh
loc_1708C:				; ...
		mov	al, [ds:byte_16365+di]
		mov	[ds:byte_1675F+di], al
		dec	di
		jns	short loc_1708C
		pop	si
		pop	di
		pop	ax
		retn
endp		sub_1706A
; =============== S U B	R O U T	I N E =======================================
proc		sub_1709B near		; ...
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jnz	short locret_170C2
		sub	al, al
		mov	bl, [ds:byte_10570]
		mov	[ds:byte_160ED], bl
		mov	bh, 11h
		mov	si, 3
loc_170B3:				; ...
		mov	dx, bx
		lea	bp, [byte_166B1]
		call	sub_16F88
		inc	al
		inc	bx
		dec	si
		jns	short loc_170B3
locret_170C2:				; ...
		retn
endp		sub_1709B
; =============== S U B	R O U T	I N E =======================================
proc		sub_170C3 near		; ...
		cmp	al, 6
		jnb	short locret_170F3
		sub	ah, ah
		mov	di, ax
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jnz	short locret_170F3
		mov	al, [byte ptr ds:unk_170F4+di]
		sub	ah, ah
		mov	di, ax
		mov	si, 0Fh
loc_170DF:				; ...
		mov	al, [ds:byte_16641+di]
		mov	[ds:byte_166B1+si], al
		mov	al, [ds:byte_166A1+si]
		mov	[ds:byte_166C1+si], al
		dec	di
		dec	si
		jns	short loc_170DF
locret_170F3:				; ...
		retn
endp		sub_170C3
; ---------------------------------------------------------------------------
unk_170F4	db  0Fh			; ...
		db  1Fh
		db  2Fh	; /
		db  3Fh	; ?
		db  4Fh	; O
		db  5Fh	; _
; =============== S U B	R O U T	I N E =======================================
proc		sub_170FA near		; ...
		mov	dl, [ds:byte_160ED]
		sub	dh, dh
		shl	dx, 1
		add	dx, 8
		push	ds
		push	es
		mov	cx, [cs:freeSegm]
		mov	ds, cx
		mov	es, cx
		cld
		mov	bx, 110h
		mov	di, [cs:word_1611E+bx]
		add	di, dx
		mov	si, di
		add	si, 2600h
		mov	bx, 8
loc_17124:				; ...
		mov	cx, 4
		rep movsw
		add	si, 54h	; 'T'
		add	di, 54h	; 'T'
		dec	bx
		jnz	short loc_17124
		mov	bx, 0F0h ; ''
		mov	di, [cs:word_1611E+bx]
		add	di, 42h	; 'B'
		mov	si, di
		add	si, 2600h
		mov	bx, 10h
loc_17146:				; ...
		mov	cx, 6
		rep movsw
		add	si, 50h	; 'P'
		add	di, 50h	; 'P'
		dec	bx
		jnz	short loc_17146
		pop	es
		pop	ds
		mov	si, 1
loc_17159:				; ...
		push	si
		mov	dl, [ds:byte_160E3+si]
		mov	[ds:byte_160E5+si], dl
		sub	dh, dh
		mov	[ds:word_160E9], dx
		mov	cl, [ds:byte_160E7+si]
		lea	bx, [unk_160EE]
		add	bx, si
		mov	di, 0Bh
loc_17175:				; ...
		shl	di, 1
		mov	al, [bx+di]
		mov	[bx+di+18h], al
		shr	di, 1
		push	ax
		and	al, 0Fh
		mov	[ds:byte_1053F+di], al
		shl	al, 1
		mov	dh, al
		pop	ax
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shl	al, 1
		cmp	cl, 0
		jz	short loc_171A1
		mov	dl, 12h
		sub	dl, al
		sub	dl, dh
		mov	al, dl
loc_171A1:				; ...
		mov	[ds:byte_1054B+di], al
		dec	di
		jns	short loc_17175
		call	sub_171B0
		pop	si
		dec	si
		jns	short loc_17159
		retn
endp		sub_170FA
; =============== S U B	R O U T	I N E =======================================
proc		sub_171B0 near		; ...
		mov	bx, [ds:word_160EB]
		shl	bx, 1
		mov	di, [ds:word_1611E+bx]
		add	di, [ds:word_160E9]
		mov	si, di
		add	si, 2600h
		push	ds
		push	es
		mov	cx, [cs:freeSegm]
		mov	ds, cx
		mov	es, cx
		sub	ch, ch
		sub	dh, dh
		cld
		sub	bx, bx
loc_171D6:				; ...
		push	di
		push	si
		mov	cl, [cs:byte_1053F+bx]
		cmp	cl, 0
		jz	short loc_17230
		mov	dl, [cs:byte_1054B+bx]
		add	di, dx
		add	si, dx
		shl	cx, 1
		mov	ax, 5Ch	; '\'
		sub	ax, cx
		shr	cx, 1
		mov	bp, cx
		rep movsw
		add	si, ax
		add	di, ax
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, ax
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, ax
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, ax
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, ax
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, ax
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, ax
		mov	cx, bp
		rep movsw
loc_17230:				; ...
		pop	si
		pop	di
		add	si, 2E0h
		add	di, 2E0h
		inc	bx
		cmp	bx, 0Ch
		jb	short loc_171D6
		pop	es
		pop	ds
		retn
endp		sub_171B0
; =============== S U B	R O U T	I N E =======================================
proc		sub_17243 near		; ...
		mov	si, 1
loc_17246:				; ...
		push	si
		mov	dl, [ds:byte_160E3+si]
		mov	[ds:byte_160E5+si], dl
		sub	dh, dh
		mov	[ds:word_160E9], dx
		mov	cl, [ds:byte_160E7+si]
		lea	bx, [unk_160EE]
		add	bx, si
		mov	di, 0Bh
loc_17262:				; ...
		shl	di, 1
		mov	al, [bx+di]
		mov	[bx+di+18h], al
		shr	di, 1
		push	ax
		and	al, 0Fh
		mov	[ds:byte_1053F+di], al
		shl	al, 1
		mov	dh, al
		pop	ax
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shl	al, 1
		cmp	cl, 0
		jz	short loc_1728E
		mov	dl, 12h
		sub	dl, al
		sub	dl, dh
		mov	al, dl
loc_1728E:				; ...
		mov	[ds:byte_1054B+di], al
		dec	di
		jns	short loc_17262
		call	sub_1729D
		pop	si
		dec	si
		jns	short loc_17246
		retn
endp		sub_17243
; =============== S U B	R O U T	I N E =======================================
proc		sub_1729D near		; ...
		mov	bx, [ds:word_160EB]
		shl	bx, 1
		mov	di, [ds:word_1611E+bx]
		add	di, [ds:word_160E9]
		add	di, 4C00h
		push	ds
		push	es
		mov	cx, [cs:freeSegm]
		mov	ds, cx
		mov	es, cx
		sub	ch, ch
		sub	dh, dh
		cld
		sub	bx, bx
loc_172C1:				; ...
		push	di
		mov	cl, [cs:byte_1053F+bx]
		cmp	cl, 0
		jz	short loc_1730C
		mov	dl, [cs:byte_1054B+bx]
		add	di, dx
		shl	cx, 1
		mov	si, 5Ch	; '\'
		sub	si, cx
		shr	cx, 1
		sub	ax, ax
		mov	bp, cx
		rep stosw
		add	di, si
		mov	cx, bp
		rep stosw
		add	di, si
		mov	cx, bp
		rep stosw
		add	di, si
		mov	cx, bp
		rep stosw
		add	di, si
		mov	cx, bp
		rep stosw
		add	di, si
		mov	cx, bp
		rep stosw
		add	di, si
		mov	cx, bp
		rep stosw
		add	di, si
		mov	cx, bp
		rep stosw
loc_1730C:				; ...
		pop	di
		add	di, 2E0h
		inc	bx
		cmp	bx, 0Ch
		jb	short loc_172C1
		pop	es
		pop	ds
		retn
endp		sub_1729D
; =============== S U B	R O U T	I N E =======================================
proc		sub_1731A near		; ...
		push	ds
		mov	cx, [cs:freeSegm]
		mov	ds, cx
		mov	bx, 0F0h ; ''
		mov	si, [cs:word_1611E+bx]
		add	si, 42h	; 'B'
		mov	di, [cs:word_12ABC+bx]
		add	di, 3Ah	; ':'
		mov	dx, 1FF4h
		mov	bp, 0E044h
		xor	bp, dx
		mov	bx, 10h
loc_17340:				; ...
		mov	cx, 6
		rep movsw
		add	si, 50h	; 'P'
		add	di, dx
		xor	dx, bp
		dec	bx
		jnz	short loc_17340
		pop	ds
		retn
endp		sub_1731A
; =============== S U B	R O U T	I N E =======================================
proc		sub_17351 near		; ...
		mov	dl, [ds:byte_160ED]
		sub	dh, dh
		shl	dx, 1
		add	dx, 8
		push	ds
		mov	cx, [cs:freeSegm]
		mov	ds, cx
		cld
		mov	bx, 110h
		mov	si, [cs:word_1611E+bx]
		add	si, dx
		mov	di, [cs:word_12ABC+bx]
		add	di, dx
		sub	di, 8
		mov	dx, 1FF8h
		mov	bp, 0E048h
		xor	bp, dx
		mov	bx, 8
loc_17384:				; ...
		mov	cx, 4
		rep movsw
		add	si, 54h	; 'T'
		add	di, dx
		xor	dx, bp
		dec	bx
		jnz	short loc_17384
		pop	ds
		retn
endp		sub_17351
; =============== S U B	R O U T	I N E =======================================
proc		sub_17395 near		; ...
		call	sub_17351
		call	sub_1731A
		mov	si, 1
loc_1739E:				; ...
		push	si
		lea	bx, [unk_160EE]
		add	bx, si
		mov	di, 0Bh
loc_173A8:				; ...
		shl	di, 1
		mov	al, [bx+di]
		mov	ah, [bx+di+18h]
		shr	di, 1
		and	al, 0Fh
		and	ah, 0Fh
		or	al, ah
		mov	[ds:byte_1053F+di], al
		dec	di
		jns	short loc_173A8
		mov	al, [ds:byte_160E5+si]
		sub	ah, ah
		mov	dl, [ds:byte_160E3+si]
		sub	dh, dh
		and	al, 0FEh
		and	dl, 0FEh
		cmp	al, dl
		jb	short loc_173F7
		add	ax, 14h
		cmp	dx, 58h	; 'X'
		jnb	short loc_17419
		cmp	dx, 8
		jnb	short loc_173E4
		mov	dx, 8
loc_173E4:				; ...
		mov	[ds:word_160E9], dx
		cmp	ax, 58h	; 'X'
		jb	short loc_173F0
		mov	ax, 58h	; 'X'
loc_173F0:				; ...
		sub	ax, dx
		mov	bp, ax
		jmp	short loc_17416
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_173F7:				; ...
		add	dx, 14h
		cmp	ax, 58h	; 'X'
		jnb	short loc_17419
		cmp	ax, 8
		jnb	short loc_17407
		mov	ax, 8
loc_17407:				; ...
		mov	[ds:word_160E9], ax
		cmp	dx, 58h	; 'X'
		jb	short loc_17412
		mov	dx, 58h	; 'X'
loc_17412:				; ...
		sub	dx, ax
		mov	bp, dx
loc_17416:				; ...
		call	paintFighter
loc_17419:				; ...
		pop	si
		dec	si
		jns	short loc_1739E
		retn
endp		sub_17395
; =============== S U B	R O U T	I N E =======================================
proc		paintFighter near	; ...
		mov	bx, [ds:word_160EB]
		shl	bx, 1
		mov	si, [ds:word_1611E+bx]
		add	si, [ds:word_160E9]
		mov	di, [ds:word_12ABC+bx]
		add	di, [ds:word_160E9]
		sub	di, 8
		push	ds
		mov	cx, [cs:freeSegm]
		mov	ds, cx
		cld
		mov	ax, 5Ch	; '\'
		sub	ax, bp
		mov	dx, 2000h
		sub	dx, bp
		mov	bx, 0E050h
		sub	bx, bp
		xor	bx, dx
		mov	[cs:word_160E0], bx
		shr	bp, 1
		sub	bx, bx
loc_1745A:				; ...
		push	bx
		cmp	[cs:byte_1053F+bx], 0
		jnz	short loc_1746E
		add	si, 2E0h
		add	di, 140h
		jmp	short loc_174C3
; ---------------------------------------------------------------------------
		align 2
loc_1746E:				; ...
		mov	bx, [cs:word_160E0]
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, dx
		xor	dx, bx
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, dx
		xor	dx, bx
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, dx
		xor	dx, bx
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, dx
		xor	dx, bx
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, dx
		xor	dx, bx
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, dx
		xor	dx, bx
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, dx
		xor	dx, bx
		mov	cx, bp
		rep movsw
		add	si, ax
		add	di, dx
		xor	dx, bx
loc_174C3:				; ...
		pop	bx
		inc	bx
		cmp	bx, 0Ch
		jb	short loc_1745A
		pop	ds
		retn
endp		paintFighter
; =============== S U B	R O U T	I N E =======================================
proc		sub_174CC near		; ...
		push	es
		mov	dx, [cs:freeSegm]
		mov	es, dx
		sub	dx, dx
		sub	di, di
		mov	[ds:word_10469], di
		cmp	[ds:byte_10491], 0
		jz	short loc_174E9
		mov	bp, 0FFFFh
		jmp	short loc_174EC
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_174E9:				; ...
		mov	bp, 5555h
loc_174EC:				; ...
		call	sub_17602
		mov	si, 3
		shl	si, 1
		sub	di, di
		call	sub_175A7
		mov	si, 0C0h ; '¿'
		shl	si, 1
		mov	di, 8
		call	sub_175A7
		mov	al, 0FFh
		cmp	dl, [ds:byte_1057B]
		jz	short loc_17516
		mov	di, [ds:word_10469]
		mov	al, [byte ptr ds:locret_175DE+di]
		sub	di, di
loc_17516:				; ...
		sub	ah, ah
		mov	si, ax
		shl	si, 1
		mov	di, 4
		call	sub_175A7
		inc	[ds:word_10469]
loc_17526:				; ...
		call	sub_17602
		mov	si, 7
		shl	si, 1
		sub	di, di
		call	sub_175A7
		mov	si, 0E0h ; '‡'
		shl	si, 1
		mov	di, 8
		call	sub_175A7
		mov	al, 0FFh
		cmp	dl, [ds:byte_1057B]
		jnb	short loc_17550
		mov	di, [ds:word_10469]
		mov	al, [byte ptr ds:locret_175DE+di]
		sub	di, di
loc_17550:				; ...
		sub	ah, ah
		mov	si, ax
		shl	si, 1
		mov	di, 4
		call	sub_175A7
		inc	[ds:word_10469]
		call	sub_17602
		mov	si, 0FFh
		shl	si, 1
		sub	di, di
		call	sub_175A7
		mov	di, 8
		call	sub_175A7
		mov	al, 0FFh
		cmp	dl, [ds:byte_1057B]
		jnb	short loc_17585
		mov	di, [ds:word_10469]
		mov	al, [byte ptr ds:locret_175DE+di]
		sub	di, di
loc_17585:				; ...
		sub	ah, ah
		mov	si, ax
		shl	si, 1
		mov	di, 4
		call	sub_175A7
		inc	[ds:word_10469]
		inc	dx
		inc	[ds:word_10469]
		mov	di, [ds:word_10469]
		cmp	di, 1Fh
		jnb	short loc_175A5
		jmp	short loc_17526
; ---------------------------------------------------------------------------
loc_175A5:				; ...
		pop	es
		retn
endp		sub_174CC
; =============== S U B	R O U T	I N E =======================================
proc		sub_175A7 near		; ...
		push	bx
		mov	ax, [ds:word_14CE0+si]
		xor	ax, 0FFFFh
		mov	bl, ah
		sub	bh, bh
		shl	bx, 1
		mov	cx, [ds:word_14CE0+bx]
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	ax, [ds:word_14CE0+bx]
		pop	bx
		and	[es:bx+di], ax
		and	[es:bx+di+2], cx
		xor	ax, 0FFFFh
		xor	cx, 0FFFFh
		and	ax, bp
		and	cx, bp
		or	[es:bx+di], ax
		or	[es:bx+di+2], cx
		retn
endp		sub_175A7
; ---------------------------------------------------------------------------
locret_175DE:				; ...
		retn
; ---------------------------------------------------------------------------
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
		db 0E7h	; Á
		db 0F3h	; Û
; =============== S U B	R O U T	I N E =======================================
proc		sub_17602 near		; ...
		mov	bx, [ds:word_10469]
		shl	bx, 1
		mov	bx, [ds:word_1625E+bx]
		add	bx, 2Ah	; '*'
		sub	di, di
		retn
endp		sub_17602
; =============== S U B	R O U T	I N E =======================================
proc		sub_17612 near		; ...
		mov	si, 0Bh
		mov	al, 0Bh
loc_17617:				; ...
		shl	si, 1
		mov	dx, [ds:word_1762C+si]
		shr	si, 1
		lea	bp, [unk_165E1]
		call	sub_16F88
		dec	al
		dec	si
		jns	short loc_17617
		retn
endp		sub_17612
; ---------------------------------------------------------------------------
word_1762C	dw 0E24h		; ...
		dw 0F24h
		dw 1024h
		dw 1124h
		dw 0E25h
		dw 0F25h
		dw 1025h
		dw 1125h
		dw 0E26h
		dw 0F26h
		dw 1026h
		dw 1126h
		dw 0E27h
		dw 0F27h
		dw 1027h
		dw 1127h
; =============== S U B	R O U T	I N E =======================================
proc		sub_1764C near		; ...
		push	ds
		push	es
		mov	cx, [cs:freeSegm]
		mov	ds, cx
		mov	es, cx
		cld
		mov	bx, 60h	; '`'
loc_1765B:				; ...
		shl	bx, 1
		mov	si, [cs:word_1611E+bx]
		mov	di, si
		add	di, 2600h
		shr	bx, 1
		mov	cx, 2Eh	; '.'
		rep movsw
		inc	bx
		cmp	bx, 0C8h ; '»'
		jb	short loc_1765B
		pop	es
		pop	ds
		retn
endp		sub_1764C
; =============== S U B	R O U T	I N E =======================================
proc		sub_17679 near		; ...
		push	ds
		mov	ax, [cs:freeSegm]
		mov	ds, ax
		cld
		mov	bx, 60h	; '`'
loc_17684:				; ...
		shl	bx, 1
		mov	si, [cs:word_1611E+bx]
		add	si, 8
		mov	di, [cs:word_12ABC+bx]
		shr	bx, 1
		mov	cx, 28h	; '('
		rep movsw
		inc	bx
		cmp	bx, 0C8h ; '»'
		jb	short loc_17684
		pop	ds
		retn
endp		sub_17679
; =============== S U B	R O U T	I N E =======================================
proc		loadLevel near		; ...
		mov	bl, [ds:byte_1056D]
		add	bl, [ds:currLvl]
		add	bl, [ds:byte_12CF7]
		sub	bh, bh
		shl	bx, 1
		mov	ax, [word ptr ds:fileNumber+bx]
		mov	di, 5600h
		call	openFile
		push	ds
		mov	ax, [cs:freeSegm]
		mov	ds, ax
		cld
		sub	bx, bx
loc_176C7:				; ...
		shl	bx, 1
		mov	si, [cs:word_12ABC+bx]
		add	si, 5600h
		mov	di, [cs:word_12ADC+bx]
		shr	bx, 1
		mov	cx, 28h	; '('
		rep movsw
		inc	bx
		cmp	bx, 0B8h ; '∏'
		jb	short loc_176C7
		pop	ds
		push	es
		mov	ax, [cs:freeSegm]
		mov	es, ax
		push	ds
		mov	ax, 0B800h
		mov	ds, ax
		assume ds:nothing
		mov	bx, 60h	; '`'
loc_176F6:				; ...
		shl	bx, 1
		mov	si, [cs:word_12ABC+bx]
		mov	di, [cs:word_1611E+bx]
		add	di, 8
		shr	bx, 1
		mov	cx, 28h	; '('
		rep movsw
		inc	bx
		cmp	bx, 0C8h ; '»'
		jb	short loc_176F6
		pop	ds
		assume ds:nothing
		pop	es
		retn
endp		loadLevel
; ---------------------------------------------------------------------------
fileNumber	db  31h	; 1		; ...
		db  20h
		db  32h	; 2
		db  20h
		db  33h	; 3
		db  20h
		db  34h	; 4
		db  20h
		db  35h	; 5
		db  20h
		db  36h	; 6
		db  20h
		db  37h	; 7
		db  20h
		db  38h	; 8
		db  20h
		db  39h	; 9
		db  20h
		db  31h	; 1
		db  30h	; 0
		db  31h	; 1
		db  31h	; 1
		db  31h	; 1
		db  32h	; 2
		db  31h	; 1
		db  33h	; 3
		db  31h	; 1
		db  34h	; 4
		db  31h	; 1
		db  35h	; 5
		dw 3631h
; =============== S U B	R O U T	I N E =======================================
proc		sub_17736 near		; ...
		mov	al, [ds:byte_10441]
		push	ax
		mov	al, [ds:byte_10442]
		push	ax
		mov	[ds:byte_10441], 0
		mov	[ds:byte_10442], 0
		mov	[ds:byte_16321], 0
		call	sub_1383D
		mov	al, [ds:byte_1056D]
		cmp	al, [ds:byte_16320]
		jnz	short loc_1775F
		call	sub_18090
		jmp	short loc_1776E
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_1775F:				; ...
		mov	[ds:byte_16320], al
		call	loadLevel
		call	sub_17612
		call	sub_17679
		call	sub_1764C
loc_1776E:				; ...
		push	es
		mov	dx, [cs:freeSegm]
		mov	es, dx
		mov	cx, 1300h
		mov	di, 7C00h
		cld
		sub	ax, ax
		rep stosw
		pop	es
		mov	[ds:byte_16321], 1
		pop	ax
		mov	[ds:byte_10442], al
		pop	ax
		mov	[ds:byte_10441], al
		retn
endp		sub_17736
; =============== S U B	R O U T	I N E =======================================
proc		sub_17790 near		; ...
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_177C2
		mov	al, 20h	; ' '
		mov	dx, 7
		call	sub_134E2
		mov	dx, 8
		call	sub_134E2
		mov	dx, 1Fh
		call	sub_134E2
		mov	dx, 20h	; ' '
		call	sub_134E2
		mov	dx, 108h
		call	sub_134E2
		mov	dx, 120h
		call	sub_134E2
		jmp	short locret_1781C
; ---------------------------------------------------------------------------
		align 2
loc_177C2:				; ...
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_10498+di]
		add	al, [ds:byte_10574]
		cmp	al, 6
		jb	short loc_177D8
		mov	al, 5
loc_177D8:				; ...
		mov	[ds:byte_10498+di], al
		mov	dl, [byte ptr ds:unk_1782F+di]
		sub	dh, dh
		mov	si, dx
		sub	ah, ah
		mov	di, ax
		mov	al, [ds:byte_1781D+di]
		mov	[ds:byte_12CC1], al
		mov	al, 80h	; 'Ä'
		mov	dx, si
		call	sub_134E2
		mov	al, [byte ptr ds:unk_17829+di]
		mov	[ds:byte_12CC1], al
		mov	al, 80h	; 'Ä'
		add	dx, 100h
		call	sub_134E2
		mov	al, [byte ptr ds:unk_17823+di]
		mov	[ds:byte_12CC1], al
		mov	al, 80h	; 'Ä'
		mov	dx, si
		sub	dx, 1
		call	sub_134E2
		mov	[ds:byte_12CC1], 3
locret_1781C:				; ...
		retn
endp		sub_17790
; ---------------------------------------------------------------------------
byte_1781D	db 2			; ...
		db    2
		db    3
		db    3
		db    3
		db    3
unk_17823	db    2			; ...
		db    2
		db    2
		db    2
		db    3
		db    3
unk_17829	db    2			; ...
		db    3
		db    2
		db    3
		db    2
		db    3
unk_1782F	db    8			; ...
		db  20h
; =============== S U B	R O U T	I N E =======================================
proc		sub_17831 near		; ...
		mov	di, 27h	; '''
		mov	al, 20h	; ' '
loc_17836:				; ...
		mov	[ds:byte_105BA+di], al
		mov	[ds:byte_105E2+di], al
		mov	[ds:byte_1060A+di], 0
		mov	[ds:byte_10632+di], 0
		dec	di
		jns	short loc_17836
		sub	bx, bx
loc_1784D:				; ...
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		shr	bx, 1
		mov	cx, 28h	; '('
		sub	ax, ax
		cld
		rep stosw
		inc	bx
		cmp	bx, 10h
		jb	short loc_1784D
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_17892
		mov	dx, 10Eh
loc_1786F:				; ...
		mov	[ds:byte_12CC1], 3
		cmp	dx, 6
		jb	short loc_1787E
		mov	[ds:byte_12CC1], 1
loc_1787E:				; ...
		mov	al, 80h	; 'Ä'
		call	showSymbol
		mov	di, dx
		inc	dl
		cmp	dl, 1Ah
		jb	short loc_1786F
		mov	[ds:byte_12CC1], 3
		retn
; ---------------------------------------------------------------------------
loc_17892:				; ...
		mov	[ds:byte_12CC1], 2
		mov	al, 80h	; 'Ä'
		mov	dx, 7
		call	sub_134E2
		mov	dx, 8
		call	sub_134E2
		mov	dx, 1Fh
		call	sub_134E2
		mov	dx, 20h	; ' '
		call	sub_134E2
		mov	dx, 108h
		call	sub_134E2
		mov	dx, 120h
		call	sub_134E2
		mov	[ds:byte_12CC1], 3
		retn
endp		sub_17831
; =============== S U B	R O U T	I N E =======================================
proc		sub_178C3 near		; ...
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short locret_178F5
		mov	al, 80h	; 'Ä'
		mov	[ds:byte_12CC1], 3
		mov	dx, 10Eh
		mov	cl, [ds:byte_1059F]
		sub	cl, 28h	; '('
loc_178DD:				; ...
		cmp	dl, cl
		jb	short loc_178E6
		mov	[ds:byte_12CC1], 1
loc_178E6:				; ...
		call	sub_134E2
		inc	dl
		cmp	dl, 1Ah
		jb	short loc_178DD
		mov	[ds:byte_12CC1], 3
locret_178F5:				; ...
		retn
endp		sub_178C3
; ---------------------------------------------------------------------------
byte_178F6	db 0Ah			; ...
		db  1Bh
a12		db 31h	; 1...
		db  32h	; 2
aTime	db  54h    ; T...
		db  49h	   ; I
		db  4Dh	   ; M
		db  45h	   ; E
aDemo	db  44h    ; D...
		db  45h	   ; E
		db  4Dh	   ; M
		db  4Fh	   ; O
; =============== S U B	R O U T	I N E =======================================
proc		sub_17902 near		; ...
		mov	di, 1
loc_17905:				; ...
		mov	dl, [ds:byte_178F6+di]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_10465+di]
		cmp	al, 0
		jnz	short loc_17930
		mov	dx, 0
		add	dx, si
		call	showSymbol
		mov	dx, 1
		add	dx, si
		call	showSymbol
		mov	dx, 2
		add	dx, si
		call	showSymbol
		jmp	short loc_17950
; ---------------------------------------------------------------------------
		align 2
loc_17930:				; ...
		mov	al, [ds:a12+di]
		mov	dx, 0
		add	dx, si
		call	showSymbol
		mov	al, 55h	; 'U'
		mov	dx, 1
		add	dx, si
		call	showSymbol
		mov	al, 50h	; 'P'
		mov	dx, 2
		add	dx, si
		call	showSymbol
loc_17950:				; ...
		dec	di
		jns	short loc_17905
		mov	al, [ds:byte_10465]
		or	al, [ds:byte_10466]
		jnz	short loc_1795F
		jmp	loc_17A11
; ---------------------------------------------------------------------------
loc_1795F:				; ...
		mov	di, 3
loc_17962:				; ...
		mov	al, [ds:aTime+di]
		mov	dx, 0Eh
		add	dx, di
		call	showSymbol
		dec	di
		jns	short loc_17962
		mov	al, [ds:byte_10465]
		and	al, [ds:byte_10466]
		jz	short loc_179DB
		mov	di, 2
loc_1797D:				; ...
		mov	al, 2
		mov	[byte ptr ds:loc_179D8+di], al
		dec	di
		jns	short loc_1797D
		mov	dl, [ds:byte_104CF]
		sub	dh, dh
		mov	si, dx
		cmp	si, 0
		jz	short loc_1799F
		sub	di, di
loc_17995:				; ...
		mov	al, 3
		mov	[byte ptr ds:loc_179D8+di], al
		inc	di
		dec	si
		jnz	short loc_17995
loc_1799F:				; ...
		mov	dl, [ds:byte_104D0]
		sub	dh, dh
		mov	si, dx
		cmp	si, 0
		jz	short loc_179B9
		mov	di, 2
loc_179AF:				; ...
		mov	al, 1
		mov	[byte ptr ds:loc_179D8+di], al
		dec	di
		dec	si
		jnz	short loc_179AF
loc_179B9:				; ...
		mov	di, 2
loc_179BC:				; ...
		mov	al, [byte ptr ds:loc_179D8+di]
		mov	[ds:byte_12CC1], al
		mov	al, 80h	; 'Ä'
		mov	dx, 17h
		add	dx, di
		call	showSymbol
		dec	di
		jns	short loc_179BC
		mov	[ds:byte_12CC1], 3
		jmp	short loc_17A2D
; ---------------------------------------------------------------------------
		nop
loc_179D8:				; ...
		add	al, [bp+si]
; ---------------------------------------------------------------------------
		db 2
; ---------------------------------------------------------------------------
loc_179DB:				; ...
		mov	di, 17h
		mov	al, 4Ch	; 'L'
		mov	dx, 0
		add	dx, di
		call	showSymbol
		inc	di
		mov	al, [ds:byte_10492]
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		add	al, 30h	; '0'
		mov	dx, 0
		add	dx, di
		call	showSymbol
		inc	di
		mov	al, [ds:byte_10492]
		and	al, 0Fh
		add	al, 30h	; '0'
		mov	dx, 0
		add	dx, di
		call	showSymbol
		jmp	short loc_17A2D
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_17A11:				; ...
		mov	si, 3
loc_17A14:				; ...
		mov	al, [ds:aDemo+si]
		mov	dx, 0Eh
		add	dx, si
		call	showSymbol
		mov	al, 20h	; ' '
		mov	dx, 16h
		add	dx, si
		call	showSymbol
		dec	si
		jns	short loc_17A14
loc_17A2D:				; ...
		mov	al, [ds:byte_1048F]
		cmp	al, 4
		jz	short loc_17A38
		cmp	al, 5
		jnz	short sub_17A49
loc_17A38:				; ...
		mov	al, 20h	; ' '
		mov	dx, 13h
		call	showSymbol
		mov	dx, 14h
		call	showSymbol
		jmp	short locret_17A6D
endp		sub_17902 ; sp-analysis	failed
; ---------------------------------------------------------------------------
		db 90h
; =============== S U B	R O U T	I N E =======================================
proc		sub_17A49 near		; ...
		mov	al, [ds:byte_104A1]
		and	al, 0Fh
		add	al, 30h	; '0'
		mov	dx, 14h
		call	showSymbol
		mov	al, [ds:byte_104A1]
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		jnz	short loc_17A65
		mov	al, 0F0h ; ''
loc_17A65:				; ...
		add	al, 30h	; '0'
		mov	dx, 13h
		call	showSymbol
locret_17A6D:				; ...
		retn
endp		sub_17A49
; ---------------------------------------------------------------------------
byte_17A6E	db 0			; ...
		db 22h
byte_17A70	db 0			; ...
		db 3
; =============== S U B	R O U T	I N E =======================================
proc		sub_17A72 near		; ...
		mov	ax, [ds:word_1046D]
		push	ax
		mov	al, [ds:byte_1049A]
		cmp	al, 0
		jz	short loc_17A80
		jmp	loc_17B32
; ---------------------------------------------------------------------------
loc_17A80:				; ...
		mov	al, [ds:byte_10561]
		mov	[ds:byte_1049A], al
		mov	dl, [ds:byte_10491]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_10577+di]
		clc
		adc	al, [ds:byte_10561]
		daa
		mov	[ds:byte_10577+di], al
		mov	al, [ds:byte_10575+di]
		adc	al, 0
		daa
		mov	[ds:byte_10575+di], al
		mov	dl, [ds:byte_17A70+di]
		sub	dh, dh
		mov	si, dx
		mov	al, [ds:byte_1049C+si]
		clc
		adc	al, [ds:byte_10561]
		daa
		mov	[ds:byte_1049C+si], al
		mov	al, [ds:byte_1049B+si]
		adc	al, 0
		daa
		mov	[ds:byte_1049B+si], al
		mov	dl, [ds:byte_17A6E+di]
		sub	dh, dh
		mov	si, dx
		mov	dl, [ds:byte_17A70+di]
		sub	dh, dh
		mov	di, dx
		sub	al, al
		mov	[byte ptr ds:word_1046D], al
		sub	bx, bx
loc_17ADF:				; ...
		mov	al, [ds:byte_1049B+di]
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		add	al, 30h	; '0'
		cmp	al, 30h	; '0'
		jz	short loc_17AF2
		inc	bx
loc_17AF2:				; ...
		mov	dx, 0
		add	dx, si
		cmp	bx, 0
		jnz	short loc_17AFE
		mov	al, 20h	; ' '
loc_17AFE:				; ...
		call	showSymbol
		inc	si
		mov	al, [ds:byte_1049B+di]
		and	al, 0Fh
		add	al, 30h	; '0'
		cmp	al, 30h	; '0'
		jz	short loc_17B0F
		inc	bx
loc_17B0F:				; ...
		mov	dx, 0
		add	dx, si
		cmp	[ds:word_1046D], 2
		jz	short loc_17B22
		cmp	bx, 0
		jnz	short loc_17B22
		mov	al, 20h	; ' '
loc_17B22:				; ...
		call	showSymbol
		inc	si
		inc	di
		inc	[ds:word_1046D]
		cmp	[ds:word_1046D], 3
		jb	short loc_17ADF
loc_17B32:				; ...
		pop	ax
		mov	[ds:word_1046D], ax
		retn
endp		sub_17A72
; =============== S U B	R O U T	I N E =======================================
proc		showSymbol near		; ...
		push	bx
		mov	bl, dl
		sub	bh, bh
		cmp	dh, 0
		jz	short loc_17B44
		add	bx, 28h	; '('
loc_17B44:				; ...
		cmp	[ds:byte_105BA+bx], al
		jnz	short loc_17B54
		mov	ah, [ds:byte_12CC1]
		cmp	[ds:byte_1060A+bx], ah
		jz	short loc_17B5F
loc_17B54:				; ...
		call	sub_134E2
		mov	[ds:byte_105BA+bx], al
		mov	[ds:byte_1060A+bx], ah
loc_17B5F:				; ...
		pop	bx
		retn
endp		showSymbol
; =============== S U B	R O U T	I N E =======================================
proc		sub_17B61 near		; ...
		cld
		mov	al, 2
		mov	ah, 2
		call	sub_17EE0
		inc	[ds:byte_10584]
		mov	dl, [ds:byte_10584]
		and	dx, 3
		mov	[ds:byte_10584], dl
		mov	si, dx
		mov	al, [ds:byte_17C08+si]
		sub	ah, ah
		lea	si, [unk_17C0C]
		add	si, ax
		mov	al, [ds:byte_10464]
		and	al, 3
		sub	ah, ah
		mov	bx, ax
		mov	dl, [ds:byte_17C04+bx]
		mov	dh, dl
		mov	bx, [ds:word_10587]
		shl	bx, 1
		mov	di, [ds:word_1611E+bx]
		mov	bl, [ds:byte_10589]
		sub	bh, bh
		shr	bx, 1
		add	di, bx
		push	es
		mov	ax, [cs:freeSegm]
		mov	es, ax
		mov	dx, 0FFFFh
		mov	cx, 0Fh
loc_17BB7:				; ...
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bx, [ds:word_14CE0+bx]
		mov	ax, [es:di+4C00h]
		and	ax, bx
		jz	short loc_17BD0
		mov	[ds:byte_10586], 1
loc_17BD0:				; ...
		mov	ax, [es:di]
		and	ax, bx
		xor	bx, dx
		or	ax, bx
		stosw
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bx, [ds:word_14CE0+bx]
		mov	ax, [es:di+4C00h]
		and	ax, bx
		jz	short loc_17BF3
		mov	[ds:byte_10586], 1
loc_17BF3:				; ...
		mov	ax, [es:di]
		and	ax, bx
		xor	bx, dx
		or	ax, bx
		stosw
		add	di, 58h	; 'X'
		loop	loc_17BB7
		pop	es
		retn
endp		sub_17B61
; ---------------------------------------------------------------------------
byte_17C04	db 0FFh			; ...
		db 0FFh
		db 0FFh
		db 0FFh
byte_17C08	db 0			; ...
		db 1Eh,	3Ch, 5Ah
unk_17C0C	db    7			; ...
		db  80h	; Ä
		db  0Fh
		db  80h	; Ä
		db  0Fh
		db  80h	; Ä
		db  0Fh
		db  80h	; Ä
		db    7
		db  80h	; Ä
		db    3
		db  80h	; Ä
		db    1
		db  80h	; Ä
		db    0
		db  80h	; Ä
		db    0
		db 0C0h	; ¿
		db    0
		db 0E0h	; ‡
		db    0
		db 0F0h	; 
		db    0
		db 0F8h	; ¯
		db    0
		db 0F8h	; ¯
		db    0
		db 0F8h	; ¯
		db    0
		db 0F0h	; 
		db    0
		db 0F0h	; 
		db    0
		db 0F8h	; ¯
		db    0
		db 0F8h	; ¯
		db    0
		db 0F8h	; ¯
		db    0
		db 0F0h	; 
		db    0
		db 0E0h	; ‡
		db    0
		db 0C0h	; ¿
		db    0
		db  80h	; Ä
		db    1
		db  80h	; Ä
		db    3
		db  80h	; Ä
		db    7
		db  80h	; Ä
		db  0Fh
		db  80h	; Ä
		db  0Fh
		db  80h	; Ä
		db  0Fh
		db  80h	; Ä
		db    7
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ch
		db    0
		db  1Eh
		db    0
		db  3Fh	; ?
		db    0
		db  7Fh	; 
		db    0
		db 0FFh
		db 0FFh
		db    0
		db 0FEh	; ˛
		db    0
		db 0FCh	; ¸
		db    0
		db  78h	; x
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  78h	; x
		db    0
		db 0FCh	; ¸
		db    0
		db 0FEh	; ˛
		db    0
		db 0FFh
		db    0
		db    0
		db 0FFh
		db    0
		db  7Fh	; 
		db    0
		db  3Fh	; ?
		db    0
		db  1Eh
		db    0
		db  0Ch
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_17C84 near		; ...
		cld
		mov	al, 1
		mov	ah, 6
		call	sub_17EE0
		mov	bx, [ds:word_10587]
		shl	bx, 1
		mov	di, [ds:word_1611E+bx]
		mov	bl, [ds:byte_10589]
		sub	bh, bh
		shr	bx, 1
		add	di, bx
		push	es
		mov	ax, [cs:freeSegm]
		mov	es, ax
		mov	al, [ds:byte_1058B]
		cmp	al, 0
		jnz	short loc_17CB5
		lea	si, [unk_17DB4]
		jmp	short loc_17CB9
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_17CB5:				; ...
		lea	si, [unk_17DDE]
loc_17CB9:				; ...
		mov	dx, 0FFFFh
		mov	cx, 7
loc_17CBF:				; ...
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17CDA
		mov	[ds:byte_10586], 1
loc_17CDA:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17D01
		mov	[ds:byte_10586], 1
loc_17D01:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17D28
		mov	[ds:byte_10586], 1
loc_17D28:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17D4F
		mov	[ds:byte_10586], 1
loc_17D4F:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17D76
		mov	[ds:byte_10586], 1
loc_17D76:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17D9D
		mov	[ds:byte_10586], 1
loc_17D9D:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		add	di, 50h	; 'P'
		dec	cx
		jz	short loc_17DB2
		jmp	loc_17CBF
; ---------------------------------------------------------------------------
loc_17DB2:				; ...
		pop	es
		retn
endp		sub_17C84
; ---------------------------------------------------------------------------
unk_17DB4	db    0			; ...
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db 0ECh	; Ï
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0ABh	; ´
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db 0ECh	; Ï
		db    0
		db    0
		db    0
		db    1
		db  40h	; @
		db  30h	; 0
		db    0
		db    0
		db    0
		db    5
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db  11h
		db    0
		db    0
unk_17DDE	db  0Ch			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db  3Bh	; ;
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db 0EAh	; Í
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  3Bh	; ;
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FFh
		db  0Ch
		db    1
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    1
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db  44h	; D
		db    0
		db    0
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_17E08 near		; ...
		cld
		mov	al, 1
		mov	ah, 3
		call	sub_17EE0
		mov	bx, [ds:word_10587]
		shl	bx, 1
		mov	di, [ds:word_1611E+bx]
		mov	bl, [ds:byte_10589]
		sub	bh, bh
		shr	bx, 1
		add	di, bx
		push	es
		mov	ax, [cs:freeSegm]
		mov	es, ax
		mov	al, [ds:byte_1058B]
		cmp	al, 0
		jz	short loc_17E39
		lea	si, [unk_17ECE]
		jmp	short loc_17E3D
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_17E39:				; ...
		lea	si, [word_17EBC]
loc_17E3D:				; ...
		mov	cx, 6
loc_17E40:				; ...
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17E5B
		mov	[ds:byte_10586], 1
loc_17E5B:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17E82
		mov	[ds:byte_10586], 1
loc_17E82:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		lodsb
		mov	bl, al
		sub	bh, bh
		shl	bx, 1
		mov	bp, [ds:word_152E0+bx]
		xor	bp, dx
		mov	ax, [es:di+4C00h]
		and	ax, bp
		jz	short loc_17EA9
		mov	[ds:byte_10586], 1
loc_17EA9:				; ...
		xor	bp, dx
		mov	ax, [es:di]
		and	ax, bp
		or	ax, [ds:word_156E0+bx]
		stosw
		add	di, 56h	; 'V'
		loop	loc_17E40
		pop	es
endp		sub_17E08 ; sp-analysis	failed
		retn
; ---------------------------------------------------------------------------
word_17EBC	dw 3			; ...
		db    0
		db  3Fh	; ?
		db    0
		db    0
		db 0D7h	; ◊
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FFh
		db 0AAh	; ™
		db 0A8h	; ®
		db    7
		db  55h	; U
		db    0
		db    3
		db    0
		db    0
unk_17ECE	db    0			; ...
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db 0FCh	; ¸
		db 0AAh	; ™
		db 0AAh	; ™
		db 0D7h	; ◊
		db  2Ah	; *
		db 0AAh	; ™
		db 0FFh
		db    0
		db  55h	; U
		db 0D0h	; –
		db    0
		db    0
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_17EE0 near		; ...
		push	ax
		mov	bl, [ds:byte_10490]
		xor	bl, 1
		sub	bh, bh
		and	bx, 1
		mov	al, [ds:byte_10589]
		shr	al, 1
		mov	[ds:byte_160E3+bx], al
		mov	[ds:byte_160E7+bx], 0
		lea	si, [unk_160EE]
		mov	dx, bx
		add	dx, si
		mov	ax, [ds:word_10587]
		sub	ax, [ds:word_160EB]
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		mov	bp, ax
		pop	ax
		mov	cl, al
		sub	ch, ch
		add	cx, bp
		inc	cx
		sub	di, di
loc_17F1D:				; ...
		sub	al, al
		cmp	di, bp
		jb	short loc_17F29
		cmp	di, cx
		jnb	short loc_17F29
		mov	al, ah
loc_17F29:				; ...
		shl	di, 1
		mov	si, dx
		add	si, di
		mov	[si], al
		shr	di, 1
		inc	di
		cmp	di, 0Ch
		jnz	short loc_17F1D
		retn
endp		sub_17EE0
; =============== S U B	R O U T	I N E =======================================
proc		sub_17F3A near		; ...
		mov	al, [ds:byte_1058D]
		cmp	al, 0
		jnz	short loc_17F44
loc_17F41:				; ...
		jmp	short loc_17FA9
; ---------------------------------------------------------------------------
		align 2
loc_17F44:				; ...
		mov	al, [ds:byte_1058E]
		cmp	al, 0
		jnz	short loc_17F5C
		mov	al, [ds:byte_10586]
		cmp	al, 0
		jnz	short loc_17F41
		mov	al, [ds:byte_10585]
		cmp	al, 0
		jz	short loc_17F41
		call	sub_18013
loc_17F5C:				; ...
		mov	al, [ds:byte_1058B]
		cmp	al, 0
		jz	short loc_17F7E
		mov	al, [ds:byte_10589]
		clc
		sbb	al, [ds:byte_1058A]
		jmp	short loc_17F85
; ---------------------------------------------------------------------------
		nop
loc_17F6E:				; ...
		dec	[ds:byte_10585]
		inc	[ds:byte_10592]
		sub	al, al
		mov	[ds:byte_1058E], al
		jmp	short loc_17FA9
; ---------------------------------------------------------------------------
		align 2
loc_17F7E:				; ...
		mov	al, [ds:byte_10589]
		add	al, [ds:byte_1058A]
loc_17F85:				; ...
		mov	[ds:byte_10589], al
		cmp	al, 0B8h ; '∏'
		jnb	short loc_17F6E
		mov	al, [ds:byte_1058C]
		cmp	al, 0
		jnz	short loc_17F99
		call	sub_17B61
		jmp	short locret_17FAE
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_17F99:				; ...
		cmp	al, 1
		jnz	short loc_17FA3
		call	sub_17C84
		jmp	short locret_17FAE
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_17FA3:				; ...
		call	sub_17E08
		jmp	short locret_17FAE
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
loc_17FA9:				; ...
		mov	[ds:byte_10589], 0ACh ;	'¨'
locret_17FAE:				; ...
		retn
endp		sub_17F3A
; ---------------------------------------------------------------------------
byte_17FAF	db 1			; ...
		db    1
		db    0
		db    1
		db    0
		db    0
		db    1
		db    0
		db    1
		db    1
		db    0
		db    1
		db    1
		db    0
		db    0
		db    0
		db    1
		db    0
		db    1
		db    1
		db    0
		db    0
		db    1
		db    0
		db    1
		db    0
		db    1
		db    0
byte_17FCB	db 0			; ...
		db    1
		db    2
		db    2
		db    0
		db    1
		db    2
		db    0
		db    0
		db    1
		db    1
		db    2
byte_17FD7	db 2			; ...
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    1
		db    2
		db    3
word_17FE3	dw 8Ah			; ...
		db 90h
		db    0
		db  9Fh	; ü
		db    0
		db  8Ah	; ä
		db    0
		db  90h	; ê
		db    0
		db  9Fh	; ü
		db    0
		db  8Ah	; ä
		db    0
		db  9Fh	; ü
		db    0
		db  8Eh	; é
		db    0
		db  92h	; í
		db    0
		db  97h	; ó
		db    0
		db  97h	; ó
		db    0
		db 0A7h	; ß
		db    0
		db 0ABh	; ´
		db    0
		db  8Eh	; é
		db    0
		db 0A7h	; ß
		db    0
		db  8Eh	; é
		db    0
		db  92h	; í
		db    0
		db  97h	; ó
		db    0
		db  97h	; ó
		db    0
		db 0A7h	; ß
		db    0
		db 0ABh	; ´
		db    0
		db  8Eh	; é
		db    0
		db 0A7h	; ß
		db    0
; =============== S U B	R O U T	I N E =======================================
proc		sub_18013 near		; ...
		mov	al, [ds:byte_1058F]
		shl	al, 1
		shl	al, 1
		mov	[ds:byte_10487], al
		call	sub_18087
		and	al, 3
		add	al, [ds:byte_10487]
		sub	ah, ah
		mov	di, ax
		mov	al, [ds:byte_17FCB+di]
		mov	[ds:byte_1058C], al
		shl	al, 1
		shl	al, 1
		shl	al, 1
		shl	al, 1
		mov	[ds:byte_10487], al
		mov	al, [ds:byte_17FD7+di]
		shl	al, 1
		shl	al, 1
		mov	[ds:byte_1058A], al
		sub	si, si
		mov	dl, [ds:byte_10592]
		sub	dh, dh
		mov	di, dx
		mov	al, [ds:byte_17FAF+di]
		xor	al, [ds:byte_10490]
		and	al, 1
		jz	short loc_18060
		mov	si, 0B0h ; '∞'
loc_18060:				; ...
		mov	[ds:byte_1058B], al
		mov	dx, si
		mov	[ds:byte_10589], dl
		call	sub_18087
		and	al, 7
		shl	al, 1
		add	al, [ds:byte_10487]
		sub	ah, ah
		mov	si, ax
		mov	ax, [ds:word_17FE3+si]
		shr	si, 1
		mov	[ds:word_10587], ax
		mov	al, 1
		mov	[ds:byte_1058E], al
		retn
endp		sub_18013
; =============== S U B	R O U T	I N E =======================================
proc		sub_18087 near		; ...
		call	sub_13925
		sub	ah, ah
		mov	al, [ds:byte_12CBC]
		retn
endp		sub_18087
; =============== S U B	R O U T	I N E =======================================
proc		sub_18090 near		; ...
		push	ds
		mov	dx, [cs:freeSegm]
		mov	ds, dx
		cld
		mov	bx, 78h	; 'x'
loc_1809C:				; ...
		shl	bx, 1
		mov	si, [cs:word_1611E+bx]
		add	si, 2614h
		mov	di, [cs:word_12ABC+bx]
		add	di, 0Ch
		shr	bx, 1
		mov	cx, 1Eh
		rep movsw
		inc	bx
		cmp	bx, 0C0h ; '¿'
		jb	short loc_1809C
		pop	ds
		retn
endp		sub_18090
; =============== S U B	R O U T	I N E =======================================
proc		sub_180BF near		; ...
		push	si
		push	bx
		push	di
		push	bp
		push	cx
		mov	bl, dh
		sub	bh, bh
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		mov	di, [ds:word_12ABC+bx]
		mov	si, [ds:word_1611E+bx]
		add	si, 2608h
		mov	bl, dl
		sub	bh, bh
		shl	bx, 1
		add	di, bx
		add	si, bx
		lea	bp, [word_181C0]
		mov	bl, al
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		shl	bx, 1
		add	bp, bx
		mov	bl, [ds:byte_12CC1]
		sub	bh, bh
		shl	bx, 1
		mov	bx, [ds:word_181B7+bx]
		push	ax
		push	dx
		push	ds
		mov	dx, [cs:freeSegm]
		mov	ds, dx
		mov	dx, 5Ah	; 'Z'
		lodsw
		mov	cx, [cs:bp+0]
		or	ax, cx
		and	cx, bx
		xor	ax, cx
		stosw
		add	si, dx
		add	di, 1FFEh
		add	bp, 2
		lodsw
		mov	cx, [cs:bp+0]
		or	ax, cx
		and	cx, bx
		xor	ax, cx
		stosw
		add	si, dx
		sub	di, 1FB2h
		add	bp, 2
		lodsw
		mov	cx, [cs:bp+0]
		or	ax, cx
		and	cx, bx
		xor	ax, cx
		stosw
		add	si, dx
		add	di, 1FFEh
		add	bp, 2
		lodsw
		mov	cx, [cs:bp+0]
		or	ax, cx
		and	cx, bx
		xor	ax, cx
		stosw
		add	si, dx
		sub	di, 1FB2h
		add	bp, 2
		lodsw
		mov	cx, [cs:bp+0]
		or	ax, cx
		and	cx, bx
		xor	ax, cx
		stosw
		add	si, dx
		add	di, 1FFEh
		add	bp, 2
		lodsw
		mov	cx, [cs:bp+0]
		or	ax, cx
		and	cx, bx
		xor	ax, cx
		stosw
		add	si, dx
		sub	di, 1FB2h
		add	bp, 2
		lodsw
		mov	cx, [cs:bp+0]
		or	ax, cx
		and	cx, bx
		xor	ax, cx
		stosw
		add	si, dx
		add	di, 1FFEh
		add	bp, 2
		lodsw
		mov	cx, [cs:bp+0]
		or	ax, cx
		and	cx, bx
		xor	ax, cx
		stosw
		pop	ds
		pop	dx
		pop	ax
		pop	cx
		pop	bp
		pop	di
		pop	bx
		pop	si
		retn
endp		sub_180BF
; ---------------------------------------------------------------------------
word_181B7	dw 0FFFFh		; ...
		dw 0AAAAh
		dw 5555h
		db    0
		db    0
		db    0
word_181C0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Eh	; ~
		db    0
		db  81h	; Å
		db    0
		db 0A5h	; •
		db    0
		db  81h	; Å
		db    0
		db 0A5h	; •
		db    0
		db  99h	; ô
		db    0
		db  81h	; Å
		db    0
		db  7Eh	; ~
		db    0
		db  7Eh	; ~
		db    0
		db 0FFh
		db    0
		db 0DBh	; €
		db    0
		db 0FFh
		db    0
		db 0DBh	; €
		db    0
		db 0E7h	; Á
		db    0
		db 0FFh
		db    0
		db  7Eh	; ~
		db    0
		db  6Ch	; l
		db    0
		db 0FEh	; ˛
		db    0
		db 0FEh	; ˛
		db    0
		db 0FEh	; ˛
		db    0
		db  7Ch	; |
		db    0
		db  38h	; 8
		db    0
		db  10h
		db    0
		db    0
		db    0
		db  10h
		db    0
		db  38h	; 8
		db    0
		db  7Ch	; |
		db    0
		db 0FEh	; ˛
		db    0
		db  7Ch	; |
		db    0
		db  38h	; 8
		db    0
		db  10h
		db    0
		db    0
		db    0
		db  10h
		db    0
		db  38h	; 8
		db    0
		db  54h	; T
		db    0
		db 0FEh	; ˛
		db    0
		db  54h	; T
		db    0
		db  10h
		db    0
		db  38h	; 8
		db    0
		db    0
		db    0
		db  10h
		db    0
		db  10h
		db    0
		db  38h	; 8
		db    0
		db  7Ch	; |
		db    0
		db 0FEh	; ˛
		db    0
		db  54h	; T
		db    0
		db  10h
		db    0
		db  7Ch	; |
		db    0
		db    0
		db    0
		db    0
		db    0
		db  18h
		db    0
		db  3Ch	; <
		db    0
		db  3Ch	; <
		db    0
		db  18h
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db    0
		db 0FFh
		db    0
		db 0E7h	; Á
		db    0
		db 0C3h	; √
		db    0
		db 0C3h	; √
		db    0
		db 0E7h	; Á
		db    0
		db 0FFh
		db    0
		db 0FFh
		db    0
		db    0
		db    0
		db  3Ch	; <
		db    0
		db  66h	; f
		db    0
		db 0C3h	; √
		db    0
		db 0C3h	; √
		db    0
		db  66h	; f
		db    0
		db  3Ch	; <
		db    0
		db    0
		db    0
		db 0FFh
		db    0
		db 0FFh
		db    0
		db 0C3h	; √
		db    0
		db  99h	; ô
		db    0
		db 0BDh	; Ω
		db    0
		db  99h	; ô
		db    0
		db 0C3h	; √
		db    0
		db 0FFh
		db    0
		db  0Fh
		db    0
		db    3
		db    0
		db  0Dh
		db    0
		db  79h	; y
		db    0
		db 0CCh	; Ã
		db    0
		db 0C6h	; ∆
		db    0
		db  6Ch	; l
		db    0
		db  38h	; 8
		db    0
		db  3Ch	; <
		db    0
		db  66h	; f
		db    0
		db 0C3h	; √
		db    0
		db  66h	; f
		db    0
		db  3Ch	; <
		db    0
		db  18h
		db    0
		db  7Eh	; ~
		db    0
		db  18h
		db    0
		db  1Fh
		db    0
		db  19h
		db    0
		db  1Fh
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  78h	; x
		db    0
		db 0F8h	; ¯
		db    0
		db  70h	; p
		db    0
		db  3Fh	; ?
		db    0
		db  21h	; !
		db    0
		db  3Fh	; ?
		db    0
		db  21h	; !
		db    0
		db  21h	; !
		db    0
		db  27h	; '
		db    0
		db 0E6h	; Ê
		db    0
		db 0C0h	; ¿
		db    0
		db  99h	; ô
		db    0
		db  5Ah	; Z
		db    0
		db  3Ch	; <
		db    0
		db 0E7h	; Á
		db    0
		db 0E7h	; Á
		db    0
		db  3Ch	; <
		db    0
		db  5Ah	; Z
		db    0
		db  99h	; ô
		db    0
		db  80h	; Ä
		db    0
		db 0E0h	; ‡
		db    0
		db 0F8h	; ¯
		db    0
		db 0FEh	; ˛
		db    0
		db 0F8h	; ¯
		db    0
		db 0E0h	; ‡
		db    0
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    2
		db    0
		db  0Eh
		db    0
		db  3Eh	; >
		db    0
		db 0FEh	; ˛
		db    0
		db  3Eh	; >
		db    0
		db  0Eh
		db    0
		db    2
		db    0
		db    0
		db    0
		db  10h
		db    0
		db  38h	; 8
		db    0
		db  7Ch	; |
		db    0
		db  10h
		db    0
		db  10h
		db    0
		db  7Ch	; |
		db    0
		db  38h	; 8
		db    0
		db  10h
		db    0
		db  66h	; f
		db    0
		db  66h	; f
		db    0
		db  66h	; f
		db    0
		db  66h	; f
		db    0
		db  66h	; f
		db    0
		db    0
		db    0
		db  66h	; f
		db    0
		db    0
		db    0
		db  7Fh	; 
		db    0
		db 0CBh	; À
		db    0
		db 0CBh	; À
		db    0
		db  7Bh	; {
		db    0
		db  0Bh
		db    0
		db  0Bh
		db    0
		db  1Bh
		db    0
		db    0
		db    0
		db  3Ch	; <
		db    0
		db  66h	; f
		db    0
		db  38h	; 8
		db    0
		db  6Ch	; l
		db    0
		db  38h	; 8
		db    0
		db 0CCh	; Ã
		db    0
		db  78h	; x
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Eh	; ~
		db    0
		db  7Eh	; ~
		db    0
		db  7Eh	; ~
		db    0
		db    0
		db    0
		db  10h
		db    0
		db  38h	; 8
		db    0
		db  7Ch	; |
		db    0
		db  10h
		db    0
		db  7Ch	; |
		db    0
		db  38h	; 8
		db    0
		db  10h
		db    0
		db 0FEh	; ˛
		db    0
		db  10h
		db    0
		db  38h	; 8
		db    0
		db  7Ch	; |
		db    0
		db 0FEh	; ˛
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db    0
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db 0FEh	; ˛
		db    0
		db  7Ch	; |
		db    0
		db  38h	; 8
		db    0
		db  10h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  18h
		db    0
		db  0Ch
		db    0
		db 0FEh	; ˛
		db    0
		db  0Ch
		db    0
		db  18h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db 0FEh	; ˛
		db    0
		db  60h	; `
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db 0FEh	; ˛
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  24h	; $
		db    0
		db  66h	; f
		db    0
		db 0FFh
		db    0
		db  66h	; f
		db    0
		db  24h	; $
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  10h
		db    0
		db  38h	; 8
		db    0
		db  7Ch	; |
		db    0
		db 0FEh	; ˛
		db    0
		db 0FEh	; ˛
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FEh	; ˛
		db    0
		db 0FEh	; ˛
		db    0
		db  7Ch	; |
		db    0
		db  38h	; 8
		db    0
		db  10h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db  26h	; &
		db    0
		db  66h	; f
		db    0
		db  64h	; d
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  66h	; f
		db    0
		db 0FFh
		db    0
		db  66h	; f
		db    0
		db 0FFh
		db    0
		db  66h	; f
		db    0
		db    0
		db    0
		db    0
		db    0
		db  18h
		db    0
		db  7Eh	; ~
		db    0
		db 0C0h	; ¿
		db    0
		db  7Ch	; |
		db    0
		db    6
		db    0
		db 0FCh	; ¸
		db    0
		db  18h
		db    0
		db    0
		db    0
		db  72h	; r
		db    0
		db  66h	; f
		db    0
		db  0Ch
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  66h	; f
		db    0
		db 0C6h	; ∆
		db    0
		db    0
		db    0
		db  78h	; x
		db    0
		db 0CCh	; Ã
		db    0
		db 0D8h	; ÿ
		db    0
		db  70h	; p
		db    0
		db 0DAh	; ⁄
		db    0
		db 0CCh	; Ã
		db    0
		db  76h	; v
		db    0
		db    0
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db  60h	; `
		db    0
		db  60h	; `
		db    0
		db  30h	; 0
		db    0
		db  18h
		db    0
		db    0
		db    0
		db  60h	; `
		db    0
		db  30h	; 0
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db    0
		db    0
		db  44h	; D
		db    0
		db  6Ch	; l
		db    0
		db  38h	; 8
		db    0
		db 0FEh	; ˛
		db    0
		db  38h	; 8
		db    0
		db  6Ch	; l
		db    0
		db  44h	; D
		db    0
		db    0
		db    0
		db    0
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  7Eh	; ~
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    3
		db    0
		db    6
		db    0
		db  0Ch
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  3Ch	; <
		db    0
		db  66h	; f
		db    0
		db 0CBh	; À
		db    0
		db 0DBh	; €
		db    0
		db 0D3h	; ”
		db    0
		db  66h	; f
		db    0
		db  3Ch	; <
		db    0
		db    0
		db    0
		db  18h
		db    0
		db  38h	; 8
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  18h
		db    0
		db  3Ch	; <
		db    0
		db    0
		db    0
		db  78h	; x
		db    0
		db 0CCh	; Ã
		db    0
		db  8Ch	; å
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db 0FEh	; ˛
		db    0
		db    4
		db    0
		db  18h
		db    0
		db  0Ch
		db    0
		db    6
		db    0
		db 0CCh	; Ã
		db    0
		db  78h	; x
		db    0
		db    0
		db    0
		db    6
		db    0
		db  16h
		db    0
		db  36h	; 6
		db    0
		db  66h	; f
		db    0
		db 0FEh	; ˛
		db    0
		db    6
		db    0
		db    6
		db    0
		db    0
		db    0
		db 0FEh	; ˛
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db 0FCh	; ¸
		db    0
		db    6
		db    0
		db 0C6h	; ∆
		db    0
		db  7Ch	; |
		db    0
		db    0
		db    0
		db  0Ch
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  78h	; x
		db    0
		db 0CCh	; Ã
		db    0
		db 0C6h	; ∆
		db    0
		db  7Ch	; |
		db    0
		db    0
		db    0
		db 0FEh	; ˛
		db    0
		db  0Ch
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  7Ch	; |
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db  38h	; 8
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db  7Ch	; |
		db    0
		db    0
		db    0
		db  7Ch	; |
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db  7Ch	; |
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db  80h	; Ä
		db    0
		db  60h	; `
		db    0
		db  30h	; 0
		db    0
		db  18h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db    0
		db    0
		db  60h	; `
		db    0
		db  30h	; 0
		db    0
		db  18h
		db    0
		db    4
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db  60h	; `
		db    0
		db    0
		db    0
		db  78h	; x
		db    0
		db 0CCh	; Ã
		db    0
		db  0Ch
		db    0
		db  18h
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db  3Ch	; <
		db    0
		db  66h	; f
		db    0
		db 0C6h	; ∆
		db    0
		db 0CEh	; Œ
		db    0
		db 0CEh	; Œ
		db    0
		db 0C0h	; ¿
		db    0
		db  7Ch	; |
		db    0
		db    0
		db    0
		db  38h	; 8
		db    0
		db  6Ch	; l
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db 0FEh	; ˛
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db 0FCh	; ¸
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db  3Ch	; <
		db    0
		db  66h	; f
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db  66h	; f
		db    0
		db  3Ch	; <
		db    0
		db    0
		db    0
		db 0F8h	; ¯
		db    0
		db 0CCh	; Ã
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db 0CCh	; Ã
		db    0
		db 0F8h	; ¯
		db    0
		db    0
		db    0
		db 0FEh	; ˛
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db 0F8h	; ¯
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db 0FEh	; ˛
		db    0
		db    0
		db    0
		db 0FEh	; ˛
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db 0F8h	; ¯
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  7Ch	; |
		db    0
		db 0C6h	; ∆
		db    0
		db 0C0h	; ¿
		db    0
		db 0CEh	; Œ
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db  7Ch	; |
		db    0
		db    0
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db    0
		db 0C6h	; ∆
		db 0, 0FEh, 0, 0C6h, 0,	0C6h, 0, 0C6h, 3 dup(0), 78h, 0
		db 30h,	0, 30h,	0, 30h,	0, 30h,	0, 30h,	0, 78h,	3 dup(0)
		db 1Eh,	0, 0Ch,	0, 0Ch,	0, 0Ch,	0, 0Ch,	0, 0CCh, 0, 78h
		db 3 dup(0), 0C6h, 0, 0CCh, 0, 0D8h, 0,	0F0h, 0, 0D8h
		db 0, 0CCh, 0, 0C6h, 3 dup(0), 0C0h, 0,	0C0h, 0, 0C0h
		db 0, 0C0h, 0, 0C0h, 0,	0C0h, 0, 0FEh, 3 dup(0), 0C6h
		db 0, 0EEh, 0, 0DAh, 0,	0D6h, 0, 0C6h, 0, 0C6h,	0, 0C6h
		db 3 dup(0), 0C6h, 0, 0E6h, 0, 0F6h, 0,	0DEh, 0, 0CEh
		db 0, 0C6h, 0, 0C6h, 3 dup(0), 7Ch, 0, 0C6h, 0,	0C6h, 0
		db 0C6h, 0, 0C6h, 0, 0C6h, 0, 7Ch, 3 dup(0), 0FCh, 0, 0C6h
		db 0, 0C6h, 0, 0FCh, 0,	0C0h, 0, 0C0h, 0, 0C0h,	3 dup(0)
		db 7Ch,	0, 0C6h, 0, 0C6h, 0, 0C6h, 0, 0C6h, 0, 0CCh, 0
		db 76h,	3 dup(0), 0FCh,	0, 0C6h, 0, 0C6h, 0, 0FCh, 0, 0D8h
		db 0, 0CCh, 0, 0C6h, 3 dup(0), 7Ch, 0, 0C6h, 0,	0C0h, 0
		db 7Ch,	0, 6, 0, 0C6h, 0, 7Ch, 3 dup(0), 0FCh, 0, 30h
		db 0, 30h, 0, 30h, 0, 30h, 0, 30h, 0, 30h, 3 dup(0), 0C6h
		db 0, 0C6h, 0, 0C6h, 0,	0C6h, 0, 0C6h, 0, 0C6h,	0, 7Ch
		db 3 dup(0), 0C6h, 0, 0C6h, 0, 0C6h, 0,	0C6h, 0, 66h, 0
		db 3Ch,	0, 18h,	3 dup(0), 0C6h,	0, 0C6h, 0, 0C6h, 0, 0C6h
		db 0, 0F6h, 0, 0EEh, 0,	0C6h, 3	dup(0),	0C6h, 0, 0C6h
		db 0, 6Ch, 0, 38h, 0, 6Ch, 0, 0C6h, 0, 0C6h, 3 dup(0)
		db 0C6h, 0, 0C6h, 0, 6Ch, 0, 38h, 0, 18h, 0, 18h, 0, 18h
		db 3 dup(0), 0FEh, 0, 6, 0, 0Ch, 0, 18h, 0, 30h, 0, 60h
		db 0, 0FEh, 3 dup(0), 7Ch, 0, 60h, 0, 60h, 0, 60h, 0, 60h
		db 0, 60h, 0, 7Ch, 3 dup(0), 0C0h, 0, 60h, 0, 30h, 0, 18h
		db 0, 0Ch, 0, 6, 0, 2, 3 dup(0), 7Ch, 0, 0Ch, 0, 0Ch, 0
		db 0Ch,	0, 0Ch,	0, 0Ch,	0, 7Ch,	3 dup(0), 10h, 0, 38h
		db 0, 6Ch, 0, 0C6h, 17h	dup(0),	0FFh, 0, 30h, 0, 30h, 0
		db 18h,	0Fh dup(0), 78h, 0, 0Ch, 0, 7Ch, 0, 0CCh, 0, 7Ah
		db 3 dup(0), 0C0h, 0, 0C0h, 0, 0C0h, 0,	0FCh, 0, 0C6h
		db 0, 0C6h, 0, 7Ch, 7 dup(0), 7Ch, 0, 0C6h, 0, 0C0h, 0
		db 0C6h, 0, 7Ch, 3 dup(0), 6, 0, 6, 0, 6, 0, 7Eh, 0, 0C6h
		db 0, 0C6h, 0, 7Ch, 7 dup(0), 7Ch, 0, 0C6h, 0, 0FEh, 0
		db 0C0h, 0, 7Ch, 3 dup(0), 3Ch,	0, 66h,	0, 60h,	0, 0F8h
		db 0, 60h, 0, 60h, 0, 60h, 7 dup(0), 7Ch, 0, 0C6h, 0, 0C6h
		db 0, 7Eh, 0, 6, 0, 7Ch, 0, 0C0h, 0, 0C0h, 0, 0C0h, 0
		db 0DCh, 0, 0E6h, 0, 0C6h, 0, 0C6h, 3 dup(0), 18h, 3 dup(0)
		db 38h,	0, 18h,	0, 18h,	0, 18h,	0, 3Ch,	3 dup(0), 0Ch
		db 3 dup(0), 0Ch, 0, 0Ch, 0, 0Ch, 0, 0CCh, 0, 0D8h, 0
		db 70h,	0, 0C0h, 0, 0C0h, 0, 0CCh, 0, 0D8h, 0, 0F0h, 0
		db 0D8h, 0, 0CCh, 3 dup(0), 38h, 0, 18h, 0, 18h, 0, 18h
		db 0, 18h, 0, 18h, 0, 3Ch, 7 dup(0), 0ECh, 0, 0FEh, 0
		db 0D6h, 0, 0C6h, 0, 0C6h, 7 dup(0), 0BCh, 0, 0C6h, 0
		db 0C6h, 0, 0C6h, 0, 0C6h, 7 dup(0), 7Ch, 0, 0C6h, 0, 0C6h
		db 0, 0C6h, 0, 7Ch, 7 dup(0), 0FCh, 0, 0C6h, 0,	0C6h, 0
		db 0FCh, 0, 0C0h, 0, 0C0h
		db 5 dup(0), 7Ch, 0, 0C6h, 0, 0C6h, 0, 7Eh, 0, 6, 0, 0Eh
		db 5 dup(0), 0BCh, 0, 0C6h, 0, 0C0h, 0,	0C0h, 0, 0C0h
		db 7 dup(0), 7Eh, 0, 0C0h, 0, 7Ch, 0, 6, 0, 0FCh, 3 dup(0)
		db 30h,	0, 30h,	0, 0FCh, 0, 30h, 0, 30h, 0, 30h, 0, 30h
		db 7 dup(0), 0C6h, 0, 0C6h, 0, 0C6h, 0,	0C6h, 0, 7Ah, 7	dup(0)
		db 0C6h, 0, 0C6h, 0, 66h, 0, 3Ch, 0, 18h, 7 dup(0), 0C6h
		db 0, 0C6h, 0, 0D6h, 0,	0FEh, 0, 6Ch, 7	dup(0),	0C6h, 0
		db 6Ch,	0, 38h,	0, 6Ch,	0, 0C6h, 7 dup(0), 0C6h, 0, 0C6h
		db 0, 6Ch, 0, 18h, 0, 30h, 0, 60h, 5 dup(0), 0FCh, 0, 18h
		db 0, 30h, 0, 60h, 0, 0FCh, 3 dup(0), 0Ch, 0, 18h, 0, 18h
		db 0, 30h, 0, 18h, 0, 18h, 0, 0Ch, 3 dup(0), 18h, 0, 18h
		db 0, 18h, 3 dup(0), 18h, 0, 18h, 0, 18h, 3 dup(0), 60h
		db 0, 30h, 0, 30h, 0, 18h, 0, 30h, 0, 30h, 0, 60h, 3 dup(0)
		db 66h,	0, 9Ch,	0Fh dup(0), 10h, 0, 28h, 0, 44h, 0, 82h
		db 0, 0FEh, 5 dup(0), 38h, 0, 7Ch, 0, 0FEh, 0, 0FEh, 0
		db 0FEh, 0, 7Ch, 0, 38h, 3 dup(0)
word_189D0	dw 7900h		; ...
		dw 790Ch
		dw 7918h
		dw 7924h
		dw 7930h
		dw 793Ch
		dw 7948h
		dw 7954h
		dw 7960h
		dw 796Ch
		dw 7978h
		dw 7984h
		dw 7990h
		dw 799Ch
		dw 79A8h
		dw 79B4h
		dw 79C0h
		dw 79CCh
		dw 79D8h
		dw 79E4h
		dw 79F0h
		dw 79FCh
		dw 7A08h
		dw 7A14h
		dw 7A20h
		dw 7A2Ch
		dw 7A38h
		dw 7A44h
		dw 7A50h
		dw 7A5Ch
		dw 7A68h
		dw 7A74h
		dw 7A80h
		dw 7A8Ch
		dw 7A98h
		dw 7AA4h
		dw 7AB0h
		dw 7ABCh
		dw 7AC8h
		dw 7AD4h
		dw 7AE0h
		dw 7AECh
		dw 7AF8h
		dw 7B04h
		dw 7B10h
		dw 7B1Ch
		dw 7B28h
		dw 7B34h
		dw 7B40h
		dw 7B4Ch
		dw 7B58h
		dw 7B64h
		dw 7B70h
		dw 7B7Ch
		dw 7B88h
		dw 7B94h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_18A50	dw 7C00h		; ...
		dw 7D10h
		dw 7E08h
		dw 7EE8h
		dw 7FC8h
		dw 7FC8h
		dw 8060h
		dw 8170h
		dw 8288h
		dw 8370h
		dw 8468h
		dw 8540h
		dw 8668h
		dw 8748h
		dw 8820h
		dw 8958h
		dw 8A20h
		dw 8B58h
		dw 8BE8h
		dw 8CC0h
		dw 8DC0h
		dw 8EB0h
		dw 8FB0h
		dw 90C0h
		dw 91A8h
		dw 92C0h
		dw 9398h
		dw 9440h
		dw 9520h
		dw 95F0h
		dw 96B8h
		dw 9780h
		dw 9880h
		dw 9938h
		dw 99E0h
		dw 9AF0h
		dw 9C00h
		dw 9CD8h
		dw 9DB0h
		dw 9E80h
		dw 9F50h
		dw 0A058h
		dw 0A160h
		dw 0A270h
		dw 0A318h
		dw 0A410h
		dw 0A4D8h
		dw 0A5A8h
		dw 0A640h
		dw 0A6B8h
		dw 0A738h
		dw 0A850h
		dw 0A978h
		dw 0AA98h
		dw 0ABB8h
		dw 0ABB8h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db  13h
		db    6
		db    6
		db  14h
		db    6
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  13h
		db    6
		db    6
		db  13h
		db    5
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  12h
		db    6
		db    5
		db    4
		db    4
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  12h
		db    6
		db    5
		db    4
		db    4
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  22h	; "
		db  13h
		db    4
		db    4
		db  22h	; "
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    4
		db    7
		db    7
		db    5
		db  14h
		db    7
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    6
		db    6
		db    7
		db    5
		db  32h	; 2
		db    7
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  13h
		db    5
		db    5
		db  14h
		db  14h
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  23h	; #
		db    7
		db    7
		db  24h	; $
		db  24h	; $
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  14h
		db    5
		db    4
		db    4
		db    5
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  36h	; 6
		db    8
		db    5
		db    5
		db    5
		db    8
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  12h
		db    6
		db    5
		db    4
		db    4
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    3
		db    4
		db    5
		db  14h
		db  14h
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  51h	; Q
		db    6
		db    9
		db    9
		db    5
		db  32h	; 2
		db  17h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  12h
		db    4
		db    4
		db  13h
		db    5
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  62h	; b
		db    8
		db    7
		db    6
		db    5
		db    5
		db  16h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    3
		db    3
		db    4
		db    4
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  33h	; 3
		db  26h	; &
		db  26h	; &
		db  24h	; $
		db    8
		db    0
		db    0
		db    0
		db    0
		db    0
		db  14h
		db  14h
		db  14h
		db  14h
		db  14h
		db    6
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  15h
		db    5
		db    4
		db  13h
		db    5
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    5
		db    5
		db  15h
		db  16h
		db    7
		db    0
		db    0
		db  12h
		db    4
		db    6
		db    7
		db  17h
		db  32h	; 2
		db    0
		db    0
		db    0
		db  16h
		db    0
		db    0
		db    0
		db    0
		db  12h
		db    4
		db    6
		db    5
		db  15h
		db  22h	; "
		db    0
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db  13h
		db    6
		db    6
		db    5
		db    6
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db  33h	; 3
		db  15h
		db    5
		db    5
		db    3
		db  11h
		db    5
		db    0
		db    0
		db  22h	; "
		db  15h
		db    6
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db  14h
		db    5
		db    5
		db    5
		db  14h
		db  13h
		db  21h	; !
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db    0
		db  23h	; #
		db  14h
		db    5
		db    5
		db  14h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db    0
		db    0
		db    0
		db    2
		db    2
		db    4
		db    5
		db    5
		db  32h	; 2
		db    0
		db    0
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  21h	; !
		db  13h
		db    4
		db    4
		db    5
		db  13h
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db  13h
		db    5
		db    5
		db  14h
		db    6
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  22h	; "
		db    5
		db    7
		db    9
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  13h
		db    5
		db    5
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db  13h
		db    6
		db    6
		db  14h
		db    6
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db  13h
		db    6
		db    6
		db  14h
		db    6
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db    4
		db    5
		db    5
		db    3
		db    3
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db    4
		db    5
		db    5
		db    5
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db    4
		db    5
		db    7
		db    7
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  22h	; "
		db  13h
		db    5
		db    8
		db    8
		db    0
		db    0
		db    0
		db    0
		db    2
		db    4
		db    6
		db    4
		db  13h
		db  14h
		db  24h	; $
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    9
		db    8
		db  17h
		db    0
		db  17h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    9
		db    9
		db    8
		db    8
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    3
		db    9
		db    9
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  13h
		db    5
		db    6
		db  14h
		db    5
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  12h
		db  13h
		db  15h
		db  16h
		db  14h
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  43h	; C
		db  35h	; 5
		db    9
		db    9
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  53h	; S
		db  17h
		db    9
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    3
		db    2
		db    2
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  22h	; "
		db    4
		db    3
		db    2
		db    2
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db  13h
		db    5
		db    7
		db  14h
		db    6
		db    7
		db    0
		db    0
		db    0
		db    0
		db    0
		db  13h
		db  13h
		db    5
		db    7
		db  16h
		db    6
		db    7
		db    0
		db    0
		db    0
		db    0
		db    0
		db  22h	; "
		db  14h
		db    6
		db    6
		db    6
		db    6
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    6
		db    6
		db    6
		db    6
		db    6
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
byte_18D90	db 22h			; ...
		db  1Fh
		db  1Ch
		db  1Ch
		db    0
		db  13h
		db  22h	; "
		db  23h	; #
		db  1Dh
		db  1Fh
		db  1Bh
		db  25h	; %
		db  1Ch
		db  1Bh
		db  27h	; '
		db  19h
		db  27h	; '
		db  12h
		db  1Bh
		db  20h
		db  1Eh
		db  20h
		db  22h	; "
		db  1Dh
		db  23h	; #
		db  1Bh
		db  15h
		db  1Ch
		db  1Ah
		db  19h
		db  19h
		db  20h
		db  17h
		db  15h
		db  22h	; "
		db  22h	; "
		db  1Bh
		db  1Bh
		db  1Ah
		db  1Ah
		db  21h	; !
		db  21h	; !
		db  22h	; "
		db  15h
		db  1Fh
		db  19h
		db  1Ah
		db  13h
		db  0Fh
		db  10h
		db  23h	; #
		db  25h	; %
		db  24h	; $
		db  24h	; $
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_18DD0	dw 0			; ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		dw 0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    0
		db    0
		db  57h	; W
		db  5Dh	; ]
		db  5Fh	; _
		db  77h	; w
		db  77h	; w
		db  7Fh	; 
		db  7Fh	; 
		db 0FFh
		db 0C0h	; ¿
		db  40h	; @
		db  70h	; p
		db 0F0h	; 
		db 0C0h	; ¿
		db  40h	; @
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FFh
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A2h	; ¢
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Ch
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db 0FFh
		db 0FCh	; ¸
		db 0F4h	; Ù
		db  90h	; ê
		db    2
		db    2
		db    2
		db    2
		db    2
		db    0
		db    0
		db    0
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db 0AAh	; ™
		db 0ABh	; ´
		db 0AFh	; Ø
		db 0BDh	; Ω
		db 0FFh
		db 0FFh
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0EAh	; Í
		db 0F9h	; ˘
		db 0F8h	; ¯
		db 0F8h	; ¯
		db 0E8h	; Ë
		db 0A8h	; ®
		db  94h	; î
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db  69h	; i
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ah
		db    1
		db    2
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db  55h	; U
		db 0A5h	; •
		db  95h	; ï
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db  54h	; T
		db 0A8h	; ®
		db 0A8h	; ®
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db    6
		db    6
		db    1
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db    0
		db    0
		db    1
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db  17h
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A5h	; •
		db  95h	; ï
		db 0F4h	; Ù
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    1
		db    3
		db  5Fh	; _
		db  75h	; u
		db  7Dh	; }
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0FDh	; ˝
		db 0FFh
		db 0FCh	; ¸
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Bh	; +
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0BEh	; æ
		db 0BEh	; æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    3
		db  8Bh	; ã
		db 0ABh	; ´
		db 0AAh	; ™
		db  30h	; 0
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0F0h	; 
		db 0D0h	; –
		db  40h	; @
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    2
		db    2
		db    0
		db  9Ah	; ö
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0ABh	; ´
		db 0ABh	; ´
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AFh	; Ø
		db 0BFh	; ø
		db 0F7h	; ˜
		db 0FFh
		db 0FFh
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0E6h	; Ê
		db 0E1h	; ·
		db 0E0h	; ‡
		db 0A0h	; †
		db 0A0h	; †
		db  50h	; P
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A4h	; §
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  29h	; )
		db    6
		db  0Ah
		db  2Ah	; *
		db  29h	; )
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db  55h	; U
		db  96h	; ñ
		db  56h	; V
		db  69h	; i
		db  69h	; i
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db  50h	; P
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db  86h	; Ü
		db  86h	; Ü
		db    5
		db    1
		db    1
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  6Ah	; j
		db  35h	; 5
		db 0FFh
		db 0FFh
		db 0A0h	; †
		db 0A0h	; †
		db  81h	; Å
		db  95h	; ï
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db  40h	; @
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    1
		db    0
		db    0
		db  6Ah	; j
		db  6Ah	; j
		db  1Ah
		db  5Ah	; Z
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db    7
		db 0A0h	; †
		db 0A0h	; †
		db 0A5h	; •
		db 0A5h	; •
		db  94h	; î
		db 0F4h	; Ù
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db  55h	; U
		db  57h	; W
		db  57h	; W
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db  1Fh
		db  3Fh	; ?
		db 0F0h	; 
		db  50h	; P
		db 0DCh	; ‹
		db 0FCh	; ¸
		db 0F0h	; 
		db 0D0h	; –
		db 0F0h	; 
		db 0C0h	; ¿
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0E0h	; ‡
		db 0E8h	; Ë
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db    3
		db  0Fh
		db  0Fh
		db  0Fh
		db  3Fh	; ?
		db 0BFh	; ø
		db 0BDh	; Ω
		db 0A4h	; §
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Bh	; k
		db  6Fh	; o
		db 0BFh	; ø
		db 0BFh	; ø
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db 0FAh	; ˙
		db 0FEh	; ˛
		db  7Eh	; ~
		db 0FEh	; ˛
		db 0FAh	; ˙
		db 0AAh	; ™
		db 0A5h	; •
		db 0AAh	; ™
		db  9Ah	; ö
		db  6Ah	; j
		db  1Ah
		db    0
		db    0
		db    0
		db    0
		db 0A8h	; ®
		db 0A0h	; †
		db  80h	; Ä
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  95h	; ï
		db  69h	; i
		db 0A5h	; •
		db  96h	; ñ
		db  9Ah	; ö
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db  55h	; U
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  1Ah
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  81h	; Å
		db  95h	; ï
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db  1Ah
		db  1Ah
		db  1Ah
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Dh	; ]
		db  1Fh
		db  1Fh
		db 0A0h	; †
		db 0A0h	; †
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0D4h	; ‘
		db 0F4h	; Ù
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db  55h	; U
		db  57h	; W
		db  57h	; W
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db  1Fh
		db  3Fh	; ?
		db 0F0h	; 
		db  50h	; P
		db 0DCh	; ‹
		db 0FCh	; ¸
		db 0F0h	; 
		db 0D0h	; –
		db 0F0h	; 
		db 0C0h	; ¿
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0E0h	; ‡
		db 0E8h	; Ë
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db    3
		db  0Fh
		db  0Fh
		db  0Fh
		db  3Fh	; ?
		db 0BFh	; ø
		db 0BDh	; Ω
		db 0A4h	; §
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Bh	; k
		db  6Fh	; o
		db 0BFh	; ø
		db 0BFh	; ø
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db 0FAh	; ˙
		db 0FEh	; ˛
		db  7Eh	; ~
		db 0FEh	; ˛
		db 0FAh	; ˙
		db 0AAh	; ™
		db 0A5h	; •
		db 0AAh	; ™
		db  9Ah	; ö
		db  6Ah	; j
		db  1Ah
		db    0
		db    0
		db    0
		db    0
		db 0A8h	; ®
		db 0A0h	; †
		db  80h	; Ä
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  95h	; ï
		db  69h	; i
		db 0A5h	; •
		db 0A6h	; ¶
		db  96h	; ñ
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db  55h	; U
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db  16h
		db  1Ah
		db  0Ah
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    1
		db    7
		db    7
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A5h	; •
		db 0A4h	; §
		db  95h	; ï
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FFh
		db 0A0h	; †
		db 0A0h	; †
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  54h	; T
		db  50h	; P
		db  40h	; @
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db  14h
		db  55h	; U
		db  55h	; U
		db  7Dh	; }
		db 0F7h	; ˜
		db  77h	; w
		db  7Fh	; 
		db 0DDh	; ›
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db  0Fh
		db  0Fh
		db  0Fh
		db    3
		db    1
		db 0A9h	; ©
		db  3Dh	; =
		db  2Ah	; *
		db 0EAh	; Í
		db 0DAh	; ⁄
		db 0FAh	; ˙
		db 0FEh	; ˛
		db 0FDh	; ˝
		db 0AFh	; Ø
		db  40h	; @
		db  50h	; P
		db 0A0h	; †
		db 0A4h	; §
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A9h	; ©
		db 0EAh	; Í
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    6
		db  3Fh	; ?
		db 0AAh	; ™
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0E8h	; Ë
		db  6Fh	; o
		db  9Bh	; õ
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db  69h	; i
		db  94h	; î
		db 0A8h	; ®
		db 0A8h	; ®
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db  15h
		db    0
		db    0
		db    0
		db    0
		db 0D8h	; ÿ
		db 0D8h	; ÿ
		db 0D0h	; –
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db  1Ah
		db  16h
		db  15h
		db  1Ah
		db  1Ah
		db  1Ah
		db  1Ah
		db  1Ah
		db  98h	; ò
		db  68h	; h
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A4h	; §
		db 0A4h	; §
		db 0A0h	; †
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  90h	; ê
		db  90h	; ê
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    1
		db    3
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  69h	; i
		db  4Fh	; O
		db  7Fh	; 
		db 0FFh
		db 0FFh
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  55h	; U
		db  55h	; U
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db  15h
		db  15h
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  54h	; T
		db  7Ch	; |
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  28h	; (
		db  15h
		db  15h
		db  17h
		db  17h
		db    7
		db  0Fh
		db  0Fh
		db  2Bh	; +
		db 0D4h	; ‘
		db 0F7h	; ˜
		db  7Fh	; 
		db  7Eh	; ~
		db 0F6h	; ˆ
		db 0FEh	; ˛
		db 0FAh	; ˙
		db 0FAh	; ˙
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AFh	; Ø
		db 0AFh	; Ø
		db  9Fh	; ü
		db 0A4h	; §
		db  92h	; í
		db  4Ah	; J
		db  6Ah	; j
		db  9Ah	; ö
		db 0FCh	; ¸
		db 0FFh
		db 0DFh	; ﬂ
		db 0F7h	; ˜
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db    0
		db    0
		db    0
		db    0
		db    0
unk_19285	db    0
		db    0
		db 0C0h	; ¿
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FFh
		db 0AFh	; Ø
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  6Ah	; j
		db  66h	; f
		db 0AAh	; ™
		db 0EAh	; Í
		db 0EAh	; Í
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A5h	; •
		db  9Ah	; ö
		db  95h	; ï
		db  95h	; ï
		db  9Ah	; ö
		db  56h	; V
		db  55h	; U
		db  65h	; e
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A4h	; §
		db 0A0h	; †
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  9Ah	; ö
		db  6Bh	; k
		db  3Fh	; ?
		db  0Fh
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db    0
		db    0
		db    0
		db    0
		db    0
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db    2
		db    2
		db    0
		db  90h	; ê
		db 0A0h	; †
		db 0A4h	; §
		db 0A8h	; ®
		db  94h	; î
		db  7Ch	; |
		db  7Fh	; 
		db 0BFh	; ø
		db  56h	; V
		db  0Ah
		db    6
		db    2
		db    1
		db    0
		db 0C0h	; ¿
		db  40h	; @
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db 0A4h	; §
		db  1Fh
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db  6Ah	; j
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db  1Ah
		db  0Ah
		db    6
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A8h	; ®
		db 0A8h	; ®
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db    5
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db    6
		db    6
		db    6
		db    6
		db  54h	; T
		db  57h	; W
		db  5Fh	; _
		db  7Fh	; 
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0F9h	; ˘
		db 0F5h	; ı
		db 0F5h	; ı
		db 0F4h	; Ù
		db    0
		db    0
		db  15h
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db  50h	; P
		db  50h	; P
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db    5
		db    5
		db    5
		db    5
		db    7
		db    5
		db    5
		db    1
		db  55h	; U
		db  55h	; U
		db  5Fh	; _
		db 0FDh	; ˝
		db 0DDh	; ›
		db 0DFh	; ﬂ
		db 0FFh
		db 0F7h	; ˜
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A4h	; §
		db 0AFh	; Ø
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db    3
		db    3
		db  0Bh
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0FFh
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FFh
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0EAh	; Í
		db 0FAh	; ˙
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  9Ah	; ö
		db 0A4h	; §
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A5h	; •
		db 0A6h	; ¶
		db 0BFh	; ø
		db 0BFh	; ø
		db  97h	; ó
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0DCh	; ‹
		db 0D0h	; –
		db  80h	; Ä
		db 0A8h	; ®
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  5Ah	; Z
		db  96h	; ñ
		db 0A0h	; †
		db  94h	; î
		db  7Fh	; 
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  95h	; ï
		db  1Ah
		db  6Ah	; j
		db  95h	; ï
		db  95h	; ï
		db  9Ah	; ö
		db  56h	; V
		db  66h	; f
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A5h	; •
		db 0A0h	; †
		db  90h	; ê
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0AAh	; ™
		db  59h	; Y
		db  67h	; g
		db  9Fh	; ü
		db 0BCh	; º
		db    0
		db  40h	; @
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db    0
		db  0Ah
		db  0Ah
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FDh	; ˝
		db  7Fh	; 
		db  7Fh	; 
		db  9Fh	; ü
		db    1
		db    0
		db    0
		db    0
		db 0CAh	;  
		db 0CAh	;  
		db 0C2h	; ¬
		db  42h	; B
		db    2
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  90h	; ê
		db  80h	; Ä
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    1
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    1
		db  2Ah	; *
		db  2Ah	; *
		db  2Bh	; +
		db  27h	; '
		db  5Fh	; _
		db  5Fh	; _
		db  5Fh	; _
		db  7Fh	; 
		db  80h	; Ä
		db  40h	; @
		db  40h	; @
		db 0D5h	; ’
		db 0F5h	; ı
		db 0F5h	; ı
		db 0D4h	; ‘
		db  50h	; P
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    1
		db    3
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db 0F5h	; ı
		db    1
		db    1
		db    3
		db    3
		db    3
		db    3
		db    1
		db  0Ah
		db 0DDh	; ›
		db 0DDh	; ›
		db 0F5h	; ı
		db 0F5h	; ı
		db  7Dh	; }
		db 0FFh
		db 0FEh	; ˛
		db  7Eh	; ~
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db 0A8h	; ®
		db    0
		db    0
		db    0
		db    2
		db    9
		db 0FFh
		db 0FFh
		db 0FFh
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  66h	; f
		db  66h	; f
		db  66h	; f
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0EAh	; Í
		db 0E9h	; È
		db 0E9h	; È
		db 0EAh	; Í
		db 0EAh	; Í
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db 0FFh
		db  35h	; 5
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db  4Ah	; J
		db  8Ah	; ä
		db    6
		db    1
		db    1
		db    1
		db    2
		db    2
		db 0AAh	; ™
		db 0AFh	; Ø
		db 0BFh	; ø
		db 0BFh	; ø
		db  7Fh	; 
		db  55h	; U
		db  96h	; ñ
		db  5Ah	; Z
		db  9Ah	; ö
		db 0FEh	; ˛
		db 0FAh	; ˙
		db 0E8h	; Ë
		db  50h	; P
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  56h	; V
		db  65h	; e
		db  5Ah	; Z
		db  96h	; ñ
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A5h	; •
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    2
		db  90h	; ê
		db  90h	; ê
		db  94h	; î
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db  6Ah	; j
		db  29h	; )
		db  16h
		db  0Ah
		db    6
		db    6
		db    1
		db    1
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db    0
		db    1
		db  55h	; U
		db    1
		db    0
		db    2
		db    2
		db    2
		db    0
		db  55h	; U
		db  55h	; U
		db  57h	; W
		db  0Fh
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A9h	; ©
		db 0A5h	; •
		db  9Dh	; ù
		db  7Dh	; }
		db 0FDh	; ˝
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  55h	; U
		db    1
		db    0
		db  67h	; g
		db  7Fh	; 
		db  3Fh	; ?
		db  0Fh
		db  0Fh
		db  50h	; P
		db  50h	; P
		db  55h	; U
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    3
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  9Eh	; û
		db 0AAh	; ™
		db  2Ah	; *
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    9
		db    5
		db    0
		db    0
		db  2Ah	; *
		db 0AAh	; ™
		db  9Ah	; ö
		db 0A6h	; ¶
		db  69h	; i
		db 0D9h	; Ÿ
		db    0
		db    0
		db    0
		db 0A0h	; †
		db 0A8h	; ®
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db    1
		db    6
		db  5Ah	; Z
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0A8h	; ®
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    5
		db  15h
		db  35h	; 5
		db 0D5h	; ’
		db 0D5h	; ’
		db 0F5h	; ı
		db 0B5h	; µ
		db 0BDh	; Ω
		db  40h	; @
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db 0FFh
		db 0FFh
		db 0FFh
		db  3Dh	; =
		db    6
		db    0
		db    0
		db    0
		db 0F6h	; ˆ
		db 0F6h	; ˆ
		db 0D9h	; Ÿ
		db  62h	; b
		db    2
		db    2
		db    2
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  5Ah	; Z
		db  9Ah	; ö
		db  9Ah	; ö
		db  96h	; ñ
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A4h	; §
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A2h	; ¢
		db  8Ah	; ä
		db 0ADh	; ≠
		db 0ACh	; ¨
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A8h	; ®
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db  60h	; `
		db  90h	; ê
		db  90h	; ê
		db  80h	; Ä
		db  40h	; @
		db    0
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  35h	; 5
		db  3Fh	; ?
		db  3Fh	; ?
		db 0A8h	; ®
		db 0A0h	; †
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  40h	; @
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db  69h	; i
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  3Fh	; ?
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db  15h
		db    5
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  54h	; T
		db  54h	; T
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db  69h	; i
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    7
		db  0Bh
		db  29h	; )
		db  2Ah	; *
		db  2Ah	; *
		db  0Fh
		db  3Fh	; ?
		db 0FFh
		db 0FFh
		db 0F4h	; Ù
		db 0D0h	; –
		db    0
		db  90h	; ê
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  0Fh
		db  9Fh	; ü
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db  0Ah
		db  29h	; )
		db  2Ah	; *
		db  6Ah	; j
		db  5Ah	; Z
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  69h	; i
		db  6Ah	; j
		db 0AAh	; ™
		db  9Ah	; ö
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A7h	; ß
		db 0B5h	; µ
		db 0A7h	; ß
		db 0A7h	; ß
		db 0ABh	; ´
		db 0A9h	; ©
		db  80h	; Ä
		db  40h	; @
		db  54h	; T
		db  54h	; T
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  3Ch	; <
		db    0
		db    0
		db    0
		db    0
		db  29h	; )
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db  66h	; f
		db 0B5h	; µ
		db 0B5h	; µ
		db 0B5h	; µ
		db 0BDh	; Ω
		db 0AFh	; Ø
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db  54h	; T
		db  54h	; T
		db  54h	; T
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  26h	; &
		db  69h	; i
		db  99h	; ô
		db 0A4h	; §
		db  94h	; î
		db  94h	; î
		db  94h	; î
		db  84h	; Ñ
		db  84h	; Ñ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db  58h	; X
		db  1Ah
		db  26h	; &
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  6Ah	; j
		db  80h	; Ä
		db  80h	; Ä
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    9
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F4h	; Ù
		db 0FCh	; ¸
		db 0FFh
		db  3Fh	; ?
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db 0F6h	; ˆ
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  40h	; @
		db  54h	; T
		db  55h	; U
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  2Fh	; /
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  2Ah	; *
		db    0
		db    0
		db    0
		db    0
		db    0
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db  3Fh	; ?
		db  7Fh	; 
		db 0FFh
		db 0FFh
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  57h	; W
		db  57h	; W
		db    0
		db    0
		db  42h	; B
		db  5Ah	; Z
		db  7Ah	; z
		db 0DAh	; ⁄
		db  5Ah	; Z
		db  7Ah	; z
		db    2
		db  2Ah	; *
		db 0AAh	; ™
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0A4h	; §
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0FFh
		db 0CBh	; À
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0EAh	; Í
		db 0EAh	; Í
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A0h	; †
		db  80h	; Ä
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db 0A4h	; §
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0B4h	; ¥
		db  50h	; P
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db  57h	; W
		db  55h	; U
		db  1Dh
		db    3
		db  2Bh	; +
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FEh	; ˛
		db 0DFh	; ﬂ
		db 0FFh
		db 0FFh
		db 0FAh	; ˙
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0EAh	; Í
		db 0FAh	; ˙
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A5h	; •
		db  6Ah	; j
		db  65h	; e
		db  55h	; U
		db  5Ah	; Z
		db  6Ah	; j
		db  5Ah	; Z
		db  99h	; ô
		db  9Ah	; ö
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A4h	; §
		db  90h	; ê
		db  40h	; @
		db    0
		db    0
		db  40h	; @
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  96h	; ñ
		db  81h	; Å
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  80h	; Ä
		db  80h	; Ä
		db  96h	; ñ
		db  5Ah	; Z
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db    2
		db    2
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  2Ah	; *
		db  2Ah	; *
		db  19h
		db    7
		db    7
		db    0
		db    0
		db    0
		db 0A0h	; †
		db  50h	; P
		db 0C0h	; ¿
		db 0F0h	; 
		db 0FCh	; ¸
		db 0F7h	; ˜
		db 0FDh	; ˝
		db  3Ch	; <
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    1
		db  15h
		db  15h
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  15h
		db    0
		db    0
		db    1
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    1
		db    3
		db    3
		db  2Ah	; *
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  67h	; g
		db 0FFh
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db  55h	; U
		db  57h	; W
		db  57h	; W
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db  1Fh
		db  3Fh	; ?
		db 0F0h	; 
		db  50h	; P
		db 0DCh	; ‹
		db 0FCh	; ¸
		db 0F0h	; 
		db 0D0h	; –
		db 0F0h	; 
		db 0C0h	; ¿
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0E0h	; ‡
		db 0E8h	; Ë
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db    3
		db  0Fh
		db  0Fh
		db  0Fh
		db  3Fh	; ?
		db 0BFh	; ø
		db 0BDh	; Ω
		db 0A4h	; §
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Bh	; k
		db  6Fh	; o
		db 0BFh	; ø
		db 0BFh	; ø
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db 0FAh	; ˙
		db 0FEh	; ˛
		db  7Eh	; ~
		db 0FEh	; ˛
		db 0FAh	; ˙
		db 0AAh	; ™
		db 0A5h	; •
		db 0AAh	; ™
		db  9Ah	; ö
		db  6Ah	; j
		db  1Ah
		db    0
		db    0
		db    0
		db    0
		db 0A8h	; ®
		db 0A0h	; †
		db  80h	; Ä
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  95h	; ï
		db  69h	; i
		db 0A5h	; •
		db 0A6h	; ¶
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db  55h	; U
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A0h	; †
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  1Ah
		db  1Ah
		db  1Ah
		db    6
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db  15h
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    6
		db    1
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    1
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  7Fh	; 
		db  5Fh	; _
		db  5Fh	; _
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A5h	; •
		db  55h	; U
		db 0D0h	; –
		db 0F4h	; Ù
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    1
		db  55h	; U
		db  5Fh	; _
		db  75h	; u
		db  7Dh	; }
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0FEh	; ˛
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0AAh	; ™
		db  5Fh	; _
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BAh	; ∫
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FDh	; ˝
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A7h	; ß
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db    1
		db    0
		db    0
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BDh	; Ω
		db  96h	; ñ
		db  5Ah	; Z
		db 0AAh	; ™
		db  19h
		db  15h
		db 0FEh	; ˛
		db 0D6h	; ÷
		db  6Ah	; j
		db 0AAh	; ™
		db 0A9h	; ©
		db  95h	; ï
		db  55h	; U
		db  59h	; Y
		db  5Fh	; _
		db  0Fh
		db  83h	; É
		db  43h	; C
		db  40h	; @
		db 0A0h	; †
		db 0A8h	; ®
		db  6Ah	; j
		db 0C0h	; ¿
		db 0F0h	; 
		db 0FCh	; ¸
		db  7Ch	; |
		db  3Ch	; <
		db    0
		db    0
		db    0
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  96h	; ñ
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A4h	; §
		db 0A4h	; §
		db  90h	; ê
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  16h
		db  29h	; )
		db  2Ah	; *
		db 0AAh	; ™
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db 0A4h	; §
		db 0A4h	; §
		db 0EAh	; Í
		db 0DAh	; ⁄
		db 0F6h	; ˆ
		db  3Fh	; ?
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0F0h	; 
		db 0F0h	; 
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db    1
		db    0
		db    2
		db    2
		db    2
		db    2
		db  56h	; V
		db  55h	; U
		db  57h	; W
		db  17h
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0D5h	; ’
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  3Ch	; <
		db    1
		db    5
		db    5
		db    5
		db    5
		db    7
		db    5
		db    5
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db  5Fh	; _
		db 0FDh	; ˝
		db 0DDh	; ›
		db 0DFh	; ﬂ
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db    0
		db 0A3h	; £
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A8h	; ®
		db 0FFh
		db 0FFh
		db 0F5h	; ı
		db 0FCh	; ¸
		db  4Ch	; L
		db    0
		db    0
		db    0
		db    1
		db    3
		db  0Bh
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0FFh
		db 0FFh
		db 0BFh	; ø
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0EAh	; Í
		db 0FAh	; ˙
		db 0FEh	; ˛
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db 0A4h	; §
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0AAh	; ™
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db  80h	; Ä
		db 0BFh	; ø
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db  94h	; î
		db    0
		db    0
		db 0F0h	; 
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  6Ah	; j
		db 0AAh	; ™
		db  6Ah	; j
		db  9Ah	; ö
		db 0A4h	; §
		db 0A4h	; §
		db  94h	; î
		db  70h	; p
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  29h	; )
		db    5
		db    2
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A5h	; •
		db  95h	; ï
		db  59h	; Y
		db  69h	; i
		db 0A9h	; ©
		db 0A9h	; ©
		db  5Ah	; Z
		db  56h	; V
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A4h	; §
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A4h	; §
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  3Ch	; <
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ah
		db  0Ah
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db  7Fh	; 
		db  7Fh	; 
		db  9Fh	; ü
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db  70h	; p
		db 0D0h	; –
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0A4h	; §
		db 0A0h	; †
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  90h	; ê
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    2
		db 0A0h	; †
		db 0A0h	; †
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  15h
		db    5
		db    1
		db    0
		db    0
		db  45h	; E
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db  50h	; P
		db    0
		db    2
		db  56h	; V
		db  56h	; V
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db  17h
		db 0A8h	; ®
		db 0A4h	; §
		db  7Dh	; }
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db 0FDh	; ˝
		db 0F4h	; Ù
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    0
		db    0
		db    0
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  54h	; T
		db  15h
		db  15h
		db  15h
		db  17h
		db  17h
		db  17h
		db    7
		db    3
		db  7Ch	; |
		db 0D4h	; ‘
		db 0F7h	; ˜
		db  7Fh	; 
		db  7Ch	; |
		db 0F4h	; Ù
		db 0FCh	; ¸
		db 0FCh	; ¸
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Bh
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0F0h	; 
		db 0F8h	; ¯
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AAh	; ™
		db 0ABh	; ´
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    2
		db    2
		db    2
		db    2
		db    0
		db    0
		db    0
		db    0
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A5h	; •
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  55h	; U
		db 0AFh	; Ø
		db 0BFh	; ø
		db 0FFh
		db 0FDh	; ˝
		db 0F5h	; ı
		db 0DAh	; ⁄
		db  6Ah	; j
		db 0A9h	; ©
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db  15h
		db  29h	; )
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  65h	; e
		db  56h	; V
		db  96h	; ñ
		db  95h	; ï
		db  59h	; Y
		db  6Ah	; j
		db  6Ah	; j
		db 0A6h	; ¶
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  60h	; `
		db  68h	; h
		db 0A8h	; ®
		db 0AAh	; ™
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A4h	; §
		db  9Ah	; ö
		db  86h	; Ü
		db  45h	; E
		db    1
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db    6
		db  3Dh	; =
		db 0FFh
		db 0FFh
		db 0A0h	; †
		db 0A0h	; †
		db  81h	; Å
		db  95h	; ï
		db  95h	; ï
		db  54h	; T
		db  50h	; P
		db  40h	; @
		db    0
		db  50h	; P
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    1
		db    0
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Fh	; _
		db  7Fh	; 
		db  7Fh	; 
		db  3Fh	; ?
		db  80h	; Ä
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db 0D0h	; –
		db 0F0h	; 
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    3
		db  0Fh
		db    0
		db    0
		db    0
		db    0
		db  3Ch	; <
		db 0FFh
		db 0FFh
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db  2Ah	; *
		db    0
		db    0
		db    8
		db  2Bh	; +
		db 0ABh	; ´
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Fh
		db  3Fh	; ?
		db 0FFh
		db 0FDh	; ˝
		db 0FFh
		db 0D0h	; –
		db  82h	; Ç
		db  4Ah	; J
		db    0
		db 0C0h	; ¿
		db 0C2h	; ¬
		db 0CAh	;  
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Fh	; /
		db 0ABh	; ´
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A4h	; §
		db 0A0h	; †
		db 0FFh
		db 0DFh	; ﬂ
		db  50h	; P
		db  80h	; Ä
		db  40h	; @
		db    0
		db    0
		db    0
		db  55h	; U
		db  57h	; W
		db  57h	; W
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db  1Fh
		db  0Bh
		db 0F0h	; 
		db  52h	; R
		db 0DEh	; ﬁ
		db 0FEh	; ˛
		db 0DAh	; ⁄
		db 0DAh	; ⁄
		db 0FAh	; ˙
		db 0FEh	; ˛
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  90h	; ê
		db    2
		db  9Ah	; ö
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A4h	; §
		db  90h	; ê
		db  90h	; ê
		db  40h	; @
		db  90h	; ê
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0BFh	; ø
		db 0ABh	; ´
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  9Ah	; ö
		db 0A5h	; •
		db 0A0h	; †
		db 0EAh	; Í
		db 0FAh	; ˙
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  19h
		db 0A5h	; •
		db  95h	; ï
		db  96h	; ñ
		db  95h	; ï
		db  99h	; ô
		db  5Ah	; Z
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  69h	; i
		db 0A9h	; ©
		db 0A9h	; ©
		db  64h	; d
		db  64h	; d
		db 0A4h	; §
		db 0A4h	; §
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db  0Ah
		db  60h	; `
		db  90h	; ê
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  90h	; ê
		db  70h	; p
		db    5
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A8h	; ®
		db    3
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0F0h	; 
		db 0FCh	; ¸
		db 0F7h	; ˜
		db  3Dh	; =
		db  3Fh	; ?
		db  0Ch
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  1Ah
		db  1Ah
		db  1Ah
		db  0Ah
		db  0Ah
		db    6
		db    6
		db    6
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db    0
		db  14h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    1
		db    0
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db  40h	; @
		db  40h	; @
		db    6
		db    6
		db  56h	; V
		db  56h	; V
		db  55h	; U
		db  17h
		db  0Fh
		db  3Fh	; ?
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  95h	; ï
		db 0F5h	; ı
		db 0F5h	; ı
		db 0F4h	; Ù
		db 0F0h	; 
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  40h	; @
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db  5Fh	; _
		db  75h	; u
		db  7Dh	; }
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    5
		db    1
		db    3
		db  0Bh
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0A9h	; ©
		db 0FDh	; ˝
		db 0FFh
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FEh	; ˛
		db 0BEh	; æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  16h
		db 0AEh	; Æ
		db 0AAh	; ™
		db 0AAh	; ™
		db  59h	; Y
		db 0ABh	; ´
		db 0ABh	; ´
		db 0A9h	; ©
		db 0A5h	; •
		db  80h	; Ä
		db 0BFh	; ø
		db 0FFh
		db 0FDh	; ˝
		db 0F7h	; ˜
		db 0C0h	; ¿
		db    0
		db  82h	; Ç
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db 0A0h	; †
		db  25h	; %
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db    1
		db  1Ah
		db  55h	; U
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0A9h	; ©
		db  59h	; Y
		db  96h	; ñ
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  68h	; h
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  3Ah	; :
		db  3Eh	; >
		db  3Eh	; >
		db  3Dh	; =
		db  3Fh	; ?
		db  3Fh	; ?
		db  1Fh
		db  57h	; W
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A9h	; ©
		db  6Ah	; j
		db  5Ah	; Z
		db 0D5h	; ’
		db 0D5h	; ’
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A5h	; •
		db  57h	; W
		db  57h	; W
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  50h	; P
		db 0F4h	; Ù
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    1
		db    5
		db    5
		db    5
		db    5
		db    5
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db  5Fh	; _
		db  75h	; u
		db  7Dh	; }
		db 0DFh	; ﬂ
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db    5
		db    1
		db  2Bh	; +
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0DFh	; ﬂ
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db 0BCh	; º
		db  98h	; ò
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0FCh	; ¸
		db  29h	; )
		db  29h	; )
		db  25h	; %
		db  29h	; )
		db  2Ah	; *
		db    9
		db    1
		db    1
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db  69h	; i
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  50h	; P
		db 0A0h	; †
		db  90h	; ê
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db  95h	; ï
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Ch	; |
		db 0FCh	; ¸
		db 0F0h	; 
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  1Ah
		db  55h	; U
		db 0A5h	; •
		db 0A5h	; •
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  6Ah	; j
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db  99h	; ô
		db 0A6h	; ¶
		db  9Ah	; ö
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db  0Ah
		db 0F6h	; ˆ
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0F5h	; ı
		db 0FDh	; ˝
		db    0
		db 0A0h	; †
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db  1Ah
		db  6Ah	; j
		db  6Ah	; j
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  95h	; ï
		db  95h	; ï
		db  55h	; U
		db  6Ah	; j
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  6Ah	; j
		db  56h	; V
		db  7Fh	; 
		db  7Fh	; 
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  80h	; Ä
		db  95h	; ï
		db  55h	; U
		db 0D5h	; ’
		db 0F4h	; Ù
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db  7Ch	; |
		db 0DCh	; ‹
		db 0FCh	; ¸
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    0
		db    0
		db  57h	; W
		db  5Dh	; ]
		db  5Fh	; _
		db  77h	; w
		db  77h	; w
		db  7Fh	; 
		db  7Fh	; 
		db  3Fh	; ?
		db 0C0h	; ¿
		db  40h	; @
		db  70h	; p
		db 0F0h	; 
		db 0C0h	; ¿
		db  40h	; @
		db 0C0h	; ¿
		db    0
		db 0FCh	; ¸
		db  3Ch	; <
		db  3Ch	; <
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  7Fh	; 
		db    2
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0BFh	; ø
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db  9Bh	; õ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A8h	; ®
		db  9Fh	; ü
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A4h	; §
		db  40h	; @
		db    0
		db    0
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  0Ah
		db    6
		db    2
		db    1
		db    1
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  69h	; i
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  68h	; h
		db 0F8h	; ¯
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    1
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db  57h	; W
		db 0A5h	; •
		db  95h	; ï
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db 0FFh
		db 0FFh
		db  9Fh	; ü
		db  69h	; i
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db    6
		db    6
		db    1
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db    0
		db    0
		db    1
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    1
		db    0
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db  17h
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db  94h	; î
		db 0F4h	; Ù
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db    5
		db    5
		db    5
		db    5
		db    5
		db    1
		db    1
		db    2
		db  5Fh	; _
		db  75h	; u
		db  7Dh	; }
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    3
		db  8Fh	; è
		db 0BFh	; ø
		db    0
		db    0
		db  30h	; 0
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  9Ah	; ö
		db 0BDh	; Ω
		db 0A6h	; ¶
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A4h	; §
		db  50h	; P
		db 0AFh	; Ø
		db 0A5h	; •
		db 0A8h	; ®
		db 0A4h	; §
		db  90h	; ê
		db  40h	; @
		db    0
		db    0
		db    2
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db    5
		db    9
		db 0A9h	; ©
		db  96h	; ñ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  55h	; U
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db  40h	; @
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0A9h	; ©
		db 0A5h	; •
		db  96h	; ñ
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db  10h
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A6h	; ¶
		db 0A2h	; ¢
		db 0A1h	; °
		db  90h	; ê
		db  80h	; Ä
		db  40h	; @
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db  79h	; y
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db  90h	; ê
		db  45h	; E
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db 0D4h	; ‘
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Fh	; _
		db  7Fh	; 
		db  7Fh	; 
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  55h	; U
		db  55h	; U
		db 0D5h	; ’
		db 0F5h	; ı
		db    0
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db    5
		db  15h
		db  15h
		db  15h
		db  15h
		db  17h
		db  17h
		db  17h
		db  54h	; T
		db  54h	; T
		db  7Ch	; |
		db 0D4h	; ‘
		db 0F7h	; ˜
		db  7Fh	; 
		db  7Ch	; |
		db 0F4h	; Ù
		db    7
		db    3
		db    3
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0F4h	; Ù
		db 0FEh	; ˛
		db 0FAh	; ˙
		db 0FEh	; ˛
		db 0BEh	; æ
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0AAh	; ™
		db    0
		db 0A0h	; †
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BAh	; ∫
		db 0FEh	; ˛
		db 0FEh	; ˛
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db    0
		db 0ABh	; ´
		db  5Fh	; _
		db 0BFh	; ø
		db 0BFh	; ø
		db 0A5h	; •
		db 0A6h	; ¶
		db  9Ah	; ö
		db  59h	; Y
		db 0FDh	; ˝
		db 0FEh	; ˛
		db 0DAh	; ⁄
		db  69h	; i
		db 0A9h	; ©
		db 0A5h	; •
		db  96h	; ñ
		db  55h	; U
		db 0A7h	; ß
		db  67h	; g
		db  55h	; U
		db  54h	; T
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FCh	; ¸
		db 0FFh
		db 0DFh	; ﬂ
		db 0CFh	; œ
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  15h
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  59h	; Y
		db  9Ah	; ö
		db  96h	; ñ
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A4h	; §
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  4Ah	; J
		db    2
		db    0
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0A7h	; ß
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    2
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  2Ah	; *
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AFh	; Ø
		db 0AFh	; Ø
		db  9Fh	; ü
		db  24h	; $
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0FCh	; ¸
		db 0FFh
		db 0FFh
		db  3Fh	; ?
		db  0Fh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db    1
		db    0
		db    0
		db    2
		db    2
		db  16h
		db  56h	; V
		db  55h	; U
		db  57h	; W
		db  5Fh	; _
		db  1Fh
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0F9h	; ˘
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FCh	; ¸
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  54h	; T
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db 0F0h	; 
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db  2Ah	; *
		db  57h	; W
		db  57h	; W
		db  5Dh	; ]
		db  5Dh	; ]
		db  1Fh
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db  50h	; P
		db 0DCh	; ‹
		db 0FCh	; ¸
		db 0F0h	; 
		db 0D0h	; –
		db 0D0h	; –
		db 0F0h	; 
		db 0EAh	; Í
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AFh	; Ø
		db 0ABh	; ´
		db  6Bh	; k
		db  6Ah	; j
		db  6Bh	; k
		db 0ABh	; ´
		db 0AFh	; Ø
		db 0BFh	; ø
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0F9h	; ˘
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db    6
		db    1
		db    0
		db    0
		db 0A8h	; ®
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A9h	; ©
		db  54h	; T
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db 0FFh
		db 0FFh
		db  37h	; 7
		db  0Ch
		db    0
		db 0A9h	; ©
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A9h	; ©
		db 0AAh	; ™
		db  6Ah	; j
		db  15h
		db 0FFh
		db 0FEh	; ˛
		db 0F6h	; ˆ
		db 0D9h	; Ÿ
		db  65h	; e
		db  9Ah	; ö
		db  6Ah	; j
		db  6Ah	; j
		db 0E5h	; Â
		db  96h	; ñ
		db  55h	; U
		db  59h	; Y
		db  9Ah	; ö
		db  6Ah	; j
		db  9Ah	; ö
		db 0A5h	; •
		db 0A0h	; †
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Ah
		db    0
		db  80h	; Ä
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  7Ch	; |
		db 0FFh
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  1Ah
		db    2
		db    0
		db    0
		db    0
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0ABh	; ´
		db  29h	; )
		db    8
		db    5
		db    0
		db  80h	; Ä
		db  70h	; p
		db 0FCh	; ¸
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db  6Ah	; j
		db  16h
		db    1
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  1Ah
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db  7Fh	; 
		db  7Fh	; 
		db  93h	; ì
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db  15h
		db  15h
		db    5
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  55h	; U
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    1
		db    0
		db    0
		db    0
		db  50h	; P
		db  55h	; U
		db  55h	; U
		db  41h	; A
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  54h	; T
		db  55h	; U
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db  55h	; U
		db  57h	; W
		db  57h	; W
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db 0F0h	; 
		db  50h	; P
		db 0DCh	; ‹
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  5Dh	; ]
		db  5Dh	; ]
		db  1Fh
		db 0DFh	; ﬂ
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0FCh	; ¸
		db 0F0h	; 
		db 0D0h	; –
		db 0F0h	; 
		db 0E0h	; ‡
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0ABh	; ´
		db 0AAh	; ™
		db 0ABh	; ´
		db 0AFh	; Ø
		db 0AFh	; Ø
		db  9Fh	; ü
		db  7Fh	; 
		db 0FEh	; ˛
		db 0AAh	; ™
		db 0AAh	; ™
		db 0E6h	; Ê
		db 0E9h	; È
		db 0E6h	; Ê
		db 0EAh	; Í
		db  9Ah	; ö
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db  9Fh	; ü
		db  9Fh	; ü
		db  9Fh	; ü
		db 0A0h	; †
		db  50h	; P
		db  40h	; @
		db  80h	; Ä
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0DCh	; ‹
		db 0F0h	; 
		db    0
		db    0
		db    0
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A9h	; ©
		db 0AAh	; ™
		db  6Ah	; j
		db  15h
		db    0
		db 0FDh	; ˝
		db 0F6h	; ˆ
		db 0D5h	; ’
		db  5Ah	; Z
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  9Ah	; ö
		db  69h	; i
		db  94h	; î
		db  90h	; ê
		db 0A0h	; †
		db 0A0h	; †
		db  9Ah	; ö
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  1Ah
		db  1Ah
		db    6
		db    6
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  0Ah
		db    6
		db    2
		db    1
		db    0
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0A5h	; •
		db  9Fh	; ü
		db  9Fh	; ü
		db    6
		db    6
		db    5
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0A4h	; §
		db  7Ch	; |
		db 0FFh
		db 0FFh
		db  3Fh	; ?
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db  5Fh	; _
		db  0Fh
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  15h
		db    1
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  45h	; E
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  54h	; T
		db    0
		db    0
		db  50h	; P
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  55h	; U
		db  40h	; @
		db  54h	; T
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    0
		db    0
		db  57h	; W
		db  5Dh	; ]
		db  5Fh	; _
		db  77h	; w
		db  77h	; w
		db  7Fh	; 
		db  7Fh	; 
		db 0FFh
		db 0C0h	; ¿
		db  40h	; @
		db  70h	; p
		db 0F0h	; 
		db 0C0h	; ¿
		db  40h	; @
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FFh
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A2h	; ¢
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Ch
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db 0FFh
		db 0FCh	; ¸
		db 0F4h	; Ù
		db  90h	; ê
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db  96h	; ñ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  94h	; î
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db  69h	; i
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    3
		db  7Ch	; |
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FFh
		db 0FFh
		db  55h	; U
		db 0A5h	; •
		db  95h	; ï
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db  54h	; T
		db 0A8h	; ®
		db 0A8h	; ®
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db    3
		db    3
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db 0FBh	; ˚
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0EAh	; Í
		db 0AAh	; ™
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db    6
		db    6
		db    1
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db    0
		db    0
		db    1
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db  17h
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A5h	; •
		db  95h	; ï
		db 0F4h	; Ù
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    1
		db    5
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db    0
		db    0
		db    0
		db    2
		db    6
		db  26h	; &
		db 0A6h	; ¶
		db 0A5h	; •
		db    0
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db    5
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db  55h	; U
		db  5Dh	; ]
		db  7Fh	; 
		db 0F7h	; ˜
		db 0DDh	; ›
		db 0DCh	; ‹
		db    0
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    2
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A5h	; •
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db  6Ah	; j
		db  6Ah	; j
		db  68h	; h
		db  90h	; ê
		db 0A4h	; §
		db  69h	; i
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  2Ah	; *
		db  2Ah	; *
		db  29h	; )
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  40h	; @
		db    0
		db    2
		db    0
		db    0
		db    0
		db  0Ah
		db  0Ah
		db  0Eh
		db 0FEh	; ˛
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  1Ah
		db  9Ah	; ö
		db  96h	; ñ
		db 0A6h	; ¶
		db  6Ah	; j
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A4h	; §
		db 0A0h	; †
		db    7
		db  83h	; É
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  30h	; 0
		db    0
		db    0
		db 0FEh	; ˛
		db 0FCh	; ¸
		db 0F1h	; Ò
		db 0F0h	; 
		db 0C0h	; ¿
		db 0C2h	; ¬
		db    2
		db    2
		db  9Ah	; ö
		db  6Ah	; j
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A0h	; †
		db  90h	; ê
		db  80h	; Ä
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db  68h	; h
		db 0F4h	; Ù
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  3Ch	; <
		db  3Ch	; <
		db  0Fh
		db  0Fh
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  40h	; @
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A8h	; ®
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  5Ah	; Z
		db  9Ah	; ö
		db  9Ah	; ö
		db  56h	; V
		db  96h	; ñ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  9Ah	; ö
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0B5h	; µ
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    3
		db    7
		db    7
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db 0CAh	;  
		db 0F2h	; Ú
		db  74h	; t
		db 0A6h	; ¶
		db 0A5h	; •
		db 0A9h	; ©
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0ADh	; ≠
		db 0AFh	; Ø
		db  2Fh	; /
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A5h	; •
		db  64h	; d
		db 0D5h	; ’
		db 0BDh	; Ω
		db 0B5h	; µ
		db  77h	; w
		db 0FFh
		db 0FFh
		db 0DDh	; ›
		db 0DDh	; ›
		db  0Ch
		db  54h	; T
		db  54h	; T
		db  54h	; T
		db  54h	; T
		db 0D4h	; ‘
		db 0D0h	; –
		db 0D0h	; –
		db    0
		db  3Fh	; ?
		db  3Fh	; ?
		db 0FFh
		db 0FFh
		db 0F0h	; 
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db 0DAh	; ⁄
		db 0DAh	; ⁄
		db  6Ah	; j
		db  6Ah	; j
		db  2Ah	; *
		db  0Ah
		db    0
		db    0
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BDh	; Ω
		db 0BEh	; æ
		db 0BEh	; æ
		db 0BFh	; ø
		db 0AFh	; Ø
		db  5Fh	; _
		db 0A9h	; ©
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db  40h	; @
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  54h	; T
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db  3Fh	; ?
		db  0Fh
		db    3
		db    3
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db  54h	; T
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db    0
		db    0
		db    0
		db    0
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db    6
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    2
		db    2
		db 0A4h	; §
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  1Ah
		db  2Ah	; *
		db  2Ah	; *
		db  69h	; i
		db  69h	; i
		db  6Ah	; j
		db  6Ah	; j
		db  95h	; ï
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A6h	; ¶
		db  69h	; i
		db  55h	; U
		db  96h	; ñ
		db  5Ah	; Z
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db  40h	; @
		db  60h	; `
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db    2
		db    2
		db    3
		db    1
		db    1
		db    0
		db    0
		db    0
		db 0FEh	; ˛
		db 0FFh
		db 0FFh
		db 0FFh
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db 0DAh	; ⁄
		db 0DAh	; ⁄
		db  55h	; U
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  96h	; ñ
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db    0
		db    0
		db    0
		db    0
		db  8Ah	; ä
		db  8Ah	; ä
		db  8Ah	; ä
		db  0Eh
		db  0Fh
		db  0Fh
		db  37h	; 7
		db 0FFh
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0E8h	; Ë
		db 0E0h	; ‡
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    3
		db    3
		db    0
		db    0
		db    1
		db    0
		db    0
		db  7Fh	; 
		db 0F7h	; ˜
		db  75h	; u
		db  7Dh	; }
		db 0D5h	; ’
		db  55h	; U
		db  55h	; U
		db  15h
		db 0D0h	; –
		db 0D4h	; ‘
		db  54h	; T
		db  54h	; T
		db  54h	; T
		db  54h	; T
		db  50h	; P
		db  40h	; @
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    1
		db    0
		db    0
		db    0
		db    0
		db    1
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  54h	; T
		db  54h	; T
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    1
		db    0
		db  0Ch
		db  0Ch
		db  3Ch	; <
		db  25h	; %
		db  9Bh	; õ
		db  6Bh	; k
		db 0ABh	; ´
		db    0
		db  30h	; 0
		db  30h	; 0
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0FEh	; ˛
		db 0BEh	; æ
		db 0BEh	; æ
		db 0BEh	; æ
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A4h	; §
		db  90h	; ê
		db  40h	; @
		db 0A0h	; †
		db 0F0h	; 
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  1Dh
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db  5Fh	; _
		db  0Ah
		db    2
		db 0C2h	; ¬
		db 0D0h	; –
		db 0DCh	; ‹
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  7Eh	; ~
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BFh	; ø
		db  3Fh	; ?
		db  3Fh	; ?
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  5Ah	; Z
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  5Dh	; ]
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db  7Eh	; ~
		db 0F9h	; ˘
		db 0F6h	; ˆ
		db 0EAh	; Í
		db  6Ah	; j
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A6h	; ¶
		db  9Ah	; ö
		db 0AAh	; ™
		db  69h	; i
		db  95h	; ï
		db  66h	; f
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  68h	; h
		db  68h	; h
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Ah
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db    0
		db    0
		db    0
		db    0
		db    0
		db  90h	; ê
		db  90h	; ê
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db    5
		db    1
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  40h	; @
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db  15h
		db  15h
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db  55h	; U
		db  57h	; W
		db  57h	; W
		db  5Dh	; ]
		db  1Dh
		db  0Fh
		db  0Bh
		db  29h	; )
		db 0F0h	; 
		db  50h	; P
		db 0DCh	; ‹
		db 0FCh	; ¸
		db 0F0h	; 
		db 0D0h	; –
		db 0F0h	; 
		db 0C0h	; ¿
		db  26h	; &
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A9h	; ©
		db  69h	; i
		db  69h	; i
		db  9Ah	; ö
		db  9Ah	; ö
		db  0Fh
		db  3Fh	; ?
		db  37h	; 7
		db 0FDh	; ˝
		db 0FAh	; ˙
		db 0E9h	; È
		db  66h	; f
		db  9Ah	; ö
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db  58h	; X
		db 0A4h	; §
		db 0A8h	; ®
		db  9Ah	; ö
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db 0A7h	; ß
		db 0ABh	; ´
		db 0ABh	; ´
		db 0A9h	; ©
		db  56h	; V
		db  9Ah	; ö
		db  56h	; V
		db  55h	; U
		db  6Ah	; j
		db 0FEh	; ˛
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db 0A5h	; •
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A9h	; ©
		db 0AAh	; ™
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  80h	; Ä
		db  83h	; É
		db 0BFh	; ø
		db  29h	; )
		db  29h	; )
		db  0Ah
		db  0Ah
		db    2
		db    0
		db    0
		db    0
		db  69h	; i
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db 0A8h	; ®
		db 0A0h	; †
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db  9Ah	; ö
		db  9Ah	; ö
		db  1Ah
		db  1Ah
		db  0Ah
		db    7
		db    3
		db    3
		db 0BCh	; º
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  50h	; P
		db 0C0h	; ¿
		db 0F3h	; Û
		db 0FFh
		db    3
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  15h
		db    1
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db    0
		db    0
		db    0
		db  54h	; T
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db    1
		db    5
		db    5
		db    5
		db    5
		db    5
		db    1
		db  6Bh	; k
		db  55h	; U
		db  55h	; U
		db  5Fh	; _
		db  75h	; u
		db  7Dh	; }
		db  7Fh	; 
		db 0DFh	; ﬂ
		db 0DDh	; ›
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    1
		db    2
		db    6
		db  0Ah
		db  0Ah
		db  1Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db 0FFh
		db 0FCh	; ¸
		db 0F8h	; ¯
		db 0FAh	; ˙
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  29h	; )
		db  9Ah	; ö
		db  9Ah	; ö
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  9Ah	; ö
		db  75h	; u
		db 0FDh	; ˝
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  66h	; f
		db  59h	; Y
		db  80h	; Ä
		db  80h	; Ä
		db  90h	; ê
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  94h	; î
		db  7Fh	; 
		db  29h	; )
		db  15h
		db    2
		db    2
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db  7Fh	; 
		db  9Fh	; ü
		db  9Dh	; ù
		db 0A6h	; ¶
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  5Ah	; Z
		db  66h	; f
		db  65h	; e
		db 0A9h	; ©
		db  9Ah	; ö
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  7Fh	; 
		db  8Fh	; è
		db  83h	; É
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0C0h	; ¿
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db    0
		db    0
		db    0
		db  0Ah
		db  0Ah
		db    6
		db    5
		db  0Ah
		db    6
		db    9
		db  2Ah	; *
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db  69h	; i
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A0h	; †
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  6Ah	; j
		db  6Ah	; j
		db  9Ah	; ö
		db 0A9h	; ©
		db 0A8h	; ®
		db    0
		db    0
		db    1
		db    5
		db  15h
		db  17h
		db  17h
		db    5
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0DAh	; ⁄
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FFh
		db 0A2h	; ¢
		db  82h	; Ç
		db  86h	; Ü
		db  0Ah
		db  59h	; Y
		db  57h	; W
		db  57h	; W
		db  47h	; G
		db 0A8h	; ®
		db 0A4h	; §
		db 0A0h	; †
		db 0A4h	; §
		db 0D5h	; ’
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    0
		db    0
		db  7Fh	; 
		db 0D5h	; ’
		db 0DDh	; ›
		db  7Fh	; 
		db  7Fh	; 
		db 0F7h	; ˜
		db 0FFh
		db  3Fh	; ?
		db  50h	; P
		db 0D0h	; –
		db 0D0h	; –
		db  50h	; P
		db  50h	; P
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db    0
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BEh	; æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db  80h	; Ä
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0ABh	; ´
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0E0h	; ‡
		db 0E0h	; ‡
		db 0E0h	; ‡
		db  0Ah
		db  0Ah
		db  0Bh
		db  0Bh
		db  0Bh
		db    9
		db    2
		db    0
		db 0A6h	; ¶
		db 0F6h	; ˆ
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0F6h	; ˆ
		db  9Ah	; ö
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0AFh	; Ø
		db 0A7h	; ß
		db 0A5h	; •
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A8h	; ®
		db  94h	; î
		db 0E0h	; ‡
		db 0D0h	; –
		db  60h	; `
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db  55h	; U
		db 0A5h	; •
		db  95h	; ï
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db  54h	; T
		db 0A8h	; ®
		db 0A8h	; ®
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db    6
		db    6
		db    1
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  1Eh
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  54h	; T
		db  54h	; T
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db    0
		db    0
		db    1
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    5
		db    0
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db  17h
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db  90h	; ê
		db 0F4h	; Ù
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db 0D0h	; –
		db    0
		db    0
		db    0
		db    0
		db    1
		db    2
		db    6
		db  0Ah
		db    0
		db    0
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  57h	; W
		db  5Fh	; _
		db  5Dh	; ]
		db  5Fh	; _
		db  77h	; w
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BEh	; æ
		db 0C0h	; ¿
		db  40h	; @
		db  70h	; p
		db 0F4h	; Ù
		db 0F9h	; ˘
		db  6Ah	; j
		db 0EAh	; Í
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db  90h	; ê
		db  0Ah
		db  1Ah
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A5h	; •
		db  9Ah	; ö
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db  6Ah	; j
		db  9Ah	; ö
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A5h	; •
		db 0AAh	; ™
		db  9Ah	; ö
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  96h	; ñ
		db  66h	; f
		db  69h	; i
		db  90h	; ê
		db 0A0h	; †
		db 0A4h	; §
		db 0A4h	; §
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0DAh	; ⁄
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db  16h
		db  0Dh
		db  0Fh
		db  0Fh
		db  1Fh
		db  7Fh	; 
		db 0FFh
		db 0F7h	; ˜
		db  9Ah	; ö
		db  9Ah	; ö
		db  52h	; R
		db  42h	; B
		db  41h	; A
		db  40h	; @
		db  55h	; U
		db  41h	; A
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0ACh	; ¨
		db  9Fh	; ü
		db  7Fh	; 
		db  5Fh	; _
		db  5Bh	; [
		db  57h	; W
		db  67h	; g
		db  44h	; D
		db  40h	; @
		db  55h	; U
		db 0D7h	; ◊
		db 0DFh	; ﬂ
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0F5h	; ı
		db 0F1h	; Ò
		db 0F0h	; 
		db 0FDh	; ˝
		db  7Fh	; 
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A5h	; •
		db  5Ah	; Z
		db  11h
		db  55h	; U
		db  55h	; U
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  55h	; U
		db  55h	; U
		db    0
		db 0A0h	; †
		db 0A8h	; ®
		db 0A9h	; ©
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A5h	; •
		db  55h	; U
		db    0
		db    0
		db    0
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FDh	; ˝
		db  75h	; u
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db  15h
		db  15h
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  54h	; T
		db  7Ch	; |
		db  15h
		db  15h
		db  17h
		db  17h
		db  17h
		db    7
		db  0Bh
		db  2Bh	; +
		db 0D4h	; ‘
		db 0F7h	; ˜
		db  7Fh	; 
		db  7Ch	; |
		db 0F4h	; Ù
		db 0FCh	; ¸
		db 0FAh	; ˙
		db 0FAh	; ˙
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A8h	; ®
		db    0
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db 0ABh	; ´
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0A6h	; ¶
		db  9Ah	; ö
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0F9h	; ˘
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db    9
		db    1
		db  1Ah
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db  90h	; ê
		db  70h	; p
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  9Ah	; ö
		db  9Ah	; ö
		db  55h	; U
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  46h	; F
		db  79h	; y
		db 0A9h	; ©
		db  56h	; V
		db  5Ah	; Z
		db  65h	; e
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  99h	; ô
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0BCh	; º
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BDh	; Ω
		db  90h	; ê
		db 0A0h	; †
		db  90h	; ê
		db  2Ah	; *
		db  1Ah
		db    6
		db  0Fh
		db  1Fh
		db  7Fh	; 
		db 0FFh
		db 0F7h	; ˜
		db  7Ah	; z
		db  7Ah	; z
		db  76h	; v
		db  76h	; v
		db  7Dh	; }
		db  7Fh	; 
		db  7Fh	; 
		db 0DFh	; ﬂ
		db  5Ah	; Z
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db 0D5h	; ’
		db 0D4h	; ‘
		db 0A2h	; ¢
		db 0A1h	; °
		db 0A0h	; †
		db  80h	; Ä
		db  15h
		db  55h	; U
		db  50h	; P
		db    0
		db  4Ch	; L
		db 0FFh
		db 0FFh
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    0
		db    0
		db  57h	; W
		db  7Dh	; }
		db  77h	; w
		db  5Fh	; _
		db  5Fh	; _
		db  7Dh	; }
		db  7Dh	; }
		db 0FFh
		db  40h	; @
		db 0C0h	; ¿
		db  40h	; @
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0FFh
		db 0BEh	; æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0ABh	; ´
		db  6Fh	; o
		db 0BFh	; ø
		db  8Ch	; å
		db 0ECh	; Ï
		db 0FCh	; ¸
		db 0FEh	; ˛
		db 0FEh	; ˛
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0EAh	; Í
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A2h	; ¢
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Ch
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db 0FFh
		db 0FCh	; ¸
		db 0F4h	; Ù
		db  90h	; ê
		db    2
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db    9
		db    6
		db    1
		db 0BFh	; ø
		db 0BEh	; æ
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  6Ah	; j
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  94h	; î
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db  69h	; i
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db  55h	; U
		db 0A5h	; •
		db  95h	; ï
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db  54h	; T
		db 0A8h	; ®
		db 0A8h	; ®
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db    6
		db    6
		db    1
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    1
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  45h	; E
		db    0
		db    0
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db  17h
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A5h	; •
		db  95h	; ï
		db 0F4h	; Ù
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    0
		db    0
		db  57h	; W
		db  5Dh	; ]
		db  5Fh	; _
		db  77h	; w
		db  77h	; w
		db  7Fh	; 
		db  7Fh	; 
		db 0FFh
		db 0C0h	; ¿
		db  40h	; @
		db  70h	; p
		db 0F0h	; 
		db 0C0h	; ¿
		db  40h	; @
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FFh
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A2h	; ¢
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Ch
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db 0FFh
		db 0FCh	; ¸
		db 0F4h	; Ù
		db  90h	; ê
		db    2
		db    2
		db    2
		db    2
		db    2
		db    0
		db    0
		db    0
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  94h	; î
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db  69h	; i
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db  80h	; Ä
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  9Fh	; ü
		db  7Fh	; 
		db  7Fh	; 
		db  3Fh	; ?
		db  2Fh	; /
		db  2Fh	; /
		db  2Fh	; /
		db 0AEh	; Æ
		db  55h	; U
		db 0A5h	; •
		db  95h	; ï
		db 0DAh	; ⁄
		db 0FAh	; ˙
		db 0FEh	; ˛
		db 0EAh	; Í
		db 0EAh	; Í
		db  54h	; T
		db 0A8h	; ®
		db 0A8h	; ®
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db 0AEh	; Æ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db    6
		db    6
		db    1
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    0
		db    1
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db  17h
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A5h	; •
		db  95h	; ï
		db 0F4h	; Ù
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db    1
		db    1
		db    1
		db    1
		db  2Bh	; +
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Fh	; _
		db  7Dh	; }
		db  7Dh	; }
		db  5Fh	; _
		db  5Fh	; _
		db 0DFh	; ﬂ
		db 0BFh	; ø
		db 0BFh	; ø
		db 0D0h	; –
		db 0F0h	; 
		db 0D0h	; –
		db 0D0h	; –
		db 0F0h	; 
		db  40h	; @
		db  40h	; @
		db    0
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  6Ah	; j
		db 0ABh	; ´
		db  6Ah	; j
		db 0BEh	; æ
		db 0BEh	; æ
		db 0BAh	; ∫
		db 0BAh	; ∫
		db 0FAh	; ˙
		db 0EAh	; Í
		db 0AAh	; ™
		db 0AAh	; ™
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db  68h	; h
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ch
		db  3Fh	; ?
		db  3Fh	; ?
		db 0AAh	; ™
		db  2Ah	; *
		db  6Ah	; j
		db  9Ah	; ö
		db  66h	; f
		db  59h	; Y
		db  95h	; ï
		db 0A9h	; ©
		db  9Ah	; ö
		db  6Bh	; k
		db  7Fh	; 
		db  7Fh	; 
		db  5Fh	; _
		db  9Fh	; ü
		db  55h	; U
		db  56h	; V
		db 0AAh	; ™
		db 0F8h	; ¯
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db    0
		db    0
		db  7Fh	; 
		db 0FFh
		db 0FCh	; ¸
		db 0F0h	; 
		db  40h	; @
		db    0
		db    0
		db    0
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  65h	; e
		db  59h	; Y
		db  9Ah	; ö
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A6h	; ¶
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  0Ah
		db  0Ah
		db  0Ah
		db    2
		db    2
		db    2
		db    2
		db    2
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db    2
		db    1
		db    1
		db    0
		db    0
		db  15h
		db  55h	; U
		db  15h
		db 0A9h	; ©
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  65h	; e
		db 0FCh	; ¸
		db 0FFh
		db  7Fh	; 
		db 0C0h	; ¿
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    0
		db  40h	; @
		db  54h	; T
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  2Ah	; *
		db    5
		db  15h
		db  55h	; U
		db  57h	; W
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db 0D7h	; ◊
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db 0D4h	; ‘
		db 0F4h	; Ù
		db 0D0h	; –
		db 0D0h	; –
		db 0F0h	; 
		db    0
		db    2
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  97h	; ó
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BEh	; æ
		db 0BEh	; æ
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0EAh	; Í
		db  40h	; @
		db  40h	; @
		db 0C0h	; ¿
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  9Ah	; ö
		db  65h	; e
		db  6Ah	; j
		db 0ABh	; ´
		db  6Ah	; j
		db  9Ah	; ö
		db  7Ah	; z
		db  7Eh	; ~
		db  7Fh	; 
		db  5Fh	; _
		db 0EAh	; Í
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A0h	; †
		db 0E0h	; ‡
		db 0F0h	; 
		db 0A8h	; ®
		db  68h	; h
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db  29h	; )
		db  27h	; '
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  40h	; @
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  5Ah	; Z
		db  95h	; ï
		db 0A5h	; •
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  9Fh	; ü
		db  57h	; W
		db  57h	; W
		db  99h	; ô
		db  9Ah	; ö
		db  99h	; ô
		db  9Ah	; ö
		db 0AAh	; ™
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0F0h	; 
		db 0F0h	; 
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db  6Ah	; j
		db  27h	; '
		db  0Bh
		db    7
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db  1Ah
		db  1Ah
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db    2
		db    2
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db  69h	; i
		db  57h	; W
		db  9Fh	; ü
		db    0
		db    0
		db    0
		db  0Ch
		db 0FCh	; ¸
		db 0F0h	; 
		db 0F0h	; 
		db  40h	; @
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  15h
		db    5
		db    1
		db    0
		db    0
		db    0
		db  50h	; P
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db 0AAh	; ™
		db 0AAh	; ™
		db  29h	; )
		db  27h	; '
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  95h	; ï
		db  7Fh	; 
		db 0FFh
		db 0FFh
		db 0FDh	; ˝
		db  71h	; q
		db  55h	; U
		db  55h	; U
		db 0D0h	; –
		db 0C0h	; ¿
		db    0
		db  50h	; P
		db  54h	; T
		db  50h	; P
		db  50h	; P
		db  40h	; @
		db    0
		db    0
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  7Fh	; 
		db 0F7h	; ˜
		db  77h	; w
		db  7Fh	; 
		db    0
		db  40h	; @
		db  40h	; @
		db  40h	; @
		db 0C0h	; ¿
		db  40h	; @
		db  40h	; @
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db    3
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  7Fh	; 
		db 0FDh	; ˝
		db 0FFh
		db 0BEh	; æ
		db 0BEh	; æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0C0h	; ¿
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db  9Ah	; ö
		db  9Ah	; ö
		db  6Ah	; j
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db  9Ah	; ö
		db  99h	; ô
		db 0BFh	; ø
		db 0BFh	; ø
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0E8h	; Ë
		db 0F8h	; ¯
		db 0D8h	; ÿ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  27h	; '
		db  27h	; '
		db  27h	; '
		db    7
		db    3
		db  6Ah	; j
		db  9Ah	; ö
		db  95h	; ï
		db  65h	; e
		db 0FAh	; ˙
		db 0FEh	; ˛
		db 0F7h	; ˜
		db 0FDh	; ˝
		db 0AAh	; ™
		db 0A5h	; •
		db  55h	; U
		db  56h	; V
		db 0A5h	; •
		db 0A5h	; •
		db 0A9h	; ©
		db 0AAh	; ™
		db  7Fh	; 
		db  7Fh	; 
		db  7Eh	; ~
		db  5Ah	; Z
		db  65h	; e
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0E0h	; ‡
		db  50h	; P
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  56h	; V
		db 0A5h	; •
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db 0A0h	; †
		db 0AAh	; ™
		db 0AAh	; ™
		db  69h	; i
		db  67h	; g
		db    0
		db    0
		db    0
		db  0Ch
		db  3Ch	; <
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0F0h	; 
		db    0
		db    0
		db    0
		db    0
		db    1
		db  15h
		db  15h
		db    1
		db 0FFh
		db 0F1h	; Ò
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  55h	; U
		db 0AAh	; ™
		db 0AAh	; ™
		db  0Ah
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db  55h	; U
		db  55h	; U
		db  15h
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A3h	; £
		db 0A9h	; ©
		db  55h	; U
		db  55h	; U
		db  9Dh	; ù
		db 0FDh	; ˝
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0F5h	; ı
		db 0F5h	; ı
		db  55h	; U
		db  50h	; P
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db  0Ah
		db  55h	; U
		db  5Fh	; _
		db  7Fh	; 
		db  5Dh	; ]
		db 0DFh	; ﬂ
		db 0BFh	; ø
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0F0h	; 
		db 0F0h	; 
		db 0D0h	; –
		db 0F0h	; 
		db 0F0h	; 
		db  68h	; h
		db 0EAh	; Í
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A6h	; ¶
		db 0A5h	; •
		db 0A5h	; •
		db 0A2h	; ¢
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  55h	; U
		db  56h	; V
		db 0A8h	; ®
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0FFh
		db 0FFh
		db 0FFh
		db  7Eh	; ~
		db  59h	; Y
		db 0A8h	; ®
		db  60h	; `
		db 0D0h	; –
		db 0D0h	; –
		db  60h	; `
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db  30h	; 0
		db 0F0h	; 
		db 0F0h	; 
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  1Fh
		db  1Fh
		db  7Fh	; 
		db 0FDh	; ˝
		db  92h	; í
		db  82h	; Ç
		db  85h	; Ö
		db  55h	; U
		db 0D5h	; ’
		db 0D5h	; ’
		db 0F5h	; ı
		db 0F0h	; 
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  56h	; V
		db  55h	; U
		db    5
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  56h	; V
		db  55h	; U
		db  5Ah	; Z
		db 0A5h	; •
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db 0AAh	; ™
		db  6Ah	; j
		db  96h	; ñ
		db 0A9h	; ©
		db 0A7h	; ß
		db  9Fh	; ü
		db  9Fh	; ü
		db 0A7h	; ß
		db 0A9h	; ©
		db 0BBh	; ª
		db 0FBh	; ˚
		db 0F9h	; ˘
		db 0F5h	; ı
		db 0F5h	; ı
		db 0F4h	; Ù
		db 0F4h	; Ù
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db  54h	; T
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db    5
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  55h	; U
		db  5Dh	; ]
		db  77h	; w
		db    5
		db    5
		db    5
		db    5
		db    1
		db    1
		db    0
		db    0
		db  77h	; w
		db  7Fh	; 
		db  5Fh	; _
		db 0DFh	; ﬂ
		db 0FFh
		db  7Fh	; 
		db  7Fh	; 
		db  3Fh	; ?
		db 0C0h	; ¿
		db  40h	; @
		db  40h	; @
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db  2Ah	; *
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db 0A8h	; ®
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0ABh	; ´
		db 0ABh	; ´
		db 0A9h	; ©
		db  1Ah
		db    0
		db    0
		db  80h	; Ä
		db  60h	; `
		db 0F0h	; 
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db  3Dh	; =
		db  0Dh
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0F0h	; 
		db 0F0h	; 
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db    2
		db    1
		db  6Ah	; j
		db  9Bh	; õ
		db 0AFh	; Ø
		db  9Fh	; ü
		db  9Fh	; ü
		db  9Fh	; ü
		db  99h	; ô
		db  65h	; e
		db 0FAh	; ˙
		db 0FEh	; ˛
		db  7Eh	; ~
		db 0FEh	; ˛
		db 0F6h	; ˆ
		db 0DAh	; ⁄
		db  65h	; e
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db  56h	; V
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  5Ah	; Z
		db  96h	; ñ
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db  1Ah
		db    6
		db    6
		db    1
		db    1
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  9Ah	; ö
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A9h	; ©
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A4h	; §
		db 0B0h	; ∞
		db  1Ah
		db  1Ah
		db  0Ah
		db    6
		db    2
		db    2
		db    1
		db    0
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AFh	; Ø
		db  9Fh	; ü
		db  7Fh	; 
		db  3Fh	; ?
		db  7Ch	; |
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db  54h	; T
		db 0F0h	; 
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db    0
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db  1Fh
		db    4
		db    0
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db  57h	; W
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db  57h	; W
		db  55h	; U
		db  57h	; W
		db  15h
		db  7Ch	; |
		db 0F7h	; ˜
		db 0F7h	; ˜
		db 0FFh
		db  7Fh	; 
		db  7Fh	; 
		db 0FFh
		db 0AFh	; Ø
		db    0
		db    0
		db    0
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0EAh	; Í
		db 0FEh	; ˛
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db 0A5h	; •
		db    0
		db 0A0h	; †
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BFh	; ø
		db  97h	; ó
		db 0A1h	; °
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0F0h	; 
		db 0FCh	; ¸
		db 0DCh	; ‹
		db 0C4h	; ƒ
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ah
		db    0
		db    0
		db    0
		db    0
		db    0
		db    3
		db  0Fh
		db 0BFh	; ø
		db    0
		db    0
		db    0
		db  30h	; 0
		db 0F0h	; 
		db 0F0h	; 
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    2
		db    2
		db    2
		db    2
		db    2
		db    1
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db 0AEh	; Æ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db 0A7h	; ß
		db  9Fh	; ü
		db  9Fh	; ü
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BFh	; ø
		db 0FFh
		db 0FFh
		db 0FDh	; ˝
		db 0F6h	; ˆ
		db  40h	; @
		db  60h	; `
		db  6Ah	; j
		db  66h	; f
		db  56h	; V
		db  5Ah	; Z
		db  6Ah	; j
		db  99h	; ô
		db    2
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A5h	; •
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db  59h	; Y
		db 0AAh	; ™
		db 0A9h	; ©
		db 0ABh	; ´
		db 0BFh	; ø
		db  9Fh	; ü
		db  9Ch	; ú
		db 0A4h	; §
		db 0A3h	; £
		db  0Fh
		db 0FFh
		db 0FFh
		db  2Ah	; *
		db  1Ah
		db    6
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A7h	; ß
		db 0A9h	; ©
		db 0A5h	; •
		db  52h	; R
		db    1
		db    0
		db    0
		db    0
		db  5Ah	; Z
		db  5Ah	; Z
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  2Ah	; *
		db  0Ah
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A4h	; §
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  6Ah	; j
		db  80h	; Ä
		db    0
		db    0
		db 0ABh	; ´
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db  54h	; T
		db    0
		db    0
		db    0
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  14h
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db    0
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db    0
		db    0
		db    0
		db  55h	; U
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  57h	; W
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db  5Fh	; _
		db  5Dh	; ]
		db  5Fh	; _
		db  57h	; W
		db  55h	; U
		db  57h	; W
		db  15h
		db  15h
		db  7Ch	; |
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0FFh
		db  7Fh	; 
		db  7Fh	; 
		db 0FAh	; ˙
		db  6Ah	; j
		db    0
		db    2
		db  2Ah	; *
		db 0AAh	; ™
		db 0EAh	; Í
		db 0FEh	; ˛
		db 0AFh	; Ø
		db 0AAh	; ™
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db 0A4h	; §
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A7h	; ß
		db  9Fh	; ü
		db  9Fh	; ü
		db  94h	; î
		db    0
		db    0
		db  68h	; h
		db    0
		db 0FCh	; ¸
		db 0FFh
		db 0DFh	; ﬂ
		db 0F4h	; Ù
		db    0
		db    2
		db  2Ah	; *
		db    0
		db    0
		db    0
		db    0
		db    2
		db  2Ah	; *
		db 0AAh	; ™
		db 0A5h	; •
		db    0
		db    0
		db    3
		db  2Fh	; /
		db 0AFh	; Ø
		db  9Fh	; ü
		db  9Dh	; ù
		db 0BDh	; Ω
		db  30h	; 0
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db 0F0h	; 
		db 0C0h	; ¿
		db  40h	; @
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db    2
		db  6Ah	; j
		db  9Ah	; ö
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AFh	; Ø
		db 0FFh
		db 0FFh
		db 0FFh
		db 0FDh	; ˝
		db  56h	; V
		db  66h	; f
		db  56h	; V
		db  5Ah	; Z
		db 0E9h	; È
		db 0EAh	; Í
		db 0EAh	; Í
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A5h	; •
		db  9Ah	; ö
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  59h	; Y
		db 0A9h	; ©
		db 0ABh	; ´
		db 0ABh	; ´
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A9h	; ©
		db 0AAh	; ™
		db  7Dh	; }
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0D0h	; –
		db    0
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  15h
		db    1
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    0
		db  29h	; )
		db    1
		db    0
		db  50h	; P
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  5Ah	; Z
		db  9Ah	; ö
		db  9Ah	; ö
		db  1Ah
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  80h	; Ä
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db 0A6h	; ¶
		db 0A8h	; ®
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db 0A0h	; †
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  50h	; P
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db  0Ch
		db    0
		db    0
		db    3
		db  0Fh
		db    3
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db 0C3h	; √
		db    0
		db    0
		db    0
		db    0
		db  30h	; 0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    1
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db  50h	; P
		db  7Dh	; }
		db 0DFh	; ﬂ
		db 0DDh	; ›
		db 0FDh	; ˝
		db  5Fh	; _
		db  76h	; v
		db  6Ah	; j
		db    0
		db    0
		db 0C0h	; ¿
		db 0F2h	; Ú
		db 0FEh	; ˛
		db 0FFh
		db 0ABh	; ´
		db 0AAh	; ™
		db    0
		db    0
		db  2Ah	; *
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0EAh	; Í
		db 0AAh	; ™
		db    0
		db    0
		db 0A7h	; ß
		db 0A9h	; ©
		db  9Ah	; ö
		db 0A5h	; •
		db  96h	; ñ
		db  56h	; V
		db    0
		db    0
		db 0C0h	; ¿
		db 0FFh
		db  97h	; ó
		db  99h	; ô
		db 0AAh	; ™
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db  50h	; P
		db 0A9h	; ©
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ch
		db  0Ch
		db  7Ch	; |
		db    1
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  5Ah	; Z
		db  15h
		db  5Ah	; Z
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A5h	; •
		db  9Fh	; ü
		db  9Fh	; ü
		db  97h	; ó
		db  95h	; ï
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0D9h	; Ÿ
		db 0FFh
		db 0FFh
		db 0FFh
		db  65h	; e
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0DAh	; ⁄
		db 0F6h	; ˆ
		db 0F5h	; ı
		db  96h	; ñ
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db 0AAh	; ™
		db  5Ah	; Z
		db 0A5h	; •
		db 0AAh	; ™
		db 0ABh	; ´
		db 0A7h	; ß
		db 0A7h	; ß
		db 0A9h	; ©
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0BEh	; æ
		db  7Eh	; ~
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FDh	; ˝
		db  7Dh	; }
		db 0FCh	; ¸
		db 0FCh	; ¸
		db 0FCh	; ¸
		db  7Ch	; |
		db  55h	; U
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  54h	; T
		db  7Ch	; |
		db  15h
		db  17h
		db  15h
		db  15h
		db  17h
		db  17h
		db    3
		db  0Ah
		db 0F4h	; Ù
		db 0D7h	; ◊
		db 0DFh	; ﬂ
		db 0FDh	; ˝
		db  7Dh	; }
		db  7Fh	; 
		db 0FFh
		db 0FEh	; ˛
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db 0A8h	; ®
		db    0
		db    0
		db    0
		db    2
		db    2
		db  0Ah
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db 0AAh	; ™
		db 0BEh	; æ
		db 0BEh	; æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0A8h	; ®
		db 0AAh	; ™
		db  9Ah	; ö
		db 0AAh	; ™
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0A4h	; §
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db    2
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db  9Eh	; û
		db  7Fh	; 
		db  7Fh	; 
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A6h	; ¶
		db  9Ah	; ö
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0FDh	; ˝
		db  9Ah	; ö
		db 0A2h	; ¢
		db 0A2h	; ¢
		db 0A0h	; †
		db  90h	; ê
		db  90h	; ê
		db  58h	; X
		db  6Ah	; j
		db 0A7h	; ß
		db  9Fh	; ü
		db  9Fh	; ü
		db 0A4h	; §
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0FCh	; ¸
		db 0FFh
		db 0F7h	; ˜
		db  33h	; 3
		db  30h	; 0
		db    0
		db    0
		db 0BFh	; ø
		db  1Fh
		db  0Bh
		db  0Bh
		db  0Bh
		db  1Ah
		db  1Ah
		db  1Ah
		db 0FDh	; ˝
		db 0F5h	; ı
		db 0F9h	; ˘
		db 0BDh	; Ω
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0A9h	; ©
		db 0AAh	; ™
		db  66h	; f
		db  56h	; V
		db  9Ah	; ö
		db 0AAh	; ™
		db  9Ah	; ö
		db  6Ah	; j
		db 0AAh	; ™
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0A8h	; ®
		db    0
		db    0
		db    0
		db    1
		db    1
		db    6
		db  0Ah
		db  2Ah	; *
		db  1Ah
		db  6Ah	; j
		db  66h	; f
		db 0AAh	; ™
		db  6Ah	; j
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A0h	; †
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db  6Ah	; j
		db  1Ah
		db  16h
		db    5
		db    2
		db  19h
		db  19h
		db  2Ah	; *
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  68h	; h
		db  1Ah
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0F6h	; ˆ
		db 0FDh	; ˝
		db 0FDh	; ˝
		db 0FFh
		db  7Fh	; 
		db 0A8h	; ®
		db 0A0h	; †
		db  80h	; Ä
		db    1
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  14h
		db    0
		db    0
		db  1Ah
		db 0A6h	; ¶
		db 0EAh	; Í
		db 0DAh	; ⁄
		db 0F6h	; ˆ
		db 0FDh	; ˝
		db 0FFh
		db  3Fh	; ?
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  90h	; ê
		db  95h	; ï
		db  55h	; U
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    5
		db  15h
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  54h	; T
		db 0F4h	; Ù
		db  57h	; W
		db  5Fh	; _
		db  57h	; W
		db  55h	; U
		db  1Dh
		db  1Fh
		db  0Fh
		db  0Ah
		db 0D4h	; ‘
		db  5Ch	; \
		db 0FCh	; ¸
		db 0F4h	; Ù
		db 0DCh	; ‹
		db 0DEh	; ﬁ
		db 0FEh	; ˛
		db 0FEh	; ˛
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BEh	; æ
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db  6Bh	; k
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db  9Ah	; ö
		db 0E6h	; Ê
		db 0E6h	; Ê
		db 0E6h	; Ê
		db 0E9h	; È
		db 0A9h	; ©
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  60h	; `
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  40h	; @
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db    2
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db 0A5h	; •
		db 0AAh	; ™
		db  9Eh	; û
		db  7Fh	; 
		db  7Fh	; 
		db 0A9h	; ©
		db 0A5h	; •
		db  56h	; V
		db  56h	; V
		db  65h	; e
		db  59h	; Y
		db  96h	; ñ
		db 0EAh	; Í
		db 0A9h	; ©
		db  29h	; )
		db    9
		db    2
		db  40h	; @
		db  40h	; @
		db  80h	; Ä
		db  80h	; Ä
		db 0F0h	; 
		db 0FCh	; ¸
		db 0FFh
		db 0FFh
		db  77h	; w
		db  7Dh	; }
		db  0Ch
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    2
		db    0
		db    0
		db    0
		db    0
		db    1
		db  0Ah
		db  1Ah
		db  3Fh	; ?
		db  5Fh	; _
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db 0FEh	; ˛
		db 0FFh
		db 0FAh	; ˙
		db 0BAh	; ∫
		db 0AAh	; ™
		db  9Ah	; ö
		db  96h	; ñ
		db  9Ah	; ö
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  0Ah
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0F6h	; ˆ
		db 0F6h	; ˆ
		db 0FDh	; ˝
		db 0FFh
		db  7Fh	; 
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  65h	; e
		db  50h	; P
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0ADh	; ≠
		db  9Fh	; ü
		db  5Fh	; _
		db  5Fh	; _
		db  13h
		db  66h	; f
		db  69h	; i
		db  9Ah	; ö
		db 0A6h	; ¶
		db  6Ah	; j
		db 0D9h	; Ÿ
		db 0F5h	; ı
		db 0F5h	; ı
		db 0A0h	; †
		db  80h	; Ä
		db  90h	; ê
		db    0
		db  40h	; @
		db  54h	; T
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    1
		db    1
		db    1
		db    0
		db  0Ah
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  5Fh	; _
		db  7Fh	; 
		db  5Dh	; ]
		db 0DFh	; ﬂ
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db 0D0h	; –
		db 0D0h	; –
		db  50h	; P
		db 0C0h	; ¿
		db    0
		db    2
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db  9Ah	; ö
		db  6Ah	; j
		db 0AAh	; ™
		db 0DFh	; ﬂ
		db 0FDh	; ˝
		db 0BFh	; ø
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0AEh	; Æ
		db 0BEh	; æ
		db  40h	; @
		db    0
		db 0C0h	; ¿
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db  6Ah	; j
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A8h	; ®
		db  9Ch	; ú
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  1Ah
		db    0
		db    0
		db    0
		db    3
		db  0Fh
		db  0Fh
		db  0Fh
		db  0Dh
		db    2
		db    2
		db  1Ah
		db 0EBh	; Î
		db 0EBh	; Î
		db  9Ah	; ö
		db  6Ah	; j
		db  6Ah	; j
		db 0AEh	; Æ
		db 0EEh	; Ó
		db 0FFh
		db 0BFh	; ø
		db 0FDh	; ˝
		db 0F6h	; ˆ
		db  9Ah	; ö
		db 0AAh	; ™
		db 0BAh	; ∫
		db 0FAh	; ˙
		db 0EAh	; Í
		db 0AAh	; ™
		db  5Ah	; Z
		db  55h	; U
		db  96h	; ñ
		db  95h	; ï
		db 0BAh	; ∫
		db 0EAh	; Í
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A0h	; †
		db  50h	; P
		db  80h	; Ä
		db  40h	; @
		db  9Ah	; ö
		db  9Ah	; ö
		db    2
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Fh	; 
		db  7Fh	; 
		db  9Fh	; ü
		db  23h	; #
		db    3
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0F0h	; 
		db 0FCh	; ¸
		db  7Ch	; |
		db  1Ch
		db    0
		db    0
		db    0
		db  6Ah	; j
		db 0EAh	; Í
		db 0EAh	; Í
		db 0DAh	; ⁄
		db 0FAh	; ˙
		db 0F6h	; ˆ
		db 0FDh	; ˝
		db  7Dh	; }
		db  8Dh	; ç
		db  86h	; Ü
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A5h	; •
		db  95h	; ï
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A6h	; ¶
		db  9Ah	; ö
		db  6Ah	; j
		db  15h
		db  55h	; U
		db  55h	; U
		db  99h	; ô
		db  98h	; ò
		db 0A4h	; §
		db  90h	; ê
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  40h	; @
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db  54h	; T
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0BCh	; º
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0BCh	; º
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0BCh	; º
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  3Ch	; <
		db 0F6h	; ˆ
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ah
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db    0
		db    0
		db  2Ah	; *
		db  5Ah	; Z
		db  69h	; i
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A9h	; ©
		db  55h	; U
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db    0
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db  95h	; ï
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db  68h	; h
		db    0
		db  3Dh	; =
		db 0F6h	; ˆ
		db 0DAh	; ⁄
		db 0DAh	; ⁄
		db 0F6h	; ˆ
		db 0FDh	; ˝
		db  7Fh	; 
		db 0FAh	; ˙
		db 0D5h	; ’
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  56h	; V
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A5h	; •
		db 0A9h	; ©
		db 0A9h	; ©
		db  95h	; ï
		db  6Ah	; j
		db 0DAh	; ⁄
		db 0FDh	; ˝
		db 0FFh
		db  7Fh	; 
		db 0AAh	; ™
		db  95h	; ï
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0BEh	; æ
		db 0FFh
		db 0FFh
		db 0A9h	; ©
		db 0A9h	; ©
		db 0ADh	; ≠
		db 0AFh	; Ø
		db 0ADh	; ≠
		db 0AFh	; Ø
		db  97h	; ó
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db 0D5h	; ’
		db 0F5h	; ı
		db  7Dh	; }
		db 0DDh	; ›
		db 0D5h	; ’
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  59h	; Y
		db  5Dh	; ]
		db  7Fh	; 
		db  7Fh	; 
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db  7Ch	; |
		db 0FFh
		db 0FFh
		db 0FFh
		db 0F5h	; ı
		db    0
		db    0
		db    0
		db    5
		db  15h
		db  55h	; U
		db  55h	; U
		db  57h	; W
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db  50h	; P
		db 0F0h	; 
		db  50h	; P
		db  57h	; W
		db  5Dh	; ]
		db  5Dh	; ]
		db  5Fh	; _
		db  1Fh
		db  0Fh
		db  0Ah
		db  2Ah	; *
		db 0DCh	; ‹
		db 0FCh	; ¸
		db 0F0h	; 
		db 0D0h	; –
		db 0F0h	; 
		db 0C0h	; ¿
		db 0C0h	; ¿
		db  80h	; Ä
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0A0h	; †
		db 0A0h	; †
		db  68h	; h
		db  68h	; h
		db  68h	; h
		db  68h	; h
		db  6Ah	; j
		db  6Bh	; k
		db  2Ah	; *
		db  1Ah
		db  2Ah	; *
		db  19h
		db  29h	; )
		db  15h
		db  15h
		db  2Ah	; *
		db  6Bh	; k
		db 0BBh	; ª
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db  7Fh	; 
		db  65h	; e
		db 0A9h	; ©
		db    0
		db 0C0h	; ¿
		db  40h	; @
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  0Ah
		db    6
		db  0Ah
		db  0Ah
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db  0Ah
		db    6
		db    9
		db    6
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A4h	; §
		db  60h	; `
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  19h
		db  57h	; W
		db  5Fh	; _
		db  1Fh
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  80h	; Ä
		db  94h	; î
		db 0D5h	; ’
		db 0F5h	; ı
		db 0FCh	; ¸
		db    0
		db    1
		db    5
		db  15h
		db  15h
		db  15h
		db  15h
		db  17h
		db    0
		db  50h	; P
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db 0D5h	; ’
		db 0FDh	; ˝
		db  77h	; w
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db    9
		db    0
		db    2
		db  0Ah
		db  29h	; )
		db 0A6h	; ¶
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AFh	; Ø
		db 0ABh	; ´
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db  74h	; t
		db 0FCh	; ¸
		db 0DCh	; ‹
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db  2Ah	; *
		db  2Ah	; *
		db  6Ah	; j
		db  59h	; Y
		db  17h
		db  97h	; ó
		db 0ADh	; ≠
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  69h	; i
		db 0FAh	; ˙
		db 0FEh	; ˛
		db 0FDh	; ˝
		db 0FFh
		db  7Fh	; 
		db  94h	; î
		db  58h	; X
		db  60h	; `
		db  80h	; Ä
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0BCh	; º
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A4h	; §
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db  1Ah
		db  2Ah	; *
		db  1Ah
		db  26h	; &
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db 0A0h	; †
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  2Ah	; *
		db  2Ah	; *
		db  2Ah	; *
		db  26h	; &
		db  1Eh
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db  55h	; U
		db 0D5h	; ’
		db 0F5h	; ı
		db    0
		db    0
		db    0
		db    0
		db    0
		db  54h	; T
		db  54h	; T
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    0
		db  5Fh	; _
		db  75h	; u
		db  7Dh	; }
		db 0DFh	; ﬂ
		db 0DFh	; ﬂ
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db 0C0h	; ¿
		db  50h	; P
		db 0D0h	; –
		db 0F0h	; 
		db 0F0h	; 
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0FFh
		db 0BFh	; ø
		db 0BFh	; ø
		db 0AFh	; Ø
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    0
		db    0
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0ABh	; ´
		db 0AFh	; Ø
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db  6Ah	; j
		db 0AAh	; ™
		db 0AAh	; ™
		db 0EAh	; Í
		db 0F8h	; ¯
		db 0F8h	; ¯
		db 0F8h	; ¯
		db 0E8h	; Ë
		db  94h	; î
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db    2
		db    0
		db  83h	; É
		db 0BFh	; ø
		db 0BFh	; ø
		db 0BFh	; ø
		db  93h	; ì
		db  90h	; ê
		db  80h	; Ä
		db    0
		db 0C0h	; ¿
		db  70h	; p
		db 0F0h	; 
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db  2Ah	; *
		db    1
		db    2
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db  55h	; U
		db 0A5h	; •
		db  95h	; ï
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db  54h	; T
		db 0A8h	; ®
		db 0A8h	; ®
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db    6
		db    6
		db    1
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    1
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    0
		db    0
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db  17h
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A4h	; §
		db  95h	; ï
		db 0F5h	; ı
		db 0FCh	; ¸
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  15h
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  50h	; P
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    0
		db  7Fh	; 
		db 0D5h	; ’
		db 0DDh	; ›
		db  7Fh	; 
		db  7Fh	; 
		db 0F7h	; ˜
		db 0FFh
		db 0FFh
		db  50h	; P
		db 0D0h	; –
		db 0D0h	; –
		db  50h	; P
		db  50h	; P
		db 0C0h	; ¿
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  2Ah	; *
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0FFh
		db 0BFh	; ø
		db 0BEh	; æ
		db 0BEh	; æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db 0AEh	; Æ
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    0
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0A6h	; ¶
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AEh	; Æ
		db 0AAh	; ™
		db 0AAh	; ™
		db 0ABh	; ´
		db 0AFh	; Ø
		db 0FDh	; ˝
		db 0FFh
		db 0FFh
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0EAh	; Í
		db 0F9h	; ˘
		db 0F8h	; ¯
		db 0F8h	; ¯
		db 0D4h	; ‘
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A4h	; §
		db 0B0h	; ∞
		db 0BFh	; ø
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0C0h	; ¿
		db 0AAh	; ™
		db  2Ah	; *
		db    1
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db 0AAh	; ™
		db  55h	; U
		db  65h	; e
		db  95h	; ï
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db  9Ah	; ö
		db 0AAh	; ™
		db  54h	; T
		db 0A8h	; ®
		db 0A8h	; ®
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db    2
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A0h	; †
		db 0BFh	; ø
		db  9Fh	; ü
		db  5Fh	; _
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0F0h	; 
		db 0F0h	; 
		db 0C0h	; ¿
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		db    2
		db  0Ah
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  1Ah
		db  1Ah
		db    6
		db    6
		db    1
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A8h	; ®
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db  0Ah
		db  0Ah
		db  2Ah	; *
		db  2Ah	; *
		db  1Ah
		db  7Dh	; }
		db 0FFh
		db 0FFh
		db 0A8h	; ®
		db 0A0h	; †
		db 0A1h	; °
		db  85h	; Ö
		db  95h	; ï
		db  55h	; U
		db  55h	; U
		db  40h	; @
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    0
		db    0
		db    1
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  45h	; E
		db    0
		db    0
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  5Ah	; Z
		db  59h	; Y
		db  57h	; W
		db  17h
		db  80h	; Ä
		db  80h	; Ä
		db 0A0h	; †
		db 0A4h	; §
		db  94h	; î
		db 0F5h	; ı
		db 0FDh	; ˝
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db  40h	; @
		db    0
		db    0
		db    1
		db    5
		db  15h
		db  17h
		db  1Dh
		db  1Dh
		db  17h
		db    0
		db  50h	; P
		db  54h	; T
		db  55h	; U
		db 0F5h	; ı
		db  5Dh	; ]
		db 0DDh	; ›
		db 0F5h	; ı
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db  0Ah
		db  17h
		db  1Fh
		db  1Fh
		db  0Fh
		db 0AFh	; Ø
		db 0ABh	; ´
		db 0ABh	; ´
		db 0ABh	; ´
		db 0F5h	; ı
		db  7Dh	; }
		db 0FDh	; ˝
		db 0FCh	; ¸
		db 0FEh	; ˛
		db 0FAh	; ˙
		db 0FAh	; ˙
		db 0FAh	; ˙
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db 0A8h	; ®
		db 0A8h	; ®
		db  3Ch	; <
		db 0FFh
		db 0D7h	; ◊
		db  55h	; U
		db  55h	; U
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db  2Ah	; *
		db 0EAh	; Í
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db  6Ah	; j
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0EAh	; Í
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A5h	; •
		db  65h	; e
		db  65h	; e
		db  65h	; e
		db 0A5h	; •
		db  65h	; e
		db  3Ch	; <
		db 0FFh
		db 0DFh	; ﬂ
		db  55h	; U
		db  55h	; U
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db  6Ah	; j
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db  5Ah	; Z
		db  5Ah	; Z
		db  58h	; X
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db  52h	; R
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  5Ah	; Z
		db  55h	; U
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A9h	; ©
		db  55h	; U
		db  5Ah	; Z
		db  56h	; V
		db 0A6h	; ¶
		db 0A5h	; •
		db 0A5h	; •
		db  85h	; Ö
		db  45h	; E
		db  45h	; E
		db  85h	; Ö
		db  85h	; Ö
		db 0A5h	; •
		db 0A9h	; ©
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  52h	; R
		db  52h	; R
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  58h	; X
		db 0A8h	; ®
		db 0A0h	; †
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db  15h
		db  55h	; U
		db  0Ah
		db    2
		db    2
		db    0
		db    0
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db  25h	; %
		db  25h	; %
		db  45h	; E
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  2Ah	; *
		db  59h	; Y
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db  50h	; P
		db  40h	; @
		db  40h	; @
		db  55h	; U
		db  55h	; U
		db  50h	; P
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  15h
		db    5
		db    5
		db    1
		db    1
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A8h	; ®
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  0Ah
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0A0h	; †
		db 0A9h	; ©
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db  9Ah	; ö
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  80h	; Ä
		db 0A0h	; †
		db  3Fh	; ?
		db 0FFh
		db 0D7h	; ◊
		db  55h	; U
		db  55h	; U
		db  6Ah	; j
		db  6Ah	; j
		db  6Ah	; j
		db 0AAh	; ™
		db 0EAh	; Í
		db 0DAh	; ⁄
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  6Ah	; j
		db 0AAh	; ™
		db 0A9h	; ©
		db 0A7h	; ß
		db 0AFh	; Ø
		db 0BDh	; Ω
		db 0B5h	; µ
		db 0B5h	; µ
		db 0AAh	; ™
		db 0AAh	; ™
		db  5Ah	; Z
		db 0F6h	; ˆ
		db 0FEh	; ˛
		db  5Fh	; _
		db  57h	; W
		db  55h	; U
		db  6Ah	; j
		db 0AAh	; ™
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0FCh	; ¸
		db 0FFh
		db 0DFh	; ﬂ
		db  55h	; U
		db  55h	; U
		db 0A9h	; ©
		db 0A9h	; ©
		db 0A9h	; ©
		db  6Ah	; j
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db  5Ah	; Z
		db  56h	; V
		db  5Ah	; Z
		db  52h	; R
		db  52h	; R
		db  52h	; R
		db  50h	; P
		db  52h	; R
		db  95h	; ï
		db  95h	; ï
		db  95h	; ï
		db  95h	; ï
		db  95h	; ï
		db 0A5h	; •
		db 0A9h	; ©
		db 0AAh	; ™
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  56h	; V
		db  5Ah	; Z
		db 0AAh	; ™
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db  85h	; Ö
		db 0A5h	; •
		db 0A9h	; ©
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  52h	; R
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db 0A9h	; ©
		db 0A9h	; ©
		db 0AAh	; ™
		db 0AAh	; ™
		db 0AAh	; ™
		db 0A8h	; ®
		db 0A8h	; ®
		db 0A0h	; †
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0A6h	; ¶
		db 0AAh	; ™
		db  2Ah	; *
		db  0Ah
		db  0Ah
		db    2
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  5Ah	; Z
		db  58h	; X
		db  58h	; X
		db  51h	; Q
		db 0A0h	; †
		db  80h	; Ä
		db  80h	; Ä
		db    0
		db    0
		db    5
		db  55h	; U
		db  55h	; U
		db    2
		db    0
		db    0
		db    0
		db  40h	; @
		db  54h	; T
		db  55h	; U
		db  55h	; U
		db 0A5h	; •
		db 0A5h	; •
		db 0A5h	; •
		db  25h	; %
		db  25h	; %
		db    5
		db  45h	; E
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  6Ah	; j
		db 0FFh
		db  55h	; U
		db  2Ah	; *
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  54h	; T
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db  40h	; @
		db  55h	; U
		db  54h	; T
		db  40h	; @
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db    5
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    5
		db    5
		db    5
		db    5
		db    1
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A9h	; ©
		db 0FFh
		db  55h	; U
		db 0A8h	; ®
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  40h	; @
		db    1
		db 0AAh	; ™
		db 0AAh	; ™
		db    0
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db    1
		db    0
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db    1
		db    0
		db    4
		db  0Ah
		db    0
		db    0
		db  55h	; U
		db  50h	; P
		db 0A5h	; •
		db  0Ah
		db 0A0h	; †
		db  55h	; U
		db 0A5h	; •
		db  55h	; U
		db 0AAh	; ™
		db  55h	; U
		db 0A5h	; •
		db  55h	; U
		db 0A5h	; •
		db  5Ah	; Z
		db  55h	; U
		db  5Ah	; Z
		db    0
		db  50h	; P
		db  50h	; P
		db  55h	; U
		db    0
		db    0
		db    0
		db  55h	; U
		db  50h	; P
		db  55h	; U
		db  5Ah	; Z
		db    0
		db    0
		db 0A5h	; •
		db    1
		db  55h	; U
		db  18h
		db    1
		db    0
		db    6
		db  0Ah
		db 0AAh	; ™
		db 0AAh	; ™
		db    1
		db    0
		db  0Ah
		db 0AAh	; ™
		db 0A0h	; †
		db    0
		db 0A0h	; †
		db    0
		db 0AAh	; ™
		db 0A0h	; †
		db 0A0h	; †
		db 0AAh	; ™
		db  50h	; P
		db    5
		db    0
		db 0FFh
		db 0A5h	; •
		db  55h	; U
		db 0A0h	; †
		db  55h	; U
		db 0A5h	; •
		db  55h	; U
		db 0A5h	; •
		db  5Ah	; Z
		db  55h	; U
		db  5Ah	; Z
		db  55h	; U
		db    0
		db  50h	; P
		db  50h	; P
		db  50h	; P
		db    5
		db    0
		db    0
		db  50h	; P
		db  5Ah	; Z
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    1
		db  55h	; U
		db  18h
		db 0AAh	; ™
		db 0AAh	; ™
		db    1
		db    0
		db    7
		db 0AAh	; ™
		db 0AAh	; ™
		db    1
		db    0
		db    5
		db  0Ah
		db    1
		db    0
		db    4
		db 0A0h	; †
		db  0Ah
		db    0
		db 0A0h	; †
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db  55h	; U
		db    5
		db    5
		db 0F0h	; 
		db 0AFh	; Ø
		db 0F5h	; ı
		db 0A0h	; †
		db  55h	; U
		db 0A5h	; •
		db  55h	; U
		db 0A5h	; •
		db  5Ah	; Z
		db  55h	; U
		db  5Ah	; Z
		db  55h	; U
		db 0AAh	; ™
		db  0Ah
		db  50h	; P
		db  50h	; P
		db    0
		db  55h	; U
		db    0
		db  0Ah
		db  5Ah	; Z
		db  50h	; P
		db  55h	; U
		db    0
		db    0
		db 0AFh	; Ø
		db    1
		db  55h	; U
		db  17h
		db    0
		db    0
		db 0AAh	; ™
		db 0AAh	; ™
		db    1
		db    0
		db    7
		db  0Ah
		db 0AAh	; ™
		db    0
		db  0Ah
		db    0
		db  0Ah
		db    0
		db    0
		db 0A0h	; †
		db 0A0h	; †
		db 0AAh	; ™
		db 0A0h	; †
		db    0
		db 0A0h	; †
		db 0A0h	; †
		db    0
		db    0
		db    0
		db 0AFh	; Ø
		db 0F5h	; ı
		db    0
		db  50h	; P
		db 0A5h	; •
		db 0A0h	; †
		db  55h	; U
		db 0A5h	; •
		db  5Ah	; Z
		db 0A5h	; •
		db  5Ah	; Z
		db  55h	; U
		db  5Ah	; Z
		db  55h	; U
		db 0A5h	; •
		db  50h	; P
		db    5
		db  50h	; P
		db  50h	; P
		db    0
		db    0
		db    0
		db  50h	; P
		db    0
		db  50h	; P
		db 0A0h	; †
		db    0
ends		seg001
		end start
