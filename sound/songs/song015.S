#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080AC990:
    .byte KEYSH, 0
    .byte TEMPO, 75
    .byte VOICE, 0
    .byte VOL  , 113
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 2
    .byte    N06, Bn0, v112
    .byte    N48, Cs2, v072
    .byte W96
    .byte W84
    .byte    N06, Bn0, v112
    .byte W12
    .byte    N06
    .byte    N48, Cs2, v072
    .byte W96
    .byte W60
    .byte    N36, Bn1
    .byte W24
    .byte    N06, Bn0, v112
    .byte W12
LABEL_080AC9B8:
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v072
    .byte W12
    .byte    N10, Fn1, v092
    .byte W12
    .byte    N06, Bn0, v100
    .byte W12
    .byte    N10, Fn1, v080
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
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N12, As1, v060
    .byte W12
    .byte PEND
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Fn1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
LABEL_080ACA47:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v080
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
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N12, As1, v060
    .byte W12
    .byte PEND
LABEL_080ACA91:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Fn1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Fn1, v080
    .byte    N02, Fs1, v040
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AC9B8
LABEL_080ACAEF:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Fn1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080ACA47
    .byte PATT
    .word LABEL_080ACA91
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v072
    .byte W12
    .byte    N10, Fn1, v092
    .byte W12
    .byte    N06, Bn0, v100
    .byte W12
    .byte    N10, Fn1, v092
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
    .byte    N06, Fn1, v080
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N12, As1, v060
    .byte W12
    .byte PATT
    .word LABEL_080ACAEF
    .byte PATT
    .word LABEL_080ACA47
    .byte PATT
    .word LABEL_080ACA91
    .byte PATT
    .word LABEL_080AC9B8
    .byte PATT
    .word LABEL_080ACAEF
    .byte PATT
    .word LABEL_080ACA47
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte    N06, An1, v120
    .byte W06
    .byte    N02, Fs1, v040
    .byte    N10, An1, v112
    .byte W06
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte    N06, Gs1, v120
    .byte W06
    .byte    N02, Fs1, v060
    .byte    N10, Gs1, v120
    .byte W06
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte    N06, Gn1, v120
    .byte W06
    .byte    N02, Fs1, v040
    .byte    N06, Gn1, v120
    .byte W06
    .byte PATT
    .word LABEL_080AC9B8
    .byte PATT
    .word LABEL_080ACAEF
    .byte    N06, Bn0, v112
    .byte    N30, Cs2, v052
    .byte W12
    .byte    N10, Fn1, v092
    .byte W12
    .byte    N06, Bn0, v100
    .byte W06
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N10, Fn1, v080
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
    .byte    N06, Fn1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N12, As1, v060
    .byte W12
    .byte PATT
    .word LABEL_080ACA91
    .byte PATT
    .word LABEL_080AC9B8
    .byte PATT
    .word LABEL_080ACAEF
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N10, Fn1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, An1, v120
    .byte    N18, As1, v060
    .byte W06
    .byte    N10, An1, v112
    .byte W12
    .byte    N06, Gs1, v120
    .byte    N18, As1, v060
    .byte W06
    .byte    N10, Gs1, v120
    .byte W12
    .byte    N06, Gn1
    .byte    N12, As1, v060
    .byte W06
    .byte    N06, Gn1, v120
    .byte W06
    .byte    Bn0, v112
    .byte    N48, Cs2, v072
    .byte W24
    .byte    N06, Bn0, v100
    .byte W24
    .byte    N06
    .byte W12
    .byte    N36, Bn1, v072
    .byte W12
    .byte    N06, Bn0, v100
    .byte W24
    .byte GOTO
    .word LABEL_080AC9B8
    .byte FINE

Track_080ACCB6:
    .byte KEYSH, 0
    .byte W96
    .byte W96
    .byte W96
    .byte W96
LABEL_080ACCBC:
    .byte VOICE, 1
    .byte VOL  , 94
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte PAN  , 64
    .byte    N03, An2, v100
    .byte W03
    .byte    An2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    An2, v100
    .byte W03
    .byte    An2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    An2, v100
    .byte W03
    .byte    An2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    An2, v100
    .byte W03
    .byte    An2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
LABEL_080ACD32:
    .byte PAN  , 127
    .byte    N03, Fs1, v100
    .byte W03
    .byte    Fs1, v060
    .byte W03
    .byte    Bn1, v100
    .byte W03
    .byte    Bn1, v060
    .byte W03
    .byte    Cs2, v100
    .byte W03
    .byte    Cs2, v060
    .byte W03
    .byte    Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte PAN  , 127
    .byte    N03, Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    Bn3, v100
    .byte W03
    .byte    Bn3, v060
    .byte W03
    .byte    Cn4, v100
    .byte W03
    .byte    Cn4, v060
    .byte W03
    .byte    En4, v100
    .byte W03
    .byte    En4, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fs4, v100
    .byte W03
    .byte    Fs4, v060
    .byte W03
    .byte    Bn4, v100
    .byte W03
    .byte    Bn4, v060
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v060
    .byte W03
    .byte    Fs5, v100
    .byte W03
    .byte    Fs5, v060
    .byte W03
    .byte PEND
LABEL_080ACD9F:
    .byte PAN  , 64
    .byte    N03, An2, v100
    .byte W03
    .byte    An2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    An2, v100
    .byte W03
    .byte    An2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    An2, v100
    .byte W03
    .byte    An2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    An2, v100
    .byte W03
    .byte    An2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte PEND
LABEL_080ACE03:
    .byte PAN  , 127
    .byte    N03, Fs5, v100
    .byte W03
    .byte    Fs5, v060
    .byte W03
    .byte    Cs5, v100
    .byte W03
    .byte    Cs5, v060
    .byte W03
    .byte    Bn4, v100
    .byte W03
    .byte    Bn4, v060
    .byte W03
    .byte    Fs4, v100
    .byte W03
    .byte    Fs4, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fn4, v100
    .byte W03
    .byte    Fn4, v060
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte    Bn3, v100
    .byte W03
    .byte    Bn3, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte PAN  , 127
    .byte    N03, En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    Cn3, v100
    .byte W03
    .byte    Cn3, v060
    .byte W03
    .byte    Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte    Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    Cn2, v100
    .byte W03
    .byte    Cn2, v060
    .byte W03
    .byte    Bn1, v100
    .byte W03
    .byte    Bn1, v060
    .byte W03
    .byte    Fs1, v100
    .byte W03
    .byte    Fs1, v060
    .byte W03
    .byte PEND
    .byte PATT
    .word LABEL_080ACD9F
    .byte PATT
    .word LABEL_080ACD32
    .byte PATT
    .word LABEL_080ACD9F
    .byte PATT
    .word LABEL_080ACE03
LABEL_080ACE84:
    .byte PAN  , 64
    .byte    N03, Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte    An3, v100
    .byte W03
    .byte    An3, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte    An3, v100
    .byte W03
    .byte    An3, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte    An3, v100
    .byte W03
    .byte    An3, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte    An3, v100
    .byte W03
    .byte    An3, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte PEND
    .byte PATT
    .word LABEL_080ACD32
    .byte PATT
    .word LABEL_080ACE84
    .byte PATT
    .word LABEL_080ACE03
LABEL_080ACEF7:
    .byte PAN  , 64
    .byte    N03, Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    As2, v100
    .byte W03
    .byte    As2, v060
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    As2, v100
    .byte W03
    .byte    As2, v060
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    As2, v100
    .byte W03
    .byte    As2, v060
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    As2, v100
    .byte W03
    .byte    As2, v060
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte PEND
    .byte PAN  , 127
    .byte    N03, Ds1, v100
    .byte W03
    .byte    Ds1, v060
    .byte W03
    .byte    Gs1, v100
    .byte W03
    .byte    Gs1, v060
    .byte W03
    .byte    As1, v100
    .byte W03
    .byte    As1, v060
    .byte W03
    .byte    Ds2, v100
    .byte W03
    .byte    Ds2, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Ds2, v100
    .byte W03
    .byte    Ds2, v060
    .byte W03
    .byte    Gs2, v100
    .byte W03
    .byte    Gs2, v060
    .byte W03
    .byte    As2, v100
    .byte W03
    .byte    As2, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte PAN  , 127
    .byte    N03, Ds3, v100
    .byte W03
    .byte    Ds3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    An3, v100
    .byte W03
    .byte    An3, v060
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Ds4, v100
    .byte W03
    .byte    Ds4, v060
    .byte W03
    .byte    Gs4, v100
    .byte W03
    .byte    Gs4, v060
    .byte W03
    .byte    An4, v100
    .byte W03
    .byte    An4, v060
    .byte W03
    .byte    Ds5, v100
    .byte W03
    .byte    Ds5, v060
    .byte W03
    .byte PATT
    .word LABEL_080ACEF7
    .byte PAN  , 127
    .byte    N03, Ds5, v100
    .byte W03
    .byte    Ds5, v060
    .byte W03
    .byte    As4, v100
    .byte W03
    .byte    As4, v060
    .byte W03
    .byte    Gs4, v100
    .byte W03
    .byte    Gs4, v060
    .byte W03
    .byte    Ds4, v100
    .byte W03
    .byte    Ds4, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Dn4, v112
    .byte W03
    .byte    Dn4, v060
    .byte W03
    .byte    As3, v112
    .byte W03
    .byte    As3, v060
    .byte W03
    .byte    Gs3, v112
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    Ds3, v112
    .byte W03
    .byte    Ds3, v060
    .byte W03
    .byte PAN  , 127
    .byte    N03, Cs3, v120
    .byte W03
    .byte    Cs3, v080
    .byte W03
    .byte    An2, v120
    .byte W03
    .byte    An2, v080
    .byte W03
    .byte    Gs2, v120
    .byte W03
    .byte    Gs2, v080
    .byte W03
    .byte    Ds2, v120
    .byte W03
    .byte    Ds2, v080
    .byte W03
    .byte PAN  , 0
    .byte    N03, Ds2, v120
    .byte W03
    .byte    Ds2, v080
    .byte W03
    .byte    An1, v120
    .byte W03
    .byte    An1, v080
    .byte W03
    .byte    Gs1, v120
    .byte W03
    .byte    Gs1, v080
    .byte W03
    .byte    Ds1, v120
    .byte W03
    .byte    Ds1, v080
    .byte W03
LABEL_080AD038:
    .byte PAN  , 127
    .byte    N03, En2, v100
    .byte W03
    .byte    En2, v060
    .byte W03
    .byte    Gn2, v100
    .byte W03
    .byte    Gn2, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte    Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn2, v100
    .byte W03
    .byte    Gn2, v060
    .byte W03
    .byte    Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte PAN  , 127
    .byte    N03, Bn2, v100
    .byte W03
    .byte    Bn2, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte    An3, v100
    .byte W03
    .byte    An3, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte    An3, v100
    .byte W03
    .byte    An3, v060
    .byte W03
    .byte PEND
LABEL_080AD0A5:
    .byte PAN  , 127
    .byte    N03, En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    Gn3, v100
    .byte W03
    .byte    Gn3, v060
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v060
    .byte W03
    .byte    Bn3, v100
    .byte W03
    .byte    Bn3, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v060
    .byte W03
    .byte    Bn3, v100
    .byte W03
    .byte    Bn3, v060
    .byte W03
    .byte    Fs4, v100
    .byte W03
    .byte    Fs4, v060
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v060
    .byte W03
    .byte PAN  , 127
    .byte    N03, Bn3, v100
    .byte W03
    .byte    Bn3, v060
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v060
    .byte W03
    .byte    An4, v100
    .byte W03
    .byte    An4, v060
    .byte W03
    .byte    Fs4, v100
    .byte W03
    .byte    Fs4, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Dn4, v100
    .byte W03
    .byte    Dn4, v060
    .byte W03
    .byte    Fs4, v100
    .byte W03
    .byte    Fs4, v060
    .byte W03
    .byte    Cs5, v100
    .byte W03
    .byte    Cs5, v060
    .byte W03
    .byte    An4, v100
    .byte W03
    .byte    An4, v060
    .byte W03
    .byte PEND
LABEL_080AD112:
    .byte PAN  , 127
    .byte    N03, Ds2, v100
    .byte W03
    .byte    Ds2, v060
    .byte W03
    .byte    Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    As2, v100
    .byte W03
    .byte    As2, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    As2, v100
    .byte W03
    .byte    As2, v060
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte PAN  , 127
    .byte    N03, As2, v100
    .byte W03
    .byte    As2, v060
    .byte W03
    .byte    Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cs3, v100
    .byte W03
    .byte    Cs3, v060
    .byte W03
    .byte    Fn3, v100
    .byte W03
    .byte    Fn3, v060
    .byte W03
    .byte    Cn4, v100
    .byte W03
    .byte    Cn4, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte PEND
    .byte PAN  , 127
    .byte    N03, Ds3, v100
    .byte W03
    .byte    Ds3, v060
    .byte W03
    .byte    Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte    As3, v100
    .byte W03
    .byte    As3, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    As3, v100
    .byte W03
    .byte    As3, v060
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v060
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte PAN  , 127
    .byte    N03, As3, v100
    .byte W03
    .byte    As3, v060
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte    Gs4, v100
    .byte W03
    .byte    Gs4, v060
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte    Fn4, v100
    .byte W03
    .byte    Fn4, v060
    .byte W03
    .byte    Cn5, v100
    .byte W03
    .byte    Cn5, v060
    .byte W03
    .byte    Gs4, v100
    .byte W03
    .byte    Gs4, v060
    .byte W03
    .byte PATT
    .word LABEL_080AD038
    .byte PATT
    .word LABEL_080AD0A5
    .byte PATT
    .word LABEL_080AD112
    .byte PAN  , 127
    .byte    N03, Fs2, v100
    .byte W03
    .byte    Fs2, v060
    .byte W03
    .byte    Cn3, v100
    .byte W03
    .byte    Cn3, v060
    .byte W03
    .byte    Gs3, v100
    .byte W03
    .byte    Gs3, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte PAN  , 0
    .byte    N03, Fs3, v100
    .byte W03
    .byte    Fs3, v060
    .byte W03
    .byte    Cn4, v100
    .byte W03
    .byte    Cn4, v060
    .byte W03
    .byte    Gs4, v100
    .byte W03
    .byte    Gs4, v060
    .byte W03
    .byte    En4, v100
    .byte W03
    .byte    En4, v060
    .byte W03
    .byte PAN  , 64
    .byte    N03, Gs5, v100
    .byte W03
    .byte    Fs5
    .byte W03
    .byte    En5
    .byte W03
    .byte    Cn5
    .byte W03
    .byte    Gs4
    .byte W03
    .byte    Fs4
    .byte W03
    .byte    En4
    .byte W03
    .byte    Cn4
    .byte W03
    .byte    Gs3
    .byte W03
    .byte    Fs3
    .byte W03
    .byte    En3
    .byte W03
    .byte    Cn3
    .byte W03
    .byte    Gs2
    .byte W03
    .byte    Fs2
    .byte W03
    .byte    En2
    .byte W03
    .byte    Cn2
    .byte W03
    .byte GOTO
    .word LABEL_080ACCBC
    .byte FINE

Track_080AD25A:
    .byte KEYSH, 0
    .byte W96
    .byte VOICE, 5
    .byte W48
    .byte PAN  , 64
    .byte W48
    .byte W12
    .byte XCMD , xIECV, 40
    .byte W12
    .byte W12
    .byte    AnM2, v003
    .byte W12
    .byte BENDR, 12
    .byte W12
    .byte LFOS , 29
    .byte W12
    .byte LFODL, 14
    .byte W12
    .byte MODT , 0
    .byte W12
    .byte W96
LABEL_080AD279:
    .byte VOL  , 85
    .byte    N12, Fs3, v112
    .byte W12
    .byte MOD  , 5
    .byte    N12, Gs3
    .byte W12
    .byte    An3
    .byte W12
    .byte TIE, En4
    .byte W60
    .byte W48
    .byte EOT
    .byte    N48, Dn4
    .byte W48
    .byte TIE, Cs4
    .byte W96
    .byte W64
    .byte VOL  , 75
    .byte W04
    .byte    Fs3
    .byte W04
    .byte    Gs2
    .byte W04
    .byte    Bn1
    .byte W04
    .byte    Cs1
    .byte W04
    .byte    En0
    .byte W04
    .byte    EnM1
    .byte W04
    .byte    FnM2
    .byte W04
    .byte EOT
    .byte VOL  , 85
    .byte    N12, Fs3
    .byte W12
    .byte    Gs3
    .byte W12
    .byte    An3
    .byte W12
    .byte TIE, En4
    .byte W60
    .byte W48
    .byte EOT
    .byte    N36, Dn4
    .byte W36
    .byte    N06, En4
    .byte W06
    .byte    Dn4
    .byte W06
    .byte TIE, Cs4
    .byte W96
    .byte W64
    .byte VOL  , 75
    .byte W04
    .byte    Fs3
    .byte W04
    .byte    Gs2
    .byte W04
    .byte    Bn1
    .byte W04
    .byte    Cs1
    .byte W04
    .byte    En0
    .byte W04
    .byte    EnM1
    .byte W04
    .byte    EnM2
    .byte W04
    .byte EOT
    .byte VOL  , 85
    .byte    N12, Bn3
    .byte W12
    .byte    Cs4
    .byte W12
    .byte    Dn4
    .byte W12
    .byte    N60, Fs4
    .byte W60
    .byte    N12, Fs4, v052
    .byte W12
    .byte    Fs4, v020
    .byte W12
    .byte    N24, En4, v112
    .byte W24
    .byte    N36, An4
    .byte W36
    .byte    N06, Gs4
    .byte W06
    .byte    Gn4
    .byte W06
    .byte TIE, Fs4
    .byte W96
    .byte W48
    .byte EOT
    .byte    N12, Fs4, v060
    .byte W12
    .byte    Fs4, v040
    .byte W12
    .byte    N24, Fs4, v112
    .byte W24
    .byte    N18, Fn4
    .byte W18
    .byte    Fs4
    .byte W18
    .byte    N06, Fn4
    .byte W06
    .byte    Cs4
    .byte W06
    .byte TIE, As3
    .byte W48
    .byte W96
    .byte W64
    .byte VOL  , 75
    .byte W04
    .byte    Fs3
    .byte W04
    .byte    Gs2
    .byte W04
    .byte    Bn1
    .byte W04
    .byte    Cs1
    .byte W04
    .byte    En0
    .byte W04
    .byte    DsM1
    .byte W04
    .byte    DnM2
    .byte W04
    .byte EOT
    .byte W96
    .byte VOL  , 85
    .byte    N06, Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Bn3, v020
    .byte W06
    .byte    Gn3, v100
    .byte W06
    .byte    Gn3, v040
    .byte W06
    .byte    Dn3, v100
    .byte W06
    .byte    Dn3, v040
    .byte W06
    .byte    Dn3, v020
    .byte W06
    .byte    Gn3, v100
    .byte W06
    .byte    Gn3, v040
    .byte W06
    .byte    Gn3, v020
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
LABEL_080AD354:
    .byte    N06, Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Cs4, v020
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    En4, v020
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte PEND
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Cs4, v020
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    As3, v020
    .byte W06
    .byte    Fs3, v100
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    Ds3, v020
    .byte W06
    .byte    Fs3, v100
    .byte W06
    .byte    Fs3, v040
    .byte W06
    .byte    Fs3, v020
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Cs4, v020
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    As3, v020
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v040
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Cs4, v020
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Bn3, v020
    .byte W06
    .byte    Gn3, v100
    .byte W06
    .byte    Gn3, v040
    .byte W06
    .byte    Dn3, v100
    .byte W06
    .byte    Dn3, v040
    .byte W06
    .byte    Dn3, v020
    .byte W06
    .byte    Gn3, v100
    .byte W06
    .byte    Gn3, v040
    .byte W06
    .byte    Gn3, v020
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte PATT
    .word LABEL_080AD354
    .byte MOD  , 3
    .byte    N78, Cs4, v100
    .byte W78
    .byte    N06, Cs4, v040
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    As3
    .byte W06
    .byte    N90, Gs3
    .byte W90
    .byte    N06, Gs3, v052
    .byte W06
    .byte GOTO
    .word LABEL_080AD279
    .byte FINE

Track_080AD437:
    .byte KEYSH, 0
    .byte VOICE, 14
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte    N06, Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N04, An2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N04, Gs2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    N04, Gn2, v100
    .byte W06
    .byte    N04
    .byte W06
LABEL_080AD47F:
    .byte    N06, Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N04, An2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N04, Bn2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    N04, Gn2, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte PEND
LABEL_080AD4B1:
    .byte    N06, Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N04, An2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N04, Gs2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    N04, Gn2, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AD47F
LABEL_080AD4E8:
    .byte PATT
    .word LABEL_080AD4B1
    .byte PATT
    .word LABEL_080AD47F
    .byte PATT
    .word LABEL_080AD4B1
    .byte PATT
    .word LABEL_080AD47F
    .byte PATT
    .word LABEL_080AD4B1
    .byte PATT
    .word LABEL_080AD47F
    .byte PATT
    .word LABEL_080AD4B1
    .byte PATT
    .word LABEL_080AD47F
LABEL_080AD510:
    .byte    N06, En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    N04, Gn2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte    N04, Fs2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N04, Fn2, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte PEND
LABEL_080AD542:
    .byte    N06, En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    N04, Gn2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte    N04, An2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N04, Fn2, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AD510
    .byte PATT
    .word LABEL_080AD542
LABEL_080AD57E:
    .byte    N06, Ds2, v100
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
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    N04, Fs2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N04, Fn2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    N04, En2, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte PEND
LABEL_080AD5B0:
    .byte    N06, Ds2, v100
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
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    N04, Fs2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N04, Gs2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    N04, En2, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AD57E
    .byte PATT
    .word LABEL_080AD5B0
    .byte PATT
    .word LABEL_080AD510
LABEL_080AD5F1:
    .byte    N06, En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    N04, En2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    N04, Bn2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    N04, En3, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080AD57E
    .byte    N06, Ds2, v100
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
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    N04, Ds2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    N04, As2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    N04, Ds3, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte PATT
    .word LABEL_080AD510
    .byte PATT
    .word LABEL_080AD5F1
    .byte    N06, Ds2, v100
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
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    N04, Fs2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N04, En2, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    N04, Ds2, v100
    .byte W06
    .byte    N04
    .byte W06
    .byte BEND , 64
    .byte    N48, Dn2
    .byte W32
    .byte W03
    .byte BEND , 65
    .byte W01
    .byte    Fs3
    .byte W01
    .byte    Gn3
    .byte W01
    .byte    Gs3
    .byte W01
    .byte    As3
    .byte W01
    .byte    Ds4
    .byte W01
    .byte    Fs4
    .byte W01
    .byte    Bn4
    .byte W01
    .byte    En5
    .byte W01
    .byte    As5
    .byte W01
    .byte    En6
    .byte W01
    .byte    Dn7
    .byte W01
    .byte    Gs7
    .byte W01
    .byte    En3
    .byte    N48, Dn3
    .byte W48
    .byte GOTO
    .word LABEL_080AD4E8
    .byte FINE

Track_080AD6BF:
    .byte KEYSH, 0
    .byte VOICE, 21
    .byte VOL  , 66
    .byte PAN  , 64
    .byte BENDR, 12
    .byte MODT , 0
    .byte W96
    .byte W96
    .byte W96
    .byte W48
    .byte VOL  , 0
    .byte    N48, Fs3, v040
    .byte    N48, Cs4, v060
    .byte W04
    .byte VOL  , 4
    .byte W04
    .byte    AsM2
    .byte W04
    .byte    EnM1
    .byte W04
    .byte    AnM1
    .byte W04
    .byte    Ds0
    .byte W04
    .byte    An0
    .byte W04
    .byte    Cs1
    .byte W04
    .byte    Gn1
    .byte W04
    .byte    Cs2
    .byte W04
    .byte    Fs2
    .byte W04
    .byte    Cn3
    .byte W04
LABEL_080AD6EF:
    .byte VOICE, 21
    .byte VOL  , 66
    .byte TIE, Gs3, v072
    .byte W96
    .byte W48
    .byte EOT
    .byte    N36, Bn3
    .byte W36
    .byte    N06, As3
    .byte W06
    .byte    An3
    .byte W06
    .byte TIE, Gs3
    .byte W96
    .byte W90
    .byte EOT
    .byte    N06, Gs3, v032
    .byte W06
    .byte TIE, Gs3, v072
    .byte W96
    .byte W48
    .byte EOT
    .byte    N36, Bn3
    .byte W36
    .byte    N06, As3
    .byte W06
    .byte    An3
    .byte W06
    .byte TIE, Gs3
    .byte W96
    .byte W90
    .byte EOT
    .byte    N06, Gs3, v032
    .byte W06
    .byte TIE, Bn3, v060
    .byte W96
    .byte W84
    .byte EOT
    .byte    N06, Cs4
    .byte W06
    .byte    Cn4
    .byte W06
    .byte TIE, Bn3
    .byte W96
    .byte W90
    .byte EOT
    .byte    N06, Bn3, v032
    .byte W06
    .byte TIE, As3, v060
    .byte W96
    .byte W84
    .byte EOT
    .byte    N06, Gs3
    .byte W06
    .byte    Fs3
    .byte W06
    .byte TIE, Fn3
    .byte W96
    .byte W78
    .byte EOT
    .byte    N06, Fn3, v032
    .byte W06
    .byte    Fn3, v020
    .byte W06
    .byte    Fn3, v012
    .byte W06
    .byte VOICE, 27
    .byte    N06, Fs3, v092
    .byte W06
    .byte    Fs3, v052
    .byte W06
    .byte    Fs3, v020
    .byte W06
    .byte    Dn3, v092
    .byte W06
    .byte    Dn3, v052
    .byte W06
    .byte    Dn3, v020
    .byte W06
    .byte    Bn2, v092
    .byte W06
    .byte    Bn2, v032
    .byte W06
    .byte    Gn2, v092
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    Gn2, v020
    .byte W06
    .byte    Bn2, v092
    .byte W06
    .byte    Bn2, v052
    .byte W06
    .byte    Bn2, v020
    .byte W06
    .byte    Dn3, v092
    .byte W06
    .byte    Dn3, v032
    .byte W06
LABEL_080AD782:
    .byte    N06, Fs3, v092
    .byte W06
    .byte    Fs3, v052
    .byte W06
    .byte    Fs3, v020
    .byte W06
    .byte    En3, v092
    .byte W06
    .byte    En3, v052
    .byte W06
    .byte    En3, v020
    .byte W06
    .byte    En3, v092
    .byte W06
    .byte    En3, v032
    .byte W06
    .byte    An3, v092
    .byte W06
    .byte    An3, v052
    .byte W06
    .byte    An3, v020
    .byte W06
    .byte    Gn3, v092
    .byte W06
    .byte    Gn3, v052
    .byte W06
    .byte    Gn3, v020
    .byte W06
    .byte    Gn3, v092
    .byte W06
    .byte    Gn3, v032
    .byte W06
    .byte PEND
    .byte    Fn3, v092
    .byte W06
    .byte    Fn3, v052
    .byte W06
    .byte    Fn3, v020
    .byte W06
    .byte    Cs3, v092
    .byte W06
    .byte    Cs3, v052
    .byte W06
    .byte    Cs3, v020
    .byte W06
    .byte    As2, v092
    .byte W06
    .byte    As2, v032
    .byte W06
    .byte    Fs2, v092
    .byte W06
    .byte    Fs2, v052
    .byte W06
    .byte    Fs2, v020
    .byte W06
    .byte    As2, v092
    .byte W06
    .byte    As2, v052
    .byte W06
    .byte    As2, v020
    .byte W06
    .byte    Cs3, v092
    .byte W06
    .byte    Cs3, v032
    .byte W06
    .byte    Fn3, v092
    .byte W06
    .byte    Fn3, v052
    .byte W06
    .byte    Fn3, v020
    .byte W06
    .byte    Ds3, v092
    .byte W06
    .byte    Ds3, v052
    .byte W06
    .byte    Ds3, v020
    .byte W06
    .byte    Ds3, v092
    .byte W06
    .byte    Ds3, v032
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v020
    .byte W06
    .byte    Fs3, v092
    .byte W06
    .byte    Fs3, v052
    .byte W06
    .byte    Fs3, v020
    .byte W06
    .byte    Fs3, v092
    .byte W06
    .byte    Fs3, v032
    .byte W06
    .byte    Fs3, v092
    .byte W06
    .byte    Fs3, v052
    .byte W06
    .byte    Fs3, v020
    .byte W06
    .byte    Dn3, v092
    .byte W06
    .byte    Dn3, v052
    .byte W06
    .byte    Dn3, v020
    .byte W06
    .byte    Bn2, v092
    .byte W06
    .byte    Bn2, v032
    .byte W06
    .byte    Gn2, v092
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    Gn2, v020
    .byte W06
    .byte    Bn2, v092
    .byte W06
    .byte    Bn2, v052
    .byte W06
    .byte    Bn2, v020
    .byte W06
    .byte    Dn3, v092
    .byte W06
    .byte    Dn3, v032
    .byte W06
    .byte PATT
    .word LABEL_080AD782
    .byte    N80, Fs3, v092
    .byte W84
    .byte    N06, En3
    .byte W06
    .byte    Dn3
    .byte W06
    .byte    N60, Cn3
    .byte W60
    .byte    N06, Cn3, v032
    .byte W06
    .byte    Cn3, v012
    .byte W06
    .byte VOICE, 21
    .byte    N06, Cs3, v052
    .byte W06
    .byte    Ds3
    .byte W06
    .byte    Fn3, v060
    .byte W06
    .byte    Fs3, v072
    .byte W06
    .byte GOTO
    .word LABEL_080AD6EF
    .byte FINE

    .align 2, 0

global_label SongHeader_080AD870
    .byte 5
    .byte 0
    .byte 0
    .byte 163
    .word 0x809FF38
    .word Track_080AC990
    .word Track_080ACCB6
    .word Track_080AD25A
    .word Track_080AD437
    .word Track_080AD6BF

    .end
