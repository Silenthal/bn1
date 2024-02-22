Track_080B727C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N72, Cn3, v127
    .byte W72
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080B728C
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0C88
    .word Track_080B727C
