#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D9EF0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N32, Cn3, v127
    .byte W32
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080D9F00
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0AA8
    .word Track_080D9EF0

    .end
