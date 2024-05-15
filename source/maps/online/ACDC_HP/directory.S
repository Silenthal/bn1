#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_ACDC_HP
    .word FlagSetup_ACDC_HP_S0
    .word FlagSetup_ACDC_HP_S0
    .word FlagSetup_ACDC_HP_S0
    .word FlagSetup_ACDC_HP_S0
    .word FlagSetup_ACDC_HP_S0
    .word FlagSetup_ACDC_HP_S0

global_label MapSetup_ACDC_HP
    .word MapSetup_ACDC_HP_S0
    .word MapSetup_ACDC_HP_S0
    .word MapSetup_ACDC_HP_S0
    .word MapSetup_ACDC_HP_S0
    .word MapSetup_ACDC_HP_S0
    .word MapSetup_ACDC_HP_S0

MapSetup_ACDC_HP_S0:
    .word MapSetup_ACDC_Lan_PC_S0
    .word MapSetup_ACDC_Mayl_PC_S0
    .word MapSetup_ACDC_Yai_PC_S0
    .word MapSetup_ACDC_Dex_PC_S0

global_label EventHandler_ACDC_HP
    .word EventHandler_ACDC_HP_S0
    .word EventHandler_ACDC_HP_S0
    .word EventHandler_ACDC_HP_S0
    .word EventHandler_ACDC_HP_S0
    .word EventHandler_ACDC_HP_S0
    .word EventHandler_ACDC_HP_S0

EventHandler_ACDC_HP_S0:
    .word EventHandler_ACDC_Lan_PC_S0
    .word EventHandler_ACDC_Mayl_PC_S0
    .word EventHandler_ACDC_Yai_PC_S0
    .word EventHandler_ACDC_Dex_PC_S0


_ts FlagSetup_ACDC_HP_S0
    mov        pc,lr

    .align 2, 0
