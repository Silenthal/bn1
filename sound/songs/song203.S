#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_08160A60:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, En4, v127
    .byte W04
    .byte    Cn4
    .byte W04
    .byte    En4
    .byte W04
    .byte    N16, Gn4
    .byte W16
    .byte FINE

    .align 2, 0

global_label SongHeader_08160A78
    .byte 1
    .byte 0
    .byte 192
    .byte 0
    .word 0x80A0CB8
    .word Track_08160A60

    .end
