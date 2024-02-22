Track_080B71DC:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, En1, v127
    .byte W04
    .byte    Fs1, v100
    .byte W04
    .byte    Gs1, v088
    .byte W04
    .byte    As1, v064
    .byte W04
    .byte    As1, v032
    .byte W04
    .byte    As1, v016
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080B71FC
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0D3C
    .word Track_080B71DC
