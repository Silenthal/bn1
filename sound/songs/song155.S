#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D1994:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N20, Cn4, v064
    .byte W20
    .byte FINE

    .align 2, 0

global_label SongHeader_080D19A4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A54
    .word Track_080D1994

    .end
