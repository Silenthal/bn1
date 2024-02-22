Track_080B119C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, Dn2, v127
    .byte W02
    .byte    N03, Cn4
    .byte W03
    .byte    N01, Dn3
    .byte W01
    .byte    N08, Bn2
    .byte W08
    .byte FINE

Track_080B11B4:
    .byte KEYSH, 0
    .byte VOICE, 1
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, Dn2, v127
    .byte W03
    .byte    N02, Cn3
    .byte W03
    .byte    N12, Gn3, v100
    .byte W12
    .byte FINE

    .align 2, 0

global_label SongHeader_080B11C8
    .byte 2
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A09AC
    .word Track_080B119C
    .word Track_080B11B4
