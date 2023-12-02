#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D71E4:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N30, Gs4, v127
    .byte W30
    .byte FINE

    .align 2, 0

global_label SongHeader_080D71F4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0C4C
    .word Track_080D71E4

    .end
