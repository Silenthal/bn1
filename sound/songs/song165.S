#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080C6D34:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N20, Cn3, v127
    .byte W20
    .byte FINE

    .align 2, 0

global_label SongHeader_080C6D44
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0AE4
    .word Track_080C6D34

    .end
