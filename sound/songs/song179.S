Track_080D9F0C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N06, Cn3, v127
    .byte W06
    .byte    N30, En3, v100
    .byte W30
    .byte FINE

    .align 2, 0

global_label SongHeader_080D9F20
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B98
    .word Track_080D9F0C
