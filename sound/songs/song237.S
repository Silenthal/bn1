Track_080A1964:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N84, An1, v127
    .byte W84
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080A1974
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0E74
    .word Track_080A1964
