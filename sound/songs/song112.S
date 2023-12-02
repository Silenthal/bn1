#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B7240:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Dn3, v127
    .byte W04
    .byte    N32, Gn2
    .byte W32
    .byte FINE

    .align 2, 0

global_label SongHeader_080B7254
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A07FC
    .word Track_080B7240

    .end
