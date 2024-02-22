Track_080D23A4:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N28, Cn4, v127
    .byte W28
    .byte FINE

    .align 2, 0

global_label SongHeader_080D23B4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0958
    .word Track_080D23A4
