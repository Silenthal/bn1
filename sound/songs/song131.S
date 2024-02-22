Track_080B72DC:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, Cn2, v127
    .byte W02
    .byte    N03, Cn2, v064
    .byte W03
    .byte    Cn2, v032
    .byte W03
    .byte    Cn2, v016
    .byte W03
    .byte    Cn2, v008
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080B72F8
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0904
    .word Track_080B72DC
