#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D7200:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte BENDR, 36
    .byte    N18, Cn2, v127
    .byte W01
    .byte BEND , 64
    .byte W01
    .byte    Gs3
    .byte W01
    .byte    Cn4
    .byte W01
    .byte    En4
    .byte W01
    .byte    An4
    .byte W01
    .byte    Cs5
    .byte W01
    .byte    Fn5
    .byte W01
    .byte    An5
    .byte W01
    .byte    Dn6
    .byte W01
    .byte    Fs6
    .byte W01
    .byte    As6
    .byte W01
    .byte    Dn7
    .byte W01
    .byte    Gn7
    .byte W01
    .byte    Bn7
    .byte W01
    .byte    Ds8
    .byte W01
    .byte W00
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080D7234
    .byte 1
    .byte 0
    .byte 96
    .byte 0
    .word 0x80A0850
    .word Track_080D7200

    .end
