#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B9B6C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 88
    .byte PAN  , 64
    .byte    N16, Gs3, v127
    .byte W16
    .byte VOICE, 1
    .byte    N16
    .byte W16
    .byte FINE

    .align 2, 0

global_label SongHeader_080B9B80
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0E44
    .word Track_080B9B6C

    .end
