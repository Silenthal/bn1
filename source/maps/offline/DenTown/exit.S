#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_DenTown
    .word MapExitList_DenTown_Center
    .word MapExitList_DenTown_Station
    .word MapExitList_DenTown_Block_1
    .word MapExitList_DenTown_Block_2
    .word MapExitList_DenTown_Block_3
    .word MapExitList_DenTown_Block_4
    .word MapExitList_DenTown_Miyu_Antiques
    .word MapExitList_DenTown_Summer_School

MapExitList_DenTown_Center:
    MapEntrance Map_DenTown_Block_1, d_nw, f(-94, 298, 0)
    MapEntrance Map_DenTown_Block_1, d_nw, f(82, 298, 0)
    MapEntrance Map_DenTown_Block_2, d_ne, f(-356, -10, 0)
    MapEntrance Map_DenTown_Block_2, d_ne, f(-356, 166, 0)
    MapEntrance Map_DenTown_Block_3, d_se, f(82, -304, 0)
    MapEntrance Map_DenTown_Block_3, d_se, f(-94, -304, 0)
    MapEntrance Map_DenTown_Block_4, d_sw, f(376, 38, 0)
    MapEntrance Map_DenTown_Center, d_sw, f(-258, -32, 0)
    MapEntrance Map_DenTown_Center, d_sw, f(-258, 106, 0)
    MapEntrance Map_DenTown_Center, d_se, f(30, -96, 0)
    MapEntrance Map_DenTown_Center, d_se, f(-106, -94, 0)

MapExitList_DenTown_Station:
    MapEntrance Map_DenTown_Block_3, d_se, f(-222, -118, 0)

MapExitList_DenTown_Block_1:
    MapEntrance Map_DenTown_Center, d_se, f(-112, -200, 0)
    MapEntrance Map_DenTown_Center, d_se, f(50, -240, 0)
    MapEntrance Map_DenTown_Block_1, d_sw, f(-226, -46, 0)
    MapEntrance Map_DenTown_Block_1, d_sw, f(-226, 90, 0)

MapExitList_DenTown_Block_2:
    MapEntrance Map_DenTown_Center, d_sw, f(240, -50, 0)
    MapEntrance Map_DenTown_Center, d_sw, f(208, 112, 0)
    MapEntrance Map_DenTown_Block_2, d_se, f(-8, -86, 0)
    MapEntrance Map_DenTown_Block_2, d_se, f(-146, -86, 0)
    MapEntrance Map_DenTown_Miyu_Antiques, d_nw, f(-40, 130, 0)

MapExitList_DenTown_Block_3:
    MapEntrance Map_DenTown_Center, d_nw, f(50, 316, 0)
    MapEntrance Map_DenTown_Center, d_nw, f(-126, 316, 0)
    MapEntrance Map_DenTown_Station, d_nw, f(-92, 84, 0)
    MapEntrance Map_DenTown_Block_3, d_se, f(62, -158, 0)
    MapEntrance Map_DenTown_Block_3, d_se, f(-74, -158, 0)
    MapEntrance Map_DenTown_Block_3, d_sw, f(126, 40, 0)
    MapEntrance Map_DenTown_Block_3, d_sw, f(126, -94, 0)

MapExitList_DenTown_Block_4:
    MapEntrance Map_DenTown_Center, d_ne, f(-316, 126, 0)
    MapEntrance Map_DenTown_Block_4, d_se, f(-62, 168, 0)
    MapEntrance Map_DenTown_Block_4, d_se, f(164, 168, 0)
    MapEntrance Map_DenTown_Summer_School, d_nw, f(68, 114, 0)

MapExitList_DenTown_Miyu_Antiques:
    MapEntrance Map_DenTown_Block_2, d_se, f(68, 8, 0)

MapExitList_DenTown_Summer_School:
    MapEntrance Map_DenTown_Block_4, d_se, f(-106, -116, 0)
