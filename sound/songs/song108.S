#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B1218:
    .byte KEYSH, 0
    .byte TEMPO, 60
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, Ds2, v127
    .byte W03
    .byte    N03
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080B122C
    .byte 1
    .byte 0
    .byte 160
    .byte 0
    .word 0x80A07CC
    .word Track_080B1218

    .end
