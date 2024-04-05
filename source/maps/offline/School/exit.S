#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label mapExitList_ACDC_Elementary
    .word mapExitList_School_Class_5A
    .word mapExitList_School_Class_5B
    .word mapExitList_School_Library
    .word mapExitList_School_2F_Hallway
    .word 0
    .word mapExitList_School_Class_1A
    .word mapExitList_School_Class_1B
    .word mapExitList_School_AV_Room
    .word mapExitList_School_Infirmary
    .word mapExitList_School_1F_Hallway
    .word 0
    .word mapExitList_School_Cross_Hallway
    .word mapExitList_School_Storage
    .word mapExitList_School_Staff_Lounge
    .word mapExitList_School_Staff_Lounge_Hallway


mapExitList_School_Class_5A:
    MapEntrance Map_School_2F_Hallway, d_se, f(-343, 24, 0)
    MapEntrance Map_School_2F_Hallway, d_se, f(-538, 24, 0)

global_label MapEntrance_ARRAY_08023de8
    MapEntrance Map_ACDC_Town, d_sw, f(346, -90, 0)
    MapEntrance Map_ACDC_Town, d_sw, f(346, -90, 0)

mapExitList_School_Class_5B:
    MapEntrance Map_School_2F_Hallway, d_se, f(-56, 24, 0)
    MapEntrance Map_School_2F_Hallway, d_se, f(-248, 24, 0)

mapExitList_School_Library:
    MapEntrance Map_School_2F_Hallway, d_se, f(136, 24, 0)

mapExitList_School_2F_Hallway:
    MapEntrance Map_School_Class_5A, d_nw, f(-126, 115, 0)
    MapEntrance Map_School_Class_5A, d_nw, f(66, 115, 0)
    MapEntrance Map_School_Class_5B, d_nw, f(-126, 115, 0)
    MapEntrance Map_School_Class_5B, d_nw, f(66, 115, 0)
    MapEntrance Map_School_1F_Hallway, d_se, f(24, 6, 0)
    MapEntrance Map_School_Library, d_nw, f(-150, 106, 0)

mapExitList_School_Class_1A:
    MapEntrance Map_School_1F_Hallway, d_se, f(-343, 24, 0)
    MapEntrance Map_School_1F_Hallway, d_se, f(-538, 24, 0)

mapExitList_School_Class_1B:
    MapEntrance Map_School_1F_Hallway, d_se, f(-56, 24, 0)
    MapEntrance Map_School_1F_Hallway, d_se, f(-248, 24, 0)

mapExitList_School_AV_Room:
    MapEntrance Map_School_1F_Hallway, d_se, f(328, 24, 0)
    MapEntrance Map_School_1F_Hallway, d_se, f(138, 24, 0)

mapExitList_School_Infirmary:
    MapEntrance Map_School_1F_Hallway, d_se, f(424, 24, 0)

mapExitList_School_1F_Hallway:
    MapEntrance Map_School_Class_1A, d_nw, f(-126, 115, 0)
    MapEntrance Map_School_Class_1A, d_nw, f(66, 115, 0)
    MapEntrance Map_School_Class_1B, d_nw, f(-126, 115, 0)
    MapEntrance Map_School_Class_1B, d_nw, f(66, 115, 0)
    MapEntrance Map_School_2F_Hallway, d_se, f(24, 6, 0)
    MapEntrance Map_School_AV_Room, d_nw, f(-118, 107, 0)
    MapEntrance Map_School_AV_Room, d_nw, f(90, 107, 0)
    MapEntrance Map_School_Infirmary, d_nw, f(-14, 66, 0)
    MapEntrance Map_School_Cross_Hallway, d_ne, f(-154, 30, 0)

mapExitList_School_Cross_Hallway:
    MapEntrance Map_ACDC_School_Gate, d_s, f(12, -68, 0)
    MapEntrance Map_School_1F_Hallway, d_sw, f(476, 50, 0)
    MapEntrance Map_School_Staff_Lounge_Hallway, d_ne, f(-285, 70, 0)

mapExitList_School_Storage:
    MapEntrance Map_School_Staff_Lounge_Hallway, d_se, f(-212, 49, 0)

mapExitList_School_Staff_Lounge:
    MapEntrance Map_School_Staff_Lounge_Hallway, d_se, f(76, 49, 0)

mapExitList_School_Staff_Lounge_Hallway:
    MapEntrance Map_School_Cross_Hallway, d_sw, f(72, 30, 0)
    MapEntrance Map_School_Storage, d_nw, f(6, 50, 0)
    MapEntrance Map_School_Staff_Lounge, d_nw, f(123, 118, 0)
