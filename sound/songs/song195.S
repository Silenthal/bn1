Track_080A1980:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N40, Gs4, v127
    .byte W40
    .byte FINE

    .align 2, 0

global_label SongHeader_080A1990
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0C58
    .word Track_080A1980
