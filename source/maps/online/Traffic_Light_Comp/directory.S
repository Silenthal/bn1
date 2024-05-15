#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_Traffic_Light_Comp
    .word FlagSetup_Traffic_Light_Comp_S0
    .word FlagSetup_Traffic_Light_Comp_S0
    .word FlagSetup_Traffic_Light_Comp_S0
    .word FlagSetup_Traffic_Light_Comp_S0
    .word FlagSetup_Traffic_Light_Comp_S0
    .word FlagSetup_Traffic_Light_Comp_S0

global_label MapSetup_Traffic_Light_Comp
    .word MapSetup_Traffic_Light_Comp_S0
    .word MapSetup_Traffic_Light_Comp_S1
    .word MapSetup_Traffic_Light_Comp_S2
    .word MapSetup_Traffic_Light_Comp_S3
    .word MapSetup_Traffic_Light_Comp_S4
    .word MapSetup_Traffic_Light_Comp_S4

MapSetup_Traffic_Light_Comp_S0:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Traffic_Light_Comp_S1:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Traffic_Light_Comp_S2:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Traffic_Light_Comp_S3:
    .word MapSetup_Traffic_Light_Comp_1_S3
    .word MapSetup_Traffic_Light_Comp_2_S3
    .word MapSetup_Traffic_Light_Comp_3_S3
    .word MapSetup_Traffic_Light_Comp_4_S3
    .word MapSetup_Traffic_Light_Comp_5_S3

MapSetup_Traffic_Light_Comp_S4:
    .word MapSetup_Traffic_Light_Comp_1_S4
    .word MapSetup_Traffic_Light_Comp_2_S4
    .word MapSetup_Traffic_Light_Comp_3_S4
    .word MapSetup_Traffic_Light_Comp_4_S4
    .word MapSetup_Traffic_Light_Comp_5_S4

global_label EventHandler_Traffic_Light_Comp
    .word EventHandler_Traffic_Light_Comp_S0
    .word EventHandler_Traffic_Light_Comp_S1
    .word EventHandler_Traffic_Light_Comp_S2
    .word EventHandler_Traffic_Light_Comp_S3
    .word EventHandler_Traffic_Light_Comp_S4
    .word EventHandler_Traffic_Light_Comp_S4

EventHandler_Traffic_Light_Comp_S0:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Traffic_Light_Comp_S1:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Traffic_Light_Comp_S2:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Traffic_Light_Comp_S3:
    .word EventHandler_Traffic_Light_Comp_1_S3
    .word EventHandler_Traffic_Light_Comp_2_S3
    .word EventHandler_Traffic_Light_Comp_3_S3
    .word EventHandler_Traffic_Light_Comp_4_S3
    .word EventHandler_Traffic_Light_Comp_5_S3

EventHandler_Traffic_Light_Comp_S4:
    .word EventHandler_Traffic_Light_Comp_1_S4
    .word EventHandler_Traffic_Light_Comp_2_S4
    .word EventHandler_Traffic_Light_Comp_3_S4
    .word EventHandler_Traffic_Light_Comp_4_S4
    .word EventHandler_Traffic_Light_Comp_5_S4


_ts FlagSetup_Traffic_Light_Comp_S0
    mov        pc,lr

    .align 2, 0
