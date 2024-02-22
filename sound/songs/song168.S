Track_080D23E0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N08, Gn8, v127
    .byte W08
    .byte FINE

    .align 2, 0

global_label SongHeader_080D23F0
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B08
    .word Track_080D23E0
