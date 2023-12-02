#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080C7A94:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, As6, v088
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080C7AA4
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0DD8
    .word Track_080C7A94

    .end
