#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_School_Comp
    .word MapExitList_School_Comp_1
    .word MapExitList_School_Comp_2
    .word MapExitList_School_Comp_3
    .word MapExitList_School_Comp_4
    .word MapExitList_School_Comp_5

MapExitList_School_Comp_1:
    MapEntrance Map_School_Comp_2, d_ne, f(-376, 206, 64)
    MapEntrance Map_School_Comp_2, d_ne, f(-408, -50, 64)
    MapEntrance Map_School_Comp_2, d_ne, f(-408, -114, 64)

MapExitList_School_Comp_2:
    MapEntrance Map_School_Comp_1, d_sw, f(206, 302, 0)
    MapEntrance Map_School_Comp_1, d_sw, f(206, 30, 0)
    MapEntrance Map_School_Comp_1, d_sw, f(206, -34, 0)
    MapEntrance Map_School_Comp_4, d_se, f(-150, -68, 0)

MapExitList_School_Comp_3:
    MapEntrance Map_School_Comp_4, d_ne, f(-384, 198, 0)
    MapEntrance Map_School_Comp_4, d_ne, f(-400, -186, 0)

MapExitList_School_Comp_4:
    MapEntrance Map_School_Comp_2, d_nw, f(-108, 344, 64)
    MapEntrance Map_School_Comp_3, d_sw, f(194, 204, 0)
    MapEntrance Map_School_Comp_3, d_sw, f(206, -130, 0)
    MapEntrance Map_School_Comp_5, d_ne, f(-442, 126, 64)

MapExitList_School_Comp_5:
    MapEntrance Map_School_Comp_4, d_sw, f(362, 198, 0)
