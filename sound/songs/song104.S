Track_080B1290:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Gn3, v100
    .byte W04
    .byte    Cn3
    .byte W04
    .byte    N02, Gn3, v052
    .byte W02
    .byte    Cn3
    .byte W02
    .byte    N01, Gn3, v028
    .byte W01
    .byte    Cn3
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080B12B0
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A079C
    .word Track_080B1290
