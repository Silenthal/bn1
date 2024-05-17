#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_DenTown_HP
    .word FlagSetup_DenTown_HP_S0
    .word FlagSetup_DenTown_HP_S0
    .word FlagSetup_DenTown_HP_S0
    .word FlagSetup_DenTown_HP_S0
    .word FlagSetup_DenTown_HP_S0
    .word FlagSetup_DenTown_HP_S0

global_label MapSetup_DenTown_HP
    .word MapSetup_DenTown_HP_S0
    .word MapSetup_DenTown_HP_S0
    .word MapSetup_DenTown_HP_S0
    .word MapSetup_DenTown_HP_S0
    .word MapSetup_DenTown_HP_S0
    .word MapSetup_DenTown_HP_S0

MapSetup_DenTown_HP_S0:
    .word MapSetup_DenTown_Antique_Comp_S0

global_label EventHandler_DenTown_HP
    .word EventHandler_DenTown_HP_S0
    .word EventHandler_DenTown_HP_S0
    .word EventHandler_DenTown_HP_S0
    .word EventHandler_DenTown_HP_S0
    .word EventHandler_DenTown_HP_S0
    .word EventHandler_DenTown_HP_S0

EventHandler_DenTown_HP_S0:
    .word EventHandler_DenTown_Antique_Comp_S0


_ts FlagSetup_DenTown_HP_S0
    mov        pc,lr

    .align 2, 0
