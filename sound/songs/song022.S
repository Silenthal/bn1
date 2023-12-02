#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080BAC3C:
    .byte KEYSH, 0
    .byte TEMPO, 60
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte TIE, Cn3, v127
    .byte W96
LABEL_080BAC4A:
    .byte W96
    .byte GOTO
    .word LABEL_080BAC4A
    .byte W96
    .byte EOT, Cn3
    .byte FINE

    .align 2, 0

global_label SongHeader_080BAC54
    .byte 1
    .byte 0
    .byte 0
    .byte 163
    .word 0x80A0748
    .word Track_080BAC3C

    .end
