Track_080D9ED4:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N20, As1, v127
    .byte W20
    .byte FINE

    .align 2, 0

global_label SongHeader_080D9EE4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0D18
    .word Track_080D9ED4
