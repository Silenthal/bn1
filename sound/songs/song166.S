#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D2348:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TIE, Cn3, v127
    .byte W96
    .byte W04
    .byte EOT
    .byte FINE

    .align 2, 0

global_label SongHeader_080D235C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0AF0
    .word Track_080D2348

    .end
