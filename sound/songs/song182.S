Track_080BF290:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N30, Cn4, v127
    .byte W30
    .byte FINE

    .align 2, 0

global_label SongHeader_080BF2A0
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0BBC
    .word Track_080BF290
