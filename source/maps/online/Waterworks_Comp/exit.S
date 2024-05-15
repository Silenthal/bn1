#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_Waterworks_Comp
    .word MapExitList_Waterworks_Comp_1
    .word MapExitList_Waterworks_Comp_2
    .word MapExitList_Waterworks_Comp_3
    .word MapExitList_Waterworks_Comp_4
    .word MapExitList_Waterworks_Comp_5
    .word MapExitList_Waterworks_Comp_6

MapExitList_Waterworks_Comp_1:
    MapEntrance Map_Waterworks_Comp_2, d_nw, f(-373, 309, 0)

MapExitList_Waterworks_Comp_2:
    MapEntrance Map_Waterworks_Comp_1, d_sw, f(147, -467, 32)
    MapEntrance Map_Waterworks_Comp_3, d_sw, f(-5, 421, 64)
    MapEntrance Map_Waterworks_Comp_3, d_sw, f(251, 325, 64)

MapExitList_Waterworks_Comp_3:
    MapEntrance Map_Waterworks_Comp_2, d_ne, f(-469, 53, 0)
    MapEntrance Map_Waterworks_Comp_2, d_ne, f(-21, -395, 0)
    MapEntrance Map_Waterworks_Comp_4, d_sw, f(91, -331, 64)
    MapEntrance Map_Waterworks_Comp_5, d_ne, f(-525, -51, 64)

MapExitList_Waterworks_Comp_4:
    MapEntrance Map_Waterworks_Comp_3, d_nw, f(-421, 37, 0)

MapExitList_Waterworks_Comp_5:
    MapEntrance Map_Waterworks_Comp_3, d_se, f(59, -411, 64)
    MapEntrance Map_Waterworks_Comp_6, d_s, f(-21, -283, 32)

MapExitList_Waterworks_Comp_6:
    MapEntrance Map_Waterworks_Comp_5, d_sw, f(147, 365, 64)
