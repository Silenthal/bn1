#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_08160A38:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N01, Gn2, v127
    .byte W01
    .byte    N02, As2
    .byte W02
    .byte    N03, Cn3
    .byte W03
    .byte    N04, En3
    .byte W04
    .byte    N12, Gn3
    .byte W12
    .byte FINE

    .align 2, 0

global_label SongHeader_08160A54
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0A60
    .word Track_08160A38

    .end
