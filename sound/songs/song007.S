#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080A6538:
    .byte KEYSH, 0
LABEL_080A653A:
    .byte TEMPO, 73
    .byte VOICE, 0
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 2
    .byte    N06, Bn0, v112
    .byte    N24, Cs2, v052
    .byte W24
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
LABEL_080A6570:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v052
    .byte W12
    .byte PEND
LABEL_080A65A1:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A6570
LABEL_080A65D3:
    .byte    N06, Bn0, v112
    .byte    N24, Cs2, v052
    .byte W24
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A6570
    .byte PATT
    .word LABEL_080A65A1
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W06
    .byte    N06, Ds1, v100
    .byte W06
    .byte    N02, Fs1, v052
    .byte    N10, Gn1, v120
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N24, Cs2, v052
    .byte W24
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v052
    .byte W12
    .byte PATT
    .word LABEL_080A6570
    .byte PATT
    .word LABEL_080A65A1
    .byte PATT
    .word LABEL_080A6570
    .byte PATT
    .word LABEL_080A65D3
    .byte PATT
    .word LABEL_080A6570
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v080
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Ds1, v120
    .byte    N02, Fs1, v072
    .byte W06
    .byte    N06, Ds1, v080
    .byte W06
    .byte    An1, v120
    .byte W06
    .byte    Gs1
    .byte W06
    .byte    N12, Gn1
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N06, Bn0, v112
    .byte W12
    .byte    Ds1, v120
    .byte    N02, Fs1, v072
    .byte W06
    .byte    N06, Ds1, v120
    .byte W06
    .byte    N02, Fs1, v052
    .byte    N10, Gn1, v120
    .byte W12
    .byte PATT
    .word LABEL_080A65D3
    .byte PATT
    .word LABEL_080A6570
    .byte PATT
    .word LABEL_080A65A1
    .byte PATT
    .word LABEL_080A6570
    .byte PATT
    .word LABEL_080A65D3
    .byte PATT
    .word LABEL_080A6570
    .byte PATT
    .word LABEL_080A65A1
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Ds1, v120
    .byte    N02, Fs1, v072
    .byte W06
    .byte    N06, Ds1, v100
    .byte W06
    .byte    N10, Gn1, v120
    .byte W12
    .byte PATT
    .word LABEL_080A65D3
    .byte PATT
    .word LABEL_080A6570
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W12
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W12
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N48, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v127
    .byte W24
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v127
    .byte    N02, Fs1, v072
    .byte W12
    .byte    N10, Ds1, v100
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Ds1, v120
    .byte    N36, Cs2, v052
    .byte W06
    .byte    N06, Ds1, v112
    .byte W06
    .byte    An1, v120
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gs1
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gn1
    .byte W06
    .byte    Bn0, v112
    .byte    N48, Cs2, v060
    .byte W30
    .byte    N06, Ds1, v112
    .byte W06
    .byte    Ds1, v120
    .byte W06
    .byte    N10, Gn1
    .byte    N10, As1, v052
    .byte W12
    .byte GOTO
    .word LABEL_080A653A
    .byte FINE

Track_080A67DB:
    .byte KEYSH, 0
LABEL_080A67DD:
    .byte VOICE, 15
    .byte VOL  , 94
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte    N06, Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
LABEL_080A6823:
    .byte    N06, Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte PEND
LABEL_080A6855:
    .byte    N06, Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte    Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte    Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte    Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte PEND
LABEL_080A6887:
    .byte    N06, As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080A6823
    .byte PATT
    .word LABEL_080A6823
    .byte PATT
    .word LABEL_080A6855
    .byte PATT
    .word LABEL_080A6887
    .byte    N06, Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte    Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs1, v100
    .byte W06
    .byte    Gs1, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte PATT
    .word LABEL_080A6823
    .byte    N06, Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn3, v100
    .byte W06
    .byte    Fn3, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
LABEL_080A6964:
    .byte    N06, Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn3, v100
    .byte W06
    .byte    Fn3, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte    Gn3, v100
    .byte W06
    .byte    Gn3, v040
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte PEND
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Bn2, v100
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    Bn2, v100
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn3, v100
    .byte W06
    .byte    Fn3, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    N12, Cs3, v100
    .byte W12
    .byte    N06, Cs3, v060
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Cs3, v060
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    N42, Gn2, v100
    .byte W42
    .byte    N06, Gn2, v040
    .byte W06
    .byte    N05, Gn2, v100
    .byte W06
    .byte    As2
    .byte W06
LABEL_080A6A15:
    .byte    N06, Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte PEND
LABEL_080A6A47:
    .byte    N06, Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte PEND
LABEL_080A6A79:
    .byte    N06, As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte PEND
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Dn3, v100
    .byte W06
    .byte    Dn3, v040
    .byte W06
    .byte    Dn3, v100
    .byte W06
    .byte    Dn3, v040
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte PATT
    .word LABEL_080A6A15
    .byte PATT
    .word LABEL_080A6A47
    .byte PATT
    .word LABEL_080A6A79
    .byte PATT
    .word LABEL_080A6A15
    .byte PATT
    .word LABEL_080A6A15
    .byte PATT
    .word LABEL_080A6A47
    .byte PATT
    .word LABEL_080A6964
    .byte    N06, Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte PATT
    .word LABEL_080A6A15
    .byte    N15, Cn2, v100
    .byte W18
    .byte    N15
    .byte W18
    .byte    N06
    .byte W06
    .byte    N06
    .byte W54
    .byte GOTO
    .word LABEL_080A67DD
    .byte FINE

Track_080A6B44:
    .byte KEYSH, 0
LABEL_080A6B46:
    .byte VOICE, 20
    .byte VOL  , 70
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte TIE, Cn3, v060
    .byte TIE, En3
    .byte W96
    .byte W96
    .byte EOT, Cn3, v064
    .byte    N96, As2
    .byte    N96, Ds3, v072
    .byte W96
    .byte    Cn3, v060
    .byte    N96, Fn3
    .byte W96
    .byte TIE, Cn3
    .byte TIE, En3
    .byte W96
    .byte W96
    .byte EOT, Cn3, v064
    .byte    N96, As2
    .byte    N96, Ds3
    .byte W96
    .byte    Cn3
    .byte    N96, Fn3
    .byte W96
    .byte VOICE, 21
    .byte    N48, Ds2, v120
    .byte    N48, Gn3, v040
    .byte W48
    .byte    N36, Dn2, v120
    .byte    N48, Fn3, v040
    .byte W36
    .byte    N06, Ds2, v120
    .byte W06
    .byte    Dn2
    .byte W06
    .byte    N54, Cn2
    .byte    N96, Ds3, v040
    .byte W54
    .byte    N06, Cn2
    .byte W06
    .byte    N12, Cn2, v120
    .byte W12
    .byte    Dn2
    .byte W12
    .byte    Ds2
    .byte W12
    .byte    N24, Gn2
    .byte TIE, As3, v040
    .byte W24
    .byte    N24, Fn2, v120
    .byte W24
    .byte    Ds2
    .byte W24
    .byte    Fn2
    .byte W24
    .byte    N36
    .byte W36
    .byte    N42, Gn2
    .byte W42
    .byte EOT, As3
    .byte    N06, Gn2, v040
    .byte    N06, As3, v032
    .byte W06
    .byte    Fn2, v120
    .byte    N06, As3, v020
    .byte W06
    .byte    Gn2, v120
    .byte    N06, As3, v012
    .byte W06
    .byte    N18, As2, v120
    .byte    N48, Gn3, v040
    .byte W18
    .byte    N18, Gs2, v120
    .byte W18
    .byte    N12, Gn2
    .byte W12
    .byte    N36, Fn2
    .byte    N48, Bn3, v040
    .byte W36
    .byte    N12, Dn2, v120
    .byte W12
    .byte    N18, Ds2
    .byte    N96, Cn4, v040
    .byte W18
    .byte    N18, Dn2, v120
    .byte W18
    .byte    N48, Cn2
    .byte W48
    .byte    N12, As1
    .byte W12
    .byte    N24, Cn2
    .byte    N48, Gs3, v040
    .byte W24
    .byte    N24, Dn2, v120
    .byte W24
    .byte    Ds2
    .byte    N48, Cn4, v040
    .byte W24
    .byte    N24, Fn2, v120
    .byte W24
    .byte    N18, Gn2
    .byte    N18, Bn3, v040
    .byte W18
    .byte    N06, Gn2, v120
    .byte    N06, Bn3, v040
    .byte W06
    .byte    Gn2
    .byte W12
    .byte    N54, As2, v080
    .byte    N32, Fn3, v040
    .byte W36
    .byte    N06, Fn2, v060
    .byte W06
    .byte    Gn2
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    As2, v040
    .byte    N06, As3, v080
    .byte W06
    .byte TIE, Cn4, v072
    .byte W96
    .byte W96
    .byte EOT
    .byte    N96, As3
    .byte W96
    .byte    N72
    .byte W72
    .byte    N24, Bn3
    .byte W24
    .byte TIE, Cn4
    .byte W96
    .byte W96
    .byte EOT
    .byte    N96, As3
    .byte W96
    .byte    N72
    .byte W72
    .byte    N12, Gn1, v100
    .byte    N06, Fn3, v060
    .byte W06
    .byte    Gn3
    .byte W06
    .byte    N12, Cn2, v100
    .byte    N06, Gs3, v060
    .byte W06
    .byte    As2
    .byte W06
    .byte    N12, Ds2, v100
    .byte TIE, Cn4, v072
    .byte W12
    .byte    N12, Dn2, v100
    .byte W12
    .byte    Cn2
    .byte W12
    .byte    N06, Dn2
    .byte W06
    .byte    N24, Gn1
    .byte W24
    .byte    N06, Gn1, v040
    .byte W06
    .byte    N12, Gn1, v100
    .byte W12
    .byte    Cn2
    .byte W12
    .byte    Ds2
    .byte W12
    .byte    Dn2
    .byte W12
    .byte    Cn2
    .byte W12
    .byte    N06, Dn2
    .byte W06
    .byte    N24, Gs1
    .byte W24
    .byte    N06, Gs1, v040
    .byte W06
    .byte    N12, Gs1, v100
    .byte W12
    .byte    As1
    .byte W12
    .byte EOT, Cn4
    .byte    N18, Cn2
    .byte    N48, Ds4, v072
    .byte W18
    .byte    N18, As1, v100
    .byte W18
    .byte    N12, Gn1
    .byte W12
    .byte    N18, Dn2
    .byte    N48, Dn4, v072
    .byte W18
    .byte    N18, Cn2, v100
    .byte W18
    .byte    N12, As1
    .byte W12
    .byte    N18, Ds2
    .byte    N48, Cn4, v072
    .byte W18
    .byte    N18, Dn2, v100
    .byte W18
    .byte    N12, Cn2
    .byte W12
    .byte    N18, Fn2
    .byte    N48, As3, v072
    .byte W18
    .byte    N18, Ds2, v100
    .byte W18
    .byte    N09, Dn2
    .byte W09
    .byte TIE, Gn1, v052
    .byte TIE, Cn4, v072
    .byte W03
    .byte W96
    .byte W48
    .byte EOT, Gn1, v072
    .byte    N06, Gn1, v020
    .byte    N06, Cn4, v040
    .byte W48
    .byte GOTO
    .word LABEL_080A6B46
    .byte FINE

Track_080A6CDC:
    .byte KEYSH, 0
LABEL_080A6CDE:
    .byte VOICE, 1
    .byte VOL  , 103
    .byte PAN  , 127
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 4
    .byte MODT , 0
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v032
    .byte W06
    .byte    N18, Bn3, v100
    .byte W18
    .byte    N06, Cn4
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v060
    .byte W06
    .byte    Dn4, v032
    .byte W06
    .byte    N18, Cn4, v100
    .byte W18
    .byte    N06, Gn3
    .byte W06
    .byte    Gn3, v060
    .byte W06
LABEL_080A6D1A:
    .byte PAN  , 0
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v032
    .byte W06
    .byte    N18, Bn3, v100
    .byte W18
    .byte    N06, Cn4
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v060
    .byte W06
    .byte    Dn4, v032
    .byte W06
    .byte    N18, Cn4, v100
    .byte W18
    .byte    N06, Gn3
    .byte W06
    .byte    Gn3, v060
    .byte W06
    .byte PEND
LABEL_080A6D44:
    .byte PAN  , 127
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v032
    .byte W06
    .byte    N18, As3, v100
    .byte W18
    .byte    N06, Cn4
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v032
    .byte W06
    .byte    N18, As3, v100
    .byte W18
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v060
    .byte W06
    .byte PEND
LABEL_080A6D6E:
    .byte PAN  , 0
    .byte    N06, Dn4, v100
    .byte W06
    .byte    Dn4, v060
    .byte W06
    .byte    Dn4, v032
    .byte W06
    .byte    N18, Cn4, v100
    .byte W18
    .byte    N06, Dn4
    .byte W06
    .byte    Dn4, v060
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Fn4, v060
    .byte W06
    .byte    Fn4, v032
    .byte W06
    .byte    N18, Ds4, v100
    .byte W18
    .byte    N06, Dn4
    .byte W06
    .byte    Dn4, v060
    .byte W06
    .byte PEND
    .byte PAN  , 127
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v032
    .byte W06
    .byte    N18, Bn3, v100
    .byte W18
    .byte    N06, Cn4
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v060
    .byte W06
    .byte    Dn4, v032
    .byte W06
    .byte    N18, Cn4, v100
    .byte W18
    .byte    N06, Gn3
    .byte W06
    .byte    Gn3, v060
    .byte W06
    .byte PATT
    .word LABEL_080A6D1A
    .byte PATT
    .word LABEL_080A6D44
    .byte PATT
    .word LABEL_080A6D6E
LABEL_080A6DD0:
    .byte PAN  , 127
    .byte    N03, Cn4, v100
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cn4, v100
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cn4, v100
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cn4, v100
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PEND
    .byte PATT
    .word LABEL_080A6DD0
    .byte PAN  , 127
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Fn3, v100
    .byte W03
    .byte    Fn3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Bn4, v100
    .byte W03
    .byte    Bn4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fn3, v100
    .byte W03
    .byte    Fn3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Bn4, v100
    .byte W03
    .byte    Bn4, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cn4, v100
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte    Ds5, v100
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cn4, v100
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte    Ds5, v100
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Cn4, v100
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Cn4, v100
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gs4, v100
    .byte W03
    .byte    Gs4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gs4, v100
    .byte W03
    .byte    Gs4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gn5, v120
    .byte W03
    .byte    Fn5
    .byte W03
    .byte    Ds5
    .byte W03
    .byte PAN  , 64
    .byte    N03, Bn4, v072
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    Fn4
    .byte W03
    .byte    Ds4
    .byte W03
    .byte PAN  , 0
    .byte    N03, Bn3, v080
    .byte W03
    .byte    Gn3
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte    Ds3
    .byte W03
    .byte    N01, Bn2, v040
    .byte W03
    .byte PAN  , 64
    .byte    N42, Fn3, v072
    .byte W42
    .byte    N06, Fn3, v052
    .byte W06
    .byte    Fn3, v032
    .byte W06
    .byte    Fn3, v020
    .byte W06
    .byte PATT
    .word LABEL_080A6DD0
    .byte PATT
    .word LABEL_080A6DD0
LABEL_080A709F:
    .byte PAN  , 127
    .byte    N03, As3, v100
    .byte W03
    .byte    As3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, As3, v100
    .byte W03
    .byte    As3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, As3, v100
    .byte W03
    .byte    As3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, As3, v100
    .byte W03
    .byte    As3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PEND
    .byte PATT
    .word LABEL_080A709F
    .byte PATT
    .word LABEL_080A6DD0
    .byte PATT
    .word LABEL_080A6DD0
    .byte PATT
    .word LABEL_080A709F
    .byte PATT
    .word LABEL_080A6DD0
    .byte PATT
    .word LABEL_080A6DD0
    .byte PATT
    .word LABEL_080A6DD0
    .byte PAN  , 127
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v040
    .byte W03
    .byte    Gn4, v100
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte PATT
    .word LABEL_080A6DD0
    .byte PAN  , 0
    .byte    N03, Cn6, v120
    .byte W03
    .byte    As5
    .byte W03
    .byte    Gn5
    .byte W03
    .byte    Fn5
    .byte W03
    .byte PAN  , 64
    .byte    N03, Cn5, v072
    .byte W03
    .byte    As4
    .byte W03
    .byte    Gn4
    .byte W03
    .byte    Fn4
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cn4, v080
    .byte W03
    .byte    As3
    .byte W03
    .byte    Gn3
    .byte W03
    .byte    Fn3
    .byte W03
    .byte    Cn3, v060
    .byte W03
    .byte    As2
    .byte W03
    .byte    Fn2
    .byte W03
    .byte    Cn2
    .byte W48
    .byte W03
    .byte GOTO
    .word LABEL_080A6CDE
    .byte FINE

Track_080A7240:
    .byte KEYSH, 0
LABEL_080A7242:
    .byte VOICE, 5
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 31
    .byte LFODL, 14
    .byte MOD  , 5
    .byte MODT , 0
    .byte W12
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Cn4, v072
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v072
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v072
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Fn4, v072
    .byte W06
    .byte    Fn4, v052
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v072
    .byte W06
    .byte    En4, v052
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v072
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Fn4, v072
    .byte W06
    .byte    Fn4, v052
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v072
    .byte W06
    .byte    En4, v052
    .byte W06
    .byte    N54, Gn4, v100
    .byte W54
    .byte    N06, Gn4, v060
    .byte W06
LABEL_080A729D:
    .byte W12
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Cn4, v072
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v072
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v072
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v072
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v072
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v072
    .byte W06
    .byte PEND
LABEL_080A72CA:
    .byte    N06, Fn4, v100
    .byte W06
    .byte    Fn4, v080
    .byte W06
    .byte    Fn4, v060
    .byte W06
    .byte    Fn4, v040
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v080
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v080
    .byte W06
    .byte    Dn4, v060
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v080
    .byte W06
    .byte    As3, v060
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte PEND
    .byte W12
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v072
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v072
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v072
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Fn4, v072
    .byte W06
    .byte    Fn4, v052
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v072
    .byte W06
    .byte    En4, v052
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v072
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Fn4, v072
    .byte W06
    .byte    Fn4, v052
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v072
    .byte W06
    .byte    En4, v052
    .byte W06
    .byte    N54, Gn4, v100
    .byte W54
    .byte    N06, Gn4, v072
    .byte W06
    .byte PATT
    .word LABEL_080A729D
    .byte PATT
    .word LABEL_080A72CA
    .byte    N72, Cn4, v100
    .byte W72
    .byte    N06, Cn4, v080
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    Cn4, v020
    .byte W06
    .byte W48
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    Cn4, v020
    .byte W06
    .byte    N18, As3, v060
    .byte W18
    .byte    N06, Cn4
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    N42, Ds4, v060
    .byte W42
    .byte    N06, Ds4, v040
    .byte W06
    .byte    N42, Gn4, v060
    .byte W42
    .byte    N06, Gn4, v040
    .byte W06
    .byte    N36, Dn4, v060
    .byte W36
    .byte    N06, Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    N24, Cn4, v060
    .byte W24
    .byte    N18, As3
    .byte W18
    .byte    N06, As3, v040
    .byte W06
    .byte    N15, Gn4, v072
    .byte W15
    .byte    N03, Gn4, v056
    .byte W03
    .byte    N18, Fn4, v072
    .byte W18
    .byte    N12, Ds4
    .byte W12
    .byte    N32, Dn4
    .byte W32
    .byte W01
    .byte    N03, Dn4, v056
    .byte W03
    .byte    N12, Bn3, v072
    .byte W12
    .byte    N18, Gn4
    .byte W18
    .byte    Fn4
    .byte W18
    .byte    N44, Ds4
    .byte W44
    .byte W01
    .byte    N03, Ds4, v056
    .byte W03
    .byte    N12, Dn4, v072
    .byte W12
    .byte    N48, Ds4
    .byte W48
    .byte    Cn4
    .byte W48
    .byte    N15, Bn3
    .byte W18
    .byte    N06
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    Bn3, v032
    .byte W06
    .byte    N54, Bn3, v060
    .byte W54
    .byte    N06, Bn3, v032
    .byte W06
    .byte VOL  , 103
    .byte    N12, Gn4, v100
    .byte W12
    .byte    Fn4
    .byte W12
    .byte    Ds4
    .byte W12
    .byte    N06, Fn4
    .byte W06
    .byte    N24, Cn4
    .byte W24
    .byte    N06, Cn4, v040
    .byte W06
    .byte    N12, Cn4, v100
    .byte W12
    .byte    Ds4
    .byte W12
LABEL_080A73F4:
    .byte    N12, Gn4, v100
    .byte W12
    .byte    Fn4
    .byte W12
    .byte    Ds4
    .byte W12
    .byte    N06, Fn4
    .byte W06
    .byte    N24, Cn4
    .byte W24
    .byte    N06, Cn4, v060
    .byte W06
    .byte    N12, Cn4, v100
    .byte W12
    .byte    Ds4
    .byte W12
    .byte PEND
LABEL_080A740D:
    .byte    N24, Fn4, v100
    .byte W24
    .byte    Ds4
    .byte W24
    .byte    Dn4
    .byte W24
    .byte    As3
    .byte W24
    .byte PEND
    .byte    N60, As4
    .byte W60
    .byte    N12, Gs4
    .byte W12
    .byte    Gn4
    .byte W12
    .byte    Gs4
    .byte W12
    .byte PATT
    .word LABEL_080A73F4
    .byte PATT
    .word LABEL_080A73F4
    .byte PATT
    .word LABEL_080A740D
    .byte    N60, Cn4, v100
    .byte W60
    .byte    N06, Cn4, v060
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    N12, Cn4, v100
    .byte W12
    .byte    Ds4
    .byte W12
    .byte PATT
    .word LABEL_080A73F4
    .byte    N12, Gn4, v100
    .byte W12
    .byte    Fn4
    .byte W12
    .byte    Ds4
    .byte W12
    .byte    N06, Fn4
    .byte W06
    .byte    N24, Cn4
    .byte W24
    .byte    N06, Cn4, v060
    .byte W06
    .byte    N12, Cn4, v100
    .byte W12
    .byte    Dn4
    .byte W12
    .byte    N15, Ds4
    .byte W15
    .byte    N03, Ds4, v080
    .byte W03
    .byte    N18, Dn4, v100
    .byte W18
    .byte    N09, Cn4
    .byte W09
    .byte    N03, Cn4, v080
    .byte W03
    .byte    N15, Fn4, v100
    .byte W15
    .byte    N03, Fn4, v080
    .byte W03
    .byte    N18, Ds4, v100
    .byte W18
    .byte    N09, Dn4
    .byte W09
    .byte    N03, Dn4, v080
    .byte W03
    .byte    N15, Gn4, v100
    .byte W15
    .byte    N03, Gn4, v080
    .byte W03
    .byte    N18, Fn4, v100
    .byte W18
    .byte    N09, Ds4
    .byte W09
    .byte    N03, Ds4, v080
    .byte W03
    .byte    N15, Dn4, v100
    .byte W15
    .byte    N03, Dn4, v080
    .byte W03
    .byte    N18, Cn4, v100
    .byte W18
    .byte    N09, As3
    .byte W09
    .byte    N03, As3, v080
    .byte W03
    .byte TIE, Cn4, v100
    .byte W96
    .byte W48
    .byte EOT
    .byte W48
    .byte GOTO
    .word LABEL_080A7242
    .byte FINE

    .align 2, 0

global_label SongHeader_080A74B8
    .byte 5
    .byte 0
    .byte 0
    .byte 163
    .word 0x809F560
    .word Track_080A6538
    .word Track_080A67DB
    .word Track_080A6B44
    .word Track_080A6CDC
    .word Track_080A7240

    .end
