#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_Oven_Comp
    .word FlagSetup_Oven_Comp_S0
    .word FlagSetup_Oven_Comp_S0
    .word FlagSetup_Oven_Comp_S0
    .word FlagSetup_Oven_Comp_S0
    .word FlagSetup_Oven_Comp_S0
    .word FlagSetup_Oven_Comp_S0

global_label MapSetup_Oven_Comp
    .word MapSetup_Oven_Comp_S0
    .word MapSetup_Oven_Comp_S1
    .word MapSetup_Oven_Comp_S2
    .word MapSetup_Oven_Comp_S2
    .word MapSetup_Oven_Comp_S2
    .word MapSetup_Oven_Comp_S2

MapSetup_Oven_Comp_S0:
    .word MapSetup_Oven_Comp_1_S0
    .word MapSetup_Oven_Comp_2_S0

MapSetup_Oven_Comp_S1:
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Oven_Comp_S2:
    .word MapSetup_Oven_Comp_1_S2
    .word MapSetup_Oven_Comp_2_S2

global_label EventHandler_Oven_Comp
    .word EventHandler_Oven_Comp_S0
    .word EventHandler_Oven_Comp_S1
    .word EventHandler_Oven_Comp_S2
    .word EventHandler_Oven_Comp_S2
    .word EventHandler_Oven_Comp_S2
    .word EventHandler_Oven_Comp_S2

EventHandler_Oven_Comp_S0:
    .word EventHandler_Oven_Comp_1_S0
    .word EventHandler_Oven_Comp_2_S0

EventHandler_Oven_Comp_S1:
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Oven_Comp_S2:
    .word EventHandler_Oven_Comp_1_S2
    .word EventHandler_Oven_Comp_2_S2


_ts FlagSetup_Oven_Comp_S0
    push       {lr}
    pop        {pc}
