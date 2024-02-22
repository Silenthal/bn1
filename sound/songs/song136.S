Track_080BDF94:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N56, Gn8, v127
    .byte W56
    .byte    N04, Gn8, v088
    .byte W04
    .byte    Gn8, v064
    .byte W04
    .byte    Gn8, v032
    .byte W04
    .byte    Gn8, v016
    .byte W04
    .byte    Gn8, v008
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080BDFB4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A094C
    .word Track_080BDF94
