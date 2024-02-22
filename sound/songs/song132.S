Track_080BAC60:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N48, Ds7, v127
    .byte W48
    .byte FINE

Track_080BAC6F:
    .byte KEYSH, 0
    .byte VOICE, 1
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TUNE , 63
    .byte    N48, Ds7, v100
    .byte W48
    .byte FINE

    .align 2, 0

global_label SongHeader_080BAC80
    .byte 2
    .byte 0
    .byte 192
    .byte 0
    .word 0x80A0910
    .word Track_080BAC60
    .word Track_080BAC6F
