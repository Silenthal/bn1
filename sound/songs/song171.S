Track_080B111C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Cn3, v127
    .byte W04
    .byte    Cn3, v064
    .byte W04
    .byte    Cn3, v032
    .byte W04
    .byte    Cn3, v016
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1134
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B2C
    .word Track_080B111C
