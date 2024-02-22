Track_080D7198:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, En2, v064
    .byte W02
    .byte    An2, v088
    .byte W02
    .byte    Bn2, v100
    .byte W02
    .byte    Cn3, v127
    .byte W02
    .byte    Dn3
    .byte W02
    .byte    N06, En3
    .byte W06
    .byte    En3, v064
    .byte W06
    .byte FINE

    .align 2, 0

global_label SongHeader_080D71B8
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0BA4
    .word Track_080D7198
