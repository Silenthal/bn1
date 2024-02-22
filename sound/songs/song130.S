Track_080B72B4:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N16, Cn2, v127
    .byte W16
    .byte    N02, Cn2, v064
    .byte W02
    .byte    Cn2, v032
    .byte W02
    .byte    Cn2, v016
    .byte W02
    .byte    Cn2, v008
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080B72D0
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A08F8
    .word Track_080B72B4
