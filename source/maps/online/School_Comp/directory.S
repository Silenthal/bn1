#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_School_Comp
    .word FlagSetup_School_Comp_S0
    .word FlagSetup_School_Comp_S0
    .word FlagSetup_School_Comp_S0
    .word FlagSetup_School_Comp_S0
    .word FlagSetup_School_Comp_S0
    .word FlagSetup_School_Comp_S0

global_label MapSetup_School_Comp
    .word MapSetup_School_Comp_S0
    .word MapSetup_School_Comp_S1
    .word MapSetup_School_Comp_S2
    .word MapSetup_School_Comp_S2
    .word MapSetup_School_Comp_S2
    .word MapSetup_School_Comp_S2

MapSetup_School_Comp_S0:
    .word MapSetup_School_Comp_1_S0
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_School_Comp_S1:
    .word MapSetup_School_Comp_1_S1
    .word MapSetup_School_Comp_2_S1
    .word MapSetup_School_Comp_3_S1
    .word MapSetup_School_Comp_4_S1
    .word MapSetup_School_Comp_5_S1

MapSetup_School_Comp_S2:
    .word MapSetup_School_Comp_1_S2
    .word MapSetup_School_Comp_2_S2
    .word MapSetup_School_Comp_3_S2
    .word MapSetup_School_Comp_4_S2
    .word MapSetup_School_Comp_5_S2

global_label EventHandler_School_Comp
    .word EventHandler_School_Comp_S0
    .word EventHandler_School_Comp_S1
    .word EventHandler_School_Comp_S2
    .word EventHandler_School_Comp_S2
    .word EventHandler_School_Comp_S2
    .word EventHandler_School_Comp_S2

EventHandler_School_Comp_S0:
    .word EventHandler_S0_School_Comp_1
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_School_Comp_S1:
    .word EventHandler_School_Comp_1_S1
    .word EventHandler_School_Comp_2_S1
    .word EventHandler_School_Comp_3_S1
    .word EventHandler_School_Comp_4_S1
    .word EventHandler_School_Comp_5_S1

EventHandler_School_Comp_S2:
    .word EventHandler_School_Comp_1_S2
    .word EventHandler_School_Comp_2_S2
    .word EventHandler_School_Comp_3_S2
    .word EventHandler_School_Comp_4_S2
    .word EventHandler_School_Comp_5_S2


_ts FlagSetup_School_Comp_S0
    push       {lr}
    pop        {pc}
