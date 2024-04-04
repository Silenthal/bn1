#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

mapExitList_ACDC:
    .word mapExitList_ACDC_Town
    .word mapExitList_ACDC_School_Gate
    .word mapExitList_ACDC_Lan_Living_Room
    .word mapExitList_ACDC_Lan_Room
    .word 0
    .word mapExitList_ACDC_Mayl_Living_Room
    .word mapExitList_ACDC_Mayl_Room
    .word mapExitList_ACDC_Dex_Room
    .word 0
    .word mapExitList_ACDC_Yai_Room
    .word 0
    .word mapExitList_ACDC_Higsby
    .word mapExitList_ACDC_Station
    .word mapExitList_ACDC_Secret_Station
mapExitList_ACDC_Town:
    MapEntrance Map_ACDC_School_Gate, d_ne, f(-240, 142, 0)
    MapEntrance Map_ACDC_Lan_Living_Room, d_nw, f(-84, 138, 0)
    MapEntrance Map_ACDC_Mayl_Living_Room, d_nw, f(-60, 178, 0)
    MapEntrance Map_ACDC_Dex_Room, d_ne, f(-112, 90, 0)
    MapEntrance Map_ACDC_Yai_Room, d_nw, f(-90, 112, 0)
    MapEntrance Map_ACDC_Higsby, d_ne, f(-134, 28, 0)
    MapEntrance Map_ACDC_Station, d_nw, f(-92, 84, 0)
mapExitList_ACDC_School_Gate:
    MapEntrance Map_ACDC_Town, d_sw, f(346, -90, 0)
    MapEntrance Map_School_Cross_Hallway, d_nw, f(-28, 84, 0)
    MapEntrance Map_ACDC_Secret_Station, d_nw, f(-86, 74, 0)
mapExitList_ACDC_Lan_Living_Room:
    MapEntrance Map_ACDC_Lan_Room, d_ne, f(-82, 44, 0)
    MapEntrance Map_ACDC_Town, d_se, f(-110, -132, 0)
mapExitList_ACDC_Lan_Room:
    MapEntrance Map_ACDC_Lan_Living_Room, d_sw, f(70, -4, 0)
mapExitList_ACDC_Mayl_Living_Room:
    MapEntrance Map_ACDC_Town, d_se, f(-252, -146, 0)
    MapEntrance Map_ACDC_Mayl_Room, d_ne, f(-106, 68, 0)
mapExitList_ACDC_Mayl_Room:
    MapEntrance Map_ACDC_Mayl_Living_Room, d_se, f(-154, 12, 0)
mapExitList_ACDC_Dex_Room:
    MapEntrance Map_ACDC_Town, d_se, f(-112, 218, 0)
mapExitList_ACDC_Yai_Room:
    MapEntrance Map_ACDC_Town, d_sw, f(80, -272, 0)
mapExitList_ACDC_Higsby:
    MapEntrance Map_ACDC_Town, d_se, f(202, -130, 0)
mapExitList_ACDC_Station:
    MapEntrance Map_ACDC_Town, d_se, f(-262, 218, 0)
mapExitList_ACDC_Secret_Station:
    MapEntrance Map_ACDC_School_Gate, d_n, f(-1, -53, 0)
