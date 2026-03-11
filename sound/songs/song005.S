Track_080A55AC:
    .byte KEYSH, 0
    .byte TEMPO, 60
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TIE, Cn3, v127
    .byte W96
    .byte W68
    .byte W01
    .byte EOT
    .byte FINE

    .align 2, 0

global_label mus_transmission
    .byte 1
    .byte 0
    .byte 0
    .byte 163
    .word ToneData_0809f44c
    .word Track_080A55AC
