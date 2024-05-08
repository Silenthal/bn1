#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label MapExitList_WWW
    .word MapExitList_WWW_Base
    .word MapExitList_WWW_Wily_Lab
    .word MapExitList_WWW_Rocket_Hangar
    .word MapExitList_WWW_Passage_1
    .word MapExitList_WWW_Passage_2
    .word MapExitList_WWW_Passage_3

MapExitList_WWW_Base:
    MapEntrance Map_ACDC_Secret_Station, d_sw, f(-26, 4, 0)
    MapEntrance Map_WWW_Passage_1, d_ne, f(-96, 204, 0)
    MapEntrance Map_WWW_Passage_2, d_ne, f(-96, 204, 0)
    MapEntrance Map_WWW_Passage_1, d_ne, f(-96, -148, 64)
    MapEntrance Map_WWW_Passage_3, d_ne, f(-96, 204, 0)
    MapEntrance Map_WWW_Passage_2, d_ne, f(-96, -148, 64)

MapExitList_WWW_Wily_Lab:
    MapEntrance Map_WWW_Passage_3, d_sw, f(-28, 204, 0)
    MapEntrance Map_WWW_Rocket_Hangar, d_ne, f(-232, 164, 0)

MapExitList_WWW_Rocket_Hangar:
    MapEntrance Map_WWW_Wily_Lab, d_sw, f(118, 88, 0)

MapExitList_WWW_Passage_1:
    MapEntrance Map_WWW_Base, d_sw, f(-98, 144, -64)
    MapEntrance Map_WWW_Base, d_sw, f(-50, -70, 0)

MapExitList_WWW_Passage_2:
    MapEntrance Map_WWW_Base, d_sw, f(-50, 154, 0)
    MapEntrance Map_WWW_Base, d_sw, f(-2, -70, 128)

MapExitList_WWW_Passage_3:
    MapEntrance Map_WWW_Base, d_sw, f(-2, 152, 128)
    MapEntrance Map_WWW_Wily_Lab, d_ne, f(-68, -34, 0)
