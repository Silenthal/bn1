#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080BAAB4:
    .byte KEYSH, 0
    .byte TEMPO, 60
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, An2, v032
    .byte W03
    .byte    An2, v064
    .byte W03
    .byte    An2, v088
    .byte W03
    .byte    An2, v127
    .byte W03
    .byte    N03
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080BAAD0
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0CF4
    .word Track_080BAAB4

    .end
