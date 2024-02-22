Track_080D424C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N28, Cn3, v127
    .byte W28
    .byte FINE

    .align 2, 0

global_label SongHeader_080D425C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0880
    .word Track_080D424C
