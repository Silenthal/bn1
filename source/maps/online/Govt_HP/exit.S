#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_Govt_HP
    .word MapExitList_Govt_Yuichiro_PC
    .word MapExitList_Govt_Lunch_Cart_Comp

MapExitList_Govt_Yuichiro_PC:
    MapEntrance Map_Internet_3, d_s, f(217, 279, 64)

MapExitList_Govt_Lunch_Cart_Comp:
    MapEntrance Map_Internet_3, d_nw, f(-135, 263, 64)
