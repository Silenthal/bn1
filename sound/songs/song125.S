Track_080D2434:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N32, Cn3, v127
    .byte W32
    .byte FINE

    .align 2, 0

global_label SongHeader_080D2444
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word ToneData_080a08b0
    .word Track_080D2434
