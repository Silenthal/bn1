#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B71C0:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N68, An1, v127
    .byte W68
    .byte W02
    .byte FINE

    .align 2, 0

global_label SongHeader_080B71D0
    .byte 1
    .byte 0
    .byte 64
    .byte 0
    .word 0x80A0DFC
    .word Track_080B71C0

    .end
