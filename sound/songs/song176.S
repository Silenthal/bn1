#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080BF268:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, Cn3, v127
    .byte W02
    .byte    N04, Cn4
    .byte W06
    .byte    Cn6, v064
    .byte W04
    .byte    N06, Cn6, v032
    .byte W06
    .byte FINE

    .align 2, 0

global_label SongHeader_080BF284
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0B74
    .word Track_080BF268

    .end
