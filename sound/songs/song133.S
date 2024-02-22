Track_080BAB00:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, Bn4, v127
    .byte W03
    .byte    Ds4
    .byte W03
    .byte    Fs4
    .byte W03
    .byte    Gs4
    .byte W03
    .byte    Bn4
    .byte W03
    .byte    Cs5
    .byte W03
    .byte    Fs4, v064
    .byte W03
    .byte    Gs4
    .byte W03
    .byte    Bn4
    .byte W03
    .byte    Cs5
    .byte W03
    .byte    Fs4, v032
    .byte W03
    .byte    Gs4
    .byte W03
    .byte    Bn4
    .byte W03
    .byte    Cs5
    .byte W03
    .byte    Fs4, v016
    .byte W03
    .byte    Gs4
    .byte W03
    .byte    Bn4
    .byte W03
    .byte    Cs5
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080BAB34
    .byte 1
    .byte 0
    .byte 192
    .byte 0
    .word 0x80A0928
    .word Track_080BAB00
