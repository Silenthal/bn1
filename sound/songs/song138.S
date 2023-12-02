#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B5D90:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, En5, v088
    .byte W04
    .byte    N04, En5, v044
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080B5DA4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0964
    .word Track_080B5D90

    .end
