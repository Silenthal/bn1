#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_Waterworks_Comp
    .word FlagSetup_Waterworks_Comp_S0
    .word FlagSetup_Waterworks_Comp_S0
    .word FlagSetup_Waterworks_Comp_S0
    .word FlagSetup_Waterworks_Comp_S0
    .word FlagSetup_Waterworks_Comp_S0
    .word FlagSetup_Waterworks_Comp_S0

global_label MapSetup_Waterworks_Comp
    .word MapSetup_Waterworks_Comp_S0
    .word MapSetup_Waterworks_Comp_S1
    .word MapSetup_Waterworks_Comp_S2
    .word MapSetup_Waterworks_Comp_S3
    .word MapSetup_Waterworks_Comp_S3
    .word MapSetup_Waterworks_Comp_S3

MapSetup_Waterworks_Comp_S0:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Waterworks_Comp_S1:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Waterworks_Comp_S2:
    .word MapSetup_Waterworks_Comp_1_S2
    .word MapSetup_Waterworks_Comp_2_S2
    .word MapSetup_Waterworks_Comp_3_S2
    .word MapSetup_Waterworks_Comp_4_S2
    .word MapSetup_Waterworks_Comp_5_S2
    .word MapSetup_Waterworks_Comp_6_S2

MapSetup_Waterworks_Comp_S3:
    .word MapSetup_Waterworks_Comp_1_S3
    .word MapSetup_Waterworks_Comp_2_S3
    .word MapSetup_Waterworks_Comp_3_S3
    .word MapSetup_Waterworks_Comp_4_S3
    .word MapSetup_Waterworks_Comp_5_S3
    .word MapSetup_Waterworks_Comp_6_S3

global_label EventHandler_Waterworks_Comp
    .word EventHandler_Waterworks_Comp_S0
    .word EventHandler_Waterworks_Comp_S1
    .word EventHandler_Waterworks_Comp_S2
    .word EventHandler_Waterworks_Comp_S3
    .word EventHandler_Waterworks_Comp_S3
    .word EventHandler_Waterworks_Comp_S3

EventHandler_Waterworks_Comp_S0:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Waterworks_Comp_S1:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Waterworks_Comp_S2:
    .word EventHandler_Waterworks_Comp_1_S2
    .word EventHandler_Waterworks_Comp_2_S2
    .word EventHandler_Waterworks_Comp_3_S2
    .word EventHandler_Waterworks_Comp_4_S2
    .word EventHandler_Waterworks_Comp_5_S2
    .word EventHandler_Waterworks_Comp_6_S2

EventHandler_Waterworks_Comp_S3:
    .word EventHandler_Waterworks_Comp_1_S3
    .word EventHandler_Waterworks_Comp_2_S3
    .word EventHandler_Waterworks_Comp_3_S3
    .word EventHandler_Waterworks_Comp_4_S3
    .word EventHandler_Waterworks_Comp_5_S3
    .word EventHandler_Waterworks_Comp_6_S3


_ts FlagSetup_Waterworks_Comp_S0
    mov        pc,lr

    .align 2, 0


_ts dummy_458bc
    mov        pc,lr

    .align 2, 0


_ts dummy_458c0
    mov        pc,lr

    .align 2, 0
