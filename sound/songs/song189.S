Track_080D19E0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, An2, v127
    .byte W03
    .byte    Bn3
    .byte W03
    .byte    N60, Ds4
    .byte W60
    .byte FINE

    .align 2, 0

global_label SongHeader_080D19F4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0C10
    .word Track_080D19E0
