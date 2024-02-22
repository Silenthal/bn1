Track_080B1238:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, Bn3, v100
    .byte W03
    .byte    En4
    .byte W03
    .byte    An4, v127
    .byte W04
    .byte    N06, An4, v060
    .byte W06
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1250
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A07B4
    .word Track_080B1238
