#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B11F8:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Bn3, v100
    .byte W05
    .byte    N06, Bn3, v052
    .byte W06
    .byte FINE

    .align 2, 0

global_label SongHeader_080B120C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A07A8
    .word Track_080B11F8

    .end
