Track_080D81A8:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N30, An1, v127
    .byte W30
    .byte FINE

    .align 2, 0

global_label SongHeader_080D81B8
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0DA8
    .word Track_080D81A8
