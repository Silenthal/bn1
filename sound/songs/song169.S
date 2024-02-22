Track_08160A84:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Dn2, v127
    .byte W04
    .byte    N05, Fs2
    .byte W06
    .byte    N52, Bn1
    .byte W52
    .byte FINE

    .align 2, 0

global_label SongHeader_08160A9C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B14
    .word Track_08160A84
