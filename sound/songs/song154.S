#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B13A8:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N48, Cn6, v064
    .byte W48
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080B13B8
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A48
    .word Track_080B13A8

    .end
