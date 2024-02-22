Track_080BAB40:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, Cn3, v127
    .byte W02
    .byte    An2
    .byte W02
    .byte    N06, En3
    .byte W06
    .byte    N16, Dn3, v100
    .byte W16
    .byte FINE

    .align 2, 0

global_label SongHeader_080BAB58
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A0C
    .word Track_080BAB40
