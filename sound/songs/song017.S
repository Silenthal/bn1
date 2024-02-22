Track_080AEB38:
    .byte KEYSH, 0
    .byte TEMPO, 68
    .byte VOICE, 0
    .byte VOL  , 120
    .byte PAN  , 64
    .byte XCMD , xIECV, 20, xIECL, 2
    .byte    N06, Bn0, v112
    .byte    N02, Fs1, v064
    .byte W06
    .byte    N06, Fn1, v120
    .byte    N24, Cs2, v040
    .byte W18
    .byte    N06, An1, v120
    .byte W06
    .byte    Gn1
    .byte    N18, Cs2, v060
    .byte W06
    .byte    N06, Fn1, v120
    .byte W06
    .byte    Bn0, v092
    .byte W06
    .byte    N01, Cs1, v080
    .byte    N02, Fs1
    .byte W01
    .byte    N04, Cs1, v120
    .byte W05
    .byte    N06, Fn1
    .byte    N02, Fs1, v072
    .byte W06
    .byte    N06, Gn1, v120
    .byte W06
    .byte    Bn0, v100
    .byte    N06, Fn1, v120
    .byte    N24, Cs2, v060
    .byte W18
    .byte    N06, Gs1, v120
    .byte W06
    .byte    Gn1
    .byte W06
LABEL_080AEB88:
    .byte    N06, Bn0, v112
    .byte    N36, Cs2, v060
    .byte W24
    .byte    N06, Fn1, v120
    .byte W12
    .byte    Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    N06, Fn1, v120
    .byte    N03, Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N03, Fs1, v060
    .byte W12
    .byte    Fs1, v040
    .byte W12
    .byte    N06, Fn1, v120
    .byte    N03, Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    N06, Fn1, v120
    .byte    N03, Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N12, As1, v060
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N03, Fs1, v040
    .byte W12
    .byte    N03
    .byte W12
    .byte    N06, Fn1, v120
    .byte    N03, Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    N06, Fn1, v120
    .byte    N03, Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    N06, Bn0, v112
    .byte    N03, Fs1, v060
    .byte W12
    .byte    Fs1, v040
    .byte W12
    .byte    N06, Fn1, v120
    .byte    N03, Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    Fs1, v060
    .byte W12
    .byte    N06, Bn0, v092
    .byte    N03, Fs1, v040
    .byte W12
    .byte    N06, Fn1, v080
    .byte    N03, Fs1, v060
    .byte W06
    .byte    N06, Fn1, v100
    .byte W06
    .byte    N11, Gn1, v120
    .byte    N12, As1, v052
    .byte W12
    .byte GOTO
    .word LABEL_080AEB88
    .byte FINE

Track_080AEC4A:
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
    .byte    N06, Gn1, v100
    .byte W06
    .byte    Gn2
    .byte W06
    .byte    Gn3
    .byte W06
    .byte    Gn2
    .byte W06
    .byte    An1
    .byte W06
    .byte    An2
    .byte W06
    .byte    An3
    .byte W06
    .byte    An2
    .byte W06
    .byte    Bn3
    .byte W06
    .byte    N06
    .byte W06
    .byte    Fs3
    .byte W06
    .byte    N18, Bn2
    .byte W18
    .byte    N12, An2
    .byte W12
LABEL_080AEC7F:
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn3
    .byte W06
    .byte    Gn3, v060
    .byte W06
    .byte    N12, Gn2, v100
    .byte W12
    .byte    N06, Gn3
    .byte W06
    .byte    Gn3, v060
    .byte W06
    .byte    N12, An2, v100
    .byte W12
    .byte    N06, An3
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte    N12, An2, v100
    .byte W12
    .byte    N06, An3
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte PEND
    .byte    N12, Fs2, v100
    .byte W12
    .byte    N06, Fs3
    .byte W06
    .byte    Fs3, v060
    .byte W06
    .byte    N12, Fs2, v100
    .byte W12
    .byte    N06, Fs3
    .byte W06
    .byte    Fs3, v060
    .byte W06
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N06, Bn3
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    N12, An2, v100
    .byte W12
    .byte    N06, An3
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte PATT
    .word LABEL_080AEC7F
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N06, Bn3
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N06, Bn3
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    N12, Bn2, v100
    .byte W12
    .byte    N06, Bn3
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    N12, An2, v100
    .byte W12
    .byte    N06, An3
    .byte W06
    .byte    An3, v060
    .byte W06
    .byte GOTO
    .word LABEL_080AEC7F
    .byte FINE

Track_080AED03:
    .byte KEYSH, 0
    .byte VOICE, 21
    .byte VOL  , 56
    .byte PAN  , 0
    .byte BENDR, 12
    .byte    N04, Dn3, v100
    .byte    N04, Fs3
    .byte W06
    .byte    Dn3
    .byte    N04, Fs3
    .byte W06
    .byte    Dn3, v052
    .byte    N04, Fs3
    .byte W06
    .byte    Dn3, v032
    .byte    N04, Fs3
    .byte W06
    .byte PAN  , 127
    .byte    N04, Cs3, v100
    .byte    N04, En3
    .byte W06
    .byte    Cs3
    .byte    N04, En3
    .byte W06
    .byte    Cs3, v052
    .byte    N04, En3
    .byte W06
    .byte    Cs3, v032
    .byte    N04, En3
    .byte W12
    .byte PAN  , 64
    .byte    N04, Cs3, v112
    .byte    N04, En3
    .byte W06
    .byte    Cs3, v040
    .byte    N04, En3
    .byte W06
    .byte    N14, Bn2, v072
    .byte    N14, Ds3
    .byte W14
    .byte    N04, En3, v100
    .byte W04
    .byte    Fs3
    .byte W04
    .byte    Gn3
    .byte W04
    .byte    An3
    .byte W04
LABEL_080AED54:
    .byte    N48, Fs3, v052
    .byte    N72, Bn3, v080
    .byte W48
    .byte    N48, En3, v052
    .byte W24
    .byte    N24, An3, v080
    .byte W24
    .byte    N48, Fs3, v052
    .byte    N48, Cs4, v080
    .byte W48
    .byte    N24, Fs3, v052
    .byte    N24, Dn4, v080
    .byte W24
    .byte    En3, v052
    .byte    N24, Cs4, v080
    .byte W24
    .byte    N48, Dn3, v052
    .byte    N72, Bn3, v080
    .byte W48
    .byte    N48, En3, v052
    .byte W24
    .byte    N24, An3, v080
    .byte W24
    .byte    N48, En3, v052
    .byte    N80, Bn3, v080
    .byte W48
    .byte    N32, Ds3, v052
    .byte W32
    .byte    N04, En3, v080
    .byte W04
    .byte    Fs3
    .byte W04
    .byte    Gn3
    .byte W04
    .byte    An3
    .byte W04
    .byte GOTO
    .word LABEL_080AED54
    .byte FINE

Track_080AEDA1:
    .byte KEYSH, 0
    .byte VOICE, 1
    .byte VOL  , 99
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 31
    .byte LFODL, 14
    .byte MOD  , 5
    .byte MODT , 0
    .byte    N03, Gn3, v100
    .byte W03
    .byte    Gn3, v060
    .byte W03
    .byte    Dn3, v100
    .byte W03
    .byte    Dn3, v060
    .byte W03
    .byte    Gn3, v100
    .byte W03
    .byte    Gn3, v060
    .byte W03
    .byte    Dn4, v100
    .byte W03
    .byte    Dn4, v060
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte    En3, v100
    .byte W03
    .byte    En3, v060
    .byte W03
    .byte    An3, v100
    .byte W03
    .byte    An3, v060
    .byte W03
    .byte    Cs4, v100
    .byte W03
    .byte    Cs4, v060
    .byte W03
    .byte    En4, v100
    .byte W03
    .byte    En4, v060
    .byte W03
    .byte    En4, v100
    .byte W03
    .byte    En4, v060
    .byte W03
    .byte    N06, En4, v040
    .byte W06
    .byte    N30, Ds4, v100
    .byte W30
LABEL_080AEDFD:
    .byte VOL  , 85
    .byte PAN  , 0
    .byte    N06, Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte PAN  , 127
    .byte    N06, Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte PAN  , 0
    .byte    N06, An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte PAN  , 127
    .byte    N06, Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte PAN  , 0
    .byte    N06, Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Gn4, v100
    .byte W06
    .byte    Gn4, v040
    .byte W06
    .byte PAN  , 127
    .byte    N06, Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    An3, v100
    .byte W06
    .byte    An3, v040
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte PAN  , 64
    .byte    N06, Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Bn3, v100
    .byte W06
    .byte    Bn3, v060
    .byte W06
    .byte    Bn3, v040
    .byte W06
    .byte    Bn3, v020
    .byte W42
    .byte GOTO
    .word LABEL_080AEDFD
    .byte FINE

Track_080AEEC8:
    .byte KEYSH, 0
    .byte VOICE, 5
    .byte VOL  , 99
    .byte PAN  , 64
    .byte XCMD , xIECV, 40, xIECL, 3
    .byte BENDR, 12
    .byte LFOS , 31
    .byte LFODL, 14
    .byte MOD  , 5
    .byte MODT , 0
    .byte    N03, Bn4, v112
    .byte W03
    .byte    Bn4, v072
    .byte W03
    .byte    Bn3, v112
    .byte W03
    .byte    Bn3, v072
    .byte W03
    .byte    Dn4, v112
    .byte W03
    .byte    Dn4, v072
    .byte W03
    .byte    Bn4, v112
    .byte W03
    .byte    Bn4, v072
    .byte W03
    .byte    An4, v112
    .byte W03
    .byte    An4, v072
    .byte W03
    .byte    Cs4, v112
    .byte W03
    .byte    Cs4, v072
    .byte W03
    .byte    En4, v112
    .byte W03
    .byte    En4, v072
    .byte W03
    .byte    An4, v112
    .byte W03
    .byte    An4, v072
    .byte W03
    .byte    Bn4, v112
    .byte W03
    .byte    Bn4, v072
    .byte W03
    .byte    Bn4, v112
    .byte W03
    .byte    Bn4, v072
    .byte W03
    .byte    N06, Bn4, v052
    .byte W06
    .byte    N24, Bn4, v112
    .byte W24
    .byte    N06, Bn4, v052
    .byte W06
LABEL_080AEF28:
    .byte VOL  , 89
    .byte    N06, Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Cs5, v100
    .byte W06
    .byte    Cs5, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Cs5, v100
    .byte W06
    .byte    Cs5, v040
    .byte W06
    .byte    En5, v100
    .byte W06
    .byte    En5, v040
    .byte W06
    .byte    Dn5, v100
    .byte W06
    .byte    Dn5, v040
    .byte W06
    .byte    Cs5, v100
    .byte W06
    .byte    Cs5, v040
    .byte W06
    .byte    Dn5, v100
    .byte W06
    .byte    Dn5, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Dn4, v100
    .byte W06
    .byte    Dn4, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Cs4, v100
    .byte W06
    .byte    Cs4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    An4, v100
    .byte W06
    .byte    An4, v040
    .byte W06
    .byte    Bn4, v100
    .byte W06
    .byte    Bn4, v040
    .byte W06
    .byte    Fs4, v100
    .byte W06
    .byte    Fs4, v040
    .byte W06
    .byte    En4, v100
    .byte W06
    .byte    En4, v040
    .byte W06
    .byte    Ds4, v100
    .byte W06
    .byte    Ds4, v060
    .byte W06
    .byte    Ds4, v040
    .byte W06
    .byte    Ds4, v020
    .byte W42
    .byte GOTO
    .word LABEL_080AEF28
    .byte FINE

    .align 2, 0

global_label SongHeader_080AEFE0
    .byte 5
    .byte 0
    .byte 0
    .byte 163
    .word 0x80A01CC
    .word Track_080AEB38
    .word Track_080AEC4A
    .word Track_080AED03
    .word Track_080AEDA1
    .word Track_080AEEC8
