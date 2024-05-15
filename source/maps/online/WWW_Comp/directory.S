#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_WWW_Comp
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_WWW_Comp_S5

global_label MapSetup_WWW_Comp
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_WWW_Comp_S5

MapSetup_WWW_Comp_S5:
    .word MapSetup_WWW_Comp_1_S5
    .word MapSetup_WWW_Comp_2_S5
    .word MapSetup_WWW_Comp_3_S5
    .word MapSetup_WWW_Comp_4_S5
    .word MapSetup_WWW_Comp_5_S5
    .word MapSetup_Rocket_Comp_S5

global_label EventHandler_WWW_Comp
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_WWW_Comp_S5

EventHandler_WWW_Comp_S5:
    .word EventHandler_WWW_Comp_1_S5
    .word EventHandler_WWW_Comp_2_S5
    .word EventHandler_WWW_Comp_3_S5
    .word EventHandler_WWW_Comp_4_S5
    .word EventHandler_WWW_Comp_5_S5
    .word EventHandler_Rocket_Comp_S5


_ts FlagSetup_WWW_Comp_S5
    mov        pc,lr

    .align 2, 0
