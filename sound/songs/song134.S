#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080BACAC:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, En6, v127
    .byte W06
    .byte    N03
    .byte W06
    .byte    N03
    .byte W06
    .byte    N03
    .byte W06
    .byte FINE

    .align 2, 0

global_label SongHeader_080BACC4
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0934
    .word Track_080BACAC

    .end
