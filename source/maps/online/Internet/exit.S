#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_Internet
    .word MapExitList_Internet_1
    .word MapExitList_Internet_2
    .word MapExitList_Internet_3
    .word MapExitList_Internet_4
    .word MapExitList_Undernet_1
    .word MapExitList_Undernet_2
    .word MapExitList_Undernet_3
    .word MapExitList_Undernet_4
    .word MapExitList_Undernet_5
    .word MapExitList_Undernet_6
    .word MapExitList_Undernet_7
    .word MapExitList_Undernet_8
    .word MapExitList_Undernet_9
    .word MapExitList_Undernet_10
    .word MapExitList_Undernet_11
    .word MapExitList_Undernet_12

MapExitList_Internet_1:
    MapEntrance Map_ACDC_Lan_PC, d_sw, f(82, -2, 0)
    MapEntrance Map_ACDC_Mayl_PC, d_nw, f(74, 292, 128)
    MapEntrance Map_ACDC_Yai_PC, d_ne, f(-30, -36, 0)
    MapEntrance Map_ACDC_Dex_PC, d_sw, f(474, 100, 0)
    MapEntrance Map_None, d_sw, f(0, 0, 0)
    MapEntrance Map_Internet_2, d_ne, f(-474, 44, 0)

MapExitList_Internet_2:
    MapEntrance Map_Internet_1, d_sw, f(296, 420, 0)
    MapEntrance Map_Internet_3, d_sw, f(-440, 36, 64)
    MapEntrance Map_Internet_4, d_nw, f(-348, -4, 0)

MapExitList_Internet_3:
    MapEntrance Map_Govt_Yuichiro_PC, d_sw, f(218, 6, 0)
    MapEntrance Map_Govt_Lunch_Cart_Comp, d_se, f(154, -250, 0)
    MapEntrance Map_SciLab_Fish_Stand_Comp, d_sw, f(162, 350, 0)
    MapEntrance Map_Internet_2, d_ne, f(150, 396, 0)
    MapEntrance Map_Undernet_5, d_ne, f(-434, 244, 0)

MapExitList_Internet_4:
    MapEntrance Map_Internet_2, d_se, f(356, -306, 0)
    MapEntrance Map_Undernet_1, d_ne, f(-416, -108, 0)
    MapEntrance Map_DenTown_Antique_Comp, d_se, f(-14, 110, 0)

MapExitList_Undernet_1:
    MapEntrance Map_Internet_4, d_se, f(580, -80, 0)
    MapEntrance Map_Undernet_2, d_ne, f(-602, 156, 64)
    MapEntrance Map_Undernet_5, d_se, f(-52, -358, 0)

MapExitList_Undernet_2:
    MapEntrance Map_Undernet_1, d_sw, f(584, -28, 0)
    MapEntrance Map_Undernet_3, d_ne, f(-434, -60, 0)

MapExitList_Undernet_3:
    MapEntrance Map_Undernet_2, d_sw, f(448, -228, 0)
    MapEntrance Map_Undernet_4, d_ne, f(-458, -4, 64)

MapExitList_Undernet_4:
    MapEntrance Map_Undernet_3, d_sw, f(-232, -60, 0)

MapExitList_Undernet_5:
    MapEntrance Map_Internet_3, d_sw, f(328, -156, 0)
    MapEntrance Map_Undernet_1, d_nw, f(460, 148, 0)
    MapEntrance Map_Undernet_6, d_ne, f(-554, 140, 64)

MapExitList_Undernet_6:
    MapEntrance Map_Undernet_5, d_sw, f(472, 116, 0)
    MapEntrance Map_Undernet_7, d_ne, f(-498, -124, 0)
    MapEntrance Map_Undernet_9, d_se, f(-364, -224, 0)

MapExitList_Undernet_7:
    MapEntrance Map_Undernet_6, d_sw, f(320, -68, 64)
    MapEntrance Map_Undernet_8, d_ne, f(-466, -28, 0)

MapExitList_Undernet_8:
    MapEntrance Map_Undernet_7, d_sw, f(384, -228, 0)

MapExitList_Undernet_9:
    MapEntrance Map_Undernet_6, d_nw, f(276, 282, 64)
    MapEntrance Map_Undernet_10, d_ne, f(-386, -204, 0)

MapExitList_Undernet_10:
    MapEntrance Map_Undernet_9, d_sw, f(512, 28, 0)
    MapEntrance Map_Undernet_11, d_ne, f(-450, -220, 64)

MapExitList_Undernet_11:
    MapEntrance Map_Undernet_10, d_sw, f(472, 20, 64)
    MapEntrance Map_Undernet_12, d_ne, f(-402, -60, 0)

MapExitList_Undernet_12:
    MapEntrance Map_Undernet_11, d_sw, f(312, -316, 0)
