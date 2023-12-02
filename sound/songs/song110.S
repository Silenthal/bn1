#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B1180:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N07, Gn8, v127
    .byte W07
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1190
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A07E4
    .word Track_080B1180

    .end
