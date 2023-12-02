#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080C6C60:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 127
    .byte PAN  , 64
    .byte    N13, Cn7, v127
    .byte W14
    .byte    Cn7, v064
    .byte W14
    .byte    Cn7, v032
    .byte W14
    .byte    Cn7, v016
    .byte W14
    .byte    Cn7, v008
    .byte W13
    .byte FINE

Track_080C6C7B:
    .byte KEYSH, 0
    .byte VOICE, 1
    .byte VOL  , 127
    .byte PAN  , 64
    .byte BENDR, 72
    .byte    N13, Cn6, v127
    .byte W01
    .byte BEND , 64
    .byte W01
    .byte    As2
    .byte W01
    .byte    Fn2
    .byte W01
    .byte    Cn2
    .byte W01
    .byte    Fs1
    .byte W01
    .byte    Cs1
    .byte W01
    .byte    Gs0
    .byte W01
    .byte    Dn0
    .byte W01
    .byte    AnM1
    .byte W01
    .byte    EnM1
    .byte W01
    .byte    AsM2
    .byte W01
    .byte    FnM2
    .byte W01
    .byte    CnM2
    .byte W01
    .byte    N13, Cn6, v064
    .byte W01
    .byte BEND , 64
    .byte W01
    .byte    As2
    .byte W01
    .byte    Fn2
    .byte W01
    .byte    Cn2
    .byte W01
    .byte    Fs1
    .byte W01
    .byte    Cs1
    .byte W01
    .byte    Gs0
    .byte W01
    .byte    Dn0
    .byte W01
    .byte    AnM1
    .byte W01
    .byte    EnM1
    .byte W01
    .byte    AsM2
    .byte W01
    .byte    FnM2
    .byte W01
    .byte    CnM2
    .byte W01
    .byte    N13, Cn6, v032
    .byte W01
    .byte BEND , 64
    .byte W01
    .byte    As2
    .byte W01
    .byte    Fn2
    .byte W01
    .byte    Cn2
    .byte W01
    .byte    Fs1
    .byte W01
    .byte    Cs1
    .byte W01
    .byte    Gs0
    .byte W01
    .byte    Dn0
    .byte W01
    .byte    AnM1
    .byte W01
    .byte    EnM1
    .byte W01
    .byte    AsM2
    .byte W01
    .byte    FnM2
    .byte W01
    .byte    CnM2
    .byte W01
    .byte    N13, Cn6, v016
    .byte W01
    .byte BEND , 64
    .byte W01
    .byte    As2
    .byte W01
    .byte    Fn2
    .byte W01
    .byte    Cn2
    .byte W01
    .byte    Fs1
    .byte W01
    .byte    Cs1
    .byte W01
    .byte    Gs0
    .byte W01
    .byte    Dn0
    .byte W01
    .byte    AnM1
    .byte W01
    .byte    EnM1
    .byte W01
    .byte    AsM2
    .byte W01
    .byte    FnM2
    .byte W01
    .byte    CnM2
    .byte W01
    .byte    N13, Cn6, v008
    .byte W01
    .byte BEND , 64
    .byte W01
    .byte    As2
    .byte W01
    .byte    Fn2
    .byte W01
    .byte    Cn2
    .byte W01
    .byte    Fs1
    .byte W01
    .byte    Cs1
    .byte W01
    .byte    Gs0
    .byte W01
    .byte    Dn0
    .byte W01
    .byte    AnM1
    .byte W01
    .byte    EnM1
    .byte W01
    .byte    AsM2
    .byte W01
    .byte    FnM2
    .byte W01
    .byte    CnM2
    .byte W01
    .byte FINE

    .align 2, 0

global_label SongHeader_080C6D24
    .byte 2
    .byte 0
    .byte 255
    .byte 0
    .word 0x80A082C
    .word Track_080C6C60
    .word Track_080C6C7B

    .end
