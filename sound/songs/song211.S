#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B10E4:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N44, Cn3, v127
    .byte W44
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080B10F4
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0D24
    .word Track_080B10E4

    .end
