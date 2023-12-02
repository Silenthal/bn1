#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B7168:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N80, An1, v127
    .byte W80
    .byte FINE

    .align 2, 0

global_label SongHeader_080B7178
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0D6C
    .word Track_080B7168

    .end
