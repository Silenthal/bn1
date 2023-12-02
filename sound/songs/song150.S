#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D9E90:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 88
    .byte PAN  , 64
    .byte    N05, Dn2, v127
    .byte W05
    .byte    Fn2
    .byte W05
    .byte    An2, v112
    .byte W05
    .byte    Dn2, v127
    .byte W05
    .byte    Fn2
    .byte W05
    .byte    An2, v112
    .byte W05
    .byte    Dn2, v127
    .byte W05
    .byte    Fn2
    .byte W05
    .byte    An2, v112
    .byte W05
    .byte    Dn2, v127
    .byte W05
    .byte    Fn2
    .byte W05
    .byte    An2, v112
    .byte W05
    .byte    Dn2, v127
    .byte W05
    .byte    Fn2
    .byte W05
    .byte    N10, An2, v112
    .byte W10
    .byte FINE

    .align 2, 0

global_label SongHeader_080D9EC8
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A18
    .word Track_080D9E90

    .end
