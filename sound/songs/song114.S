Track_080D19B0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N12, En3, v127
    .byte W12
    .byte VOICE, 1
    .byte    N04, Gs4, v100
    .byte W05
    .byte    Gs4, v088
    .byte W05
    .byte    Gs4, v064
    .byte W05
    .byte    Gs4, v032
    .byte W05
    .byte    Gs4, v016
    .byte W05
    .byte    Gs4, v008
    .byte W05
    .byte FINE

    .align 2, 0

global_label SongHeader_080D19D4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0814
    .word Track_080D19B0
