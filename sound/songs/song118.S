#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080A1944:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N01, As1, v127
    .byte W01
    .byte    Cn2
    .byte W02
    .byte    N42, Ds2
    .byte W42
    .byte FINE

    .align 2, 0

global_label SongHeader_080A1958
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A085C
    .word Track_080A1944

    .end
