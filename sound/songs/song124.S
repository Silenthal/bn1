#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B7298:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N48, Cn4, v127
    .byte W48
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080B72A8
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A08A4
    .word Track_080B7298

    .end
