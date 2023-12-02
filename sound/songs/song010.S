#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Track_080A8E18:
    .byte KEYSH, 0
LABEL_080A8E1A:
    .byte TEMPO, 66
    .byte VOICE, 0
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 2
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W36
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    N12, Fs1, v092
    .byte W12
LABEL_080A8E42:
    .byte    N02, Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    Fs1, v040
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N12, Fs1, v052
    .byte W12
    .byte PEND
LABEL_080A8E60:
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    N12, Fs1, v052
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8E60
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8E60
    .byte    N02, Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    Fs1, v040
    .byte W12
    .byte    Fs1, v060
    .byte W12
    .byte    N36, Bn1, v072
    .byte W24
    .byte    N06, Bn0, v092
    .byte W12
LABEL_080A8EAE:
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W36
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    N12, Fs1, v052
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8E60
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8E60
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8E60
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8EAE
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8E60
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8E60
    .byte PATT
    .word LABEL_080A8E42
    .byte PATT
    .word LABEL_080A8E60
    .byte    N02, Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v064
    .byte W12
    .byte    Fs1, v040
    .byte W12
    .byte    N48, Bn1, v072
    .byte W36
    .byte    N06, Bn0, v092
    .byte W12
    .byte    N06
    .byte    N36, Cs2, v060
    .byte W18
    .byte    N06, Bn0, v092
    .byte W18
    .byte    Bn0, v072
    .byte    N02, Fs1, v040
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v064
    .byte W12
    .byte    N12, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W12
    .byte    Fs1, v052
    .byte W06
    .byte    N06, Bn0, v092
    .byte W06
    .byte    N02, Fs1, v060
    .byte W12
    .byte    N06, Bn0, v072
    .byte    N02, Fs1, v040
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    N10, Dn1, v120
    .byte    N02, Fs1, v064
    .byte W12
    .byte    N12, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v060
    .byte W12
    .byte    Fs1, v052
    .byte W12
    .byte    Fs1, v060
    .byte W12
    .byte    N06, Bn0, v072
    .byte    N02, Fs1, v040
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N02, Fs1, v064
    .byte W12
    .byte    Fs1, v052
    .byte W06
    .byte    N06, Bn0, v092
    .byte W06
    .byte    N02, Fs1, v064
    .byte W12
    .byte    N06, Bn0, v072
    .byte    N12, Fs1, v052
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N48, Cs2, v072
    .byte W48
    .byte    Bn1, v060
    .byte W48
    .byte GOTO
    .word LABEL_080A8E1A
    .byte FINE

Track_080A8FB4:
    .byte KEYSH, 0
LABEL_080A8FB6:
    .byte VOICE, 15
    .byte VOL  , 113
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte    N11, Cn3, v100
    .byte W12
    .byte    Gn2
    .byte W12
    .byte    As2
    .byte W12
    .byte    Cn3
    .byte W12
    .byte    N06, Cn3, v060
    .byte W36
    .byte    N12, As2, v100
    .byte W12
LABEL_080A8FDD:
    .byte    N11, Cn3, v100
    .byte W12
    .byte    Gn2
    .byte W12
    .byte    As2
    .byte W12
    .byte    Cn3
    .byte W12
    .byte    N06, Cn3, v060
    .byte W24
    .byte    N12, Cn3, v100
    .byte W12
    .byte    N06, Cn3, v060
    .byte W12
    .byte PEND
LABEL_080A8FF4:
    .byte    N11, Cn3, v100
    .byte W12
    .byte    Gn2
    .byte W12
    .byte    As2
    .byte W12
    .byte    Cn3
    .byte W12
    .byte    N06, Cn3, v060
    .byte W36
    .byte    N12, As2, v100
    .byte W12
    .byte PEND
LABEL_080A9007:
    .byte    N11, Cn3, v100
    .byte W12
    .byte    Gn2
    .byte W12
    .byte    As2
    .byte W12
    .byte    Cn3
    .byte W12
    .byte    N06, Cn3, v060
    .byte W12
    .byte    N30, Ds3, v100
    .byte W30
    .byte    N06, Ds3, v060
    .byte W06
    .byte PEND
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A8FDD
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A9007
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A8FDD
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A9007
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A8FDD
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A9007
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A8FDD
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A9007
    .byte PATT
    .word LABEL_080A8FF4
    .byte PATT
    .word LABEL_080A8FDD
    .byte PATT
    .word LABEL_080A8FF4
    .byte    N11, Cn3, v100
    .byte W12
    .byte    Gn2
    .byte W12
    .byte    As2
    .byte W12
    .byte    Cn3
    .byte W12
    .byte    N06, Cn3, v060
    .byte W24
    .byte    N30, Cn3, v100
    .byte W12
    .byte    N06, Bn2, v060
    .byte W12
    .byte    As2, v100
    .byte W06
    .byte    As2, v060
    .byte W06
    .byte    As2, v032
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v060
    .byte W06
    .byte    As2, v032
    .byte W06
    .byte    As2, v100
    .byte W06
    .byte    As2, v060
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Ds3, v060
    .byte W06
    .byte    Ds3, v032
    .byte W06
    .byte    Ds3, v100
    .byte W06
    .byte    Ds3, v060
    .byte W06
    .byte    Ds3, v032
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    Gn2, v060
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v060
    .byte W06
    .byte    Gs2, v032
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v060
    .byte W06
    .byte    Gs2, v032
    .byte W06
    .byte    Gs2, v100
    .byte W06
    .byte    Gs2, v060
    .byte W06
    .byte    Cs2, v100
    .byte W06
    .byte    Cs2, v060
    .byte W06
    .byte    Cs2, v032
    .byte W06
    .byte    Cs3, v100
    .byte W06
    .byte    Cs3, v060
    .byte W06
    .byte    Cs3, v032
    .byte W06
    .byte    Cs2, v100
    .byte W06
    .byte    Cs2, v060
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v060
    .byte W06
    .byte    Dn2, v032
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v060
    .byte W06
    .byte    Dn2, v032
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v060
    .byte W06
    .byte    Dn2, v100
    .byte W06
    .byte    Dn2, v060
    .byte W06
    .byte    Dn2, v032
    .byte W06
    .byte    Ds2, v100
    .byte W06
    .byte    Ds2, v060
    .byte W06
    .byte    Ds2, v032
    .byte W06
    .byte    Fn2, v100
    .byte W06
    .byte    Fn2, v060
    .byte W06
    .byte    Gn2, v100
    .byte W06
    .byte    Gn2, v060
    .byte W90
    .byte GOTO
    .word LABEL_080A8FB6
    .byte FINE

Track_080A912F:
    .byte KEYSH, 0
LABEL_080A9131:
    .byte VOICE, 31
    .byte VOL  , 94
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte    N32, Cn3, v127
    .byte W36
    .byte    N06
    .byte W06
    .byte    Cn3, v080
    .byte W06
    .byte    Cn3, v052
    .byte W06
    .byte    Cn3, v032
    .byte W06
    .byte    Cn3, v012
    .byte W36
LABEL_080A9158:
    .byte W24
    .byte    N06, Cn3, v127
    .byte W06
    .byte    Cn3, v080
    .byte W06
    .byte    Cn3, v060
    .byte W06
    .byte    Cn3, v032
    .byte W06
    .byte    Cn3, v012
    .byte W12
    .byte    Cn3, v127
    .byte W06
    .byte    Cn3, v080
    .byte W06
    .byte    Cn3, v052
    .byte W06
    .byte    Cn3, v032
    .byte W06
    .byte    Cn3, v012
    .byte W12
    .byte PEND
LABEL_080A9179:
    .byte VOICE, 32
    .byte    N32, Cn3, v127
    .byte W36
    .byte    N06
    .byte W06
    .byte    Cn3, v080
    .byte W06
    .byte    Cn3, v052
    .byte W06
    .byte    Cn3, v032
    .byte W06
    .byte    Cn3, v012
    .byte W36
    .byte PEND
LABEL_080A918E:
    .byte W24
    .byte    N06, Cn3, v127
    .byte W06
    .byte    Cn3, v080
    .byte W06
    .byte    Cn3, v052
    .byte W06
    .byte    Cn3, v032
    .byte W06
    .byte    Cn3, v012
    .byte W12
    .byte    Cn3, v127
    .byte W06
    .byte    Cn3, v080
    .byte W06
    .byte    Cn3, v052
    .byte W06
    .byte    Cn3, v032
    .byte W06
    .byte    Cn3, v012
    .byte W12
    .byte PEND
LABEL_080A91AF:
    .byte VOICE, 31
    .byte    N32, Cn3, v127
    .byte W36
    .byte    N06
    .byte W06
    .byte    Cn3, v080
    .byte W06
    .byte    Cn3, v052
    .byte W06
    .byte    Cn3, v032
    .byte W06
    .byte    Cn3, v012
    .byte W36
    .byte PEND
    .byte PATT
    .word LABEL_080A9158
    .byte PATT
    .word LABEL_080A9179
    .byte PATT
    .word LABEL_080A918E
    .byte PATT
    .word LABEL_080A91AF
    .byte PATT
    .word LABEL_080A9158
    .byte PATT
    .word LABEL_080A9179
    .byte PATT
    .word LABEL_080A918E
    .byte PATT
    .word LABEL_080A91AF
    .byte PATT
    .word LABEL_080A9158
    .byte PATT
    .word LABEL_080A9179
    .byte PATT
    .word LABEL_080A918E
    .byte PATT
    .word LABEL_080A91AF
    .byte PATT
    .word LABEL_080A9158
    .byte PATT
    .word LABEL_080A9179
    .byte PATT
    .word LABEL_080A918E
    .byte PATT
    .word LABEL_080A91AF
    .byte PATT
    .word LABEL_080A9158
    .byte PATT
    .word LABEL_080A9179
    .byte PATT
    .word LABEL_080A918E
    .byte VOICE, 21
    .byte    N48, Cn4, v040
    .byte W48
    .byte    As3
    .byte W48
    .byte    Gn3
    .byte W48
    .byte    Ds3
    .byte W48
    .byte    Dn3
    .byte W48
    .byte    Fn3, v032
    .byte W48
    .byte    N12, Gn3, v040
    .byte W12
    .byte    Gn3, v032
    .byte W12
    .byte    Gn3, v020
    .byte W12
    .byte    Gn3, v012
    .byte W12
    .byte    Fn3, v040
    .byte    N12, Gs3
    .byte W12
    .byte    Ds3
    .byte    N12, Gn3
    .byte W12
    .byte    Dn3
    .byte    N12, Fn3
    .byte W12
    .byte    N11, Bn2
    .byte    N11, Dn3
    .byte W12
    .byte GOTO
    .word LABEL_080A9131
    .byte FINE

Track_080A9259:
    .byte KEYSH, 0
LABEL_080A925B:
    .byte VOICE, 2
    .byte VOL  , 37
    .byte PAN  , 0
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 4
    .byte MODT , 0
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W10
    .byte    N36, Cn4, v100
    .byte W36
    .byte TIE, Gn4
    .byte W48
    .byte W02
    .byte W80
    .byte W02
    .byte EOT
    .byte    N12, Fs4
    .byte W12
    .byte    Gn4
    .byte W02
    .byte W10
    .byte TIE, An4
    .byte W84
    .byte W02
    .byte W56
    .byte W02
    .byte EOT
    .byte    N48, Fs4
    .byte W36
    .byte W02
LABEL_080A9295:
    .byte W10
    .byte    N96, Gn4, v100
    .byte W84
    .byte W02
    .byte PEND
    .byte W10
    .byte    N72, Ds4
    .byte W72
    .byte    N12, Dn4
    .byte W12
    .byte    Ds4
    .byte W02
    .byte W10
    .byte TIE, Dn4
    .byte W84
    .byte W02
    .byte W64
    .byte VOL  , 33
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
    .byte W02
    .byte W04
    .byte    EnM2
    .byte W06
    .byte EOT
    .byte VOL  , 37
    .byte    N36, Cn4
    .byte W36
    .byte TIE, Gn4
    .byte W48
    .byte W02
    .byte W80
    .byte W02
    .byte EOT
    .byte    N12, Fs4
    .byte W12
    .byte    Gn4
    .byte W02
    .byte W10
    .byte    N96, An4
    .byte W84
    .byte W02
    .byte W10
    .byte    N48, Dn5
    .byte W48
    .byte    Fs4
    .byte W36
    .byte W02
    .byte PATT
    .word LABEL_080A9295
    .byte W10
    .byte    N48, Ds4, v100
    .byte W48
    .byte    Gn4
    .byte W36
    .byte W02
    .byte W10
    .byte TIE, Fs4
    .byte W84
    .byte W02
    .byte W30
    .byte VOL  , 33
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
    .byte    EnM2
    .byte W06
    .byte EOT
    .byte VOL  , 37
    .byte    N05, Gn3
    .byte W06
    .byte    An3
    .byte W06
    .byte    As3
    .byte W06
    .byte    Cn4
    .byte W06
    .byte    N06, Gs3
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gs3, v020
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v040
    .byte W06
    .byte    Gs3, v020
    .byte W06
    .byte    Gs3, v100
    .byte W06
    .byte    Gs3, v032
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Cs4, v020
    .byte W12
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Cs4, v020
    .byte W12
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Gn4, v020
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Gn4, v020
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v032
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Bn3, v020
    .byte W12
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Bn3, v020
    .byte W12
    .byte    An3, v100
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    An3, v020
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    An3, v020
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v032
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    An3, v020
    .byte W06
    .byte    An3, v012
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    An3, v020
    .byte W06
    .byte    An3, v012
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Bn3, v020
    .byte W36
    .byte    N12, Fn4, v100
    .byte W12
    .byte    Ds4
    .byte W12
    .byte    Dn4
    .byte W12
    .byte    Bn3
    .byte W12
    .byte GOTO
    .word LABEL_080A925B
    .byte FINE

Track_080A93A4:
    .byte KEYSH, 0
LABEL_080A93A6:
    .byte VOICE, 5
    .byte VOL  , 66
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 31
    .byte LFODL, 14
    .byte MOD  , 5
    .byte MODT , 0
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte W96
    .byte    N36, Cn4, v100
    .byte W36
    .byte TIE, Gn4
    .byte W60
    .byte W72
    .byte EOT
    .byte    N12, Fs4
    .byte W12
    .byte    Gn4
    .byte W12
    .byte TIE, An4
    .byte W96
    .byte W48
    .byte EOT
    .byte    N48, Fs4
    .byte W48
    .byte    N96, Gn4
    .byte W96
    .byte    N72, Ds4
    .byte W72
    .byte    N12, Dn4
    .byte W12
    .byte    Ds4
    .byte W12
    .byte TIE, Dn4
    .byte W96
    .byte W54
    .byte VOL  , 58
    .byte W06
    .byte    Dn2
    .byte W06
    .byte    Fn1
    .byte W06
    .byte    An0
    .byte W06
    .byte    Cs0
    .byte W06
    .byte    FnM1
    .byte W06
    .byte    GsM2
    .byte W06
    .byte EOT
    .byte VOL  , 66
    .byte    N36, Cn4
    .byte W36
    .byte TIE, Gn4
    .byte W60
    .byte W72
    .byte EOT
    .byte    N12, Fs4
    .byte W12
    .byte    Gn4
    .byte W12
    .byte    N96, An4
    .byte W96
    .byte    N48, Dn5
    .byte W48
    .byte    Fs4
    .byte W48
    .byte    N96, Gn4
    .byte W96
    .byte    N48, Ds4
    .byte W48
    .byte    Gn4
    .byte W48
    .byte TIE, Fs4
    .byte W96
    .byte W30
    .byte VOL  , 58
    .byte W06
    .byte    Dn2
    .byte W06
    .byte    Fn1
    .byte W06
    .byte    An0
    .byte W06
    .byte    Cs0
    .byte W06
    .byte    FnM1
    .byte W06
    .byte    GsM2
    .byte W06
    .byte EOT
    .byte VOL  , 66
    .byte    N05, Cn4
    .byte W06
    .byte    Dn4
    .byte W06
    .byte    Ds4
    .byte W06
    .byte    Fn4
    .byte W06
    .byte    N06, Dn4
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v032
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Gn4, v020
    .byte W12
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Gn4, v020
    .byte W12
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
    .byte    As3, v020
    .byte W06
    .byte    As3, v100
    .byte W06
    .byte    As3, v032
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W12
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W12
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    Cn4, v020
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v040
    .byte W06
    .byte    Cn4, v020
    .byte W06
    .byte    Cn4, v100
    .byte W06
    .byte    Cn4, v032
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W06
    .byte    Ds4, v012
    .byte W06
    .byte    Fn4, v100
    .byte W06
    .byte    Fn4, v040
    .byte W06
    .byte    Fn4, v020
    .byte W06
    .byte    Fn4, v012
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Dn4, v020
    .byte W36
    .byte    N12, Gs4, v100
    .byte W12
    .byte    Gn4
    .byte W12
    .byte    Fn4
    .byte W12
    .byte    Dn4
    .byte W12
    .byte GOTO
    .word LABEL_080A93A6
    .byte FINE

Track_080A94D3:
    .byte KEYSH, 0
LABEL_080A94D5:
    .byte VOICE, 20
    .byte VOL  , 113
    .byte PAN  , 10
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 28
    .byte LFODL, 14
    .byte MOD  , 3
    .byte MODT , 0
    .byte    N12, Gn2, v060
    .byte W12
    .byte    Gn2, v032
    .byte W12
    .byte    Gn2, v020
    .byte W12
    .byte    Gn2, v012
    .byte W12
    .byte    Gn2, v008
    .byte W12
    .byte    Gn2, v004
    .byte W12
    .byte    N12
    .byte W24
LABEL_080A94FF:
    .byte PAN  , 117
    .byte    N12, Gn2, v060
    .byte W12
    .byte    Gn2, v032
    .byte W12
    .byte    Gn2, v012
    .byte W12
    .byte PAN  , 64
    .byte    N12, Cn2, v060
    .byte W12
    .byte    Cn2, v032
    .byte W12
    .byte    Cn2, v012
    .byte W12
    .byte PAN  , 10
    .byte    N12, Gn2, v060
    .byte W12
    .byte    Gn2, v032
    .byte W12
    .byte PEND
LABEL_080A9521:
    .byte PAN  , 117
    .byte    N12, Fs2, v060
    .byte W12
    .byte    Fs2, v032
    .byte W12
    .byte    Fs2, v020
    .byte W12
    .byte    Fs2, v012
    .byte W12
    .byte    Fs2, v008
    .byte W12
    .byte    Fs2, v004
    .byte W12
    .byte    N12
    .byte W24
    .byte PEND
LABEL_080A9539:
    .byte PAN  , 10
    .byte    N12, Fs2, v060
    .byte W12
    .byte    Fs2, v032
    .byte W12
    .byte    Fs2, v012
    .byte W12
    .byte PAN  , 64
    .byte    N12, Dn2, v060
    .byte W12
    .byte    Dn2, v032
    .byte W12
    .byte    Dn2, v012
    .byte W12
    .byte PAN  , 117
    .byte    N12, Fs2, v060
    .byte W12
    .byte    Fs2, v032
    .byte W12
    .byte PEND
LABEL_080A955B:
    .byte PAN  , 10
    .byte    N12, Gn2, v060
    .byte W12
    .byte    Gn2, v032
    .byte W12
    .byte    Gn2, v020
    .byte W12
    .byte    Gn2, v012
    .byte W12
    .byte    Gn2, v008
    .byte W12
    .byte    Gn2, v004
    .byte W12
    .byte    N12
    .byte W24
    .byte PEND
    .byte PATT
    .word LABEL_080A94FF
LABEL_080A9578:
    .byte PAN  , 117
    .byte    N12, An2, v060
    .byte W12
    .byte    An2, v032
    .byte W12
    .byte    An2, v020
    .byte W12
    .byte    An2, v012
    .byte W12
    .byte    An2, v008
    .byte W12
    .byte    An2, v004
    .byte W12
    .byte    N12
    .byte W24
    .byte PEND
LABEL_080A9590:
    .byte PAN  , 10
    .byte    N12, An2, v060
    .byte W12
    .byte    An2, v032
    .byte W12
    .byte    An2, v012
    .byte W12
    .byte PAN  , 64
    .byte    N12, Fs2, v060
    .byte W12
    .byte    Fs2, v032
    .byte W12
    .byte    Fs2, v012
    .byte W12
    .byte PAN  , 117
    .byte    N12, Fs2, v060
    .byte W12
    .byte    Fs2, v032
    .byte W12
    .byte PEND
    .byte PATT
    .word LABEL_080A955B
    .byte PATT
    .word LABEL_080A94FF
    .byte PATT
    .word LABEL_080A9521
    .byte PATT
    .word LABEL_080A9539
    .byte PATT
    .word LABEL_080A955B
    .byte PATT
    .word LABEL_080A94FF
    .byte PATT
    .word LABEL_080A9578
    .byte PATT
    .word LABEL_080A9590
    .byte PATT
    .word LABEL_080A955B
    .byte PATT
    .word LABEL_080A94FF
    .byte PATT
    .word LABEL_080A9521
    .byte PATT
    .word LABEL_080A9539
    .byte PATT
    .word LABEL_080A955B
    .byte PATT
    .word LABEL_080A94FF
    .byte PATT
    .word LABEL_080A9578
    .byte PAN  , 64
    .byte    N12, Cn2, v072
    .byte W12
    .byte    Cn2, v040
    .byte W12
    .byte    Dn2, v072
    .byte W12
    .byte    Dn2, v040
    .byte W12
    .byte    Ds2, v080
    .byte W12
    .byte    Ds2, v040
    .byte W12
    .byte    Fn2, v080
    .byte W12
    .byte    Fn2, v052
    .byte W12
    .byte    Gn2, v080
    .byte W12
    .byte    N06, Gn2, v040
    .byte W06
    .byte    N12, Fn2, v080
    .byte W12
    .byte    N06, Fn2, v040
    .byte W06
    .byte    N12, Gn2, v080
    .byte W12
    .byte    Cn3
    .byte W12
    .byte    Cn3, v040
    .byte W12
    .byte    As2, v080
    .byte W12
    .byte    As2, v040
    .byte W12
    .byte    Ds2, v080
    .byte W12
    .byte    N06, Ds2, v040
    .byte W06
    .byte    N12, Dn2, v080
    .byte W12
    .byte    N06, Dn2, v040
    .byte W06
    .byte    N12, Ds2, v080
    .byte W12
    .byte    As2
    .byte W12
    .byte    As2, v040
    .byte W12
    .byte    Gs2, v080
    .byte W12
    .byte    Gs2, v040
    .byte W12
    .byte    Gn2, v080
    .byte W12
    .byte    Gn2, v040
    .byte W12
    .byte    Gn2, v020
    .byte W12
    .byte    Gn2, v008
    .byte W12
    .byte    Cn2, v080
    .byte W12
    .byte    Cn2, v040
    .byte W12
    .byte    Dn2, v080
    .byte W12
    .byte    Dn2, v040
    .byte W12
    .byte    Bn1, v080
    .byte W12
    .byte    Bn1, v040
    .byte W12
    .byte    Bn1, v020
    .byte W12
    .byte    Bn1, v012
    .byte W60
    .byte GOTO
    .word LABEL_080A94D5
    .byte FINE

    .align 2, 0

global_label SongHeader_080A9680
    .byte 6
    .byte 0
    .byte 0
    .byte 173
    .word 0x809F86C
    .word Track_080A8E18
    .word Track_080A8FB4
    .word Track_080A912F
    .word Track_080A9259
    .word Track_080A93A4
    .word Track_080A94D3

    .end
