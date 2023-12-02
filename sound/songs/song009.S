#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080A7F58:
    .byte KEYSH, 0
    .byte TEMPO, 58
    .byte VOICE, 0
    .byte VOL  , 118
    .byte PAN  , 64
    .byte XCMD , xIECV, 0, xIECL, 0
    .byte    N10, An1, v112
    .byte W12
    .byte    N12, Gn1, v100
    .byte W12
LABEL_080A7F6F:
    .byte    N06, Bn0, v100
    .byte    N36, Cs2, v072
    .byte W24
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
LABEL_080A7F8A:
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N12, As1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W12
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    Bn0, v092
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte PEND
LABEL_080A7FB1:
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N04, Fs1, v072
    .byte W06
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W12
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A7F8A
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N12, Gn1
    .byte    N12, As1, v060
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v072
    .byte W24
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte PATT
    .word LABEL_080A7F8A
    .byte PATT
    .word LABEL_080A7FB1
    .byte PATT
    .word LABEL_080A7F8A
    .byte    N06, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Dn1
    .byte W06
    .byte    Ds1, v092
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Ds1, v120
    .byte W06
    .byte    Bn0, v112
    .byte    N18, Cs2, v052
    .byte W18
    .byte    N06, Bn0, v112
    .byte    N18, Cs2, v052
    .byte W18
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v052
    .byte W18
    .byte    N06, An1, v120
    .byte W06
    .byte    Gs1
    .byte W06
    .byte    Gn1
    .byte W06
    .byte    N10, Ds1
    .byte    N24, As1, v040
    .byte W24
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v052
    .byte W18
    .byte    N06, Bn0, v080
    .byte W06
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    Bn0, v092
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N12, Gn1
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N18, Cs2, v052
    .byte W18
    .byte    N06, Bn0, v112
    .byte    N18, Cs2, v052
    .byte W18
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v052
    .byte W12
    .byte    N06, An1, v120
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gs1
    .byte W06
    .byte    Gn1
    .byte W06
    .byte    N10, Ds1
    .byte    N24, Cs2, v040
    .byte W18
    .byte    N06, Ds1, v120
    .byte W06
    .byte    Bn0, v112
    .byte    N36, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v080
    .byte W06
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    Bn0, v092
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N12, Gn1
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte PATT
    .word LABEL_080A7F8A
    .byte PATT
    .word LABEL_080A7FB1
    .byte    N06, Ds1, v120
    .byte W06
    .byte    Ds1, v052
    .byte W06
    .byte    Ds1, v080
    .byte W06
    .byte    Ds1, v120
    .byte W06
    .byte    Bn0, v112
    .byte    N12, Ds1, v120
    .byte W12
    .byte    N06, Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N12, Ds1, v120
    .byte W12
    .byte    N06, Bn0, v060
    .byte W06
    .byte    Ds1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N06, Ds1, v080
    .byte W06
    .byte    N12, Ds1, v120
    .byte W12
    .byte    N06, Bn0, v100
    .byte W12
    .byte    N12, Ds1, v120
    .byte    N24, Cs2, v052
    .byte W24
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte PATT
    .word LABEL_080A7F8A
    .byte PATT
    .word LABEL_080A7FB1
    .byte PATT
    .word LABEL_080A7F8A
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N06, Dn1, v040
    .byte W06
    .byte    Ds1, v120
    .byte W06
    .byte    Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte PATT
    .word LABEL_080A7F8A
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N10
    .byte W06
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N10, Bn0, v112
    .byte    N48, Cs2, v052
    .byte W48
    .byte    N10, Bn0, v112
    .byte    N12, As1, v040
    .byte W12
    .byte    N36, Bn1, v060
    .byte W12
    .byte W24
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    Bn0, v092
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
    .byte    An1, v120
    .byte W06
    .byte    N06
    .byte W06
    .byte    N11, Gn1, v072
    .byte W12
    .byte GOTO
    .word LABEL_080A7F6F
    .byte FINE

Track_080A81BF:
    .byte KEYSH, 0
    .byte W24
LABEL_080A81C2:
    .byte VOICE, 15
    .byte VOL  , 113
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 3
    .byte BENDR, 12
    .byte    N12, Cn2, v100
    .byte W12
    .byte    N06, Cn2, v040
    .byte W06
    .byte    Cn2, v020
    .byte W24
    .byte    N12, Cn2, v100
    .byte W12
    .byte    N06, Cn2, v020
    .byte W06
    .byte    N12, Cn2, v100
    .byte W12
LABEL_080A81E6:
    .byte    N06, Cn2, v020
    .byte W24
    .byte    N12, An2, v100
    .byte W12
    .byte    N06, An2, v040
    .byte W06
    .byte    An2, v020
    .byte W24
    .byte    N12, An2, v100
    .byte W12
    .byte    N06, An2, v020
    .byte W06
    .byte    N12, An2, v100
    .byte W12
    .byte PEND
LABEL_080A8202:
    .byte    N06, An2, v020
    .byte W24
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v040
    .byte W06
    .byte    Gn2, v020
    .byte W24
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v020
    .byte W06
    .byte    N12, Gn2, v100
    .byte W12
    .byte PEND
LABEL_080A821E:
    .byte    N06, Gn2, v020
    .byte W24
    .byte    N12, En2, v100
    .byte W12
    .byte    N06, En2, v040
    .byte W06
    .byte    En2, v020
    .byte W24
    .byte    N12, En2, v100
    .byte W12
    .byte    N06, En2, v020
    .byte W06
    .byte    N12, En2, v100
    .byte W12
    .byte PEND
    .byte    N06, En2, v020
    .byte W12
    .byte    N12, Dn2, v092
    .byte W12
    .byte    Cn2, v100
    .byte W12
    .byte    N06, Cn2, v040
    .byte W06
    .byte    Cn2, v020
    .byte W24
    .byte    N12, Cn2, v100
    .byte W12
    .byte    N06, Cn2, v020
    .byte W06
    .byte    N12, Cn2, v100
    .byte W12
    .byte PATT
    .word LABEL_080A81E6
    .byte PATT
    .word LABEL_080A8202
    .byte PATT
    .word LABEL_080A821E
    .byte    N06, En2, v020
    .byte W12
    .byte    N12, Dn2, v092
    .byte W12
    .byte    Cn2, v100
    .byte W12
    .byte    N06, Gn2
    .byte W06
    .byte    Cn2
    .byte W06
    .byte    Cn2, v052
    .byte W06
    .byte    Cn2, v020
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v052
    .byte W06
    .byte    Cn2, v020
    .byte W24
LABEL_080A8286:
    .byte    N06, Cn2, v112
    .byte W06
    .byte    Cn2, v052
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v052
    .byte W06
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N06, Fs2
    .byte W06
    .byte    Bn2
    .byte W06
    .byte    Bn2, v052
    .byte W06
    .byte    Bn2, v020
    .byte W06
    .byte    N18, En2, v100
    .byte W18
    .byte    N06, En2, v052
    .byte W06
    .byte    En2, v020
    .byte W06
    .byte    N06
    .byte W06
    .byte PEND
    .byte    En2, v112
    .byte W06
    .byte    En2, v052
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v052
    .byte W06
    .byte    N12, Cn2, v100
    .byte W12
    .byte    N06, Gn2
    .byte W06
    .byte    Cn2
    .byte W06
    .byte    Cn2, v052
    .byte W06
    .byte    Cn2, v020
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v052
    .byte W06
    .byte    Cn2, v020
    .byte W24
    .byte PATT
    .word LABEL_080A8286
    .byte    N06, En2, v112
    .byte W06
    .byte    En2, v052
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v052
    .byte W06
    .byte    N12, Fn2, v100
    .byte W12
    .byte    N06, Fn2, v040
    .byte W06
    .byte    Fn2, v020
    .byte W24
    .byte    N12, Fn2, v100
    .byte W12
    .byte    N06, Fn2, v020
    .byte W06
    .byte    N12, Fn2, v100
    .byte W12
    .byte    N06, Fn2, v020
    .byte W24
    .byte    N12, Fn2, v100
    .byte W12
    .byte    N06, Fn2, v040
    .byte W06
    .byte    Fn2, v020
    .byte W24
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v052
    .byte W06
    .byte    Cn2, v080
    .byte W06
    .byte    N12, Fn2, v100
    .byte W12
    .byte    N06, Fn2, v020
    .byte W24
    .byte    N12, Dn2, v100
    .byte W12
    .byte    N06, Dn2, v040
    .byte W06
    .byte    Dn2, v020
    .byte W24
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v052
    .byte W06
    .byte    An2, v080
    .byte W06
    .byte    N12, Dn2, v100
    .byte W12
    .byte    N06, Dn2, v020
    .byte W24
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v052
    .byte W06
    .byte    Dn2, v020
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v052
    .byte W06
    .byte    Dn2, v020
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v040
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v040
    .byte W18
    .byte BEND , 64
    .byte    N24, Dn3, v100
    .byte W08
    .byte BEND , 63
    .byte W04
    .byte    Dn3
    .byte W01
    .byte    Cs3
    .byte W02
    .byte    Cn3
    .byte W01
    .byte    As2
    .byte W01
    .byte    Gs2
    .byte W01
    .byte    Gn2
    .byte W01
    .byte    En2
    .byte W01
    .byte    An1
    .byte W01
    .byte    Fn1
    .byte W01
    .byte    Bn0
    .byte W01
    .byte    Ds0
    .byte W01
    .byte    En3
    .byte    N12, Gn2
    .byte W12
    .byte    N06, Gn2, v040
    .byte W06
    .byte    Gn2, v020
    .byte W24
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v020
    .byte W06
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v020
    .byte W12
    .byte    N11, Fs2, v100
    .byte W12
    .byte    N12, En2
    .byte W12
    .byte    N06, En2, v040
    .byte W06
    .byte    En2, v020
    .byte W24
    .byte    En2, v100
    .byte W06
    .byte    N05, En2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    N12, En2
    .byte W12
    .byte    N06, En2, v020
    .byte W12
    .byte    N11, En2, v100
    .byte W12
    .byte    N12, Bn2
    .byte W12
    .byte    N06, Bn2, v040
    .byte W06
    .byte    Bn2, v020
    .byte W24
    .byte    Bn2, v100
    .byte W06
    .byte    N05, Bn2, v052
    .byte W06
    .byte    N06, Fs2, v100
    .byte W06
    .byte    N12, Bn2
    .byte W12
    .byte    N06, Bn2, v020
    .byte W12
    .byte    Bn2, v100
    .byte W06
    .byte    Bn2, v052
    .byte W06
    .byte    N12, Cn3, v100
    .byte W12
    .byte    N06, Cn3, v040
    .byte W06
    .byte    Cn3, v020
    .byte W18
    .byte    Cn2, v100
    .byte W06
    .byte    N05, Cn2, v040
    .byte W06
    .byte    N06, Dn2, v100
    .byte W06
    .byte    Dn2, v040
    .byte W06
    .byte    Dn2, v020
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v020
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v040
    .byte W06
    .byte    Gn2, v020
    .byte W24
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v020
    .byte W06
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v020
    .byte W12
    .byte    N12, Fs2, v100
    .byte W12
    .byte    En2
    .byte W12
    .byte    N06, En2, v040
    .byte W06
    .byte    En2, v020
    .byte W24
    .byte    En2, v100
    .byte W06
    .byte    N05, En2, v052
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    N12, En2
    .byte W12
    .byte    N06, En2, v020
    .byte W12
    .byte    N11, Bn2, v100
    .byte W12
    .byte    N42, Cn3
    .byte W42
    .byte    N06, Cn3, v060
    .byte W06
    .byte BEND , 64
    .byte    N42, Dn3, v100
    .byte W24
    .byte W14
    .byte BEND , 63
    .byte W02
    .byte    Dn3
    .byte W01
    .byte    Cs3
    .byte W01
    .byte    Cn3
    .byte    N06, Dn3, v060
    .byte W01
    .byte BEND , 58
    .byte W01
    .byte    Gs2
    .byte W01
    .byte    Fn2
    .byte W01
    .byte    Cn2
    .byte W01
    .byte    Gn1
    .byte W01
    .byte    En3
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v040
    .byte W06
    .byte    Gn2, v020
    .byte W24
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v020
    .byte W06
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn2, v020
    .byte W06
    .byte    N06
    .byte W06
    .byte    N11, Dn2, v100
    .byte W12
    .byte GOTO
    .word LABEL_080A81C2
    .byte FINE

Track_080A848D:
    .byte KEYSH, 0
    .byte W24
LABEL_080A8490:
    .byte VOICE, 1
    .byte VOL  , 85
    .byte PAN  , 0
    .byte XCMD , xIECV, 30, xIECL, 3
    .byte BENDR, 2
    .byte    N06, Cn3, v092
    .byte W06
    .byte PAN  , 127
    .byte    N06, En3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn3, v052
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3, v032
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn3, v012
    .byte W06
    .byte PAN  , 127
    .byte    N06
    .byte W06
    .byte PAN  , 0
    .byte    N06, Cn3, v092
    .byte W06
    .byte PAN  , 127
    .byte    N06, En3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3
    .byte W06
LABEL_080A84DB:
    .byte PAN  , 0
    .byte    N06, Bn3, v020
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3, v092
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, En3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Cn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, En3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn3, v052
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3, v032
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn3, v012
    .byte W06
    .byte PAN  , 127
    .byte    N06
    .byte W06
    .byte PAN  , 0
    .byte    N06, Cn3, v092
    .byte W06
    .byte PAN  , 127
    .byte    N06, En3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3
    .byte W06
    .byte PEND
LABEL_080A8531:
    .byte PAN  , 0
    .byte    N06, Bn3, v020
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3, v092
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, En3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn2
    .byte W06
    .byte PAN  , 127
    .byte    N06, Dn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Fs3
    .byte W06
    .byte PAN  , 127
    .byte    N06, An3
    .byte W06
    .byte PAN  , 0
    .byte    N06, An3, v052
    .byte W06
    .byte PAN  , 127
    .byte    N06, An3, v032
    .byte W06
    .byte PAN  , 0
    .byte    N06, An3, v012
    .byte W06
    .byte PAN  , 127
    .byte    N06
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn2, v092
    .byte W06
    .byte PAN  , 127
    .byte    N06, Dn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Fs3
    .byte W06
    .byte PAN  , 127
    .byte    N06, An3
    .byte W06
    .byte PEND
LABEL_080A8587:
    .byte PAN  , 0
    .byte    N06, An3, v020
    .byte W06
    .byte PAN  , 127
    .byte    N06, An3, v092
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Fs3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn2
    .byte W06
    .byte PAN  , 127
    .byte    N06, Dn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Fs3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3, v052
    .byte W06
    .byte PAN  , 127
    .byte    N06, Gn3, v032
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3, v012
    .byte W06
    .byte PAN  , 127
    .byte    N06
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn2, v092
    .byte W06
    .byte PAN  , 127
    .byte    N06, Dn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Fs3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Gn3
    .byte W06
    .byte PEND
    .byte PAN  , 0
    .byte    N06, Gn3, v020
    .byte W06
    .byte PAN  , 127
    .byte    N06, Fs3, v092
    .byte W06
    .byte PAN  , 0
    .byte    N06, En3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Dn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Cn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, En3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn3, v052
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3, v032
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn3, v012
    .byte W06
    .byte PAN  , 127
    .byte    N06
    .byte W06
    .byte PAN  , 0
    .byte    N06, Cn3, v092
    .byte W06
    .byte PAN  , 127
    .byte    N06, En3
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn3
    .byte W06
    .byte PATT
    .word LABEL_080A84DB
    .byte PATT
    .word LABEL_080A8531
    .byte PATT
    .word LABEL_080A8587
    .byte PAN  , 0
    .byte    N06, Gn3, v020
    .byte W06
    .byte PAN  , 127
    .byte    N06, Fs3, v092
    .byte W06
    .byte PAN  , 0
    .byte    N06, En3
    .byte W06
    .byte PAN  , 127
    .byte    N06, Dn3
    .byte W06
    .byte PAN  , 64
    .byte    N06, Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Gn4
    .byte W06
    .byte    Gn4, v052
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    Gn4, v020
    .byte W06
    .byte    Gn4, v012
    .byte W18
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    N12, Fs4, v100
    .byte W12
    .byte    N06, Bn3
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Fs4, v020
    .byte W06
    .byte    N18, En4, v092
    .byte W18
    .byte    N12, En4, v040
    .byte W12
    .byte    N06, En4, v020
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Gn4
    .byte W06
    .byte    Gn4, v052
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    Gn4, v020
    .byte W06
    .byte    Gn4, v012
    .byte W18
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    N12, Fs4, v100
    .byte W12
    .byte    N06, An4
    .byte W06
    .byte    Dn4
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    N18, En4, v092
    .byte W18
    .byte    N12, En4, v040
    .byte W12
    .byte    N06, En4, v020
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Cn4
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    An4
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte PAN  , 0
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    An4
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte PAN  , 127
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    An4
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte PAN  , 64
    .byte    N06, Cn5, v100
    .byte W06
    .byte    Fn5
    .byte W06
    .byte    An5
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    An4
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Cn5, v040
    .byte W06
    .byte PAN  , 0
    .byte    N06, Fn4, v100
    .byte W06
    .byte    An4
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Cn5, v040
    .byte W06
    .byte PAN  , 127
    .byte    N06, Fn4, v100
    .byte W06
    .byte    An4
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Cn5, v040
    .byte W06
    .byte PAN  , 64
    .byte    N06, Cn5, v100
    .byte W06
    .byte    An4
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    Dn4
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    An4
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte PAN  , 0
    .byte    N06, Dn4, v100
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    An4
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte PAN  , 127
    .byte    N06, Dn4, v100
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    An4
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte PAN  , 64
    .byte    N06, Dn5, v100
    .byte W06
    .byte    Fs5
    .byte W06
    .byte    An5
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v060
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v060
    .byte W06
    .byte BEND , 64
    .byte    N18, An4, v100
    .byte W02
    .byte BEND , 63
    .byte W01
    .byte    Cs3
    .byte W01
    .byte    Cn3
    .byte W02
    .byte VOL  , 56
    .byte BEND , 58
    .byte W01
    .byte    Gn2
    .byte W01
    .byte    En2
    .byte W01
    .byte VOL  , 37
    .byte BEND , 48
    .byte W02
    .byte    Cn1
    .byte W02
    .byte VOL  , 18
    .byte BEND , 31
    .byte W02
    .byte    FnM1
    .byte W01
    .byte    CnM2
    .byte W02
    .byte    N05, An4, v080
    .byte W06
    .byte VOL  , 85
    .byte BEND , 64
    .byte    N06, An4, v100
    .byte W06
    .byte    An4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W04
    .byte LFOS , 28
    .byte LFODL, 14
    .byte W01
    .byte MODT , 0
    .byte MOD  , 4
    .byte W01
    .byte    N54, Gn4, v100
    .byte W54
    .byte    N06, Gn4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    N60, Gn4
    .byte W60
    .byte    N06, Gn4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    N12, Dn4, v100
    .byte W12
    .byte    N06, Dn4, v060
    .byte W06
    .byte    N12, En4, v100
    .byte W12
    .byte    N06, En4, v060
    .byte W06
    .byte    N21, Fs4, v100
    .byte W24
    .byte    N06
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    N42, Cn4, v100
    .byte W42
    .byte    N06, Cn4, v060
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v060
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    N54, Gn4, v100
    .byte W54
    .byte    N06, Gn4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Bn4, v020
    .byte W06
    .byte    Dn5, v100
    .byte W06
    .byte    Dn5, v040
    .byte W06
    .byte    Dn5, v020
    .byte W06
    .byte    N12, En5, v100
    .byte W12
    .byte    En5, v040
    .byte W12
    .byte    En5, v020
    .byte W12
    .byte    N06, En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    N18, Gn4, v100
    .byte W18
    .byte    N06, Gn4, v060
    .byte W06
    .byte    N18, Gn4, v100
    .byte W18
    .byte    N06, Gn4, v060
    .byte W06
    .byte    N18, En4, v100
    .byte W18
    .byte    N06, En4, v060
    .byte W06
    .byte    N18, Cn4, v100
    .byte W18
    .byte    N06, Cn4, v060
    .byte W06
    .byte    N48, Bn3, v100
    .byte W48
    .byte    N06, Bn3, v060
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Bn3, v020
    .byte W06
    .byte    Bn3, v012
    .byte W06
    .byte W24
    .byte GOTO
    .word LABEL_080A8490
    .byte FINE

Track_080A88D4:
    .byte KEYSH, 0
    .byte W24
LABEL_080A88D7:
    .byte VOICE, 6
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 4
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MODT , 0
    .byte BENDR, 2
    .byte MOD  , 4
    .byte W12
    .byte VOL  , 120
    .byte    N06, En4, v080
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    En4, v080
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    N60, Gn4
    .byte W24
    .byte W03
    .byte VOL  , 103
    .byte W03
    .byte W06
    .byte    Gs2
    .byte W09
    .byte    Cs1
    .byte W09
    .byte    En0
    .byte W12
    .byte    Cn8
    .byte    N06, En4
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    En4, v080
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    N60, Gn4
    .byte W24
    .byte W03
    .byte VOL  , 103
    .byte W03
    .byte W06
    .byte    Gs2
    .byte W09
    .byte    Cs1
    .byte W09
    .byte    En0
    .byte W12
    .byte    Cn8
    .byte    N06, Fs4
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    N30, An4
    .byte W30
    .byte    N06, Fs4
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Dn4, v080
    .byte W06
    .byte    Dn4, v032
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    En4, v080
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    En4, v016
    .byte W06
    .byte    En4, v012
    .byte W12
    .byte W36
    .byte VOL  , 120
    .byte    N06, En4, v080
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    En4, v080
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    N60, Gn4
    .byte W24
    .byte W03
    .byte VOL  , 103
    .byte W03
    .byte W06
    .byte    Gs2
    .byte W09
    .byte    Cs1
    .byte W09
    .byte    En0
    .byte W12
    .byte    Cn8
    .byte    N06
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    An4, v080
    .byte W06
    .byte    N30, Bn4
    .byte W30
    .byte    N06, An4
    .byte W06
    .byte    An4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W18
    .byte VOL  , 120
    .byte    N06, Fs4, v080
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    An4, v080
    .byte W06
    .byte    N30, Fs4
    .byte W30
    .byte    N06, Dn4
    .byte W06
    .byte    Dn4, v032
    .byte W06
    .byte    Bn3, v080
    .byte W06
    .byte    Bn3, v032
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    En4, v080
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    En4, v016
    .byte W06
    .byte    En4, v012
    .byte W12
    .byte W24
    .byte    N12, Bn4, v080
    .byte W12
    .byte    N06, En4
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Bn4, v020
    .byte W06
    .byte    Bn4, v012
    .byte W06
    .byte    Bn4, v008
    .byte W18
    .byte    En4, v080
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    Bn4, v080
    .byte W06
    .byte    Bn4, v032
    .byte W06
    .byte    N12, An4, v080
    .byte W12
    .byte    N06, Dn4
    .byte W06
    .byte    An4
    .byte W06
    .byte    An4, v032
    .byte W06
    .byte    An4, v012
    .byte W06
    .byte    N24, Gn4, v060
    .byte W24
    .byte    N06, Gn4, v032
    .byte W06
    .byte    Gn4, v012
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    An4, v080
    .byte W06
    .byte    An4, v032
    .byte W06
    .byte    N12, Bn4, v080
    .byte W12
    .byte    N06, En4
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    Bn4, v032
    .byte W06
    .byte    Bn4, v016
    .byte W06
    .byte    Bn4, v012
    .byte W06
    .byte    Bn4, v008
    .byte W18
    .byte    En4, v080
    .byte W06
    .byte    En4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    Bn4, v080
    .byte W06
    .byte    Bn4, v032
    .byte W06
    .byte    N12, An4, v080
    .byte W12
    .byte    N06, Dn5, v096
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Fs4, v016
    .byte W06
    .byte    N24, Gn4, v060
    .byte W24
    .byte    N06, Gn4, v032
    .byte W06
    .byte    Gn4, v016
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte TIE, An4, v080
    .byte W72
    .byte W68
    .byte W03
    .byte EOT
    .byte W01
    .byte    N06
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    An4, v032
    .byte W06
    .byte    Bn4, v080
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Bn4, v032
    .byte W06
    .byte    Cn5, v080
    .byte W06
    .byte    Cn5, v040
    .byte W06
    .byte    Bn4, v080
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    An4, v080
    .byte W06
    .byte    N78
    .byte W54
    .byte W24
    .byte    N06
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    An4, v032
    .byte W06
    .byte    Bn4, v080
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Bn4, v032
    .byte W06
    .byte    Cn5, v080
    .byte W06
    .byte    Cn5, v040
    .byte W06
    .byte BEND , 64
    .byte    N18, Dn5, v080
    .byte W02
    .byte BEND , 63
    .byte W01
    .byte    Cs3
    .byte W01
    .byte    Cn3
    .byte W02
    .byte VOL  , 75
    .byte BEND , 58
    .byte W01
    .byte    Gn2
    .byte W01
    .byte    En2
    .byte W01
    .byte VOL  , 56
    .byte BEND , 48
    .byte W02
    .byte    Cn1
    .byte W02
    .byte VOL  , 28
    .byte BEND , 31
    .byte W02
    .byte    FnM1
    .byte W01
    .byte VOL  , 9
    .byte BEND , 0
    .byte W02
    .byte    N05, Dn5, v040
    .byte W06
    .byte VOL  , 120
    .byte BEND , 64
    .byte    N06, Dn5, v080
    .byte W06
    .byte    Dn5, v032
    .byte W06
    .byte    Cn5, v080
    .byte W06
    .byte    Cn5, v032
    .byte W06
    .byte    N54, Bn4, v080
    .byte W54
    .byte    N06, Bn4, v032
    .byte W06
    .byte    Bn4, v080
    .byte W06
    .byte    Bn4, v032
    .byte W06
    .byte    Cn5, v080
    .byte W06
    .byte    Cn5, v032
    .byte W06
    .byte    Dn5, v080
    .byte W06
    .byte    N60, Bn4
    .byte W60
    .byte    N06, Bn4, v032
    .byte W06
    .byte    Bn4, v080
    .byte W06
    .byte    Bn4, v032
    .byte W06
    .byte    An4, v080
    .byte W06
    .byte    An4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    N12, Fs4, v080
    .byte W12
    .byte    N06, Fs4, v032
    .byte W06
    .byte    N12, Gn4, v080
    .byte W12
    .byte    N06, Gn4, v032
    .byte W06
    .byte    N21, An4, v080
    .byte W24
    .byte    N06
    .byte W06
    .byte    An4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    N42, En4, v080
    .byte W42
    .byte    N06, En4, v040
    .byte W06
    .byte    Fs4, v080
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Fs4, v032
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    An4, v080
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    N54, Bn4, v080
    .byte W54
    .byte    N06, Bn4, v032
    .byte W06
    .byte    Bn4, v080
    .byte W06
    .byte    Bn4, v032
    .byte W06
    .byte    Cn5, v080
    .byte W06
    .byte    Cn5, v032
    .byte W06
    .byte    Dn5, v080
    .byte W06
    .byte    Dn5, v032
    .byte W06
    .byte    En5, v080
    .byte W06
    .byte    En5, v032
    .byte W06
    .byte    En5, v016
    .byte W06
    .byte    Fs5, v080
    .byte W06
    .byte    Fs5, v032
    .byte W06
    .byte    Fs5, v016
    .byte W06
    .byte    N12, Gn5, v080
    .byte W12
    .byte    Gn5, v032
    .byte W12
    .byte    Gn5, v016
    .byte W12
    .byte    N06, Gn4, v080
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    An4, v080
    .byte W06
    .byte    An4, v032
    .byte W06
    .byte    N18, Cn5, v080
    .byte W18
    .byte    N06, Cn5, v040
    .byte W06
    .byte    N18, Bn4, v080
    .byte W18
    .byte    N06, Bn4, v040
    .byte W06
    .byte    N18, Gn4, v080
    .byte W18
    .byte    N06, Gn4, v040
    .byte W06
    .byte    N18, An4, v080
    .byte W18
    .byte    N06, An4, v040
    .byte W06
    .byte    N48, Gn4, v080
    .byte W48
    .byte    N06, Gn4, v040
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    Gn4, v016
    .byte W06
    .byte    Gn4, v012
    .byte W06
    .byte W24
    .byte GOTO
    .word LABEL_080A88D7
    .byte FINE

Track_080A8BF9:
    .byte KEYSH, 0
    .byte VOICE, 16
    .byte VOL  , 73
    .byte PAN  , 64
    .byte    N05, Dn3, v036
    .byte W04
    .byte    En3
    .byte W05
    .byte    Fs3
    .byte W05
    .byte    Gn3, v040
    .byte W05
    .byte    An3
    .byte W05
LABEL_080A8C0E:
    .byte TIE, Bn3, v056
    .byte W72
    .byte W96
    .byte W18
    .byte EOT
    .byte    N06, Bn3, v032
    .byte W06
    .byte TIE, An3, v048
    .byte W72
    .byte W54
    .byte EOT
    .byte    N06, An3, v032
    .byte W06
    .byte    N36, Gn3, v048
    .byte W36
    .byte    N24, An3
    .byte W24
    .byte TIE, Bn3
    .byte W72
    .byte W96
    .byte W18
    .byte EOT
    .byte    N06, Bn3, v032
    .byte W06
    .byte TIE, An3, v048
    .byte W72
    .byte W54
    .byte EOT
    .byte    N06, An3, v032
    .byte W06
    .byte    N36, Gn3, v048
    .byte W36
    .byte    N24, Fs3
    .byte W24
    .byte    N06, Gn3, v056
    .byte W06
    .byte    Gn3, v028
    .byte W06
    .byte    Gn3, v008
    .byte W06
    .byte    Gn1, v116
    .byte W06
    .byte    An1
    .byte W12
    .byte    Bn1
    .byte W36
    .byte    N12, An3, v036
    .byte W12
    .byte    Gn3
    .byte W12
    .byte    N36, Fs3, v048
    .byte W36
    .byte    En3
    .byte W36
    .byte    N24, Fs3
    .byte W24
    .byte    N06, Gn3, v056
    .byte W06
    .byte    Gn3, v028
    .byte W06
    .byte    Gn3, v008
    .byte W06
    .byte    Gn1, v116
    .byte W06
    .byte    An1
    .byte W12
    .byte    Bn1
    .byte W24
    .byte    N24, An3, v036
    .byte W12
    .byte W12
    .byte    N12, Gn3
    .byte W12
    .byte    N36, Fs3, v048
    .byte W36
    .byte    N30, En3
    .byte W30
    .byte    N06, En3, v032
    .byte W06
    .byte    N24, Dn3, v048
    .byte W24
    .byte    N42, Cn3
    .byte W42
    .byte    N06, Cn3, v032
    .byte W06
    .byte    N18, Cn3, v048
    .byte W18
    .byte    Dn3
    .byte W06
    .byte W12
    .byte    N12, En3
    .byte W12
    .byte    N60, Fn3
    .byte W60
    .byte    N06, Fn3, v032
    .byte W06
    .byte    N18, En3, v048
    .byte W06
    .byte W12
    .byte    N12, Fn3
    .byte W12
    .byte    N72, Fs3
    .byte W72
    .byte    N06, Fs3, v032
    .byte W06
    .byte    Dn3, v048
    .byte W06
    .byte    En3
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    Fs3, v032
    .byte W06
    .byte    Fs3, v008
    .byte W06
    .byte    Gn3, v048
    .byte W06
    .byte    Gn3, v032
    .byte W06
    .byte    Gn3, v008
    .byte W06
    .byte    An3, v048
    .byte W06
    .byte    An3, v028
    .byte W06
    .byte    An3, v048
    .byte W06
    .byte    An3, v032
    .byte W06
    .byte    An3, v008
    .byte W06
    .byte    An3, v004
    .byte W06
    .byte    N24, Dn3, v048
    .byte W24
    .byte    N06, Gn1, v116
    .byte    N30, Gn3, v048
    .byte W24
    .byte    N06, Gn1, v116
    .byte W06
    .byte    An1
    .byte    N06, Gn3, v032
    .byte W06
    .byte    N36, Gn3, v048
    .byte W06
    .byte    N06, Bn1, v116
    .byte W30
    .byte    N24, Fs3, v048
    .byte W24
    .byte    N06, Gn1, v116
    .byte    N42, En3, v048
    .byte W24
    .byte    N06, Gn1, v116
    .byte W06
    .byte    An1
    .byte W12
    .byte    Bn1
    .byte    N06, En3, v032
    .byte W06
    .byte    N18, En3, v048
    .byte W12
    .byte    N06, Gn1, v116
    .byte W06
    .byte    N18, Fs3, v048
    .byte W06
    .byte W12
    .byte    N12, Gn3
    .byte W12
    .byte    N06, An1, v116
    .byte    N42, An3, v048
    .byte W24
    .byte    N06, An1, v116
    .byte W06
    .byte    N12, Bn1
    .byte W12
    .byte    N06, An1
    .byte    N06, An3, v032
    .byte W06
    .byte    N18, Cn4, v048
    .byte W18
    .byte    Bn3
    .byte W06
    .byte W12
    .byte    N12, An3
    .byte W12
    .byte    N06, Gn1, v116
    .byte    N30, Gn3, v048
    .byte W24
    .byte    N06, Fs1, v116
    .byte W06
    .byte    Gn1
    .byte    N06, Gn3, v016
    .byte W06
    .byte    Fs3, v048
    .byte W06
    .byte    An1, v116
    .byte    N06, Gn3, v048
    .byte W06
    .byte    An3
    .byte W06
    .byte    An3, v032
    .byte W06
    .byte    Dn2, v116
    .byte    N06, An3, v008
    .byte W06
    .byte    Bn3, v048
    .byte W06
    .byte    Bn3, v032
    .byte W06
    .byte    Bn3, v008
    .byte W06
    .byte    Cn4, v048
    .byte W06
    .byte    Cn4, v032
    .byte W06
    .byte    Gn1, v116
    .byte    N54, Dn4, v048
    .byte W24
    .byte    N06, Gn1, v116
    .byte W06
    .byte    An1
    .byte W12
    .byte    Bn1
    .byte W12
    .byte    Dn4, v032
    .byte W06
    .byte    N18, Dn4, v048
    .byte W12
    .byte    Cn4
    .byte W12
    .byte    N12, Bn3
    .byte W12
    .byte    N06, Gn1, v116
    .byte    N12, Gn3, v048
    .byte W12
    .byte    N06, Gn3, v032
    .byte W06
    .byte    N12, An3, v048
    .byte W06
    .byte    N06, Gn1, v116
    .byte W06
    .byte    An1
    .byte    N06, An3, v032
    .byte W06
    .byte    Bn3, v048
    .byte W06
    .byte    Bn1, v116
    .byte    N06, Bn3, v032
    .byte W06
    .byte    Dn3, v016
    .byte W06
    .byte    En3
    .byte W06
    .byte    Dn2, v116
    .byte    N06, Fs3, v016
    .byte W06
    .byte    Gn3, v028
    .byte W06
    .byte    An3
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Cn4, v036
    .byte W06
    .byte    Dn4
    .byte W06
    .byte    N42, En4, v048
    .byte W42
    .byte    N06, En4, v032
    .byte W06
    .byte    N42, Dn4, v048
    .byte W24
    .byte W18
    .byte    N06, Dn4, v032
    .byte W06
    .byte    N84, Bn3, v048
    .byte W44
    .byte W02
    .byte VOL  , 72
    .byte W04
    .byte    Fn3
    .byte W04
    .byte    An2
    .byte W04
    .byte    Dn2
    .byte W04
    .byte    Fs1
    .byte W04
    .byte    As0
    .byte W04
    .byte    Ds0
    .byte W02
    .byte W02
    .byte    GnM1
    .byte W04
    .byte    CnM1
    .byte W04
    .byte    EnM2
    .byte W02
    .byte    Gs4
    .byte    N06, Gn3, v036
    .byte W06
    .byte    An3
    .byte W06
    .byte GOTO
    .word LABEL_080A8C0E
    .byte FINE

    .align 2, 0

global_label SongHeader_080A8DFC
    .byte 5
    .byte 0
    .byte 0
    .byte 163
    .word 0x809F788
    .word Track_080A7F58
    .word Track_080A81BF
    .word Track_080A848D
    .word Track_080A88D4
    .word Track_080A8BF9

    .end
