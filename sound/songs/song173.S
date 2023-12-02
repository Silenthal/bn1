#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B1164:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N12, Cn4, v127
    .byte W12
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1174
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B44
    .word Track_080B1164

    .end
