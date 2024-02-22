Track_080A18AC:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N40, Cn4, v127
    .byte W40
    .byte FINE

    .align 2, 0

global_label SongHeader_080A18BC
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A09C4
    .word Track_080A18AC
