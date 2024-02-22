Track_080B7334:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N07, Fs3, v127
    .byte W07
    .byte VOICE, 1
    .byte    N03, En3
    .byte W03
    .byte    N02, Gn2
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080B734C
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0CD0
    .word Track_080B7334
