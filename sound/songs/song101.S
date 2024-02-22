Track_080BDFC0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 64
    .byte PAN  , 64
    .byte    N06, Cn3, v127
    .byte W06
    .byte FINE

    .align 2, 0

global_label SongHeader_080BDFD0
    .byte 1
    .byte 0
    .byte 32
    .byte 0
    .word 0x80A0778
    .word Track_080BDFC0
