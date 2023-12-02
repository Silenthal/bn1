#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D23C0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte XCMD , xIECV, 127, xIECL, 5
    .byte    N08, Bn5, v127
    .byte W08
    .byte FINE

    .align 2, 0

global_label SongHeader_080D23D4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A30
    .word Track_080D23C0

    .end
