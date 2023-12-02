#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D9F4C:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N04, Cn4, v127
    .byte W04
    .byte    En4
    .byte W04
    .byte    Gn4
    .byte W04
    .byte    As4
    .byte W04
    .byte    Dn5
    .byte W04
    .byte    An5
    .byte W04
    .byte VOICE, 1
    .byte    N08, Cn6
    .byte W08
    .byte    Cn6, v064
    .byte W08
    .byte    Cn6, v032
    .byte W08
    .byte FINE

    .align 2, 0

global_label SongHeader_080D9F70
    .byte 1
    .byte 0
    .byte 192
    .byte 0
    .word 0x80A0E14
    .word Track_080D9F4C

    .end
