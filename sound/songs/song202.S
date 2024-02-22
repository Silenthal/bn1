Track_080B7184:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N01, Cn3, v127
    .byte W01
    .byte    N02, Cn3, v032
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080B7198
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0CAC
    .word Track_080B7184
