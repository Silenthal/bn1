#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_ACDC_HP
    .word MapExitList_ACDC_Lan_PC
    .word MapExitList_ACDC_Mayl_PC
    .word MapExitList_ACDC_Yai_PC
    .word MapExitList_ACDC_Dex_PC

MapExitList_ACDC_Lan_PC:
    MapEntrance Map_Internet_1, d_ne, f(-469, 22, 0)

MapExitList_ACDC_Mayl_PC:
    MapEntrance Map_Internet_1, d_nw, f(-374, 310, 0)

MapExitList_ACDC_Yai_PC:
    MapEntrance Map_Internet_1, d_nw, f(-280, -298, 0)

MapExitList_ACDC_Dex_PC:
    MapEntrance Map_Internet_1, d_s, f(184, 310, 0)
