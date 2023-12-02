#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B11D8:
    .byte KEYSH, 0
    .byte TEMPO, 60
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, En3, v100
    .byte W02
    .byte    N04, Bn2, v072
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080B11EC
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A07C0
    .word Track_080B11D8

    .end
