Track_080B5DB0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N28, An5, v100
    .byte W28
    .byte FINE

Track_080B5DBF:
    .byte KEYSH, 0
    .byte VOICE, 1
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TUNE , 62
    .byte    N28, An5, v084
    .byte W28
    .byte FINE

    .align 2, 0

global_label SongHeader_080B5DD0
    .byte 2
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0970
    .word Track_080B5DB0
    .word Track_080B5DBF
