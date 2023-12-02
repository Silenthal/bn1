#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080BAADC:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Cn3, v127
    .byte W05
    .byte    N04
    .byte W05
    .byte    N05, Cn3, v064
    .byte W05
    .byte    Cn3, v032
    .byte W05
    .byte FINE

    .align 2, 0

global_label SongHeader_080BAAF4
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0D00
    .word Track_080BAADC

    .end
