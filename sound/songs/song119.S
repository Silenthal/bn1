Track_080BF24C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N10, Fn3, v127
    .byte W10
    .byte FINE

    .align 2, 0

global_label SongHeader_080BF25C
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0868
    .word Track_080BF24C
