#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_Oven_Comp
    .word MapExitList_Oven_Comp_1
    .word MapExitList_Oven_Comp_2

MapExitList_Oven_Comp_1:
    MapEntrance Map_Oven_Comp_2, d_sw, f(310, 202, 0)
    MapEntrance Map_Internet_1, d_ne, f(-468, -138, 0)

MapExitList_Oven_Comp_2:
    MapEntrance Map_Oven_Comp_1, d_ne, f(-482, 130, 0)
