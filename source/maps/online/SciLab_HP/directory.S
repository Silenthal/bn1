#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_SciLab_HP
    .word FlagSetup_SciLab_HP_S0
    .word FlagSetup_SciLab_HP_S0
    .word FlagSetup_SciLab_HP_S0
    .word FlagSetup_SciLab_HP_S0
    .word FlagSetup_SciLab_HP_S0
    .word FlagSetup_SciLab_HP_S0

global_label MapSetup_SciLab_HP
    .word MapSetup_SciLab_HP_S0
    .word MapSetup_SciLab_HP_S0
    .word MapSetup_SciLab_HP_S0
    .word MapSetup_SciLab_HP_S0
    .word MapSetup_SciLab_HP_S0
    .word MapSetup_SciLab_HP_S0

MapSetup_SciLab_HP_S0:
    .word MapSetup_SciLab_Fish_Stand_Comp_S0

global_label EventHandler_SciLab_HP
    .word EventHandler_SciLab_HP_S0
    .word EventHandler_SciLab_HP_S0
    .word EventHandler_SciLab_HP_S0
    .word EventHandler_SciLab_HP_S0
    .word EventHandler_SciLab_HP_S0
    .word EventHandler_SciLab_HP_S0

EventHandler_SciLab_HP_S0:
    .word EventHandler_SciLab_Fish_Stand_Comp_S0


_ts FlagSetup_SciLab_HP_S0
    mov        pc,lr

    .align 2, 0
