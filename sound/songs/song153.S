Track_080B9B30:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, An2, v127
    .byte W04
    .byte    N03, Bn3
    .byte W03
    .byte    N12
    .byte W12
    .byte FINE

    .align 2, 0

global_label SongHeader_080B9B44
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A3C
    .word Track_080B9B30
