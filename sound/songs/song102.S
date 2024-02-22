Track_080B5DFC:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Gn4, v100
    .byte W05
    .byte    Gn4, v052
    .byte W05
    .byte    N08, Gn4, v028
    .byte W08
    .byte FINE

    .align 2, 0

global_label SongHeader_080B5E14
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0784
    .word Track_080B5DFC
