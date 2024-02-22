Track_080D814C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte MOD  , 64
    .byte LFOS , 64
    .byte MODT , 0
    .byte    N60, An5, v127
    .byte W60
    .byte FINE

    .align 2, 0

global_label SongHeader_080D8164
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0B20
    .word Track_080D814C
