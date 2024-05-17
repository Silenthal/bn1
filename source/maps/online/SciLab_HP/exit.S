#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_SciLab_HP
    .word MapExitList_SciLab_Fish_Stand_Comp

MapExitList_SciLab_Fish_Stand_Comp:
    MapEntrance Map_Internet_3, d_nw, f(-391, 391, 128)
