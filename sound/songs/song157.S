#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B9B50:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N60, Gn8, v127
    .byte W60
    .byte FINE

    .align 2, 0

global_label SongHeader_080B9B60
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A6C
    .word Track_080B9B50

    .end
