Track_080BDF4C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N06, Ds1, v127
    .byte W06
    .byte VOICE, 1
    .byte    N04, En1
    .byte W04
    .byte    En1, v064
    .byte W04
    .byte    En1, v032
    .byte W04
    .byte    En1, v016
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080BDF6C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0988
    .word Track_080BDF4C
