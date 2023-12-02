#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080A190C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N30, Cn4, v127
    .byte W30
    .byte FINE

    .align 2, 0

global_label SongHeader_080A191C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A09E8
    .word Track_080A190C

    .end
