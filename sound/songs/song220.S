Track_080B7358:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 100
    .byte PAN  , 64
    .byte    N64, An1, v127
    .byte W64
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080B7368
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0D90
    .word Track_080B7358
