Track_080BDF30:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N54, An1, v127
    .byte W54
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080BDF40
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0DCC
    .word Track_080BDF30
