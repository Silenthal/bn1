Track_080C9A50:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, As6, v100
    .byte W04
    .byte    N02
    .byte W04
    .byte    N02
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080C9A64
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0D84
    .word Track_080C9A50
