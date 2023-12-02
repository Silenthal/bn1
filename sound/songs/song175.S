#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B1034:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N12, As1, v127
    .byte W12
    .byte FINE

Track_080B1043:
    .byte KEYSH, 0
    .byte VOICE, 1
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N12, Cn7, v127
    .byte W12
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1050
    .byte 2
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0B5C
    .word Track_080B1034
    .word Track_080B1043

    .end
