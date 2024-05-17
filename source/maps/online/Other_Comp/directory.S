#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_Other_Comp
    .word FlagSetup_Other_Comp_S0
    .word FlagSetup_Other_Comp_S0
    .word FlagSetup_Other_Comp_S0
    .word FlagSetup_Other_Comp_S0
    .word FlagSetup_Other_Comp_S0
    .word FlagSetup_Other_Comp_S0

global_label MapSetup_Other_Comp
    .word MapSetup_Other_Comp_S0
    .word MapSetup_Other_Comp_S0
    .word MapSetup_Other_Comp_S0
    .word MapSetup_Other_Comp_S0
    .word MapSetup_Other_Comp_S0
    .word MapSetup_Other_Comp_S0

MapSetup_Other_Comp_S0:
    .word MapSetup_Other_Doghouse_Comp_S0
    .word MapSetup_Other_Servbot_Comp_S0
    .word MapSetup_Other_New_Game_Machine_Comp_S0
    .word MapSetup_Other_Telephone_Comp_S0
    .word MapSetup_Other_Car_Comp_S0
    .word MapSetup_Other_Waterworks_Vending_Machine_S0
    .word MapSetup_Other_Lobby_TV_Comp_S0
    .word MapSetup_Other_Large_Monitor_Comp_S0
    .word MapSetup_Other_Control_Equipment_Comp_S0
    .word MapSetup_Other_SciLab_Vending_Machine_S0
    .word MapSetup_Other_Recycled_PET_Comp_S0
    .word MapSetup_Other_Big_Vase_Comp_S0
    .word MapSetup_Other_Blackboard_Comp_S0

global_label EventHandler_Other_Comp
    .word EventHandler_Other_Comp_S0
    .word EventHandler_Other_Comp_S0
    .word EventHandler_Other_Comp_S0
    .word EventHandler_Other_Comp_S0
    .word EventHandler_Other_Comp_S0
    .word EventHandler_Other_Comp_S0

EventHandler_Other_Comp_S0:
    .word EventHandler_Other_Doghouse_Comp_S0
    .word EventHandler_Other_Servbot_Comp_S0
    .word EventHandler_Other_New_Game_Machine_Comp_S0
    .word EventHandler_Other_Telephone_Comp_S0
    .word EventHandler_Other_Car_Comp_S0
    .word EventHandler_Other_Waterworks_Vending_Machine_S0
    .word EventHandler_Other_Lobby_TV_Comp_S0
    .word EventHandler_Other_Large_Monitor_Comp_S0
    .word EventHandler_Other_Control_Equipment_Comp_S0
    .word EventHandler_Other_SciLab_Vending_Machine_S0
    .word EventHandler_Other_Recycled_PET_Comp_S0
    .word EventHandler_Other_Big_Vase_Comp_S0
    .word EventHandler_Other_Blackboard_Comp_S0


_ts FlagSetup_Other_Comp_S0
    mov        pc,lr

    .align 2, 0
