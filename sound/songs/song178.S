Track_080A18E4:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, Cn2, v127
    .byte W02
    .byte    Gn2
    .byte W02
    .byte    N03, Cn3
    .byte W03
    .byte    Gn3
    .byte W03
    .byte    N48, Gs3, v088
    .byte W48
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080A1900
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B8C
    .word Track_080A18E4
