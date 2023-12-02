#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_081609F0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TIE, Cn3, v127
    .byte W96
    .byte W84
    .byte EOT
    .byte FINE

    .align 2, 0

global_label SongHeader_08160A04
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0AD8
    .word Track_081609F0

    .end
