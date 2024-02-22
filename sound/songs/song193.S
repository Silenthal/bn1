Track_080B7260:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N68, Gs4, v127
    .byte W68
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080B7270
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0C40
    .word Track_080B7260
