#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080A3960:
    .byte KEYSH, 0
LABEL_080A3962:
    .byte TEMPO, 60
    .byte VOICE, 0
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 2
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte    N12, Gs2
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N11, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
LABEL_080A39B2:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N06, Gs2, v072
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N06, Fs2, v060
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    Dn1, v080
    .byte    N02, Fs1, v040
    .byte    N10, Fs2, v072
    .byte W12
    .byte PEND
LABEL_080A3A02:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N11, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte PEND
LABEL_080A3A4D:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N06, Gs2, v072
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N06, Fs2, v060
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    Dn1, v100
    .byte    N02, Fs1, v040
    .byte    N10, Fs2, v072
    .byte W12
    .byte PEND
LABEL_080A3A9D:
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte    N12, Gs2
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N11, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A39B2
    .byte PATT
    .word LABEL_080A3A02
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N06, Gs2, v072
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N06, Fs2, v060
    .byte W06
    .byte    Fs1
    .byte    N06, Gn2, v052
    .byte W06
    .byte    Dn1, v080
    .byte    N02, Fs1, v040
    .byte    N10, Fs2, v072
    .byte W06
    .byte    N06, Dn1, v120
    .byte W06
    .byte PATT
    .word LABEL_080A3A9D
    .byte PATT
    .word LABEL_080A3A4D
    .byte PATT
    .word LABEL_080A3A02
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N06, Gs2, v072
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N06, Fs2, v060
    .byte W06
    .byte    Dn1
    .byte    N06, Gn2, v052
    .byte W06
    .byte    Dn1, v092
    .byte    N02, Fs1, v040
    .byte    N10, Fs2, v072
    .byte W06
    .byte    N06, Dn1, v127
    .byte W06
    .byte PATT
    .word LABEL_080A3A9D
    .byte PATT
    .word LABEL_080A3A4D
    .byte PATT
    .word LABEL_080A3A02
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N06, Gs2, v072
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N06, Fs2, v060
    .byte W06
    .byte    Gn2, v052
    .byte W06
    .byte    N02, Fs1, v040
    .byte    N10, Fs2, v072
    .byte W06
    .byte    N06, Dn1, v100
    .byte W06
    .byte    Bn0
    .byte    N10, Dn1, v112
    .byte    N24, Cs2, v052
    .byte W24
    .byte    N06, Bn0, v100
    .byte    N10, Dn1, v112
    .byte    N48, Cs2, v060
    .byte W24
    .byte    N06, Bn0, v112
    .byte W23
    .byte    N01, Dn1, v092
    .byte W01
    .byte    N05, Dn1, v112
    .byte W06
    .byte    N06, Dn1, v120
    .byte W06
    .byte    N12, Gn1
    .byte    N12, As1, v060
    .byte W12
    .byte PATT
    .word LABEL_080A3A9D
    .byte PATT
    .word LABEL_080A3A4D
    .byte PATT
    .word LABEL_080A3A02
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N06, Dn1, v112
    .byte    N02, Fs1, v040
    .byte W12
    .byte    N10, Dn1, v112
    .byte    N02, Fs1, v052
    .byte W12
    .byte    N06, Dn1, v112
    .byte    N02, Fs1, v040
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte    N12, Gs2
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N11, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte PATT
    .word LABEL_080A3A4D
    .byte PATT
    .word LABEL_080A3A02
    .byte    N06, Bn0, v112
    .byte    N72, Cs2, v060
    .byte W72
    .byte    N20, Gn1, v127
    .byte W24
    .byte    N06, Bn0, v112
    .byte    N48, Cs2, v060
    .byte    N12, Gs2
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N02, Fs1, v052
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v040
    .byte    N12, Gs2, v060
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v052
    .byte    N12, Gn2, v060
    .byte W12
    .byte    N11, Fs1, v040
    .byte    N12, Gn2, v060
    .byte W12
    .byte PATT
    .word LABEL_080A3A4D
    .byte GOTO
    .word LABEL_080A3962
    .byte FINE

Track_080A3D26:
    .byte KEYSH, 0
LABEL_080A3D28:
    .byte VOICE, 15
    .byte VOL  , 94
    .byte PAN  , 64
    .byte BENDR, 12
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte    N06, En2, v127
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    N12, En2, v100
    .byte W12
    .byte    N06, Fs2, v127
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N12, Fs2, v100
    .byte W12
    .byte    Gs2, v124
    .byte W12
    .byte    N06, En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v020
    .byte W06
    .byte    En2, v012
    .byte W06
    .byte    N23, An2, v127
    .byte W12
LABEL_080A3D5F:
    .byte W12
    .byte    N06, An2, v127
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    Bn2, v127
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N06, Cs3, v127
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    N12, Cs3, v100
    .byte W12
    .byte    N11, Ds3, v112
    .byte W12
    .byte    N12, En3, v100
    .byte W12
    .byte PEND
LABEL_080A3D85:
    .byte    N06, En2, v127
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    N12, En2, v100
    .byte W12
    .byte    N06, Fs2, v127
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N12, Fs2, v100
    .byte W12
    .byte    Gs2, v124
    .byte W12
    .byte    N06, En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v020
    .byte W06
    .byte    En2, v012
    .byte W06
    .byte    N23, An2, v127
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A3D5F
    .byte PATT
    .word LABEL_080A3D85
    .byte PATT
    .word LABEL_080A3D5F
    .byte PATT
    .word LABEL_080A3D85
    .byte PATT
    .word LABEL_080A3D5F
LABEL_080A3DC9:
    .byte    N06, Gs2, v127
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    N12, Gs2, v100
    .byte W12
    .byte    N06, As2, v127
    .byte W06
    .byte    As2, v040
    .byte W06
    .byte    N12, As2, v100
    .byte W12
    .byte    Bn2, v127
    .byte W12
    .byte    N06, Gs2, v100
    .byte W06
    .byte    Gs2, v060
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs2, v008
    .byte W06
    .byte    N24, Cs3, v127
    .byte W12
    .byte PEND
LABEL_080A3DF4:
    .byte W12
    .byte    N06, Cs3, v127
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    Ds3, v127
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    N12, Ds3, v120
    .byte W12
    .byte    N06, En3, v127
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    N12, En3, v108
    .byte W12
    .byte    N06, Cs3, v127
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    N12, Cs3, v100
    .byte W12
    .byte PEND
LABEL_080A3E1D:
    .byte    N06, Fs2, v127
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N12, Fs2, v100
    .byte W12
    .byte    N06, Gs2, v127
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    N12, Gs2, v100
    .byte W12
    .byte    An2, v124
    .byte W12
    .byte    N06, Fs2, v100
    .byte W06
    .byte    Fs2, v060
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    N01, Fs2, v012
    .byte W06
    .byte    N24, Bn2, v127
    .byte W12
    .byte PEND
LABEL_080A3E49:
    .byte W12
    .byte    N06, Bn2, v100
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    Cs3, v127
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    N12, Cs3, v100
    .byte W12
    .byte    N06, Ds3, v127
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    N12, Ds3, v100
    .byte W12
    .byte    N11, Bn2, v120
    .byte W12
    .byte    N12, An2, v108
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A3DC9
    .byte PATT
    .word LABEL_080A3DF4
    .byte PATT
    .word LABEL_080A3E1D
    .byte PATT
    .word LABEL_080A3E49
    .byte    N12, Bn2, v127
    .byte W12
    .byte    N06, Bn2, v040
    .byte W12
    .byte    N12, Bn2, v127
    .byte W12
    .byte    N06, Bn2, v040
    .byte W36
    .byte    N24, As2, v127
    .byte W24
LABEL_080A3E97:
    .byte    N11, An2, v127
    .byte W12
    .byte    N12, An2, v100
    .byte W12
    .byte    N06, An2, v040
    .byte W18
    .byte    An2, v100
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    An3, v127
    .byte W06
    .byte    N11, An2, v100
    .byte W24
    .byte    N06
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte PEND
    .byte    N11, Gs2, v127
    .byte W12
    .byte    N12, Gs2, v100
    .byte W12
    .byte    N06, Gs2, v040
    .byte W18
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs3, v127
    .byte W06
    .byte    N11, Gs2, v100
    .byte W24
    .byte    N06
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    N11, Fs2, v127
    .byte W12
    .byte    N12, Fs2, v100
    .byte W12
    .byte    N06, Fs2, v040
    .byte W18
    .byte    Bn2, v100
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    Bn2, v127
    .byte W06
    .byte    N11, Bn2, v100
    .byte W12
    .byte    N06, Cs3
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    Bn2, v100
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    N11, En2, v127
    .byte W12
    .byte    N12, En2, v100
    .byte W12
    .byte    N06, En2, v040
    .byte W24
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    N11, Fs2, v040
    .byte W06
    .byte    N06, Gs2, v112
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    En2, v127
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte PATT
    .word LABEL_080A3E97
    .byte    N11, Gs2, v127
    .byte W12
    .byte    N12, Gs2, v100
    .byte W12
    .byte    N06, Gs2, v040
    .byte W18
    .byte    Cs3, v100
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    Cs4, v127
    .byte W06
    .byte    N11, Cs3, v100
    .byte W24
    .byte    N06
    .byte W06
    .byte    Cs3, v040
    .byte W06
    .byte    N11, Fs2, v127
    .byte W12
    .byte    N12, Fs2, v100
    .byte W12
    .byte    N06, Fs2, v040
    .byte W18
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v127
    .byte W06
    .byte    N11, Fs2, v100
    .byte W12
    .byte    N06, Gs2
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    An2, v100
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N66, Bn2, v127
    .byte W66
    .byte    N06, Bn2, v040
    .byte W06
    .byte BEND , 64
    .byte    N24, Bn3, v100
    .byte W10
    .byte BEND , 63
    .byte W02
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
    .byte    Dn1
    .byte W02
    .byte    En3
    .byte    N11, En2, v127
    .byte W12
    .byte    N12, En2, v100
    .byte W12
    .byte    N06, En2, v040
    .byte W18
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En3, v127
    .byte W06
    .byte    N11, En2, v100
    .byte W24
    .byte    N06
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v127
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    Fs2, v127
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Fs2, v100
    .byte W06
    .byte    Fs2, v040
    .byte W06
    .byte    Gs2, v127
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v040
    .byte W06
    .byte    En2, v127
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte    En2, v100
    .byte W06
    .byte    En2, v040
    .byte W06
    .byte GOTO
    .word LABEL_080A3D28
    .byte FINE

Track_080A3FD9:
    .byte KEYSH, 0
LABEL_080A3FDB:
    .byte VOICE, 6
    .byte W01
    .byte VOL  , 103
    .byte W01
    .byte PAN  , 64
    .byte W01
    .byte LFOS , 28
    .byte W01
    .byte LFODL, 14
    .byte W01
    .byte BENDR, 12
    .byte W01
    .byte MODT , 0
    .byte W01
    .byte MOD  , 4
    .byte W01
    .byte W01
    .byte XCMD , xIECV, 40
    .byte W01
    .byte W01
    .byte    AnM2, v003
    .byte W01
    .byte    N06, En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    N30, Bn3, v100
    .byte W30
    .byte    N06, Bn3, v060
    .byte W06
    .byte    N18, En4, v100
    .byte W12
LABEL_080A401B:
    .byte W06
    .byte    N06, En4, v060
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    N18, Cs4, v100
    .byte W18
    .byte    N06, Cs4, v060
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte PEND
    .byte    En4, v040
    .byte W12
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    N18, Ds4, v100
    .byte W18
    .byte    N06, Ds4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte TIE, Cs4, v100
    .byte W12
    .byte W90
    .byte EOT
    .byte    N06, Cs4, v060
    .byte W06
    .byte W12
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    N30, Bn3, v100
    .byte W30
    .byte    N06, Bn3, v060
    .byte W06
    .byte    N18, En4, v100
    .byte W12
    .byte PATT
    .word LABEL_080A401B
    .byte    N06, En4, v040
    .byte W12
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    N12, Gs4, v100
    .byte W12
    .byte    N06, Fs4
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte TIE, Cs4, v100
    .byte W12
    .byte W90
    .byte EOT
    .byte    N06, Cs4, v060
    .byte W06
    .byte W24
    .byte    N18, Ds4, v100
    .byte W18
    .byte    N06, Ds4, v060
    .byte W06
    .byte    N18, Cs4, v100
    .byte W18
    .byte    N06, Cs4, v060
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    N18, Bn3, v100
    .byte W12
    .byte W06
    .byte    N06, Bn3, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    N54, Cs4, v100
    .byte W54
    .byte    N06, Cs4, v060
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    An3
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v060
    .byte W06
    .byte    N30, An3, v100
    .byte W30
    .byte    N06, An3, v060
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    An3
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v060
    .byte W06
    .byte    N18, En3, v100
    .byte W18
    .byte    N06, En3, v060
    .byte W06
    .byte    N18, Fs3, v100
    .byte W18
    .byte    N06, Fs3, v060
    .byte W06
    .byte W24
    .byte    N18, Ds4, v100
    .byte W18
    .byte    N06, Ds4, v060
    .byte W06
    .byte    N18, Cs4, v100
    .byte W18
    .byte    N06, Cs4, v060
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    N18, Fs4, v100
    .byte W12
    .byte W06
    .byte    N06, Fs4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    N36, En4, v100
    .byte W36
    .byte    N06, En4, v060
    .byte W06
    .byte    N06
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gs4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    N04, En4, v100
    .byte W06
    .byte    N36
    .byte W36
    .byte    N06, En4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    Fs4
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Gs4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    N36, Cs4, v060
    .byte W06
    .byte    N22, En4, v100
    .byte W24
    .byte    N66, Fs4
    .byte W24
    .byte W42
    .byte    N06, Fs4, v060
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
LABEL_080A41DD:
    .byte    N12, Gs4, v100
    .byte W12
    .byte    N06, Fs4
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    N04, En4, v100
    .byte W06
    .byte    N24
    .byte W24
    .byte    N06, En4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte PEND
    .byte    N12, Gs4, v100
    .byte W12
    .byte    N06, Fs4
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    N04, En4, v100
    .byte W06
    .byte    N24
    .byte W24
    .byte    N06, En4, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    N18, En4, v100
    .byte W18
    .byte    N06, En4, v060
    .byte W06
    .byte    N18, Cs4, v100
    .byte W18
    .byte    N06, Cs4, v060
    .byte W06
    .byte    N18, En4, v100
    .byte W18
    .byte    N06, En4, v060
    .byte W06
    .byte    N18, Fs4, v100
    .byte W18
    .byte    N06, Fs4, v060
    .byte W06
    .byte    N12, Ds4, v100
    .byte W12
    .byte    N06, Cs4
    .byte W06
    .byte    N24, Bn3
    .byte W24
    .byte    N06, Bn3, v060
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte PATT
    .word LABEL_080A41DD
    .byte    N12, Gs4, v100
    .byte W12
    .byte    N06, Fs4
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    N18, Bn4
    .byte W18
    .byte    N06, Gs4
    .byte W06
    .byte    Gs4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    Gs4, v100
    .byte W06
    .byte    Gs4, v060
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v060
    .byte W06
    .byte    N04, En4, v100
    .byte W06
    .byte    N48
    .byte W48
    .byte    N06, En4, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    N18, En4, v100
    .byte W18
    .byte    N06, En4, v060
    .byte W06
    .byte    N18, Ds4, v100
    .byte W18
    .byte    N06, Ds4, v060
    .byte W06
    .byte    N18, Cs4, v100
    .byte W18
    .byte    N06, Cs4, v060
    .byte W06
    .byte    N18, Ds4, v100
    .byte W18
    .byte    N06, Ds4, v060
    .byte W06
    .byte TIE, En4, v100
    .byte W96
    .byte W06
    .byte VOL  , 98
    .byte W06
    .byte    Gs5
    .byte W06
    .byte    Dn5
    .byte W06
    .byte    Gs4
    .byte W06
    .byte    Dn4
    .byte W06
    .byte    Gs3
    .byte W06
    .byte    Ds3
    .byte W06
    .byte    Gs2
    .byte W06
    .byte    Ds2
    .byte W06
    .byte    An1
    .byte W06
    .byte    Ds1
    .byte W06
    .byte    An0
    .byte W06
    .byte    Ds0
    .byte W06
    .byte    FsM1
    .byte W06
    .byte EOT
    .byte VOL  , 13
    .byte W06
    .byte GOTO
    .word LABEL_080A3FDB
    .byte FINE

Track_080A4305:
    .byte KEYSH, 0
LABEL_080A4307:
    .byte VOICE, 1
    .byte VOL  , 75
    .byte PAN  , 64
    .byte LFOS , 28
    .byte LFODL, 14
    .byte BENDR, 12
    .byte MODT , 0
    .byte MOD  , 4
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte    N78, Gs3, v080
    .byte W78
    .byte    N06, Gs3, v040
    .byte W06
    .byte    N66, An3, v080
    .byte W12
LABEL_080A4328:
    .byte W54
    .byte    N06, An3, v040
    .byte W06
    .byte    An3, v080
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    Bn3, v080
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    An3, v080
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte PEND
LABEL_080A4340:
    .byte    N78, Gs3, v080
    .byte W78
    .byte    N06, Gs3, v040
    .byte W06
    .byte    N54, An3, v080
    .byte W12
    .byte PEND
LABEL_080A434D:
    .byte W42
    .byte    N06, An3, v040
    .byte W06
    .byte    Bn3, v080
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Cs4, v080
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Ds4, v080
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Cs4, v080
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte PEND
    .byte    N78, Gs3, v080
    .byte W78
    .byte    N06, Gs3, v040
    .byte W06
    .byte    N66, An3, v080
    .byte W12
    .byte PATT
    .word LABEL_080A4328
    .byte PATT
    .word LABEL_080A4340
    .byte PATT
    .word LABEL_080A434D
    .byte    N18, Bn3, v080
    .byte W18
    .byte    N06, Bn3, v040
    .byte W06
    .byte    N18, Bn3, v092
    .byte W18
    .byte    N06, Bn3, v052
    .byte W06
    .byte    N18, An3, v092
    .byte W18
    .byte    N06, An3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    N18, Gs3, v092
    .byte W12
    .byte W06
    .byte    N06, Gs3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    N54, Gs3, v092
    .byte W54
    .byte    N06, Gs3, v052
    .byte W18
    .byte PAN  , 0
    .byte    N06, An2, v127
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N12, An2, v100
    .byte W12
    .byte PAN  , 127
    .byte    N06, Bn2, v127
    .byte W06
    .byte    Bn2, v040
    .byte W06
    .byte    N12, Bn2, v100
    .byte W12
    .byte PAN  , 0
    .byte    N12, Cs3, v124
    .byte W12
    .byte PAN  , 127
    .byte    N06, An2, v100
    .byte W06
    .byte    An2, v060
    .byte W06
    .byte    An2, v040
    .byte W06
    .byte    N01, An2, v012
    .byte W06
    .byte PAN  , 0
    .byte    N12, Cs3, v127
    .byte W12
    .byte PAN  , 0
    .byte    N06, Ds3
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    N12, Ds3, v100
    .byte W12
    .byte PAN  , 127
    .byte    N06, En3, v127
    .byte W06
    .byte    En3, v040
    .byte W06
    .byte    N12, En3, v100
    .byte W12
    .byte PAN  , 0
    .byte    N12, Fs3, v124
    .byte W12
    .byte PAN  , 127
    .byte    N06, Ds3, v100
    .byte W06
    .byte    Ds3, v060
    .byte W06
    .byte    Ds3, v040
    .byte W06
    .byte    N01, Ds3, v012
    .byte W06
    .byte PAN  , 64
    .byte    N12, Cs3, v127
    .byte W12
    .byte W18
    .byte    N06, Bn3, v040
    .byte W06
    .byte    N18, Bn3, v092
    .byte W18
    .byte    N06, Bn3, v052
    .byte W06
    .byte    N18, An3, v092
    .byte W18
    .byte    N06, An3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    N18, Gs3, v092
    .byte W12
    .byte W06
    .byte    N06, Gs3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    N42, Gs3, v092
    .byte W42
    .byte    N06, Gs3, v052
    .byte W18
    .byte    En4, v092
    .byte W06
    .byte    En4, v052
    .byte W06
    .byte    Ds4, v092
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    Ds4, v092
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    N04, Cs4, v092
    .byte W06
    .byte    N36
    .byte W36
    .byte    N06, Cs4, v052
    .byte W06
    .byte    Cs4, v092
    .byte W06
    .byte    Ds4
    .byte W06
    .byte    Cs4
    .byte W06
    .byte    Cs4, v052
    .byte W06
    .byte    Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    An3, v092
    .byte W06
    .byte    An3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    N36, Gs3, v052
    .byte W06
    .byte    N22, Bn3, v092
    .byte W24
    .byte    N66
    .byte W24
    .byte W42
    .byte    N06, Bn3, v052
    .byte W18
    .byte    An3, v092
    .byte W06
    .byte    An3, v052
    .byte W06
    .byte    Cs4, v092
    .byte W06
    .byte    Cs4, v052
    .byte W06
    .byte    Cs4, v092
    .byte W06
    .byte    Cs4, v052
    .byte W06
    .byte    N12, En4, v092
    .byte W12
    .byte    N06, Ds4
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    Ds4, v092
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    Cs4, v092
    .byte W06
    .byte    N24
    .byte W24
    .byte    N06, Cs4, v052
    .byte W06
    .byte    Cs4, v092
    .byte W06
    .byte    Cs4, v052
    .byte W06
    .byte    Ds4, v092
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    N12, Cs4, v092
    .byte W12
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    N24
    .byte W24
    .byte    N06, Gs3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    An3, v092
    .byte W06
    .byte    An3, v052
    .byte W06
    .byte W12
    .byte PAN  , 0
    .byte    N06, Fs3, v100
    .byte W06
    .byte    Fs3, v060
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte    Fs3, v100
    .byte W06
    .byte    Fs3, v060
    .byte W18
    .byte PAN  , 127
    .byte    N06, Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte PAN  , 64
    .byte    N06, Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte W12
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v060
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v060
    .byte W18
    .byte PAN  , 127
    .byte    N06, En4, v100
    .byte W06
    .byte    En4, v060
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v060
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte PAN  , 64
    .byte    N12, En4, v092
    .byte W12
    .byte    N06, Ds4
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    Ds4, v092
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    Cs4, v092
    .byte W06
    .byte    N24
    .byte W24
    .byte    N06, Cs4, v052
    .byte W06
    .byte    Cs4, v092
    .byte W06
    .byte    Cs4, v052
    .byte W06
    .byte    Ds4, v092
    .byte W06
    .byte    Ds4, v052
    .byte W06
    .byte    N12, Cs4, v092
    .byte W12
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    Gs3, v052
    .byte W06
    .byte    Gs3, v092
    .byte W06
    .byte    N24
    .byte W24
    .byte    N06, Gs3, v052
    .byte W06
    .byte    An3, v092
    .byte W06
    .byte    An3, v052
    .byte W06
    .byte    Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    N66, Cs4, v092
    .byte W66
    .byte    N06, Cs4, v052
    .byte W06
    .byte    An3, v092
    .byte W06
    .byte    An3, v052
    .byte W06
    .byte    Bn3, v092
    .byte W06
    .byte    Bn3, v052
    .byte W06
    .byte    N18, Cs4, v092
    .byte W18
    .byte    N06, Cs4, v052
    .byte W06
    .byte    N18, Bn3, v092
    .byte W18
    .byte    N06, Bn3, v052
    .byte W06
    .byte    N18, An3, v092
    .byte W18
    .byte    N06, An3, v052
    .byte W06
    .byte    N18, Bn3, v092
    .byte W18
    .byte    N06, Bn3, v052
    .byte W06
    .byte TIE, Gs3, v092
    .byte W96
    .byte W06
    .byte VOL  , 70
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    Cs3
    .byte W06
    .byte    Gs2
    .byte W06
    .byte    Ds2
    .byte W06
    .byte    Bn1
    .byte W06
    .byte    Fs1
    .byte W06
    .byte    Cs1
    .byte W06
    .byte    An0
    .byte W06
    .byte    En0
    .byte W06
    .byte    BnM1
    .byte W06
    .byte    FsM1
    .byte W06
    .byte    DnM1
    .byte W06
    .byte    AnM2
    .byte W06
    .byte EOT
    .byte VOL  , 4
    .byte W06
    .byte GOTO
    .word LABEL_080A4307
    .byte FINE

Track_080A4600:
    .byte KEYSH, 0
LABEL_080A4602:
    .byte VOICE, 18
    .byte W03
    .byte VOL  , 75
    .byte W03
    .byte PAN  , 64
    .byte W03
    .byte BENDR, 12
    .byte W03
    .byte    N12, Cn3, v100
    .byte W24
    .byte    Cs3
    .byte W24
    .byte    Cn3
    .byte W24
    .byte    Cs3
    .byte W12
    .byte PEND
LABEL_080A4619:
    .byte W12
    .byte    N12, Dn3, v100
    .byte W24
    .byte    Ds3
    .byte W24
    .byte    Dn3
    .byte W24
    .byte    Ds3
    .byte W12
    .byte PEND
LABEL_080A4625:
    .byte W12
    .byte    N12, Cn3, v100
    .byte W24
    .byte    Cs3
    .byte W24
    .byte    Cn3
    .byte W24
    .byte    Cs3
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A4619
    .byte PATT
    .word LABEL_080A4625
    .byte PATT
    .word LABEL_080A4619
    .byte PATT
    .word LABEL_080A4625
    .byte PATT
    .word LABEL_080A4619
LABEL_080A464A:
    .byte W12
    .byte    N12, En3, v100
    .byte W24
    .byte    Fn3
    .byte W24
    .byte    En3
    .byte W24
    .byte    Fn3
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A4625
    .byte PATT
    .word LABEL_080A4619
    .byte PATT
    .word LABEL_080A464A
    .byte PATT
    .word LABEL_080A464A
    .byte PATT
    .word LABEL_080A4625
    .byte PATT
    .word LABEL_080A4619
    .byte PATT
    .word LABEL_080A4619
    .byte    N12, Fn3, v100
    .byte W24
    .byte    En3
    .byte W23
    .byte    N01, Fs3, v004
    .byte W01
    .byte VOICE, 20
    .byte W12
    .byte PAN  , 64
    .byte W12
    .byte    N04, Cs3, v040
    .byte W04
    .byte    Ds3
    .byte W04
    .byte    En3
    .byte W04
    .byte    Fs3
    .byte W04
    .byte    Gs3, v052
    .byte W04
    .byte    An3
    .byte W04
    .byte TIE, Bn3, v072
    .byte W96
    .byte W72
    .byte EOT
    .byte    N12, Bn3, v052
    .byte W12
    .byte    N06, An3, v072
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    N36, Cs4
    .byte W36
    .byte    N12, Cs4, v052
    .byte W12
    .byte    N36, Ds4, v072
    .byte W36
    .byte    N12, Ds4, v052
    .byte W12
    .byte    N48, Bn3, v072
    .byte W48
    .byte    N12, Bn3, v040
    .byte W12
    .byte    Bn3, v020
    .byte W12
    .byte    N04, Cs3, v040
    .byte W04
    .byte    Ds3
    .byte W04
    .byte    En3
    .byte W04
    .byte    Fs3
    .byte W04
    .byte    Gs3, v052
    .byte W04
    .byte    An3
    .byte W04
    .byte TIE, Bn3, v072
    .byte W96
    .byte W72
    .byte EOT
    .byte    N12, Bn3, v052
    .byte W12
    .byte    N06, An3, v072
    .byte W06
    .byte    Bn3
    .byte W06
    .byte TIE, Cs4
    .byte W96
    .byte W04
    .byte VOL  , 69
    .byte W04
    .byte    En3
    .byte W04
    .byte    As2
    .byte W04
    .byte    Ds2
    .byte W04
    .byte    As1
    .byte W04
    .byte    En1
    .byte W04
    .byte    As0
    .byte W04
    .byte    En0
    .byte W04
    .byte    AsM1
    .byte W04
    .byte    FnM1
    .byte W04
    .byte    BnM2
    .byte W04
    .byte EOT
    .byte W48
    .byte PATT
    .word LABEL_080A4602
    .byte PATT
    .word LABEL_080A4625
    .byte GOTO
    .word LABEL_080A4602
    .byte FINE

    .align 2, 0

global_label SongHeader_080A4710
    .byte 5
    .byte 0
    .byte 0
    .byte 163
    .word 0x809F0D4
    .word Track_080A3960
    .word Track_080A3D26
    .word Track_080A3FD9
    .word Track_080A4305
    .word Track_080A4600

    .end
