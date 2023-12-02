#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080C6C3C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Dn3, v127
    .byte W03
    .byte    N10, Bn2
    .byte W10
    .byte FINE

    .align 2, 0

global_label SongHeader_080C6C54
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A09D0
    .word Track_080C6C3C

    .end
