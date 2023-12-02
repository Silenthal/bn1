#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080D4184:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N03, Cn4, v127
    .byte W03
    .byte    Dn4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    En4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn4, v064
    .byte W03
    .byte    Dn4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    En4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn4, v032
    .byte W03
    .byte    Dn4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    En4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    An4
    .byte W03
    .byte FINE

Track_080D41B7:
    .byte KEYSH, 0
    .byte W09
    .byte VOICE, 1
    .byte VOL  , 64
    .byte PAN  , 0
    .byte TUNE , 62
    .byte    N03, Cn4, v127
    .byte W03
    .byte    Dn4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    En4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn4, v064
    .byte W03
    .byte    Dn4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    En4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn4, v032
    .byte W03
    .byte    Dn4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    En4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    An4
    .byte W03
    .byte FINE

Track_080D41EB:
    .byte KEYSH, 0
    .byte VOICE, 2
    .byte VOL  , 100
    .byte PAN  , 127
    .byte    N03, Gn4, v127
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    Dn5
    .byte W03
    .byte    Gn4, v032
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    Dn5
    .byte W03
    .byte    Gn4, v016
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    An4
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    Dn5
    .byte W03
    .byte FINE

    .align 2, 0

global_label SongHeader_080D421C
    .byte 3
    .byte 0
    .byte 128
    .byte 0
    .word 0x80A0754
    .word Track_080D4184
    .word Track_080D41B7
    .word Track_080D41EB

    .end
