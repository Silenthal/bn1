#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B5E20:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N30, Cn4, v127
    .byte W30
    .byte FINE

    .align 2, 0

global_label SongHeader_080B5E30
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0C1C
    .word Track_080B5E20

    .end
