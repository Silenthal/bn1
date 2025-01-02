#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_Govt
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Govt_S2
    .word FlagSetup_Govt_S2
    .word FlagSetup_Govt_S2
    .word FlagSetup_Govt_S2

global_label MapSetup_Govt
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_Govt_S2
    .word MapSetup_Govt_S3
    .word MapSetup_Govt_S4
    .word MapSetup_Govt_S5

MapSetup_Govt_S2:
    .word MapSetup_Govt_Complex_Front_S2
    .word MapSetup_Govt_Complex_Station_S2
    .word MapSetup_Govt_Waterworks_Lobby_S2
    .word MapSetup_Govt_SciLab_Lobby_S2
    .word MapSetup_Govt_Complex_Hallway_S2
    .word MapSetup_Govt_Yuichiro_Lab_S2
    .word MapSetup_Govt_Waterworks_Office_S2
    .word MapSetup_Govt_Waterworks_Control_Room_S2
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Pump_Room_S2
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Purification_Room_S2

MapSetup_Govt_S3:
    .word MapSetup_Govt_Complex_Front_S3
    .word MapSetup_Govt_Complex_Station_S3
    .word MapSetup_Govt_Waterworks_Lobby_S3
    .word MapSetup_Govt_SciLab_Lobby_S3
    .word MapSetup_Govt_Complex_Hallway_S3
    .word MapSetup_Govt_Yuichiro_Lab_S3
    .word MapSetup_Govt_Waterworks_Office_S3
    .word MapSetup_Govt_Waterworks_Control_Room_S3
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Pump_Room_S3
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Purification_Room_S3

MapSetup_Govt_S4:
    .word MapSetup_Govt_Complex_Front_S4
    .word MapSetup_Govt_Complex_Station_S4
    .word MapSetup_Govt_Waterworks_Lobby_S4
    .word MapSetup_Govt_SciLab_Lobby_S4
    .word MapSetup_Govt_Complex_Hallway_S3
    .word MapSetup_Govt_Yuichiro_Lab_S4
    .word MapSetup_Govt_Waterworks_Office_S3
    .word MapSetup_Govt_Waterworks_Control_Room_S4
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Pump_Room_S3
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Purification_Room_S3

MapSetup_Govt_S5:
    .word MapSetup_Govt_Complex_Front_S5
    .word MapSetup_Govt_Complex_Station_S5
    .word MapSetup_Govt_Waterworks_Lobby_S5
    .word MapSetup_Govt_SciLab_Lobby_S5
    .word MapSetup_Govt_Complex_Hallway_S3
    .word MapSetup_Govt_Yuichiro_Lab_S5
    .word MapSetup_Govt_Waterworks_Office_S5
    .word MapSetup_Govt_Waterworks_Control_Room_S5
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Pump_Room_S5
    .word MapSetup_Default
    .word MapSetup_Govt_Waterworks_Purification_Room_S5

global_label EventHandler_Govt
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_Govt_S2
    .word EventHandler_Govt_S3
    .word EventHandler_Govt_S4
    .word EventHandler_Govt_S5

EventHandler_Govt_S2:
    .word EventHandler_Govt_Complex_Front_S2
    .word EventHandler_Govt_Complex_Station_S2
    .word EventHandler_Govt_Waterworks_Lobby_S2
    .word EventHandler_Govt_SciLab_Lobby_S2
    .word EventHandler_Govt_Complex_Hallway_S2
    .word EventHandler_Govt_Yuichiro_Lab_S2
    .word EventHandler_Govt_Waterworks_Office_S2
    .word EventHandler_Govt_Waterworks_Control_Room_S2
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Pump_Room_S2
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Purification_Room_S2

EventHandler_Govt_S3:
    .word EventHandler_Govt_Complex_Front_S3
    .word EventHandler_Govt_Complex_Station_S3
    .word EventHandler_Govt_Waterworks_Lobby_S3
    .word EventHandler_Govt_SciLab_Lobby_S3
    .word EventHandler_Govt_Complex_Hallway_S3
    .word EventHandler_Govt_Yuichiro_Lab_S3
    .word EventHandler_Govt_Waterworks_Office_S3
    .word EventHandler_Govt_Waterworks_Control_Room_S3
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Pump_Room_S3
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Purification_Room_S3

EventHandler_Govt_S4:
    .word EventHandler_Govt_Complex_Front_S4
    .word EventHandler_Govt_Complex_Station_S4
    .word EventHandler_Govt_Waterworks_Lobby_S4
    .word EventHandler_Govt_SciLab_Lobby_S4
    .word EventHandler_Govt_Complex_Hallway_S3
    .word EventHandler_Govt_Yuichiro_Lab_S4
    .word EventHandler_Govt_Waterworks_Office_S3
    .word EventHandler_Govt_Waterworks_Control_Room_S4
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Pump_Room_S3
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Purification_Room_S3

EventHandler_Govt_S5:
    .word EventHandler_Govt_Complex_Front_S5
    .word EventHandler_Govt_Complex_Station_S5
    .word EventHandler_Govt_Waterworks_Lobby_S5
    .word EventHandler_Govt_SciLab_Lobby_S5
    .word EventHandler_Govt_Complex_Hallway_S3
    .word EventHandler_Govt_Yuichiro_Lab_S5
    .word EventHandler_Govt_Waterworks_Office_S5
    .word EventHandler_Govt_Waterworks_Control_Room_S5
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Pump_Room_S5
    .word EventHandler_Default
    .word EventHandler_Govt_Waterworks_Purification_Room_S5

global_label MapDialogue_Govt
    .word MapDialogue_Govt_Complex_Front
    .word MapDialogue_Govt_Complex_Station
    .word MapDialogue_Govt_Waterworks_Lobby
    .word MapDialogue_Govt_SciLab_Lobby
    .word 0
    .word MapDialogue_Govt_Yuichiro_Lab
    .word MapDialogue_Govt_Waterworks_Office
    .word MapDialogue_Govt_Waterworks_Control_Room
    .word 0
    .word MapDialogue_Govt_Waterworks_Pump_Room
    .word 0
    .word MapDialogue_Govt_Waterworks_Purification_Room

MapDialogue_Govt_Complex_Front:
    .byte 0xDC
    .byte 0xDD
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_Govt_Complex_Station:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_Govt_Waterworks_Lobby:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_Govt_SciLab_Lobby:
    .byte 0xDC
    .byte 0xDE
    .byte 0xFF
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE5
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_Govt_Yuichiro_Lab:
    .byte 0xDC
    .byte 0xFF
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE4
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_Govt_Waterworks_Office:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_Govt_Waterworks_Control_Room:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE1
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_Govt_Waterworks_Pump_Room:
    .byte 0xDC
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_Govt_Waterworks_Purification_Room:
    .byte 0xDC
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF


_ts FlagSetup_Govt_S2
    push       {lr}
    Flag_ClearBase 0x2E
    pop        {pc}

    .align 2, 0
