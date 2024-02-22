Track_080D8130:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N48, Cn4, v127
    .byte W48
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080D8140
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0C34
    .word Track_080D8130
