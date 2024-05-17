#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_Internet
    .word FlagSetup_Internet_S0
    .word FlagSetup_Internet_S0
    .word FlagSetup_Internet_S0
    .word FlagSetup_Internet_S0
    .word FlagSetup_Internet_S0
    .word FlagSetup_Internet_S0

global_label MapSetup_Internet
    .word MapSetup_Internet_S0
    .word MapSetup_Internet_S0
    .word MapSetup_Internet_S0
    .word MapSetup_Internet_S0
    .word MapSetup_Internet_S0
    .word MapSetup_Internet_S0

MapSetup_Internet_S0:
    .word MapSetup_Internet_1_S0
    .word MapSetup_Internet_2_S0
    .word MapSetup_Internet_3_S0
    .word MapSetup_Internet_4_S0
    .word MapSetup_Undernet_1_S0
    .word MapSetup_Undernet_2_S0
    .word MapSetup_Undernet_3_S0
    .word MapSetup_Undernet_4_S0
    .word MapSetup_Undernet_5_S0
    .word MapSetup_Undernet_6_S0
    .word MapSetup_Undernet_7_S0
    .word MapSetup_Undernet_8_S0
    .word MapSetup_Undernet_9_S0
    .word MapSetup_Undernet_10_S0
    .word MapSetup_Undernet_11_S0
    .word MapSetup_Undernet_12_S0

global_label EventHandler_Internet
    .word EventHandler_Internet_S0
    .word EventHandler_Internet_S0
    .word EventHandler_Internet_S0
    .word EventHandler_Internet_S0
    .word EventHandler_Internet_S0
    .word EventHandler_Internet_S0

EventHandler_Internet_S0:
    .word EventHandler_Internet_1_S0
    .word EventHandler_Internet_2_S0
    .word EventHandler_Internet_3_S0
    .word EventHandler_Internet_4_S0
    .word EventHandler_Undernet_1_S0
    .word EventHandler_Undernet_2_S0
    .word EventHandler_Undernet_3_S0
    .word EventHandler_Undernet_4_S0
    .word EventHandler_Undernet_5_S0
    .word EventHandler_Undernet_6_S0
    .word EventHandler_Undernet_7_S0
    .word EventHandler_Undernet_8_S0
    .word EventHandler_Undernet_9_S0
    .word EventHandler_Undernet_10_S0
    .word EventHandler_Undernet_11_S0
    .word EventHandler_Undernet_12_S0


_ts FlagSetup_Internet_S0
    mov        pc,lr

    .align 2, 0
