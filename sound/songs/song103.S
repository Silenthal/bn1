#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080BABF0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, Cn4, v127
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    Cn4, v064
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    N02, Cn4, v032
    .byte W02
    .byte    Gn4
    .byte W02
    .byte    Cn5
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080BAC14
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0790
    .word Track_080BABF0

    .end
