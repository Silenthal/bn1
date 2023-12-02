#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080A55CC:
    .byte VOL  , 120
    .byte KEYSH, 0
    .byte TEMPO, 70
    .byte    N10, Cs1, v120
    .byte W06
    .byte    N06, Gn1
    .byte W06
LABEL_080A55D9:
    .byte VOICE, 0
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 2
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W24
    .byte    N10, Cs1, v120
    .byte W18
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
LABEL_080A5615:
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cs1
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PEND
LABEL_080A5667:
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PEND
LABEL_080A56B7:
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, As1
    .byte W06
    .byte    N10, Cs1, v120
    .byte W06
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cs1
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cs1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte PEND
LABEL_080A5709:
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W24
    .byte    N10, Cs1, v120
    .byte W18
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080A5615
    .byte PATT
    .word LABEL_080A5667
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W12
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Cs1, v120
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N10, Cs1, v080
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v088
    .byte    N06, Cs1, v120
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N10, Cs1, v080
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    N06, Cs1, v100
    .byte    N06, As1, v060
    .byte W06
    .byte    Cs1, v120
    .byte W06
    .byte    Gs1
    .byte W06
    .byte    N06
    .byte W06
    .byte    Gn1
    .byte W06
    .byte    Bn0, v112
    .byte    N42, Cs2, v060
    .byte W24
    .byte    N10, Cs1, v120
    .byte W18
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PATT
    .word LABEL_080A5615
    .byte PATT
    .word LABEL_080A5667
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cs1
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cs1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte PATT
    .word LABEL_080A5709
    .byte PATT
    .word LABEL_080A5615
    .byte PATT
    .word LABEL_080A5667
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N06, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cs1, v120
    .byte    N06, As1, v052
    .byte W06
    .byte    Cs1, v092
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    Cs1, v120
    .byte    N24, Cs2, v040
    .byte W12
    .byte    N04, An1, v120
    .byte W04
    .byte    Gs1
    .byte W04
    .byte    Gn1
    .byte W04
    .byte    N06, Bn0, v112
    .byte    N42, Cs2, v060
    .byte W24
    .byte    N10, Cs1, v120
    .byte W18
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PATT
    .word LABEL_080A5615
    .byte PATT
    .word LABEL_080A5667
    .byte PATT
    .word LABEL_080A56B7
    .byte PATT
    .word LABEL_080A5709
    .byte PATT
    .word LABEL_080A5615
    .byte PATT
    .word LABEL_080A5667
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, As1
    .byte W06
    .byte    N10, Cs1, v120
    .byte W06
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cs1
    .byte    N06, As1, v052
    .byte W06
    .byte    Cs1, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Cs1, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    Fs1, v060
    .byte    N06, Gn1, v120
    .byte W06
    .byte    Bn0, v112
    .byte    N42, Cs2, v060
    .byte W24
    .byte    N06, Bn0, v092
    .byte W06
    .byte    N10, Cs1, v120
    .byte W18
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v052
    .byte W06
    .byte    Bn0, v100
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, As1, v040
    .byte W06
    .byte    N10, Cs1, v120
    .byte    N02, Fs1, v060
    .byte W06
    .byte    Fs1, v040
    .byte W06
    .byte PATT
    .word LABEL_080A5615
    .byte PATT
    .word LABEL_080A5667
    .byte PATT
    .word LABEL_080A56B7
    .byte PATT
    .word LABEL_080A5709
    .byte PATT
    .word LABEL_080A5615
    .byte PATT
    .word LABEL_080A5667
    .byte    N02, Fs1, v060
    .byte W06
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte W06
    .byte    N06, Bn0, v112
    .byte    N18, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v112
    .byte    N18, Cs2, v052
    .byte W18
    .byte    N06, Bn0, v112
    .byte    N48, Cs2, v060
    .byte W30
    .byte    N06, Cs1, v040
    .byte W06
    .byte    Cs1, v092
    .byte W06
    .byte    Cs1, v120
    .byte W06
    .byte    N12, Gn1
    .byte W12
    .byte GOTO
    .word LABEL_080A55D9
    .byte FINE

Track_080A59C9:
    .byte KEYSH, 0
    .byte W12
LABEL_080A59CC:
    .byte VOICE, 15
    .byte VOL  , 94
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte    N06, Fn2, v112
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v112
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W12
    .byte    Ds3, v080
    .byte W06
    .byte    N05, Fn3, v100
    .byte W06
    .byte    N06, As2
    .byte W06
    .byte    Cn3
    .byte W06
LABEL_080A5A09:
    .byte    N06, Ds3, v100
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N05, Fn2, v112
    .byte W06
    .byte    N06, Fn2, v100
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v060
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W12
    .byte    N05, Ds3, v100
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    N06, Gn3
    .byte W06
    .byte PEND
LABEL_080A5A38:
    .byte    N06, Gn3, v040
    .byte W06
    .byte    N05, Gn3, v100
    .byte W06
    .byte    N04, Fn2, v112
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    N11, Ds3, v112
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N11, As3
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N11, As2, v100
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N04, Gs2, v112
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte BEND , 53
    .byte    N06, As2
    .byte W01
    .byte BEND , 58
    .byte W01
    .byte    En3
    .byte W04
    .byte    N06, Gs2
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte BEND , 53
    .byte    N17, As3, v112
    .byte W01
    .byte BEND , 56
    .byte W01
    .byte    As2
    .byte W01
    .byte    Cs3
    .byte W01
    .byte    En3
    .byte W02
    .byte PEND
LABEL_080A5A85:
    .byte W06
    .byte    N04, Gs3, v080
    .byte W06
    .byte    N05, Fn2, v112
    .byte W06
    .byte    Fn2, v096
    .byte W06
    .byte    N04, Fn2, v100
    .byte W06
    .byte    N06, Ds2
    .byte W06
    .byte    Ds2, v060
    .byte W06
    .byte    Ds2, v040
    .byte W06
    .byte    N05, Fn2, v100
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    N06, Fn2, v040
    .byte W06
    .byte    Fn2, v020
    .byte W06
    .byte BEND , 53
    .byte    N23, Cn4, v100
    .byte W02
    .byte BEND , 56
    .byte W01
    .byte    Cs3
    .byte W01
    .byte    En3
    .byte W20
    .byte PEND
LABEL_080A5ABA:
    .byte    N05, Fn3, v108
    .byte W06
    .byte    Gs3, v096
    .byte W06
    .byte    N06, Fn2, v112
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v112
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W12
    .byte    Ds3, v080
    .byte W06
    .byte    N05, Fn3, v100
    .byte W06
    .byte    N06, As2
    .byte W06
    .byte    Cn3
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080A5A09
    .byte PATT
    .word LABEL_080A5A38
    .byte PATT
    .word LABEL_080A5A85
    .byte    N05, Fn3, v108
    .byte W06
    .byte    Gs3, v096
    .byte W06
    .byte    Cs3, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    Cs3, v112
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    Cs3, v108
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Cs3, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    N11, Cn3, v108
    .byte W06
    .byte BEND , 127
    .byte W06
    .byte    En3
    .byte    N11, Cs3
    .byte W06
    .byte BEND , 127
    .byte W06
    .byte    En3
    .byte    N04, Cn3, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v112
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v108
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    N10, As3, v108
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N10, Fn3
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N04, Bn2, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    Bn2, v100
    .byte W06
    .byte    Bn2, v112
    .byte W06
    .byte    Bn2, v100
    .byte W06
    .byte    Bn2, v108
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    Bn2, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Bn2, v100
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    N10, An3, v108
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N10
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N04, As2, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v112
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v108
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    N10, An3, v108
    .byte W06
    .byte BEND , 69
    .byte W06
    .byte    En3
    .byte    N10, Ds3
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N04, Cs3, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    N10, Cn3, v108
    .byte W06
    .byte BEND , 127
    .byte W06
    .byte    En3
    .byte    N11, Cs3
    .byte W06
    .byte BEND , 127
    .byte W06
    .byte    En3
    .byte    N04, Cs3, v112
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Cs3, v108
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    N10, Cs3, v108
    .byte W06
    .byte BEND , 127
    .byte W06
    .byte    En3
    .byte    N11
    .byte W06
    .byte BEND , 127
    .byte W06
    .byte    En3
    .byte    N04, Cn3, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v112
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    As2, v108
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    N10, As3, v108
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N11, Fn3
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N04, As2, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v112
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    N10, An3
    .byte W06
    .byte BEND , 69
    .byte W06
    .byte    En3
    .byte    N04, As2, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    N10, Gs3, v108
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N10
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N04, Gn2, v112
    .byte W06
    .byte    N04
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte    Gn2, v032
    .byte W06
    .byte    Gn2, v096
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    N10, Fn3, v108
    .byte W06
    .byte BEND , 74
    .byte W06
    .byte    En3
    .byte    N04, Cn3, v112
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v108
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    N23, Cn3, v100
    .byte W11
    .byte BEND , 64
    .byte W01
    .byte W01
    .byte    Cn3
    .byte W01
    .byte    Gs2
    .byte W01
    .byte    Fn2
    .byte W01
    .byte    As1
    .byte W01
    .byte    Fs1
    .byte W01
    .byte    Ds1
    .byte W02
    .byte    Bn0
    .byte W01
    .byte    Gs0
    .byte W03
    .byte    En3
    .byte    N06, Fn2, v112
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v112
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W12
    .byte    Ds3, v080
    .byte W06
    .byte    N05, Fn3, v100
    .byte W06
    .byte    N06, As2
    .byte W06
    .byte    Cn3
    .byte W06
    .byte PATT
    .word LABEL_080A5A09
    .byte PATT
    .word LABEL_080A5A38
    .byte PATT
    .word LABEL_080A5A85
    .byte PATT
    .word LABEL_080A5ABA
    .byte PATT
    .word LABEL_080A5A09
    .byte    N06, Gn3, v040
    .byte W06
    .byte    N05, Gn3, v100
    .byte W06
    .byte    Cs2
    .byte W06
    .byte    N05
    .byte W06
    .byte    N06, Cs2, v040
    .byte W06
    .byte    N05, Cs2, v100
    .byte W06
    .byte    N05
    .byte W06
    .byte    N05
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    Cs2
    .byte W06
    .byte    Fs2
    .byte W06
    .byte    N05
    .byte W06
    .byte    N06, Fs2, v040
    .byte W06
    .byte    N05, Fs2, v100
    .byte W06
    .byte    Fn2
    .byte W06
    .byte    N05
    .byte W06
    .byte    Fs2
    .byte W06
    .byte    N05
    .byte W06
    .byte    Gn2
    .byte W06
    .byte    N05
    .byte W06
    .byte    Gn2, v040
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    Fn2
    .byte W06
    .byte    N05
    .byte W06
    .byte    Gn2
    .byte W06
    .byte    N05
    .byte W06
    .byte    Cn3
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    N05
    .byte W06
    .byte    Cn3, v040
    .byte W06
    .byte    N06, Fn2, v112
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v032
    .byte W06
    .byte    N06
    .byte W06
    .byte    Fn2, v112
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Fn2, v040
    .byte W12
    .byte    Ds3, v080
    .byte W06
    .byte    N05, Fn3, v100
    .byte W06
    .byte    N06, As2
    .byte W06
    .byte    Cn3
    .byte W06
    .byte PATT
    .word LABEL_080A5A09
    .byte PATT
    .word LABEL_080A5A38
    .byte PATT
    .word LABEL_080A5A85
    .byte PATT
    .word LABEL_080A5ABA
    .byte PATT
    .word LABEL_080A5A09
    .byte PATT
    .word LABEL_080A5A38
    .byte PATT
    .word LABEL_080A5A85
    .byte    N05, Fn3, v108
    .byte W06
    .byte    Gs3, v096
    .byte W06
    .byte GOTO
    .word LABEL_080A59CC
    .byte FINE

Track_080A5D91:
    .byte KEYSH, 0
    .byte VOICE, 21
    .byte W03
    .byte VOL  , 66
    .byte W03
    .byte PAN  , 64
    .byte W03
    .byte BENDR, 12
    .byte W03
LABEL_080A5D9F:
    .byte VOICE, 20
    .byte VOL  , 37
    .byte PAN  , 0
    .byte    N24, Ds3, v100
    .byte W24
    .byte    Ds3, v060
    .byte W24
    .byte    N23, Ds3, v040
    .byte W24
    .byte    Ds3, v020
    .byte W12
LABEL_080A5DB3:
    .byte W12
    .byte PAN  , 127
    .byte    N24, Dn3, v100
    .byte W24
    .byte    Dn3, v060
    .byte W24
    .byte    N23, Dn3, v040
    .byte W24
    .byte    Dn3, v020
    .byte W12
    .byte PEND
LABEL_080A5DC5:
    .byte W12
    .byte PAN  , 0
    .byte    N24, Ds3, v100
    .byte W24
    .byte    Ds3, v060
    .byte W24
    .byte    N23, Ds3, v040
    .byte W24
    .byte    Ds3, v020
    .byte W12
    .byte PEND
LABEL_080A5DD7:
    .byte W12
    .byte PAN  , 127
    .byte    N24, Dn3, v100
    .byte W24
    .byte    Dn3, v040
    .byte W24
    .byte PAN  , 0
    .byte    N23, Fn3, v100
    .byte W24
    .byte    Fn3, v040
    .byte W12
    .byte PEND
LABEL_080A5DEB:
    .byte W12
    .byte PAN  , 127
    .byte    N24, Ds3, v100
    .byte W24
    .byte    Ds3, v060
    .byte W24
    .byte    N23, Ds3, v040
    .byte W24
    .byte    Ds3, v020
    .byte W12
    .byte PEND
LABEL_080A5DFD:
    .byte W12
    .byte PAN  , 0
    .byte    N24, Dn3, v100
    .byte W24
    .byte    Dn3, v060
    .byte W24
    .byte    N23, Dn3, v040
    .byte W24
    .byte    Dn3, v020
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A5DEB
    .byte W12
    .byte PAN  , 0
    .byte    N24, Dn3, v100
    .byte W24
    .byte    Dn3, v040
    .byte W24
    .byte PAN  , 127
    .byte    N24, Fn3, v100
    .byte W24
    .byte    N06, Fn3, v040
    .byte W06
    .byte VOICE, 21
    .byte PAN  , 90
    .byte VOL  , 56
    .byte    N04, Fn3, v080
    .byte W04
    .byte    Gn3, v092
    .byte W02
    .byte W03
    .byte    Gs3, v100
    .byte W04
    .byte    As3, v112
    .byte W05
    .byte    N60, Cn4, v100
    .byte W60
    .byte    N06, Cn4, v072
    .byte W06
    .byte    N18, As3, v100
    .byte W18
    .byte    N12, Gs3
    .byte W12
    .byte    N90, Gn3
    .byte W84
    .byte W06
    .byte    N06, Gn3, v072
    .byte W06
    .byte    N90, Fn3, v100
    .byte W84
    .byte W06
    .byte    N06, Fn3, v072
    .byte W06
    .byte    N36, Ds3, v100
    .byte W36
    .byte    N42, Dn3
    .byte W42
    .byte    N06, Dn3, v072
    .byte W06
    .byte    N04, Gn3, v100
    .byte W04
    .byte    Gs3
    .byte W04
    .byte    As3
    .byte W04
    .byte    N54, Cn4
    .byte W54
    .byte    N06, Cn4, v072
    .byte W06
    .byte    N18, As3, v100
    .byte W18
    .byte    Gs3
    .byte W06
    .byte W12
    .byte    N54, Gn3
    .byte W54
    .byte    N06, Gn3, v072
    .byte W06
    .byte    N18, Fn3, v100
    .byte W18
    .byte    Gn3
    .byte W06
    .byte W12
    .byte    N54, Gs3
    .byte W54
    .byte    N06, Gs3, v072
    .byte W06
    .byte    N18, Cn4, v100
    .byte W18
    .byte    As3
    .byte W06
    .byte W12
    .byte    N36, Cn4
    .byte W36
    .byte    N03, As3
    .byte W03
    .byte    Gs3
    .byte W03
    .byte    Gn3
    .byte W03
    .byte    Fn3
    .byte W03
    .byte    N36, En3
    .byte W36
    .byte    N06, En3, v072
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte VOICE, 20
    .byte VOL  , 37
    .byte PAN  , 0
    .byte    N24, Ds3, v100
    .byte W24
    .byte    Ds3, v060
    .byte W24
    .byte    N23, Ds3, v040
    .byte W24
    .byte    Ds3, v020
    .byte W12
    .byte PATT
    .word LABEL_080A5DB3
    .byte PATT
    .word LABEL_080A5DC5
    .byte PATT
    .word LABEL_080A5DD7
    .byte PATT
    .word LABEL_080A5DEB
    .byte PATT
    .word LABEL_080A5DFD
    .byte PATT
    .word LABEL_080A5DEB
    .byte W12
    .byte PAN  , 64
    .byte VOL  , 47
    .byte    N24, En3, v100
    .byte W24
    .byte    En3, v040
    .byte W24
    .byte    N18, Gn2, v060
    .byte    N18, Cn3, v100
    .byte W18
    .byte    N06, Cn3, v072
    .byte W06
    .byte    N12
    .byte    N12, Ds3, v100
    .byte W12
    .byte    N06, Ds3, v072
    .byte W06
    .byte    Cn3
    .byte    N06, Fn3, v100
    .byte W06
    .byte    N12, Cn3, v052
    .byte    N12, Fn3, v072
    .byte W12
    .byte    Cn3, v020
    .byte    N12, Fn3, v040
    .byte W12
    .byte    Fn3, v020
    .byte W60
    .byte W96
    .byte W12
    .byte VOICE, 21
    .byte PAN  , 64
    .byte VOL  , 56
    .byte    N05, Cn3, v100
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v060
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v040
    .byte    N05, Ds3
    .byte W06
    .byte    As2, v100
    .byte    N05, Dn3
    .byte W06
    .byte    As2, v060
    .byte    N05, Dn3
    .byte W06
    .byte    Dn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v040
    .byte    N05, Ds3
    .byte W06
    .byte    Dn3, v100
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v060
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v040
    .byte    N05, Fn3
    .byte W06
    .byte    Cn3, v100
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v060
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v040
    .byte    N05, Ds3
    .byte W06
    .byte    As2, v100
    .byte    N05, Dn3
    .byte W06
    .byte    As2, v040
    .byte    N05, Dn3
    .byte W06
    .byte    Cn3, v100
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v060
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v040
    .byte    N05, Ds3
    .byte W06
    .byte    As2, v100
    .byte    N05, Dn3
    .byte W06
    .byte    As2, v060
    .byte    N05, Dn3
    .byte W06
    .byte    Dn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v040
    .byte    N05, Ds3
    .byte W06
    .byte    Dn3, v100
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v060
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v040
    .byte    N05, Fn3
    .byte W06
    .byte    Ds3, v100
    .byte    N05, Gn3
    .byte W06
    .byte    Ds3, v060
    .byte    N05, Gn3
    .byte W06
    .byte    Ds3, v040
    .byte    N05, Gn3
    .byte W06
    .byte W96
    .byte W96
    .byte W12
    .byte    Cn3, v100
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v060
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v040
    .byte    N05, Ds3
    .byte W06
    .byte    As2, v100
    .byte    N05, Dn3
    .byte W06
    .byte    As2, v060
    .byte    N05, Dn3
    .byte W06
    .byte    Dn3, v040
    .byte W06
    .byte    Cn3, v100
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v040
    .byte    N05, Ds3
    .byte W06
    .byte    Dn3, v100
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v060
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v040
    .byte    N05, Fn3
    .byte W06
    .byte    Cn3, v100
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v060
    .byte    N05, Ds3
    .byte W06
    .byte    Cn3, v040
    .byte    N05, Ds3
    .byte W06
    .byte    Dn3, v100
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v040
    .byte    N05, Fn3
    .byte W06
    .byte    Ds3, v100
    .byte    N05, Gn3
    .byte W06
    .byte    Ds3, v060
    .byte    N05, Gn3
    .byte W06
    .byte    Ds3, v040
    .byte    N05, Gn3
    .byte W06
    .byte    Dn3, v100
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v060
    .byte    N05, Fn3
    .byte W06
    .byte    Dn3, v040
    .byte    N05, Fn3
    .byte W06
    .byte    Ds3, v100
    .byte    N05, Gn3
    .byte W06
    .byte    Ds3, v040
    .byte    N05, Gn3
    .byte W06
    .byte    Ds3, v020
    .byte    N05, Gn3
    .byte W06
    .byte VOICE, 21
    .byte VOL  , 66
    .byte PAN  , 64
    .byte W30
    .byte W12
    .byte GOTO
    .word LABEL_080A5D9F
    .byte FINE

Track_080A603D:
    .byte KEYSH, 0
    .byte W07
    .byte VOICE, 2
    .byte VOL  , 37
    .byte PAN  , 0
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 35
    .byte LFODL, 11
    .byte MOD  , 6
    .byte MODT , 0
    .byte    N06, Ds3, v100
    .byte W05
LABEL_080A6059:
    .byte W01
    .byte    N06, Fn3, v100
    .byte W06
    .byte    N16, Cn4
    .byte W18
    .byte    N06
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    Cn4, v020
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, As3
    .byte W18
    .byte    N06
    .byte W06
    .byte    As3, v040
    .byte W05
LABEL_080A6076:
    .byte W01
    .byte    N06, As3, v020
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, Gs3
    .byte W18
    .byte    N06
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gs3, v020
    .byte W06
    .byte    Gn3, v100
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N12, Ds3
    .byte W12
    .byte    N06, Ds3, v040
    .byte W06
    .byte    N12, Fn3, v100
    .byte W11
    .byte PEND
LABEL_080A609C:
    .byte W01
    .byte    N06, Fn3, v040
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gn3, v100
    .byte W09
    .byte    Gn3, v040
    .byte W06
    .byte    N03, Gn3, v020
    .byte W03
    .byte    N06, Ds3, v100
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    Ds3, v020
    .byte W06
    .byte TIE, Cn3, v100
    .byte W40
    .byte W01
    .byte PEND
LABEL_080A60C1:
    .byte W19
    .byte VOL  , 37
    .byte W06
    .byte    An0
    .byte W06
    .byte    En0
    .byte W06
    .byte    En0
    .byte W06
    .byte    BnM1
    .byte W06
    .byte    BnM1
    .byte W06
    .byte    FsM1
    .byte W06
    .byte    FsM1
    .byte W06
    .byte    DnM1
    .byte W06
    .byte    DnM1
    .byte W06
    .byte    AnM2
    .byte W06
    .byte    EnM2
    .byte W06
    .byte PEND
    .byte EOT, Cn3
    .byte W03
    .byte VOL  , 37
    .byte W02
LABEL_080A60E2:
    .byte PAN  , 64
    .byte    N06, Cn3, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    N16, Gs3
    .byte W18
    .byte    N06
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gs3, v020
    .byte W06
    .byte    Cn3, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    N16, Gn3
    .byte W18
    .byte    N06
    .byte W06
    .byte    Gn3, v040
    .byte W06
    .byte    Gn3, v020
    .byte W06
    .byte PEND
LABEL_080A6106:
    .byte    N06, Cn3, v100
    .byte W06
    .byte    N06
    .byte W06
    .byte    N16, Fn3
    .byte W18
    .byte    N06
    .byte W06
    .byte    Fn3, v040
    .byte W06
    .byte    Fn3, v020
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Dn3
    .byte W06
    .byte    N12, Ds3
    .byte W12
    .byte    N06, Ds3, v040
    .byte W06
    .byte    N12, Fn3, v100
    .byte W12
    .byte    N06, Fn3, v040
    .byte W06
    .byte PEND
    .byte    Gn3, v100
    .byte W06
    .byte    Gn3, v040
    .byte W06
    .byte    N03, Gn3, v060
    .byte W03
    .byte TIE, Gs3, v100
    .byte W80
    .byte W01
    .byte W54
    .byte EOT
    .byte    N06, Gs3, v040
    .byte W06
    .byte    N18, Gs3, v100
    .byte W18
    .byte    As3
    .byte W18
    .byte    N12, Cn4
    .byte W12
    .byte VOL  , 56
    .byte PAN  , 0
    .byte    N03, Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cn4
    .byte W06
    .byte    Cs4
    .byte W06
    .byte PAN  , 127
    .byte    N03
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs5
    .byte W06
LABEL_080A616D:
    .byte    N03, Cn4, v100
    .byte W06
    .byte    Cs4
    .byte W06
    .byte PAN  , 0
    .byte    N03, Cn4
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Cn4
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Cn4
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    As3
    .byte W06
    .byte    Cn4
    .byte W06
    .byte PAN  , 127
    .byte    N03
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Cn4
    .byte W06
    .byte    Cn5
    .byte W06
    .byte    Cn4
    .byte W06
    .byte    Cn5
    .byte W06
    .byte PEND
    .byte    As3
    .byte W06
    .byte    Cn4
    .byte W06
    .byte PAN  , 0
    .byte    N03, Bn3
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    As3
    .byte W06
    .byte    Bn3
    .byte W06
    .byte PAN  , 127
    .byte    N03
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn4
    .byte W06
    .byte    As3
    .byte W06
    .byte    Bn3
    .byte W06
    .byte PAN  , 0
    .byte    N03, An3
    .byte W06
    .byte    An4
    .byte W06
    .byte    An3
    .byte W06
    .byte    An4
    .byte W06
    .byte    An3
    .byte W06
    .byte    An4
    .byte W06
    .byte    Gn3
    .byte W06
    .byte    An3
    .byte W06
    .byte PAN  , 127
    .byte    N03
    .byte W06
    .byte    An4
    .byte W06
    .byte    An3
    .byte W06
    .byte    An4
    .byte W06
    .byte    An3
    .byte W06
    .byte    An4
    .byte W06
    .byte    Gn3
    .byte W06
    .byte    An3
    .byte W06
    .byte PAN  , 0
    .byte    N03, Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cn4
    .byte W06
    .byte    Cs4
    .byte W06
    .byte PAN  , 127
    .byte    N03
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs5
    .byte W06
    .byte PATT
    .word LABEL_080A616D
    .byte    N03, As3, v100
    .byte W06
    .byte    Cn4
    .byte W06
    .byte PAN  , 0
    .byte    N03, Gs3
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gn3
    .byte W06
    .byte    Gs3
    .byte W06
    .byte PAN  , 127
    .byte    N03
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gn3
    .byte W06
    .byte    Gs3
    .byte W06
    .byte PAN  , 0
    .byte    N03, Fn3
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    En3
    .byte W06
    .byte    Fn3
    .byte W06
    .byte PAN  , 127
    .byte    N03, Gs3
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gn3
    .byte W06
    .byte    Gs3
    .byte W06
    .byte VOL  , 37
    .byte PAN  , 0
    .byte W07
    .byte    N16, Cn4
    .byte W18
    .byte    N06
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    Cn4, v020
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, As3
    .byte W18
    .byte    N06
    .byte W06
    .byte    As3, v040
    .byte W05
    .byte PATT
    .word LABEL_080A6076
    .byte PATT
    .word LABEL_080A609C
    .byte PATT
    .word LABEL_080A60C1
    .byte EOT, Cn3
    .byte W03
    .byte VOL  , 37
    .byte W02
    .byte PATT
    .word LABEL_080A60E2
    .byte PATT
    .word LABEL_080A6106
    .byte    N06, Gn3, v100
    .byte W06
    .byte    Gn3, v040
    .byte W06
    .byte    N03, Gn3, v060
    .byte W03
    .byte    N92, Gs3, v100
    .byte W80
    .byte W01
    .byte W12
    .byte    N42, Gn3
    .byte W42
    .byte    N06, Gn3, v040
    .byte W06
    .byte    N16, Gn3, v100
    .byte W18
    .byte    Cn4
    .byte W18
    .byte    N11, Cn4, v112
    .byte W12
    .byte    N12, Cn4, v052
    .byte W12
    .byte    Cn4, v032
    .byte W12
    .byte    N06, Cn4, v020
    .byte W60
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W12
    .byte VOL  , 37
    .byte PAN  , 0
    .byte W84
    .byte W12
    .byte GOTO
    .word LABEL_080A6059
    .byte FINE

Track_080A62D6:
    .byte KEYSH, 0
    .byte VOICE, 6
    .byte VOL  , 103
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 35
    .byte LFODL, 11
    .byte MOD  , 6
    .byte MODT , 0
    .byte    N06, Ds3, v096
    .byte W06
    .byte    Fn3
    .byte W06
LABEL_080A62F3:
    .byte    N16, Cn4, v096
    .byte W18
    .byte    N06
    .byte W06
    .byte    Cn4, v036
    .byte W06
    .byte    Cn4, v016
    .byte W06
    .byte    Ds3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, As3
    .byte W18
    .byte    N06
    .byte W06
    .byte    As3, v036
    .byte W06
    .byte    As3, v016
    .byte W06
LABEL_080A630F:
    .byte    N06, Ds3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, Gs3
    .byte W18
    .byte    N06
    .byte W06
    .byte    Gs3, v036
    .byte W06
    .byte    Gs3, v016
    .byte W06
    .byte    Gn3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N12, Ds3
    .byte W12
    .byte    N06, Ds3, v036
    .byte W06
    .byte    N12, Fn3, v096
    .byte W12
    .byte    N06, Fn3, v036
    .byte W06
    .byte PEND
    .byte    Gs3, v096
    .byte W06
    .byte    Gs3, v036
    .byte W06
    .byte    Gn3, v096
    .byte W09
    .byte    Gn3, v036
    .byte W09
    .byte    Ds3, v096
    .byte W06
    .byte    Ds3, v036
    .byte W06
    .byte    Ds3, v016
    .byte W06
    .byte TIE, Cn3, v096
    .byte W48
    .byte W12
    .byte VOL  , 103
    .byte W06
    .byte    As5
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Ds4
    .byte W06
    .byte    As3
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    Gs2
    .byte W06
    .byte    Ds2
    .byte W06
    .byte    Gs1
    .byte W06
    .byte    Cn1
    .byte W06
    .byte EOT
    .byte VOL  , 28
    .byte W03
    .byte    Cn8
    .byte W09
LABEL_080A636E:
    .byte    N06, Ds3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, Cn4
    .byte W18
    .byte    N06
    .byte W06
    .byte    Cn4, v036
    .byte W06
    .byte    Cn4, v016
    .byte W06
    .byte    Ds3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, As3
    .byte W18
    .byte    N06
    .byte W06
    .byte    As3, v036
    .byte W06
    .byte    As3, v016
    .byte W06
    .byte PEND
LABEL_080A6390:
    .byte    N06, Ds3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, Gs3
    .byte W18
    .byte    N06
    .byte W06
    .byte    Gs3, v036
    .byte W06
    .byte    Gs3, v016
    .byte W06
    .byte    Gn3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N12, Gn3
    .byte W12
    .byte    N06, Gn3, v036
    .byte W06
    .byte    N12, Gs3, v096
    .byte W12
    .byte    N06, Gs3, v036
    .byte W06
    .byte PEND
    .byte    As3, v096
    .byte W06
    .byte    As3, v036
    .byte W06
    .byte TIE, Cn4, v096
    .byte W84
    .byte W54
    .byte EOT
    .byte    N06, Cn4, v036
    .byte W06
    .byte    N02, Bn3, v096
    .byte W02
    .byte    N16, Cn4
    .byte W16
    .byte    N18, Cs4
    .byte W18
    .byte    N12, Ds4
    .byte W12
    .byte    N48, Fn4
    .byte W48
    .byte    N12, Fn4, v036
    .byte W12
    .byte    Fn4, v096
    .byte W12
    .byte    Gn4
    .byte W12
    .byte    Gs4
    .byte W12
    .byte    N18, As4
    .byte W18
    .byte    Gn4
    .byte W18
    .byte    N12, Fn4
    .byte W12
    .byte    N42, Ds4
    .byte W36
    .byte W06
    .byte    N06, Ds4, v036
    .byte W06
    .byte    N42, Cs4, v096
    .byte W42
    .byte    N06, Cs4, v036
    .byte W06
    .byte    N18, Cs4, v096
    .byte W18
    .byte    Fn4
    .byte W18
    .byte    N12, Ds4
    .byte W12
    .byte    N18, Dn4
    .byte W18
    .byte    An3
    .byte W18
    .byte    N54, Fn3
    .byte W48
    .byte W06
    .byte    N06, Fn3, v036
    .byte W06
    .byte    N42, Cn4, v096
    .byte W42
    .byte    N06, Cn4, v036
    .byte W06
    .byte    N02, Bn3, v096
    .byte W02
    .byte    N16, Cn4
    .byte W16
    .byte    N18, Cs4
    .byte W18
    .byte    N12, Ds4
    .byte W12
    .byte    N18, Fn4
    .byte W18
    .byte    Ds4
    .byte W18
    .byte    N12, Fn4
    .byte W12
    .byte    Gn4
    .byte W12
    .byte    N06, Gn4, v036
    .byte W06
    .byte    N12, Gs4, v096
    .byte W12
    .byte    N06, Gs4, v036
    .byte W06
    .byte    N12, As4, v096
    .byte W12
    .byte    N42, Cn5
    .byte W42
    .byte    N06, Cn5, v036
    .byte W06
    .byte    N02, Bn4, v096
    .byte W02
    .byte    N16, Cn5
    .byte W16
    .byte    N18, Ds5
    .byte W18
    .byte    N12, Cs5
    .byte W12
    .byte    N04, Cn5
    .byte W04
    .byte    Cs5
    .byte W04
    .byte    N76, Cn5
    .byte W44
    .byte W02
    .byte VOL  , 94
    .byte W06
    .byte    Ds4
    .byte W06
    .byte    Gs2
    .byte W06
    .byte    Cs1
    .byte W06
    .byte    FsM1
    .byte W06
    .byte    Gn6
    .byte    N06, Ds3
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, Cn4
    .byte W18
    .byte    N06
    .byte W06
    .byte    Cn4, v036
    .byte W06
    .byte    Cn4, v016
    .byte W06
    .byte    Ds3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte    N16, As3
    .byte W18
    .byte    N06
    .byte W06
    .byte    As3, v036
    .byte W06
    .byte    As3, v016
    .byte W06
    .byte PATT
    .word LABEL_080A630F
    .byte    N06, Gs3, v096
    .byte W06
    .byte    Gs3, v036
    .byte W06
    .byte    Gn3, v096
    .byte W09
    .byte    Gn3, v036
    .byte W06
    .byte    N03, Gn3, v016
    .byte W03
    .byte    N06, Ds3, v096
    .byte W06
    .byte    Ds3, v036
    .byte W06
    .byte    Ds3, v016
    .byte W06
    .byte TIE, Cn3, v096
    .byte W48
    .byte W18
    .byte VOL  , 94
    .byte W06
    .byte    Fn5
    .byte W06
    .byte    Cs5
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Ds4
    .byte W06
    .byte    As3
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    Bn2
    .byte W06
    .byte    Ds2
    .byte W06
    .byte    Gs1
    .byte W06
    .byte    Cn1
    .byte W06
    .byte EOT
    .byte VOL  , 28
    .byte W03
    .byte    Gn6
    .byte W09
    .byte PATT
    .word LABEL_080A636E
    .byte PATT
    .word LABEL_080A6390
    .byte    N06, As3, v096
    .byte W06
    .byte    As3, v036
    .byte W06
    .byte    N03, Bn3, v056
    .byte W03
    .byte TIE, Cn4, v096
    .byte W80
    .byte W01
    .byte W54
    .byte EOT
    .byte    N06, Cn4, v036
    .byte W06
    .byte    N18, Cn4, v096
    .byte W18
    .byte    N06, Cn4, v036
    .byte W06
    .byte    N12, Ds4, v096
    .byte W12
    .byte    N06, Ds4, v036
    .byte W06
    .byte    Fn4, v096
    .byte W06
    .byte    N12, Fn4, v036
    .byte W12
    .byte    Fn4, v016
    .byte W12
    .byte    N12
    .byte W60
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W12
    .byte VOL  , 103
    .byte W84
    .byte    N06, Ds3, v096
    .byte W06
    .byte    Fn3
    .byte W06
    .byte GOTO
    .word LABEL_080A62F3
    .byte FINE

    .align 2, 0

global_label SongHeader_080A651C
    .byte 5
    .byte 0
    .byte 0
    .byte 163
    .word 0x809F458
    .word Track_080A55CC
    .word Track_080A59C9
    .word Track_080A5D91
    .word Track_080A603D
    .word Track_080A62D6

    .end
