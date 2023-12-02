#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080BAB64:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N10, Bn1, v127
    .byte W10
    .byte    Bn1, v120
    .byte W10
    .byte    Bn1, v100
    .byte W10
    .byte    Bn1, v080
    .byte W10
    .byte    Bn1, v040
    .byte W10
    .byte    Bn1, v020
    .byte W10
    .byte FINE

    .align 2, 0

global_label SongHeader_080BAB84
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0940
    .word Track_080BAB64

    .end
