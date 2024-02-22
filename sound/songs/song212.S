Track_080B1100:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N15, Cn3, v127
    .byte W15
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1110
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0D30
    .word Track_080B1100
