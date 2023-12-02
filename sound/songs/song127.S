#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D7168:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, An2, v032
    .byte W02
    .byte    N01, Bn2, v064
    .byte W01
    .byte    N03, Cs3, v127
    .byte W03
    .byte    N04, En3
    .byte W04
    .byte    N02, Cn3
    .byte W02
    .byte    Bn2, v088
    .byte W02
    .byte    N18, Gn2, v064
    .byte W18
    .byte FINE

    .align 2, 0

global_label SongHeader_080D718C
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A08C8
    .word Track_080D7168

    .end
