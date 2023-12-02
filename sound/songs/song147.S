#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080A18C8:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N36, Cn4, v127
    .byte W36
    .byte FINE

    .align 2, 0

global_label SongHeader_080A18D8
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A09F4
    .word Track_080A18C8

    .end
