Track_080C4E60:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N32, An3, v127
    .byte W32
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080C4E70
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0CE8
    .word Track_080C4E60
