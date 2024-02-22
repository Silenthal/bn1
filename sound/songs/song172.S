Track_080B1140:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N06, Gn1, v127
    .byte W06
    .byte    Gn1, v064
    .byte W06
    .byte    Gn1, v032
    .byte W06
    .byte    Gn1, v016
    .byte W06
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1158
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B38
    .word Track_080B1140
