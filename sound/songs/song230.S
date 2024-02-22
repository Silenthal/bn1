Track_080A19B8:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TIE, An1, v127
    .byte W96
    .byte W92
    .byte W02
    .byte EOT
    .byte FINE

    .align 2, 0

global_label SongHeader_080A19CC
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0E08
    .word Track_080A19B8
