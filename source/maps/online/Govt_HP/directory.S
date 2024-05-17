#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


FlagSetup_Govt_HP:
    .word FlagSetup_Govt_HP_S0
    .word FlagSetup_Govt_HP_S0
    .word FlagSetup_Govt_HP_S0
    .word FlagSetup_Govt_HP_S0
    .word FlagSetup_Govt_HP_S0
    .word FlagSetup_Govt_HP_S0

MapSetup_Govt_HP:
    .word MapSetup_Govt_HP_S0
    .word MapSetup_Govt_HP_S1
    .word MapSetup_Govt_HP_S2
    .word MapSetup_Govt_HP_S2
    .word MapSetup_Govt_HP_S2
    .word MapSetup_Govt_HP_S2

MapSetup_Govt_HP_S0:
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Govt_HP_S1:
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_Govt_HP_S2:
    .word MapSetup_Govt_Yuichiro_PC_S2
    .word MapSetup_Govt_Lunch_Cart_Comp_S2

EventHandler_Govt_HP:
    .word EventHandler_Govt_HP_S0
    .word EventHandler_Govt_HP_S1
    .word EventHandler_Govt_HP_S2
    .word EventHandler_Govt_HP_S2
    .word EventHandler_Govt_HP_S2
    .word EventHandler_Govt_HP_S2

EventHandler_Govt_HP_S0:
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Govt_HP_S1:
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_Govt_HP_S2:
    .word EventHandler_Govt_Yuichiro_PC_S2
    .word EventHandler_Govt_Lunch_Cart_Comp_S2

MapDialogue_Govt_HP:
    .word MapDialogue_Govt_Yuichiro_PC
    .word MapDialogue_Govt_Lunch_Cart_Comp

MapDialogue_Govt_Yuichiro_PC:
    .byte 0x05
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

MapDialogue_Govt_Lunch_Cart_Comp:
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1


_ts FlagSetup_Govt_HP_S0
    mov        pc,lr

    .align 2, 0
