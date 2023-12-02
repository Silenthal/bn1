#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080BACD0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N54, Cn3, v127
    .byte W54
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080BACE0
    .byte 1
    .byte 0
    .byte 224
    .byte 0
    .word 0x80A0C94
    .word Track_080BACD0

    .end
