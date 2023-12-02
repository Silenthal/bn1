#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080B125C:
    .byte KEYSH, 0
    .byte TEMPO, 60
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N02, En4, v127
    .byte W02
    .byte    Dn4
    .byte W02
    .byte    En4
    .byte W02
    .byte    N03, An4
    .byte W03
    .byte    Dn5
    .byte W03
    .byte    N02, En4, v060
    .byte W02
    .byte    Dn4
    .byte W02
    .byte    En4
    .byte W02
    .byte    N03, An4
    .byte W03
    .byte    Dn5
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080B1284
    .byte 1
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A07D8
    .word Track_080B125C

    .end
