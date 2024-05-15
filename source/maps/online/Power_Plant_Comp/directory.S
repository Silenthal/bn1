#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_Power_Plant_Comp
    .word FlagSetup_Power_Plant_Comp_S0
    .word FlagSetup_Power_Plant_Comp_S0
    .word FlagSetup_Power_Plant_Comp_S0
    .word FlagSetup_Power_Plant_Comp_S0
    .word FlagSetup_Power_Plant_Comp_S0
    .word FlagSetup_Power_Plant_Comp_S0

global_label MapSetup_Power_Plant_Comp
    .word MapSetup_Power_Plant_Comp_S0
    .word MapSetup_Power_Plant_Comp_S1
    .word MapSetup_Power_Plant_Comp_S2
    .word MapSetup_Power_Plant_Comp_S3
    .word MapSetup_Power_Plant_Comp_S4
    .word MapSetup_Power_Plant_Comp_S5

MapSetup_Power_Plant_Comp_S0:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Power_Plant_Comp_S1:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Power_Plant_Comp_S2:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Power_Plant_Comp_S3:
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Power_Plant_Comp_S4:
    .word MapSetup_Power_Plant_Comp_1_S4
    .word MapSetup_Power_Plant_Comp_2_S4
    .word MapSetup_Power_Plant_Comp_3_S4
    .word MapSetup_Power_Plant_Comp_4_S4

MapSetup_Power_Plant_Comp_S5:
    .word MapSetup_Power_Plant_Comp_1_S5
    .word MapSetup_Power_Plant_Comp_2_S5
    .word MapSetup_Power_Plant_Comp_3_S5
    .word MapSetup_Power_Plant_Comp_4_S5

global_label EventHandler_Power_Plant_Comp
    .word EventHandler_Power_Plant_Comp_S0
    .word EventHandler_Power_Plant_Comp_S1
    .word EventHandler_Power_Plant_Comp_S2
    .word EventHandler_Power_Plant_Comp_S3
    .word EventHandler_Power_Plant_Comp_S4
    .word EventHandler_Power_Plant_Comp_S5

EventHandler_Power_Plant_Comp_S0:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Power_Plant_Comp_S1:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Power_Plant_Comp_S2:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Power_Plant_Comp_S3:
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Power_Plant_Comp_S4:
    .word EventHandler_Power_Plant_1_S4
    .word EventHandler_Power_Plant_2_S4
    .word EventHandler_Power_Plant_3_S4
    .word EventHandler_Power_Plant_4_S4

EventHandler_Power_Plant_Comp_S5:
    .word EventHandler_Power_Plant_1_S5
    .word EventHandler_Power_Plant_2_S5
    .word EventHandler_Power_Plant_3_S5
    .word EventHandler_Power_Plant_4_S5


_ts FlagSetup_Power_Plant_Comp_S0
    mov        pc,lr

    .align 2, 0
