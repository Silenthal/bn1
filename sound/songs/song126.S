Track_080D8114:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N60, Cn3, v127
    .byte W60
    .byte FINE

    .align 2, 0

global_label SongHeader_080D8124
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A08BC
    .word Track_080D8114
