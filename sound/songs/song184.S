Track_080B10C8:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N44, Cn4, v127
    .byte W44
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080B10D8
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0BD4
    .word Track_080B10C8
