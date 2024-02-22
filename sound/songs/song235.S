Track_080D2388:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N72, Gs3, v127
    .byte W72
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080D2398
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0E5C
    .word Track_080D2388
