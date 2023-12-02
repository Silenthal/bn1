#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080ABC78:
    .byte KEYSH, 0
    .byte TEMPO, 73
    .byte W12
LABEL_080ABC7D:
    .byte VOICE, 0
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 2
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v080
    .byte W06
    .byte    N10, Ds1, v120
    .byte W18
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
LABEL_080ABCB9:
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v080
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Ds1
    .byte    N06, As1, v052
    .byte W06
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PEND
LABEL_080ABD04:
    .byte    N06, Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v080
    .byte W06
    .byte    N10, Ds1, v120
    .byte W18
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PEND
LABEL_080ABD3F:
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v080
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Dn1
    .byte    N06, As1, v052
    .byte W06
    .byte    Ds1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Ds1, v100
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte    N10, An1, v120
    .byte W06
    .byte    N02, Fs1, v040
    .byte W06
    .byte PEND
LABEL_080ABD93:
    .byte    N10, Gn1, v120
    .byte    N12, As1, v060
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v080
    .byte W06
    .byte    N10, Ds1, v120
    .byte W18
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080ABCB9
LABEL_080ABDD1:
    .byte    N06, Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v080
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PEND
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v080
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Ds1
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N12, As1, v060
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v080
    .byte W06
    .byte    N10, Ds1, v120
    .byte W18
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PATT
    .word LABEL_080ABCB9
    .byte PATT
    .word LABEL_080ABDD1
LABEL_080ABEA6:
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v080
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Ds1, v092
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte    N10, An1, v120
    .byte W06
    .byte    N02, Fs1, v040
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080ABD93
    .byte PATT
    .word LABEL_080ABCB9
    .byte PATT
    .word LABEL_080ABDD1
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v080
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Ds1
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    Ds1, v072
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Ds1, v100
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Ds1, v120
    .byte    N12, As1, v060
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v080
    .byte W06
    .byte    N10, Ds1, v120
    .byte W18
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PATT
    .word LABEL_080ABCB9
    .byte PATT
    .word LABEL_080ABDD1
    .byte PATT
    .word LABEL_080ABD3F
    .byte PATT
    .word LABEL_080ABD93
    .byte PATT
    .word LABEL_080ABCB9
    .byte PATT
    .word LABEL_080ABD04
    .byte PATT
    .word LABEL_080ABEA6
    .byte PATT
    .word LABEL_080ABD93
    .byte PATT
    .word LABEL_080ABCB9
    .byte    N06, Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v080
    .byte W06
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v060
    .byte    N02, Fs1
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W48
    .byte    N02, Fs1
    .byte W06
    .byte    N06, Dn1
    .byte    N06, As1, v052
    .byte W06
    .byte    Ds1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Ds1, v100
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte    N02, Fs1, v060
    .byte    N10, An1, v120
    .byte W06
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N10, Gn1, v120
    .byte    N12, As1, v060
    .byte W12
    .byte GOTO
    .word LABEL_080ABC7D
    .byte FINE

Track_080AC033:
    .byte KEYSH, 0
    .byte VOICE, 15
    .byte VOL  , 94
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
LABEL_080AC050:
    .byte    N17, Cs2, v120
    .byte W18
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    N05, Cs2
    .byte W06
    .byte    N05
    .byte W06
    .byte    N06, Bn2
    .byte W06
    .byte    N05, Cs3
    .byte W06
    .byte    N06, En2
    .byte W06
    .byte    N05, Fs2
    .byte W06
LABEL_080AC076:
    .byte    N12, Bn1, v100
    .byte W12
    .byte    N17, Cs2, v120
    .byte W18
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    N12, As1
    .byte W12
    .byte    As2
    .byte W12
    .byte    Bn1
    .byte W12
    .byte PEND
LABEL_080AC097:
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N17, Cs2, v120
    .byte W18
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    N05, Cs2
    .byte W06
    .byte    N05
    .byte W06
    .byte    N06, Bn2
    .byte W06
    .byte    N05, Cs3
    .byte W06
    .byte    N06, En2
    .byte W06
    .byte    N05, Fs2
    .byte W06
    .byte PEND
LABEL_080AC0C2:
    .byte    N12, Bn1, v100
    .byte W12
    .byte    N17, Cs2, v120
    .byte W18
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    N05, En3, v100
    .byte W06
    .byte    Ds3
    .byte W06
    .byte    En3
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    N18, Bn2
    .byte W06
    .byte PEND
LABEL_080AC0EC:
    .byte W12
    .byte    N17, Cs2, v120
    .byte W18
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    N05, Cs2
    .byte W06
    .byte    N05
    .byte W06
    .byte    N06, Bn2
    .byte W06
    .byte    N05, Cs3
    .byte W06
    .byte    N06, En2
    .byte W06
    .byte    N05, Fs2
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AC076
    .byte PATT
    .word LABEL_080AC097
    .byte PATT
    .word LABEL_080AC0C2
    .byte PATT
    .word LABEL_080AC0EC
    .byte PATT
    .word LABEL_080AC076
    .byte PATT
    .word LABEL_080AC097
    .byte PATT
    .word LABEL_080AC0C2
    .byte W12
    .byte    N17, An2, v120
    .byte W18
    .byte    N06, An2, v100
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N05, Gs2, v100
    .byte W06
    .byte    An2
    .byte W06
    .byte    Gs2
    .byte W06
    .byte    N17, An2
    .byte W18
    .byte    Cs3
    .byte W18
    .byte    N12, En3
    .byte W12
    .byte    N17, Bn2, v120
    .byte W18
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    N05, As2, v100
    .byte W06
    .byte    Bn2
    .byte W06
    .byte    As2
    .byte W06
    .byte    N17, Bn2
    .byte W18
    .byte    Fs2
    .byte W18
    .byte    N12, Ds2
    .byte W12
    .byte    N17, Cs2, v120
    .byte W18
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    N05, Cs2
    .byte W06
    .byte    N05
    .byte W06
    .byte    N06, Bn2
    .byte W06
    .byte    N05, Cs3
    .byte W06
    .byte    N06, En2
    .byte W06
    .byte    N05, Fs2
    .byte W06
    .byte PATT
    .word LABEL_080AC076
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N17, An2, v120
    .byte W18
    .byte    N06, An2, v100
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N05, Gs2, v100
    .byte W06
    .byte    An2
    .byte W06
    .byte    Gs2
    .byte W06
    .byte    N17, An2
    .byte W18
    .byte    Cs3
    .byte W18
    .byte    N12, En3
    .byte W12
    .byte    N17, Fs2, v120
    .byte W18
    .byte    N06, Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N05, Fn2, v100
    .byte W06
    .byte    Fs2
    .byte W06
    .byte    Fn2
    .byte W06
    .byte    N17, Fs2
    .byte W18
    .byte    An2
    .byte W18
    .byte    N12, Cs3
    .byte W12
    .byte    N17, Ds2, v120
    .byte W18
    .byte    N06, Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    N05, Dn2, v100
    .byte W06
    .byte    Ds2
    .byte W06
    .byte    Dn2
    .byte W06
    .byte    N17, Ds2
    .byte W18
    .byte    Cs2
    .byte W18
    .byte    N12, Fn2
    .byte W12
    .byte    Gs2
    .byte W12
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    N12, Fs2, v100
    .byte W12
    .byte    N06, Fs3
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    N12, En2, v100
    .byte W12
    .byte    N06, En3
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    N12, Ds2, v100
    .byte W12
    .byte    N06, Ds3
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    N17, Cs2, v120
    .byte W18
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    N05, Cs3, v040
    .byte W06
    .byte    Cs2, v100
    .byte W06
    .byte    N06, Bn2
    .byte W06
    .byte    N05, Cs3
    .byte W06
    .byte    N06, En2
    .byte W06
    .byte    N05, Fs2
    .byte W06
    .byte    N12, Bn1
    .byte W12
    .byte    N10, Cs2, v120
    .byte W12
    .byte    N05
    .byte W06
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    N11, As1
    .byte W12
    .byte    As2
    .byte W12
    .byte    Bn1
    .byte W12
    .byte    Bn2
    .byte W12
    .byte    N17, Cs2, v120
    .byte W18
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    N05, Cs2
    .byte W06
    .byte    N05
    .byte W06
    .byte    N06, Bn2
    .byte W06
    .byte    N05, Cs3
    .byte W06
    .byte    N06, En2
    .byte W06
    .byte    N05, Fs2
    .byte W06
    .byte PATT
    .word LABEL_080AC0C2
    .byte PATT
    .word LABEL_080AC0EC
    .byte PATT
    .word LABEL_080AC076
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N05, Cs2, v120
    .byte W06
    .byte    Cs2, v100
    .byte W06
    .byte    Bn1, v120
    .byte W06
    .byte    N06, Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    N04, Cs2, v060
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    N05, En3, v100
    .byte W06
    .byte    Ds3
    .byte W06
    .byte    N06, En3
    .byte W06
    .byte    N05, Fs3
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    En3
    .byte W06
    .byte    Bn2, v120
    .byte W06
    .byte    Bn2, v100
    .byte W06
    .byte    As2, v120
    .byte W06
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Bn2, v060
    .byte W06
    .byte    N04, Bn2, v032
    .byte W06
    .byte    N05, Bn2, v100
    .byte W06
    .byte    N06, Cs3
    .byte W06
    .byte    Cs3, v040
    .byte W36
    .byte W12
    .byte GOTO
    .word LABEL_080AC050
    .byte FINE

Track_080AC2ED:
    .byte KEYSH, 0
    .byte W12
LABEL_080AC2F0:
    .byte VOICE, 21
    .byte VOL  , 85
    .byte PAN  , 64
    .byte BENDR, 12
    .byte MODT , 0
    .byte TIE, Cs3, v060
    .byte W84
    .byte W92
    .byte EOT
    .byte    N04, Fs3, v052
    .byte W04
    .byte    Gs3
    .byte W04
    .byte    An3
    .byte W04
    .byte    Bn3
    .byte W04
    .byte TIE, Cs4, v060
    .byte W84
    .byte W60
    .byte VOL  , 85
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Ds3
    .byte W06
    .byte    Ds2
    .byte W06
    .byte    Fn1
    .byte W06
    .byte    Gn0
    .byte W06
    .byte    FsM1
    .byte W03
    .byte    AnM2
    .byte W03
    .byte EOT
    .byte VOICE, 27
    .byte VOL  , 75
    .byte W12
    .byte    N06, Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    As3, v092
    .byte W06
    .byte    As3, v052
    .byte W06
    .byte    Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    N18, As3, v092
    .byte W18
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v032
    .byte W06
LABEL_080AC348:
    .byte W24
    .byte    N06, Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    As3, v092
    .byte W06
    .byte    As3, v052
    .byte W06
    .byte    Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    N18, As3, v092
    .byte W18
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v032
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AC348
    .byte    N96, Cs4, v092
    .byte W96
    .byte    N06, Cs4, v052
    .byte W06
    .byte    Cs4, v032
    .byte W18
    .byte    Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    As3, v092
    .byte W06
    .byte    As3, v052
    .byte W06
    .byte    Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    N18, As3, v092
    .byte W18
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v032
    .byte W06
    .byte PATT
    .word LABEL_080AC348
    .byte W24
    .byte    N06, Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    As3, v092
    .byte W06
    .byte    As3, v052
    .byte W06
    .byte    Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    N18, Cs4, v092
    .byte W18
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v032
    .byte W06
    .byte    N05, En3, v092
    .byte W06
    .byte    Fs3, v080
    .byte W06
    .byte    Cs3, v060
    .byte W06
    .byte    Gs2, v052
    .byte W06
    .byte    Bn2, v060
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    En3
    .byte W06
    .byte    Bn2, v052
    .byte W06
    .byte    Cs3, v060
    .byte W06
    .byte    En3
    .byte W06
    .byte    Fs3, v072
    .byte W06
    .byte    Cs3, v060
    .byte W06
    .byte    En3, v072
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    Gs3, v080
    .byte W06
    .byte    Fs3, v072
    .byte W06
    .byte    Gs3, v080
    .byte W06
    .byte    Bn3
    .byte W06
    .byte VOICE, 21
    .byte VOL  , 85
    .byte    N96, Cs4, v060
    .byte W84
    .byte W12
    .byte TIE, Bn3
    .byte W84
    .byte W48
    .byte EOT
    .byte TIE, Gs3, v048
    .byte W48
    .byte W54
    .byte EOT
    .byte    N06, Gs3, v036
    .byte W06
    .byte    N18, En4, v060
    .byte W18
    .byte    Ds4
    .byte W18
    .byte    N12, Bn3, v052
    .byte W12
    .byte    N96, Cs4, v060
    .byte W84
    .byte W12
    .byte    An3
    .byte W84
    .byte W12
    .byte    N42, As3
    .byte W42
    .byte    N06, As3, v032
    .byte W06
    .byte    N18, As3, v060
    .byte W18
    .byte    Cs4
    .byte W18
    .byte    N12, Fn4
    .byte W12
    .byte    Cn4
    .byte W12
    .byte    Cn4, v032
    .byte W12
    .byte    Cn4, v012
    .byte W60
    .byte W12
    .byte    Gs3, v032
    .byte    N12, Cs4, v080
    .byte W12
    .byte    Gs3, v012
    .byte    N12, Cs4, v032
    .byte W12
    .byte    N06, Gs3, v012
    .byte    N06, Cs4, v020
    .byte W60
LABEL_080AC447:
    .byte W12
    .byte VOICE, 27
    .byte W48
    .byte PAN  , 27
    .byte    N23, Gs3, v072
    .byte    N23, Bn3, v080
    .byte W24
    .byte PAN  , 100
    .byte    N23, Fs3, v072
    .byte    N23, As3, v080
    .byte W12
    .byte PEND
LABEL_080AC45E:
    .byte W12
    .byte PAN  , 64
    .byte    N09, En3, v060
    .byte    N09, Gs3, v072
    .byte W09
    .byte    En3, v020
    .byte    N09, Gs3, v040
    .byte W09
    .byte    N06, En3, v012
    .byte    N06, Gs3, v020
    .byte W66
    .byte PEND
    .byte W96
    .byte W12
    .byte VOICE, 21
    .byte    N12, Gs3, v032
    .byte    N12, Cs4, v080
    .byte W12
    .byte    Gs3, v012
    .byte    N12, Cs4, v032
    .byte W12
    .byte    N06, Gs3, v012
    .byte    N06, Cs4, v020
    .byte W60
    .byte PATT
    .word LABEL_080AC447
    .byte PATT
    .word LABEL_080AC45E
    .byte W92
    .byte VOICE, 21
    .byte    N04, Fs2, v052
    .byte W04
    .byte    Gs2
    .byte W04
    .byte    An2
    .byte W04
    .byte    Bn2
    .byte W04
    .byte GOTO
    .word LABEL_080AC2F0
    .byte FINE

Track_080AC4AB:
    .byte KEYSH, 0
    .byte W12
LABEL_080AC4AE:
    .byte VOICE, 1
    .byte VOL  , 103
    .byte PAN  , 127
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 35
    .byte LFODL, 11
    .byte MOD  , 6
    .byte MODT , 0
    .byte    N06, En3, v100
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    Fs3, v100
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
LABEL_080AC4EB:
    .byte    N06, Fs3, v100
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Fs3, v100
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte PEND
LABEL_080AC51A:
    .byte    N06, Fs3, v100
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    Fs3, v100
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    En3, v100
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AC4EB
    .byte PATT
    .word LABEL_080AC51A
    .byte PATT
    .word LABEL_080AC4EB
    .byte PATT
    .word LABEL_080AC51A
    .byte PATT
    .word LABEL_080AC4EB
    .byte PATT
    .word LABEL_080AC51A
    .byte PATT
    .word LABEL_080AC4EB
    .byte PATT
    .word LABEL_080AC51A
    .byte PATT
    .word LABEL_080AC4EB
    .byte    N06, Fs3, v100
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte PAN  , 0
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
LABEL_080AC5DD:
    .byte    N03, Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte PEND
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 0
    .byte    N06, Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte PAN  , 127
    .byte    N06, An3, v100
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    An3
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    An3
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte PAN  , 0
    .byte    N06, Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte PAN  , 127
    .byte    N06, An3, v100
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    An3
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    An3
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte PAN  , 0
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v040
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v040
    .byte W03
    .byte PATT
    .word LABEL_080AC5DD
    .byte    N03, Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, As2, v100
    .byte W03
    .byte    As2, v040
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, As2, v100
    .byte W03
    .byte    As2, v040
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fn3, v100
    .byte W03
    .byte    Fn3, v040
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    As3, v100
    .byte W03
    .byte    As3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gs3, v100
    .byte W03
    .byte    Gs3, v040
    .byte W03
    .byte    As3, v100
    .byte W03
    .byte    As3, v040
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v040
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte PAN  , 64
    .byte    N12, Cn4, v100
    .byte W12
    .byte    Cn4, v040
    .byte W12
    .byte    Cn4, v020
    .byte W60
    .byte W96
LABEL_080AC7A6:
    .byte W12
    .byte PAN  , 64
    .byte    N04, Bn4, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    As4, v100
    .byte W06
    .byte    As4, v040
    .byte W06
    .byte    As4, v020
    .byte W54
    .byte PEND
    .byte W96
    .byte W12
    .byte PAN  , 127
    .byte    N04, Bn4, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte    As4
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Bn4, v020
    .byte W18
    .byte    As4, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte    An4
    .byte W06
    .byte    As4
    .byte W06
    .byte    As4, v040
    .byte W06
    .byte    As4, v020
    .byte W06
    .byte W96
    .byte PATT
    .word LABEL_080AC7A6
    .byte W96
    .byte W96
    .byte W12
    .byte GOTO
    .word LABEL_080AC4AE
    .byte FINE

Track_080AC7EE:
    .byte KEYSH, 0
    .byte W12
LABEL_080AC7F1:
    .byte VOICE, 6
    .byte VOL  , 103
    .byte PAN  , 0
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 35
    .byte LFODL, 11
    .byte MOD  , 5
    .byte MODT , 0
    .byte    N06, Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    As3
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
LABEL_080AC82E:
    .byte    N06, As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    As3
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte PEND
LABEL_080AC85D:
    .byte    N06, As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    As3
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AC82E
    .byte PATT
    .word LABEL_080AC85D
    .byte PATT
    .word LABEL_080AC82E
    .byte PATT
    .word LABEL_080AC85D
    .byte PATT
    .word LABEL_080AC82E
    .byte PATT
    .word LABEL_080AC85D
    .byte PATT
    .word LABEL_080AC82E
    .byte PATT
    .word LABEL_080AC85D
    .byte PATT
    .word LABEL_080AC82E
    .byte    N06, As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte PAN  , 64
    .byte W48
    .byte    N18, An3, v120
    .byte W18
    .byte    Bn3
    .byte W18
    .byte    N12, Cs4
    .byte W12
    .byte    N36, Ds4
    .byte W36
    .byte    Cs4
    .byte W36
    .byte    N12, Bn3
    .byte W12
    .byte    An3
    .byte W12
    .byte    N18, Gs3
    .byte W18
    .byte    An3
    .byte W18
    .byte TIE, Bn3
    .byte W48
    .byte W36
    .byte VOL  , 103
    .byte W06
    .byte    Bn5
    .byte W06
    .byte    Dn5
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    An3
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    Ds2
    .byte W06
    .byte    Gn1
    .byte W06
    .byte    As0
    .byte W06
    .byte    Dn0
    .byte W06
    .byte EOT
    .byte VOL  , 12
    .byte W06
    .byte    DnM2
    .byte W06
    .byte    Gn6
    .byte W48
    .byte    N18, An3
    .byte W18
    .byte    Bn3
    .byte W18
    .byte    N12, Cs4
    .byte W12
    .byte    N36, Fs4
    .byte W36
    .byte    En4
    .byte W36
    .byte    N09, Cs4
    .byte W09
    .byte    N03, Cs4, v080
    .byte W03
    .byte    N06, Ds4, v120
    .byte W06
    .byte    En4
    .byte W06
    .byte    N84, Fn4
    .byte W84
    .byte    N06, Gs4, v080
    .byte W06
    .byte    As4
    .byte W06
    .byte    N12, Bn4, v100
    .byte W12
    .byte    Bn4, v040
    .byte W12
    .byte    Bn4, v020
    .byte W60
    .byte W96
LABEL_080AC92A:
    .byte W12
    .byte PAN  , 64
    .byte    N04, Fn4, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte    Fn4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    En4, v020
    .byte W54
    .byte PEND
    .byte W96
    .byte W12
    .byte PAN  , 0
    .byte    N04, En4, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte    Ds4
    .byte W06
    .byte    En4
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    En4, v020
    .byte W18
    .byte    Ds4, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte    Dn4
    .byte W06
    .byte    Ds4
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte W96
    .byte PATT
    .word LABEL_080AC92A
    .byte W96
    .byte W96
    .byte W12
    .byte GOTO
    .word LABEL_080AC7F1
    .byte FINE

    .align 2, 0

global_label SongHeader_080AC974
    .byte 5
    .byte 0
    .byte 0
    .byte 163
    .word 0x809FDE8
    .word Track_080ABC78
    .word Track_080AC033
    .word Track_080AC2ED
    .word Track_080AC4AB
    .word Track_080AC7EE

    .end
