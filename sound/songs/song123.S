#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D1954:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, Ds3, v127
    .byte W02
    .byte    N08, Gn2
    .byte W08
    .byte    N06, Gn2, v064
    .byte W06
    .byte FINE

    .align 2, 0

global_label SongHeader_080D196C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0898
    .word Track_080D1954

    .end
