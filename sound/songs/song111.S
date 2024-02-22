Track_080B7224:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N28, Cn3, v127
    .byte W28
    .byte FINE

    .align 2, 0

global_label SongHeader_080B7234
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A07F0
    .word Track_080B7224
