Track_080D23FC:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N40, Cn4, v127
    .byte W40
    .byte FINE

    .align 2, 0

global_label SongHeader_080D240C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0BEC
    .word Track_080D23FC
