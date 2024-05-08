#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_Scilab
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_SciLab_S4
    .word FlagSetup_SciLab_S4

global_label MapSetup_SciLab
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_SciLab_S4
    .word MapSetup_SciLab_S5

MapSetup_SciLab_S4:
    .word MapSetup_SciLab_Restaurant_Hallway_S4
    .word MapSetup_SciLab_Restaurant_S4
    .word MapSetup_SciLab_Power_Plant_Hallway_S4
    .word MapSetup_SciLab_Power_Plant_S4
    .word MapSetup_SciLab_Power_Plant_Control_Room_S4
    .word MapSetup_SciLab_Generator_Room_S4

MapSetup_SciLab_S5:
    .word MapSetup_SciLab_Restaurant_Hallway_S5
    .word MapSetup_SciLab_Restaurant_S5
    .word MapSetup_SciLab_Power_Plant_Hallway_S5
    .word MapSetup_SciLab_Power_Plant_S5
    .word MapSetup_SciLab_Power_Plant_Control_Room_S5
    .word MapSetup_SciLab_Generator_Room_S5

global_label EventHandler_SciLab
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_SciLab_S4
    .word EventHandler_SciLab_S5

EventHandler_SciLab_S4:
    .word EventHandler_SciLab_Restaurant_Hallway_S4
    .word EventHandler_SciLab_Restaurant_S4
    .word EventHandler_SciLab_Power_Plant_Hallway_S4
    .word EventHandler_SciLab_Power_Plant_S4
    .word EventHandler_SciLab_Power_Plant_Control_Room_S4
    .word EventHandler_SciLab_Generator_Room_S4

EventHandler_SciLab_S5:
    .word EventHandler_SciLab_Restaurant_Hallway_S5
    .word EventHandler_SciLab_Restaurant_S5
    .word EventHandler_SciLab_Power_Plant_Hallway_S5
    .word EventHandler_SciLab_Power_Plant_S5
    .word EventHandler_SciLab_Power_Plant_Control_Room_S5
    .word EventHandler_SciLab_Generator_Room_S5

global_label MapDialogue_SciLab
    .word MapDialogue_SciLab_Restaurant_Hallway
    .word MapDialogue_SciLab_Restaurant
    .word MapDialogue_SciLab_Power_Plant_Hallway
    .word MapDialogue_SciLab_Power_Plant
    .word MapDialogue_SciLab_Power_Plant_Control_Room
    .word MapDialogue_SciLab_Generator_Room

MapDialogue_SciLab_Restaurant_Hallway:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

MapDialogue_SciLab_Restaurant:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

MapDialogue_SciLab_Power_Plant_Hallway:
    .byte 0xDC
    .byte 0xDD
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

MapDialogue_SciLab_Power_Plant:
    .byte 0xDC
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

MapDialogue_SciLab_Power_Plant_Control_Room:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

MapDialogue_SciLab_Generator_Room:
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1


_ts FlagSetup_SciLab_S4
    mov        pc,lr

    .align 2, 0
