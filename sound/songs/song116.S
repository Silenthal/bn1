#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B12BC:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N40, Cn3, v127
    .byte W40
    .byte FINE

    .align 2, 0

global_label SongHeader_080B12CC
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0844
    .word Track_080B12BC

    .end
