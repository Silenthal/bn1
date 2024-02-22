Track_080BDF78:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N01, Cn5, v064
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080BDF88
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B80
    .word Track_080BDF78
