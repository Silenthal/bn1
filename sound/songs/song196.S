Track_080A199C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N44, As2, v127
    .byte W44
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080A19AC
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0C64
    .word Track_080A199C
