#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_Govt
    .word MapExitList_Govt_Complex_Front
    .word MapExitList_Govt_Complex_Station
    .word MapExitList_Govt_Waterworks_Lobby
    .word MapExitList_Govt_SciLab_Lobby
    .word MapExitList_Govt_Complex_Hallway
    .word MapExitList_Govt_Yuichiro_Lab
    .word MapExitList_Govt_Waterworks_Office
    .word MapExitList_Govt_Waterworks_Control_Room
    .word 0
    .word MapExitList_Govt_Waterworks_Pump_Room
    .word 0
    .word MapExitList_Govt_Waterworks_Purification_Room

MapExitList_Govt_Complex_Front:
    MapEntrance Map_Govt_Complex_Station, d_nw, f(-92, 84, 0)
    MapEntrance Map_Govt_Waterworks_Lobby, d_ne, f(-360, 120, 0)

MapExitList_Govt_Complex_Station:
    MapEntrance Map_Govt_Complex_Front, d_se, f(-262, -20, 0)

MapExitList_Govt_Waterworks_Lobby:
    MapEntrance Map_Govt_Complex_Front, d_se, f(110, -230, 0)
    MapEntrance Map_Govt_Complex_Hallway, d_se, f(-50, -148, 0)
    MapEntrance Map_Govt_Waterworks_Office, d_sw, f(104, 182, 0)

MapExitList_Govt_SciLab_Lobby:
    MapEntrance Map_Govt_Complex_Hallway, d_sw, f(160, 60, 0)
    MapEntrance Map_Govt_Yuichiro_Lab, d_se, f(-124, -190, 0)

MapExitList_Govt_Complex_Hallway:
    MapEntrance Map_Govt_Waterworks_Lobby, d_nw, f(88, 308, 0)
    MapEntrance Map_Govt_SciLab_Lobby, d_ne, f(-276, -118, 0)

MapExitList_Govt_Yuichiro_Lab:
    MapEntrance Map_Govt_SciLab_Lobby, d_se, f(-204, -174, 0)

MapExitList_Govt_Waterworks_Office:
    MapEntrance Map_Govt_Waterworks_Lobby, d_sw, f(144, 240, 0)
    MapEntrance Map_Govt_Waterworks_Control_Room, d_nw, f(-124, 188, 0)

MapExitList_Govt_Waterworks_Control_Room:
    MapEntrance Map_Govt_Waterworks_Office, d_se, f(-278, -24, 0)
    MapEntrance Map_Govt_Waterworks_Purification_Room, d_ne, f(-266, 28, 0)
    MapEntrance Map_Govt_Waterworks_Pump_Room, d_nw, f(-100, 178, 0)

MapExitList_Govt_Waterworks_Pump_Room:
    MapEntrance Map_Govt_Waterworks_Control_Room, d_se, f(-126, -248, 0)

MapExitList_Govt_Waterworks_Purification_Room:
    MapEntrance Map_Govt_Waterworks_Control_Room, d_sw, f(200, 140, 0)
