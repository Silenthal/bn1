#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D71C4:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TIE, Cn4, v127
    .byte W96
    .byte W92
    .byte W02
    .byte EOT
    .byte FINE

    .align 2, 0

global_label SongHeader_080D71D8
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0C28
    .word Track_080D71C4

    .end
