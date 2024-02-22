Track_080B10AC:
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

global_label SongHeader_080B10BC
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0BC8
    .word Track_080B10AC
