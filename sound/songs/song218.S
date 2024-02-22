Track_080D7130:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N24, Cn4, v127
    .byte W24
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080D7140
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0D78
    .word Track_080D7130
