#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B1060:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N40, An1, v127
    .byte W40
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1070
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0D60
    .word Track_080B1060

    .end
