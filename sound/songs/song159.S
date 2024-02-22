Track_080B1328:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TIE, Cn4, v127
    .byte W96
    .byte W54
    .byte EOT
    .byte TIE, Gn3
    .byte W42
    .byte W96
    .byte W12
    .byte EOT
    .byte FINE

Track_080B133F:
    .byte KEYSH, 0
    .byte VOICE, 1
    .byte VOL  , 127
    .byte PAN  , 64
    .byte W48
    .byte W02
    .byte TIE, En4, v127
    .byte W44
    .byte W02
    .byte W96
    .byte W96
    .byte W12
    .byte EOT
    .byte FINE

Track_080B1353:
    .byte KEYSH, 0
    .byte VOICE, 2
    .byte VOL  , 127
    .byte PAN  , 64
    .byte W96
    .byte W04
    .byte TIE, Dn5, v127
    .byte W92
    .byte W56
    .byte W02
    .byte EOT
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1368
    .byte 3
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A84
    .word Track_080B1328
    .word Track_080B133F
    .word Track_080B1353
