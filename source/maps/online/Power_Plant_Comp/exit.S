#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_Power_Plant_Comp
    .word MapExitList_Power_Plant_Comp_1
    .word MapExitList_Power_Plant_Comp_2
    .word MapExitList_Power_Plant_Comp_3
    .word MapExitList_Power_Plant_Comp_4

MapExitList_Power_Plant_Comp_1:
    MapEntrance Map_Power_Plant_Comp_2, d_nw, f(-504, 152, 0)

MapExitList_Power_Plant_Comp_2:
    MapEntrance Map_Power_Plant_Comp_1, d_se, f(28, -452, -64)
    MapEntrance Map_Power_Plant_Comp_3, d_se, f(-500, -84, 96)

MapExitList_Power_Plant_Comp_3:
    MapEntrance Map_Power_Plant_Comp_2, d_sw, f(196, 404, 0)
    MapEntrance Map_Power_Plant_Comp_4, d_ne, f(-32, 448, -64)

MapExitList_Power_Plant_Comp_4:
    MapEntrance Map_Power_Plant_Comp_3, d_sw, f(164, 372, 0)
