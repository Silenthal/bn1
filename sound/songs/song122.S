Track_08160A10:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 88
    .byte PAN  , 64
    .byte    N03, Gn2, v127
    .byte W03
    .byte    Cn3
    .byte W03
    .byte    N06, Gn3
    .byte W06
    .byte    N03, Cn3, v064
    .byte W03
    .byte    N12, Gn3
    .byte W12
    .byte FINE

    .align 2, 0

global_label SongHeader_08160A2C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A088C
    .word Track_08160A10
