#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080AF1E0:
    .byte KEYSH, 0
    .byte TEMPO, 57
    .byte W96
    .byte W96
    .byte W24
    .byte VOICE, 0
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 0, xIECL, 0
    .byte W72
    .byte    N24, Cs2, v052
    .byte W24
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W12
LABEL_080AF212:
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N12, As1, v052
    .byte W12
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W12
    .byte    N10, Ds1, v127
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
    .byte    Ds1, v127
    .byte W06
    .byte    N10
    .byte W06
    .byte    Gn1, v120
    .byte W06
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v127
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
    .word LABEL_080AF212
LABEL_080AF265:
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N04, Fs1, v072
    .byte W06
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W12
    .byte    N10, Ds1, v127
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
    .word LABEL_080AF212
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N12, Gs1
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v127
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
    .word LABEL_080AF212
    .byte PATT
    .word LABEL_080AF265
    .byte PATT
    .word LABEL_080AF212
    .byte    N06, Ds1, v127
    .byte W06
    .byte    Dn1, v060
    .byte W06
    .byte    Ds1, v092
    .byte W06
    .byte    Ds1, v127
    .byte W06
    .byte    Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v127
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
    .word LABEL_080AF212
    .byte PATT
    .word LABEL_080AF265
    .byte PATT
    .word LABEL_080AF212
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N04, Fs1, v072
    .byte W06
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N10, Ds1, v127
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
    .word LABEL_080AF212
    .byte PATT
    .word LABEL_080AF265
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N12, As1, v052
    .byte W12
    .byte    N06, Bn0, v100
    .byte    N10, Ds1, v112
    .byte    N48, Cs2, v072
    .byte W72
    .byte    N20, Gn1, v112
    .byte W24
LABEL_080AF341:
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W18
    .byte    N06, Cn2, v040
    .byte W06
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N06, Cn2, v040
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W06
    .byte    Cn2, v040
    .byte W06
LABEL_080AF366:
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N12, As1, v052
    .byte W06
    .byte    N06, Cn2, v040
    .byte W06
    .byte    Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cn2, v040
    .byte W06
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N06, Cn2, v040
    .byte W12
    .byte    Bn0, v092
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v092
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte PEND
LABEL_080AF39A:
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N04, Fs1, v072
    .byte W06
    .byte    N02, Fs1, v052
    .byte    N06, Cn2, v040
    .byte W06
    .byte    Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cn2, v040
    .byte W06
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N06, Cn2, v040
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AF366
    .byte    N06, Ds1, v100
    .byte W06
    .byte    N10, Ds1, v127
    .byte W06
    .byte    N04, Fs1, v072
    .byte    N10, Gn1, v120
    .byte W06
    .byte    N02, Fs1, v052
    .byte    N06, Cn2, v040
    .byte W06
    .byte    Bn0, v112
    .byte    N36, Cs2, v060
    .byte W18
    .byte    N06, Cn2, v040
    .byte W06
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N06, Cn2, v040
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte PATT
    .word LABEL_080AF366
    .byte PATT
    .word LABEL_080AF39A
    .byte    N10, Ds1, v127
    .byte W12
    .byte    N12, As1, v052
    .byte W06
    .byte    N06, Cn2, v040
    .byte W06
    .byte    Bn0, v112
    .byte W12
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cn2, v040
    .byte W06
    .byte    N10, Ds1, v120
    .byte W12
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N06, Cn2, v040
    .byte W12
    .byte    Bn0, v092
    .byte    N06, Ds1, v080
    .byte    N02, Fs1, v052
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N06, Cs1, v080
    .byte W06
    .byte    Dn1, v060
    .byte    N06, Cn2, v040
    .byte W06
    .byte    N01, Ds1, v120
    .byte W01
    .byte    N04
    .byte W05
    .byte    N06, Ds1, v127
    .byte W06
    .byte    N12, Gn1
    .byte    N12, As1, v060
    .byte W12
    .byte GOTO
    .word LABEL_080AF341
    .byte FINE

Track_080AF46A:
    .byte KEYSH, 0
    .byte VOICE, 2
    .byte VOL  , 113
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 3
    .byte BENDR, 12
    .byte W96
    .byte W96
    .byte W96
    .byte BEND , 64
    .byte    N24, Gn2, v080
    .byte W06
    .byte BEND , 63
    .byte W04
    .byte    Dn3
    .byte W02
    .byte    Cn3
    .byte W02
    .byte    As2
    .byte W02
    .byte    Fs2
    .byte W02
    .byte    Cn2
    .byte W02
    .byte    Ds1
    .byte W02
    .byte    Cn0
    .byte W02
    .byte    En3
    .byte    N06, Gn1, v100
    .byte W06
    .byte    Gn1, v080
    .byte W06
    .byte    Gn1, v060
    .byte W06
    .byte    Gn1, v040
    .byte W24
    .byte    Gn1, v100
    .byte W06
    .byte    Gn1, v040
    .byte W06
    .byte    Fn1, v100
    .byte W06
    .byte    Gn1
    .byte W06
    .byte    Gn1, v040
    .byte W06
    .byte    Gn1, v020
    .byte W12
    .byte    N12, En1, v100
    .byte W12
    .byte    N06, Dn1
    .byte W06
    .byte    Dn1, v080
    .byte W06
    .byte    Dn1, v060
    .byte W06
    .byte    Dn1, v040
    .byte W24
    .byte    Dn1, v100
    .byte W06
    .byte    Dn1, v040
    .byte W06
    .byte    Cn1, v100
    .byte W06
    .byte    Dn1
    .byte W06
    .byte    Dn1, v040
    .byte W06
    .byte    Dn1, v020
    .byte W12
    .byte    N12, Cn2, v100
    .byte W12
    .byte    N06, As1
    .byte W06
    .byte    As1, v080
    .byte W06
    .byte    As1, v060
    .byte W06
    .byte    As1, v040
    .byte W24
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    An1, v100
    .byte W06
    .byte    As1
    .byte W06
    .byte    As1, v040
    .byte W06
LABEL_080AF4F1:
    .byte    N06, As1, v020
    .byte W12
    .byte    N12, Fn1, v100
    .byte W12
    .byte    N06, As1
    .byte W06
    .byte    As1, v080
    .byte W06
    .byte    As1, v060
    .byte W06
    .byte    As1, v040
    .byte W24
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    An1, v100
    .byte W06
    .byte    As1
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte PEND
LABEL_080AF514:
    .byte    N06, As1, v020
    .byte W12
    .byte    N12, As1, v100
    .byte W12
    .byte    N06, An1
    .byte W06
    .byte    An1, v080
    .byte W06
    .byte    An1, v060
    .byte W06
    .byte    An1, v040
    .byte W24
    .byte    An1, v100
    .byte W06
    .byte    An1, v040
    .byte W06
    .byte    Gn1, v100
    .byte W06
    .byte    An1
    .byte W06
    .byte    An1, v040
    .byte W06
    .byte PEND
LABEL_080AF537:
    .byte    N06, An1, v020
    .byte W12
    .byte    N12, En1, v100
    .byte W12
    .byte    N06, An1
    .byte W06
    .byte    An1, v080
    .byte W06
    .byte    An1, v060
    .byte W06
    .byte    An1, v040
    .byte W24
    .byte    An1, v100
    .byte W06
    .byte    An1, v040
    .byte W06
    .byte    Gn1, v100
    .byte W06
    .byte    An1
    .byte W06
    .byte    An1, v040
    .byte W06
    .byte PEND
    .byte    An1, v020
    .byte W12
    .byte    N12, An1, v100
    .byte W12
    .byte    N06, As1
    .byte W06
    .byte    As1, v080
    .byte W06
    .byte    As1, v060
    .byte W06
    .byte    As1, v040
    .byte W24
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    An1, v100
    .byte W06
    .byte    As1
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte PATT
    .word LABEL_080AF4F1
    .byte PATT
    .word LABEL_080AF514
    .byte PATT
    .word LABEL_080AF537
    .byte    N06, An1, v020
    .byte W12
    .byte    N12, An1, v100
    .byte W12
    .byte    N06, Gn1
    .byte W06
    .byte    Gn1, v080
    .byte W06
    .byte    Gn1, v060
    .byte W06
    .byte    Gn1, v040
    .byte W18
    .byte    N12, Gn1, v100
    .byte W12
    .byte    N06, An1
    .byte W06
    .byte    An1, v080
    .byte W06
    .byte    An1, v060
    .byte W06
    .byte    An1, v040
    .byte W06
    .byte W12
    .byte    An1, v100
    .byte W06
    .byte    An1, v040
    .byte W06
    .byte    Dn1, v100
    .byte W06
    .byte    Dn1, v080
    .byte W06
    .byte    Dn1, v060
    .byte W06
    .byte    Dn1, v040
    .byte W24
    .byte    Dn1, v100
    .byte W06
    .byte    Dn1, v040
    .byte W06
    .byte    Cn1, v100
    .byte W06
    .byte    Dn1
    .byte W06
    .byte    Dn1, v040
    .byte W06
    .byte    Dn1, v020
    .byte W12
    .byte    N12, Cn1, v100
    .byte W12
    .byte    N06, As1
    .byte W06
    .byte    As1, v080
    .byte W06
    .byte    As1, v060
    .byte W06
    .byte    As1, v040
    .byte W18
    .byte    N12, As1, v100
    .byte W12
    .byte    N06, Cn2
    .byte W06
    .byte    Cn2, v080
    .byte W06
    .byte    Cn2, v060
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte W12
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Fn1, v100
    .byte W06
    .byte    Fn1, v080
    .byte W06
    .byte    Fn1, v060
    .byte W06
    .byte    Fn1, v040
    .byte W18
    .byte    En1, v100
    .byte W06
    .byte    En1, v040
    .byte W06
    .byte    Fn1, v100
    .byte W06
    .byte    Fn1, v060
    .byte W06
    .byte    Fn1, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v060
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v080
    .byte W06
    .byte    En2, v060
    .byte W06
    .byte    En2, v040
    .byte W18
    .byte    N12, En2, v100
    .byte W12
    .byte    N06, Ds2
    .byte W06
    .byte    Ds2, v060
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Ds1, v100
    .byte W06
    .byte    Ds1, v060
    .byte W06
    .byte    Ds1, v040
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v060
    .byte W06
    .byte    Dn2, v040
    .byte W06
    .byte    Cn2, v100
    .byte W06
    .byte    Cn2, v060
    .byte W06
    .byte    Cn2, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    As1, v080
    .byte W06
    .byte    As1, v060
    .byte W06
    .byte    As1, v040
    .byte W18
    .byte W12
    .byte    An1, v100
    .byte W06
    .byte    An1, v040
    .byte W06
    .byte    Gn1, v100
    .byte W06
    .byte    Gn1, v080
    .byte W06
    .byte    Gn1, v060
    .byte W06
    .byte    Gn1, v040
    .byte W18
    .byte    N12, Gn1, v100
    .byte W12
    .byte    N06, En1
    .byte W06
    .byte    En1, v060
    .byte W06
    .byte    En1, v040
    .byte W06
    .byte    En1, v100
    .byte W06
    .byte    En1, v060
    .byte W06
    .byte    En1, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte BEND , 64
    .byte    N18, An1, v100
    .byte W13
    .byte BEND , 63
    .byte W02
    .byte    Dn3
    .byte W01
    .byte    Cs3
    .byte W01
    .byte    Cn3
    .byte W01
    .byte    Bn2
    .byte W01
    .byte    An2
    .byte W01
    .byte    Fs2
    .byte W01
    .byte    Dn2
    .byte W01
    .byte    Gs1
    .byte W01
    .byte    Cs1
    .byte W48
    .byte W01
    .byte W24
LABEL_080AF6B5:
    .byte BEND , 64
    .byte    N06, Bn1, v100
    .byte W06
    .byte    Bn1, v080
    .byte W06
    .byte    Bn1, v060
    .byte W06
    .byte    Bn1, v040
    .byte W24
    .byte    Bn1, v100
    .byte W06
    .byte    Bn1, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    Bn1
    .byte W06
    .byte    Bn1, v040
    .byte W06
LABEL_080AF6D2:
    .byte    N06, Bn1, v020
    .byte W12
    .byte    N12, Bn1, v100
    .byte W12
    .byte    N06, Cs2
    .byte W06
    .byte    Cs2, v080
    .byte W06
    .byte    Cs2, v060
    .byte W06
    .byte    Cs2, v040
    .byte W24
    .byte    Cs2, v100
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte    Bn1, v100
    .byte W06
    .byte    Cs2
    .byte W06
    .byte    Cs2, v040
    .byte W06
    .byte PEND
LABEL_080AF6F5:
    .byte    N06, Cs2, v020
    .byte W12
    .byte    N12, Bn1, v100
    .byte W12
    .byte    N06, As1
    .byte W06
    .byte    As1, v080
    .byte W06
    .byte    As1, v060
    .byte W06
    .byte    As1, v040
    .byte W24
    .byte    As1, v100
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte    Gs1, v100
    .byte W06
    .byte    As1
    .byte W06
    .byte    As1, v040
    .byte W06
    .byte PEND
    .byte    As1, v020
    .byte W12
    .byte    N12, As1, v100
    .byte W12
    .byte    N06, Ds1
    .byte W06
    .byte    Ds1, v080
    .byte W06
    .byte    Ds1, v060
    .byte W06
    .byte    Ds1, v040
    .byte W24
    .byte    Ds1, v100
    .byte W06
    .byte    Ds1, v040
    .byte W06
    .byte    Cs1, v100
    .byte W06
    .byte    Ds1
    .byte W06
    .byte    Ds1, v040
    .byte W06
    .byte    Ds1, v020
    .byte W12
    .byte    N12, Cs2, v100
    .byte W12
    .byte    N06, Bn1
    .byte W06
    .byte    Bn1, v080
    .byte W06
    .byte    Bn1, v060
    .byte W06
    .byte    Bn1, v040
    .byte W24
    .byte    Bn1, v100
    .byte W06
    .byte    Bn1, v040
    .byte W06
    .byte    As1, v100
    .byte W06
    .byte    Bn1
    .byte W06
    .byte    Bn1, v040
    .byte W06
    .byte PATT
    .word LABEL_080AF6D2
    .byte PATT
    .word LABEL_080AF6F5
    .byte    N06, As1, v020
    .byte W12
    .byte    N12, Fn1, v100
    .byte W12
    .byte    N06, Ds1
    .byte W06
    .byte    Ds1, v080
    .byte W06
    .byte    Ds1, v060
    .byte W06
    .byte    Ds1, v040
    .byte W24
    .byte    Ds1, v100
    .byte W06
    .byte    Ds1, v040
    .byte W06
    .byte    Cs1, v100
    .byte W06
    .byte    Ds1
    .byte W06
    .byte    Ds1, v040
    .byte W06
    .byte    Ds1, v020
    .byte W12
    .byte    N12, Cs2, v100
    .byte W12
    .byte GOTO
    .word LABEL_080AF6B5
    .byte FINE

Track_080AF793:
    .byte VOL  , 120
    .byte KEYSH, 0
    .byte W24
    .byte VOICE, 15
    .byte PAN  , 0
    .byte XCMD , xIECV, 30, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 30
    .byte LFODL, 14
    .byte MOD  , 4
    .byte MODT , 0
    .byte PAN  , 0
    .byte W54
    .byte    N03, Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
LABEL_080AF7C1:
    .byte    N03, Dn6, v092
    .byte W03
    .byte    Dn6, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte PAN  , 127
    .byte W54
    .byte    N03, Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte PEND
    .byte    Dn6, v092
    .byte W03
    .byte    Dn6, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte PAN  , 127
    .byte W54
    .byte    N03, An4, v092
    .byte W03
    .byte    An4, v040
    .byte W03
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte    An4, v092
    .byte W03
    .byte    An4, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    En5, v092
    .byte W03
    .byte    En5, v040
    .byte W03
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PAN  , 64
    .byte    N72, Gn5, v060
    .byte W72
    .byte    N24, An5
    .byte W24
    .byte    N96, Fs5
    .byte W72
    .byte W24
    .byte PAN  , 0
    .byte W54
    .byte    N03, Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte PATT
    .word LABEL_080AF7C1
LABEL_080AF862:
    .byte    N03, Dn6, v092
    .byte W03
    .byte    Dn6, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte PAN  , 0
    .byte W54
    .byte    N03, Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PEND
LABEL_080AF892:
    .byte    N03, Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    En5, v092
    .byte W03
    .byte    En5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte PAN  , 127
    .byte W54
    .byte    N03, Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte PEND
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte PAN  , 0
    .byte W54
    .byte    N03, Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte PATT
    .word LABEL_080AF7C1
    .byte PATT
    .word LABEL_080AF862
    .byte PATT
    .word LABEL_080AF892
    .byte    N03, As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte PAN  , 0
    .byte W06
    .byte    N03, Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn4, v092
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W09
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn6, v092
    .byte W03
    .byte    Dn6, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W09
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn4, v092
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
LABEL_080AF952:
    .byte W06
    .byte    N03, Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn6, v092
    .byte W03
    .byte    Dn6, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W09
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn4, v092
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W09
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn6, v092
    .byte W03
    .byte    Dn6, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W09
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn4, v092
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte PEND
    .byte PATT
    .word LABEL_080AF952
    .byte W06
    .byte    N03, Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn6, v092
    .byte W03
    .byte    Dn6, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W09
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte    Cn4, v092
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W09
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte    Cn6, v092
    .byte W03
    .byte    Cn6, v040
    .byte W03
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W09
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte    Cn4, v092
    .byte W03
    .byte    Cn4, v040
    .byte W03
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte W06
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W03
    .byte    Cn6, v092
    .byte W03
    .byte    Cn6, v040
    .byte W03
    .byte    Cn5, v092
    .byte W03
    .byte    Cn5, v040
    .byte W09
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Gn4, v092
    .byte W03
    .byte    Gn4, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W09
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Gn6, v092
    .byte W03
    .byte    Gn6, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W09
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte    An4, v092
    .byte W03
    .byte    An4, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte W06
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W03
    .byte    An6, v092
    .byte W03
    .byte    An6, v040
    .byte W03
    .byte    An5, v092
    .byte W03
    .byte    An5, v040
    .byte W09
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn4, v092
    .byte W03
    .byte    Dn4, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W09
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W03
    .byte    Dn6, v092
    .byte W03
    .byte    Dn6, v040
    .byte W03
    .byte    Dn5, v092
    .byte W03
    .byte    Dn5, v040
    .byte W09
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Fn4, v092
    .byte W03
    .byte    Fn4, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte W06
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Fn6, v092
    .byte W03
    .byte    Fn6, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W09
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    As4, v092
    .byte W03
    .byte    As4, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W09
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    As6, v092
    .byte W03
    .byte    As6, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W09
    .byte    Bn5, v092
    .byte W03
    .byte    Bn5, v040
    .byte W03
    .byte    Bn4, v092
    .byte W03
    .byte    Bn4, v040
    .byte W03
    .byte    Bn5, v092
    .byte W03
    .byte    Bn5, v040
    .byte W03
    .byte W06
    .byte    Bn5, v092
    .byte W03
    .byte    Bn5, v040
    .byte W03
    .byte    Bn6, v092
    .byte W03
    .byte    Bn6, v040
    .byte W03
    .byte    Bn5, v092
    .byte W03
    .byte    Bn5, v040
    .byte W03
    .byte    N18, Fn5, v092
    .byte W18
    .byte    N06
    .byte W06
    .byte    Fn5, v040
    .byte W48
    .byte W24
LABEL_080AFAE4:
    .byte PAN  , 0
    .byte W54
    .byte    N03, Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Fs5, v092
    .byte W03
    .byte    Fs5, v040
    .byte W03
    .byte    Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
LABEL_080AFAFA:
    .byte    N03, Ds6, v092
    .byte W03
    .byte    Ds6, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    Fs5, v092
    .byte W03
    .byte    Fs5, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte PAN  , 127
    .byte W54
    .byte    N03, Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Fs5, v092
    .byte W03
    .byte    Fs5, v040
    .byte W03
    .byte    Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte PEND
    .byte    Ds6, v092
    .byte W03
    .byte    Ds6, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    Fs5, v092
    .byte W03
    .byte    Fs5, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte PAN  , 0
    .byte W54
    .byte    N03, Cs5, v092
    .byte W03
    .byte    Cs5, v040
    .byte W03
    .byte    Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Cs5, v092
    .byte W03
    .byte    Cs5, v040
    .byte W03
    .byte    Cs6, v092
    .byte W03
    .byte    Cs6, v040
    .byte W03
    .byte    Gs5, v092
    .byte W03
    .byte    Gs5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Gs5, v092
    .byte W03
    .byte    Gs5, v040
    .byte W03
    .byte PAN  , 127
    .byte W54
    .byte    N03, Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Ds6, v092
    .byte W03
    .byte    Ds6, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte PAN  , 0
    .byte W54
    .byte    N03, Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Fs5, v092
    .byte W03
    .byte    Fs5, v040
    .byte W03
    .byte    Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte PATT
    .word LABEL_080AFAFA
    .byte    N03, Ds6, v092
    .byte W03
    .byte    Ds6, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    Fs5, v092
    .byte W03
    .byte    Fs5, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte PAN  , 0
    .byte W54
    .byte    N03, Cs5, v092
    .byte W03
    .byte    Cs5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Cs5, v092
    .byte W03
    .byte    Cs5, v040
    .byte W03
    .byte    Cs6, v092
    .byte W03
    .byte    Cs6, v040
    .byte W03
    .byte    Gs5, v092
    .byte W03
    .byte    Gs5, v040
    .byte W03
    .byte    Fn5, v092
    .byte W03
    .byte    Fn5, v040
    .byte W03
    .byte    Cs5, v092
    .byte W03
    .byte    Cs5, v040
    .byte W03
    .byte PAN  , 127
    .byte W06
    .byte    N03, Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Ds6, v092
    .byte W03
    .byte    Ds6, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte    Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte    Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte    Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Ds6, v092
    .byte W03
    .byte    Ds6, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, As5, v092
    .byte W03
    .byte    As5, v040
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn5, v092
    .byte W03
    .byte    Gn5, v040
    .byte W03
    .byte PAN  , 127
    .byte    N03, Ds5, v092
    .byte W03
    .byte    Ds5, v040
    .byte W03
    .byte GOTO
    .word LABEL_080AFAE4
    .byte FINE

Track_080AFC76:
    .byte KEYSH, 0
    .byte VOICE, 6
    .byte VOL  , 85
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 4
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MODT , 0
    .byte BENDR, 12
    .byte MOD  , 4
    .byte VOL  , 120
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W36
    .byte    N06, Dn4, v100
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
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v072
    .byte W06
    .byte    Gn4, v052
    .byte W06
    .byte    Fn4, v100
    .byte W06
LABEL_080AFCB4:
    .byte    N06, Fn4, v072
    .byte W06
    .byte    Fn4, v052
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v072
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v072
    .byte W06
    .byte    Gn4, v052
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Fn4, v072
    .byte W06
    .byte    Fn4, v052
    .byte W06
    .byte    N54, An4, v100
    .byte W36
    .byte PEND
    .byte W18
    .byte    N06, An4, v060
    .byte W18
    .byte    Cn4, v100
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
    .byte    En4, v100
    .byte W06
    .byte    En4, v072
    .byte W06
    .byte    En4, v052
    .byte W06
    .byte    En4, v100
    .byte W06
LABEL_080AFCFB:
    .byte    N06, En4, v072
    .byte W06
    .byte    En4, v052
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v072
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v080
    .byte W06
    .byte    Gn4, v060
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Fn4, v080
    .byte W06
    .byte    Fn4, v060
    .byte W06
    .byte    Fn4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v080
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte PEND
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v080
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v040
    .byte W18
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
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v072
    .byte W06
    .byte    Gn4, v052
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte PATT
    .word LABEL_080AFCB4
    .byte W18
    .byte    N06, An4, v072
    .byte W18
    .byte    Cn4, v100
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
    .byte    En4, v100
    .byte W06
    .byte    En4, v072
    .byte W06
    .byte    En4, v052
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte PATT
    .word LABEL_080AFCFB
    .byte    N06, Cn4, v100
    .byte W06
    .byte    Cn4, v080
    .byte W06
    .byte    Cn4, v060
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    N72, Dn4, v080
    .byte W72
    .byte    N06, Dn4, v060
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    Dn4, v012
    .byte W54
    .byte    Dn4, v060
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    N18, Cn4, v060
    .byte W06
    .byte W12
    .byte    N06, Dn4
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    N42, Fn4, v060
    .byte W42
    .byte    N06, Fn4, v040
    .byte W06
    .byte    N42, An4, v060
    .byte W24
    .byte W18
    .byte    N06, An4, v040
    .byte W06
    .byte    N36, En4, v060
    .byte W36
    .byte    N06, En4, v040
    .byte W06
    .byte    En4, v020
    .byte W06
    .byte    N24, Dn4, v060
    .byte W24
    .byte    N18, Cn4
    .byte W18
    .byte    N06, Cn4, v040
    .byte W06
    .byte    N15, An4, v072
    .byte W15
    .byte    N03, An4, v056
    .byte W03
    .byte    N18, Gn4, v072
    .byte W18
    .byte    N12, Fs4
    .byte W12
    .byte    N32, Fn4
    .byte W24
    .byte W09
    .byte    N03, Fn4, v056
    .byte W03
    .byte    N12, Cs4, v072
    .byte W12
    .byte    N18, An4
    .byte W18
    .byte    Gn4
    .byte W18
    .byte    N44, Fn4
    .byte W36
    .byte W09
    .byte    N03, Fn4, v056
    .byte W03
    .byte    N12, En4, v072
    .byte W12
    .byte    N48, Fn4
    .byte W48
    .byte    Dn4
    .byte W24
    .byte W24
    .byte    N16, Cs4
    .byte W18
    .byte    N06
    .byte W06
    .byte    Cs4, v052
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Cs4, v032
    .byte W06
    .byte    Cs4, v020
    .byte W06
    .byte    Cs4, v012
    .byte W24
    .byte W24
LABEL_080AFE24:
    .byte VOL  , 85
    .byte    N12, As4, v100
    .byte W12
    .byte    Gs4
    .byte W12
    .byte    Fs4
    .byte W12
    .byte    N06, Gs4
    .byte W06
    .byte    N24, Ds4
    .byte W24
    .byte    N06, Ds4, v040
    .byte W06
LABEL_080AFE38:
    .byte    N12, Ds4, v100
    .byte W12
    .byte    Fs4
    .byte W12
    .byte    As4
    .byte W12
    .byte    Gs4
    .byte W12
    .byte    Fs4
    .byte W12
    .byte    N06, Gs4
    .byte W06
    .byte    N24, Ds4
    .byte W24
    .byte    N06, Ds4, v060
    .byte W06
    .byte PEND
LABEL_080AFE4F:
    .byte    N12, Ds4, v100
    .byte W12
    .byte    Fs4
    .byte W12
    .byte    N24, Gs4
    .byte W24
    .byte    Fs4
    .byte W24
    .byte    Fn4
    .byte W24
    .byte PEND
    .byte    Cs4
    .byte W24
    .byte    N60, Cs5
    .byte W60
    .byte    N12, Bn4
    .byte W12
    .byte    As4
    .byte W12
    .byte    Bn4
    .byte W12
    .byte    As4
    .byte W12
    .byte    Gs4
    .byte W12
    .byte    Fs4
    .byte W12
    .byte    N06, Gs4
    .byte W06
    .byte    N24, Ds4
    .byte W24
    .byte    N06, Ds4, v060
    .byte W06
    .byte PATT
    .word LABEL_080AFE38
    .byte PATT
    .word LABEL_080AFE4F
    .byte    N24, Cs4, v100
    .byte W24
    .byte    N60, Ds4
    .byte W60
    .byte    N06, Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    N12, Ds4, v100
    .byte W12
    .byte    Fs4
    .byte W12
    .byte GOTO
    .word LABEL_080AFE24
    .byte FINE

Track_080AFE9D:
    .byte KEYSH, 0
    .byte VOICE, 29
    .byte VOL  , 94
    .byte PAN  , 90
    .byte BENDR, 12
    .byte    N12, Dn3, v092
    .byte W12
    .byte    Fn3
    .byte W12
    .byte    N01, Gs3, v052
    .byte W01
    .byte    N11, An3, v072
    .byte W11
    .byte    N12, Gn3, v060
    .byte W12
    .byte    Fn3, v072
    .byte W12
    .byte    N06, Gn3
    .byte W06
    .byte    N30, Dn3, v060
    .byte W30
    .byte    N12, Dn3, v072
    .byte W12
    .byte    Fn3, v060
    .byte W12
    .byte    An3, v072
    .byte W12
    .byte    Gn3, v060
    .byte W12
    .byte    Fn3, v072
    .byte W12
    .byte    N06, Gn3
    .byte W06
    .byte    N30, Dn3, v060
    .byte W30
    .byte    N12, Dn3, v072
    .byte W12
    .byte    Fn3, v060
    .byte W12
    .byte    N01, Fs3, v052
    .byte W01
    .byte    N23, Gn3, v072
    .byte W23
    .byte    N24, Fn3
    .byte W24
    .byte    En3, v080
    .byte W24
    .byte    Cn3, v092
    .byte W24
    .byte VOL  , 94
    .byte    N96, Dn3, v100
    .byte W08
    .byte VOL  , 89
    .byte W08
    .byte    Cn5
    .byte W08
    .byte    Fs4
    .byte W08
    .byte    Cn4
    .byte W08
    .byte    Gn3
    .byte W08
    .byte    Cs3
    .byte W08
    .byte    Gs2
    .byte W08
    .byte    Ds2
    .byte W08
    .byte    An1
    .byte W08
    .byte    Ds1
    .byte W08
    .byte    As0
    .byte W08
    .byte VOICE, 22
    .byte VOL  , 28
    .byte PAN  , 64
    .byte    N96, Fs3
    .byte W08
    .byte VOL  , 33
    .byte W08
    .byte    Dn1
    .byte W08
    .byte    Gs1
    .byte W08
    .byte    Dn2
    .byte W08
    .byte    Gn2
    .byte W08
    .byte    Cs3
    .byte W08
    .byte    Fs3
    .byte W08
    .byte    Bn3
    .byte W08
    .byte    Fn4
    .byte W08
    .byte    Bn4
    .byte W08
    .byte    En5
    .byte W08
    .byte    As5
    .byte TIE, Fn3, v040
    .byte W72
    .byte W60
    .byte EOT
    .byte VOICE, 29
    .byte PAN  , 90
    .byte    N04, Dn3, v080
    .byte W04
    .byte    Fn3, v072
    .byte W04
    .byte    An3, v060
    .byte W04
    .byte    N18, Cn4
    .byte W18
    .byte    As3
    .byte W06
    .byte W12
    .byte    N12, An3
    .byte W12
    .byte    N36, Gn3
    .byte W36
    .byte    N84, Cn3, v080
    .byte W36
    .byte W48
    .byte    N24, Gn3, v060
    .byte W24
    .byte    En3, v072
    .byte W24
    .byte    Cn3, v080
    .byte W24
    .byte VOICE, 22
    .byte PAN  , 64
    .byte TIE, Fn3, v040
    .byte W72
    .byte W60
    .byte EOT
    .byte VOICE, 29
    .byte PAN  , 90
    .byte    N04, Dn3, v072
    .byte W04
    .byte    Fn3, v060
    .byte W04
    .byte    An3
    .byte W04
    .byte    N18, Cn4
    .byte W18
    .byte    As3
    .byte W06
    .byte W12
    .byte    N12, An3
    .byte W12
    .byte    N36, Gn3
    .byte W36
    .byte    N84, Cn3, v072
    .byte W36
    .byte W48
    .byte    N24, Gn3, v060
    .byte W24
    .byte    En3
    .byte W24
    .byte    Cn3, v072
    .byte W24
    .byte VOICE, 27
    .byte PAN  , 64
    .byte    N48, Fn3, v100
    .byte W48
    .byte    N36, En3
    .byte W24
    .byte W12
    .byte    N06, Fn3
    .byte W06
    .byte    En3
    .byte W06
    .byte    N48, Dn3
    .byte W48
    .byte    N12, Dn3, v032
    .byte W12
    .byte    Dn3, v100
    .byte W12
    .byte    En3
    .byte W12
    .byte    Fn3
    .byte W12
    .byte    N24, An3
    .byte W24
    .byte    Gn3
    .byte W24
    .byte    Fn3
    .byte W24
    .byte    Gn3
    .byte W24
    .byte    N36
    .byte W36
    .byte    N48, An3
    .byte W36
    .byte W12
    .byte    N06, Gn3
    .byte W06
    .byte    An3
    .byte W06
    .byte    N18, Cn4
    .byte W18
    .byte    As3
    .byte W18
    .byte    N12, An3
    .byte W12
    .byte    N36, Gn3
    .byte W24
    .byte W12
    .byte    N12, En3
    .byte W12
    .byte    N18, Fn3
    .byte W18
    .byte    En3
    .byte W18
    .byte    N48, Dn3
    .byte W36
    .byte W12
    .byte    N12, Cn3
    .byte W12
    .byte    N24, Dn3
    .byte W24
    .byte    En3
    .byte W24
    .byte    Fn3
    .byte W24
    .byte    Gn3
    .byte W24
    .byte    N15, An3
    .byte W18
    .byte    N06
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    An3, v020
    .byte W06
    .byte    An3, v012
    .byte W30
    .byte VOICE, 29
    .byte PAN  , 90
    .byte    N24, Cs3, v092
    .byte W24
LABEL_080B0000:
    .byte    N36, Ds3, v092
    .byte W36
    .byte    N06, Ds3, v072
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    N12, As3
    .byte W12
    .byte    Gs3
    .byte W12
LABEL_080B000F:
    .byte    N12, Fs3, v072
    .byte W12
    .byte    N06, Gs3
    .byte W06
    .byte    N42, Ds3, v092
    .byte W42
    .byte    N06, Ds3, v072
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    N12, As3
    .byte W12
    .byte    Gs3
    .byte W12
    .byte PEND
LABEL_080B0026:
    .byte    N12, Fn3, v072
    .byte W12
    .byte    Fs3
    .byte W12
    .byte    N24, Cs3, v092
    .byte W24
    .byte    Ds3
    .byte W24
    .byte    Cs3
    .byte W24
    .byte PEND
    .byte    Fn3
    .byte W24
    .byte    N36, Fs3, v072
    .byte W36
    .byte    N06, Fn3
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    N12, As3
    .byte W12
    .byte    Gs3
    .byte W12
    .byte    Fs3
    .byte W12
    .byte    Gs3, v060
    .byte W12
    .byte    N36, Ds3, v092
    .byte W36
    .byte    N06, Ds3, v072
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    N12, As3
    .byte W12
    .byte    Gs3
    .byte W12
    .byte PATT
    .word LABEL_080B000F
    .byte PATT
    .word LABEL_080B0026
    .byte    N24, Fn3, v092
    .byte W24
    .byte    N36, Gs3, v072
    .byte W36
    .byte    Gn3
    .byte W36
    .byte    N24, As3, v060
    .byte W24
    .byte GOTO
    .word LABEL_080B0000
    .byte FINE

Track_080B0077:
    .byte KEYSH, 0
    .byte VOICE, 29
    .byte VOL  , 113
    .byte PAN  , 40
    .byte BENDR, 12
    .byte W24
    .byte    N96, Dn2, v092
    .byte W01
    .byte    N92, Fn2, v080
    .byte W68
    .byte W03
    .byte W24
    .byte    N96, As1, v092
    .byte W01
    .byte    N92, Fn2, v080
    .byte W68
    .byte W03
    .byte W24
    .byte    N96, An1, v092
    .byte    N92, Gn2, v080
    .byte W72
    .byte W24
    .byte    N72, As2, v052
    .byte W72
    .byte    N24, Cn3
    .byte W24
    .byte VOICE, 22
    .byte VOL  , 28
    .byte PAN  , 64
    .byte    N96, Dn3, v100
    .byte W08
    .byte VOL  , 33
    .byte W08
    .byte    Dn1
    .byte W08
    .byte    Gs1
    .byte W08
    .byte    Dn2
    .byte W08
    .byte    Gn2
    .byte W08
    .byte    Cs3
    .byte W08
    .byte    Fs3
    .byte W08
    .byte    Bn3
    .byte W08
    .byte    Fn4
    .byte W08
    .byte    Bn4
    .byte W08
    .byte    En5
    .byte W08
    .byte    As5
    .byte TIE, Dn3, v060
    .byte W72
    .byte W72
    .byte EOT
    .byte    N18, An3, v072
    .byte W18
    .byte    Gn3
    .byte W06
LABEL_080B00D3:
    .byte W12
    .byte    N12, Fn3, v072
    .byte W12
    .byte TIE, En3
    .byte W72
    .byte PEND
    .byte W48
    .byte EOT
    .byte    N24, Cn3
    .byte W24
    .byte    Dn3
    .byte W24
    .byte    En3
    .byte W24
    .byte TIE, Dn3, v060
    .byte W72
    .byte W72
    .byte EOT
    .byte    N18, An3, v072
    .byte W18
    .byte    Gn3
    .byte W06
    .byte PATT
    .word LABEL_080B00D3
    .byte W48
    .byte EOT, En3
    .byte    N24, Cn3, v072
    .byte W24
    .byte    Dn3
    .byte W24
    .byte    En3
    .byte W24
    .byte VOICE, 21
    .byte PAN  , 120
    .byte    N48, An3, v032
    .byte W48
    .byte    Gn3
    .byte W24
    .byte W24
    .byte    N54, Fn3
    .byte W54
    .byte    N06, Fn3, v012
    .byte W06
    .byte    N12, Fn3, v032
    .byte W12
    .byte    En3
    .byte W12
    .byte    Fn3
    .byte W12
    .byte TIE, Cn4
    .byte W72
    .byte W96
    .byte W24
    .byte EOT
    .byte    N48, Gn3
    .byte W48
    .byte    Fn3
    .byte W24
    .byte W24
    .byte    N18, Dn4
    .byte W18
    .byte    Cn4
    .byte W18
    .byte    N60, An3
    .byte W36
    .byte W24
    .byte    N48, As3
    .byte W48
    .byte    Bn3
    .byte W24
    .byte W24
    .byte    N18, Cs4
    .byte W18
    .byte    N06
    .byte W06
    .byte    Cs4, v020
    .byte W06
    .byte    Cs4, v012
    .byte W06
    .byte    Cs4, v008
    .byte W06
    .byte    Cs4, v004
    .byte W30
    .byte W03
    .byte VOICE, 21
    .byte PAN  , 64
    .byte VOL  , 64
    .byte    N03, Ds3, v080
    .byte W03
    .byte    Fn3
    .byte W03
    .byte    Fs3
    .byte W03
    .byte    Gs3
    .byte W03
    .byte    As3
    .byte W03
    .byte    Bn3
    .byte W03
    .byte    Cs4
    .byte W03
LABEL_080B015E:
    .byte    N06, Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
LABEL_080B0183:
    .byte    N06, Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080B0183
    .byte PATT
    .word LABEL_080B0183
    .byte    N06, Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    N12, Cs4, v100
    .byte W12
    .byte    N06, Ds4
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte PATT
    .word LABEL_080B0183
    .byte PATT
    .word LABEL_080B0183
    .byte PATT
    .word LABEL_080B0183
    .byte    N06, Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    N12, Cs4, v100
    .byte W12
    .byte GOTO
    .word LABEL_080B015E
    .byte FINE

    .align 2, 0

global_label SongHeader_080B0210
    .byte 6
    .byte 0
    .byte 0
    .byte 163
    .word 0x80A03DC
    .word Track_080AF1E0
    .word Track_080AF46A
    .word Track_080AF793
    .word Track_080AFC76
    .word Track_080AFE9D
    .word Track_080B0077

    .end
