Track_080BABC8:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, Fs6, v127
    .byte W03
    .byte    Gs5
    .byte W03
    .byte    Fs6, v064
    .byte W03
    .byte    Gs5
    .byte W03
    .byte    Fs6, v032
    .byte W03
    .byte    Gs5
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080BABE4
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0D54
    .word Track_080BABC8
