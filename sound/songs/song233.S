Track_080B7374:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N48, Cn3, v127
    .byte W48
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080B7384
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0E38
    .word Track_080B7374
