Track_080B137C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Cn4, v127
    .byte W04
    .byte    Dn4
    .byte W04
    .byte    En4
    .byte W04
    .byte    Cn4
    .byte W04
    .byte    Dn4
    .byte W04
    .byte    En4
    .byte W04
    .byte    Fn4
    .byte W04
    .byte    Dn4
    .byte W04
    .byte    N16, Gn4
    .byte W16
    .byte FINE

    .align 2, 0

global_label SongHeader_080B139C
    .byte 1
    .byte 0
    .byte 192
    .byte 0
    .word 0x80A0CC4
    .word Track_080B137C
