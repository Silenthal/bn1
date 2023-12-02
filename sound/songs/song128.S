#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B7304:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N01, Bn1, v016
    .byte W01
    .byte    Bn1, v032
    .byte W01
    .byte    Bn1, v064
    .byte W01
    .byte    N30, Bn1, v127
    .byte W30
    .byte    N04
    .byte W04
    .byte    Bn1, v064
    .byte W04
    .byte    Bn1, v032
    .byte W04
    .byte    Bn1, v016
    .byte W04
    .byte FINE

    .align 2, 0

global_label SongHeader_080B7328
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A08D4
    .word Track_080B7304

    .end
