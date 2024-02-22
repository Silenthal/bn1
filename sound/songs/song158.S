Track_080B12F4:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TIE, Cn3, v127
    .byte W48
    .byte W02
    .byte    En3
    .byte W44
    .byte W02
    .byte W04
    .byte    Dn3
    .byte W40
    .byte EOT, Cn3
    .byte W10
    .byte TIE, Gn2
    .byte W42
    .byte W96
    .byte W12
    .byte EOT
    .byte W48
    .byte W02
    .byte    En3
    .byte W32
    .byte W02
    .byte W16
    .byte    Dn3
    .byte FINE

    .align 2, 0

global_label SongHeader_080B131C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A78
    .word Track_080B12F4
