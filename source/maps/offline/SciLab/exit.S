#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_SciLab
    .word MapExitList_SciLab_Restaurant_Hallway
    .word MapExitList_SciLab_Restaurant
    .word MapExitList_SciLab_Power_Plant_Hallway
    .word MapExitList_SciLab_Power_Plant
    .word MapExitList_SciLab_Power_Plant_Control_Room
    .word MapExitList_SciLab_Generator_Room

MapExitList_SciLab_Restaurant_Hallway:
    MapEntrance Map_SciLab_Restaurant_Hallway, d_ne, f(44, 268, 0)
    MapEntrance Map_SciLab_Restaurant, d_sw, f(98, 236, 0)

MapExitList_SciLab_Restaurant:
    MapEntrance Map_SciLab_Restaurant_Hallway, d_ne, f(44, 268, 0)

MapExitList_SciLab_Power_Plant_Hallway:
    MapEntrance Map_SciLab_Power_Plant_Hallway, d_ne, f(44, 268, 0)
    MapEntrance Map_SciLab_Power_Plant, d_sw, f(256, 54, 0)

MapExitList_SciLab_Power_Plant:
    MapEntrance Map_SciLab_Power_Plant_Hallway, d_ne, f(44, 268, 0)
    MapEntrance Map_SciLab_Power_Plant_Control_Room, d_nw, f(-132, 154, 0)
    MapEntrance Map_SciLab_Generator_Room, d_nw, f(4, 162, 0)

MapExitList_SciLab_Power_Plant_Control_Room:
    MapEntrance Map_SciLab_Power_Plant, d_se, f(-334, 24, 0)

MapExitList_SciLab_Generator_Room:
    MapEntrance Map_SciLab_Power_Plant, d_se, f(-46, 24, 0)
