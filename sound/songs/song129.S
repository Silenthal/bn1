Track_080B107C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N08, Dn2, v127
    .byte W08
    .byte FINE

Track_080B108B:
    .byte KEYSH, 0
    .byte VOICE, 1
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Gn3, v052
    .byte W04
    .byte    Gn3, v032
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080B109C
    .byte 2
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A08E0
    .word Track_080B107C
    .word Track_080B108B
