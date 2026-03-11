Track_080B7224:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N28, Cn3, v127
    .byte W28
    .byte FINE

    .align 2, 0

global_label se_battle_hitconfirm
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word ToneData_080a07f0
    .word Track_080B7224
