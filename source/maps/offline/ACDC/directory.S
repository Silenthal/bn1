#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label FlagSetup_ACDC
    .word FlagSetup_ACDC_S0
    .word FlagSetup_ACDC_S0
    .word FlagSetup_ACDC_S0
    .word FlagSetup_ACDC_S0
    .word FlagSetup_ACDC_S0
    .word FlagSetup_ACDC_S0

global_label MapSetup_ACDC
    .word MapSetup_ACDC_S0
    .word MapSetup_ACDC_S1
    .word MapSetup_ACDC_S2
    .word MapSetup_ACDC_S3
    .word MapSetup_ACDC_S4
    .word MapSetup_ACDC_S5

MapSetup_ACDC_S0:
    .word MapSetup_ACDC_Town_S0
    .word MapSetup_Default
    .word MapSetup_ACDC_Lan_Living_Room_S0
    .word MapSetup_ACDC_Lan_Room_S0
    .word MapSetup_Default
    .word MapSetup_ACDC_Mayl_Living_Room_S0
    .word MapSetup_ACDC_Mayl_Room_S0
    .word MapSetup_ACDC_Dex_Room_S0
    .word MapSetup_Default
    .word MapSetup_ACDC_Yai_Room_S0
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_ACDC_S1:
    .word MapSetup_ACDC_Town_S1
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_ACDC_S2:
    .word MapSetup_ACDC_Town_S2
    .word MapSetup_ACDC_School_Gate_S2
    .word MapSetup_ACDC_Lan_Living_Room_S2
    .word MapSetup_ACDC_Lan_Room_S2
    .word MapSetup_Default
    .word MapSetup_ACDC_Mayl_Living_Room_S2
    .word MapSetup_ACDC_Mayl_Room_S2
    .word MapSetup_ACDC_Dex_Room_S2
    .word MapSetup_Default
    .word MapSetup_ACDC_Yai_Room_S2
    .word MapSetup_Default
    .word MapSetup_ACDC_Higsbys_S2
    .word MapSetup_ACDC_Station_S2
    .word MapSetup_Default

MapSetup_ACDC_S3:
    .word MapSetup_ACDC_Town_S3
    .word MapSetup_ACDC_School_Gate_S3
    .word MapSetup_ACDC_Lan_Living_Room_S3
    .word MapSetup_ACDC_Lan_Room_S3
    .word MapSetup_Default
    .word MapSetup_ACDC_Mayl_Living_Room_S3
    .word MapSetup_Default
    .word MapSetup_ACDC_Dex_Room_S3
    .word MapSetup_Default
    .word MapSetup_ACDC_Yai_Room_S3
    .word MapSetup_Default
    .word MapSetup_ACDC_Higsbys_S3
    .word MapSetup_ACDC_Station_S3
    .word MapSetup_Default

MapSetup_ACDC_S4:
    .word MapSetup_ACDC_Town_S4
    .word MapSetup_ACDC_School_Gate_S4
    .word MapSetup_ACDC_Lan_Living_Room_S4
    .word MapSetup_ACDC_Lan_Room_S4
    .word MapSetup_Default
    .word MapSetup_ACDC_Mayl_Living_Room_S4
    .word MapSetup_ACDC_Mayl_Room_S4
    .word MapSetup_ACDC_Dex_Room_S4
    .word MapSetup_Default
    .word MapSetup_ACDC_Yai_Room_S4
    .word MapSetup_Default
    .word MapSetup_ACDC_Higsbys_S4
    .word MapSetup_ACDC_Station_S4
    .word MapSetup_Default

MapSetup_ACDC_S5:
    .word MapSetup_ACDC_Town_S5
    .word MapSetup_ACDC_School_Gate_S5
    .word MapSetup_ACDC_Lan_Living_Room_S5
    .word MapSetup_ACDC_Lan_Room_S5
    .word MapSetup_Default
    .word MapSetup_ACDC_Mayl_Living_Room_S4
    .word MapSetup_ACDC_Mayl_Room_S5
    .word MapSetup_ACDC_Dex_Room_S5
    .word MapSetup_Default
    .word MapSetup_ACDC_Yai_Room_S5
    .word MapSetup_Default
    .word MapSetup_ACDC_Higsbys_S5
    .word MapSetup_ACDC_Station_S5
    .word MapSetup_ACDC_Secret_Station_S5

global_label EventHandler_ACDC
    .word EventHandler_ACDC_S0
    .word EventHandler_ACDC_S1
    .word EventHandler_ACDC_S2
    .word EventHandler_ACDC_S3
    .word EventHandler_ACDC_S4
    .word EventHandler_ACDC_S5

EventHandler_ACDC_S0:
    .word EventHandler_ACDC_Town_S0
    .word EventHandler_Default
    .word EventHandler_ACDC_Lan_Living_Room_S0
    .word EventHandler_ACDC_Lan_Room_S0
    .word EventHandler_Default
    .word EventHandler_ACDC_Mayl_Living_Room_S0
    .word EventHandler_ACDC_Mayl_Room_S0
    .word EventHandler_ACDC_Dex_Room_S0
    .word EventHandler_Default
    .word EventHandler_ACDC_Yai_Room_S0
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_ACDC_S1:
    .word EventHandler_ACDC_Town_S1
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_ACDC_S2:
    .word EventHandler_ACDC_Town_S2
    .word EventHandler_ACDC_School_Gate_S2
    .word EventHandler_ACDC_Lan_Living_Room_S2
    .word EventHandler_ACDC_Lan_Room_S2
    .word EventHandler_Default
    .word EventHandler_ACDC_Mayl_Living_Room_S2
    .word EventHandler_ACDC_Mayl_Room_S2
    .word EventHandler_ACDC_Dex_Room_S2
    .word EventHandler_Default
    .word EventHandler_ACDC_Yai_Room_S2
    .word EventHandler_Default
    .word EventHandler_ACDC_Higsbys_S2
    .word EventHandler_ACDC_Station_S2
    .word EventHandler_Default

EventHandler_ACDC_S3:
    .word EventHandler_ACDC_Town_S3
    .word EventHandler_ACDC_School_Gate_S3
    .word EventHandler_ACDC_Lan_Living_Room_S3
    .word EventHandler_ACDC_Lan_Room_S3
    .word EventHandler_Default
    .word EventHandler_ACDC_Mayl_Living_Room_S3
    .word EventHandler_Default
    .word EventHandler_ACDC_Dex_Room_S3
    .word EventHandler_Default
    .word EventHandler_ACDC_Yai_Room_S3
    .word EventHandler_Default
    .word EventHandler_ACDC_Higsbys_S3
    .word EventHandler_ACDC_Station_S3
    .word EventHandler_Default

EventHandler_ACDC_S4:
    .word EventHandler_ACDC_Town_S4
    .word EventHandler_ACDC_School_Gate_S4
    .word EventHandler_ACDC_Lan_Living_Room_S4
    .word EventHandler_ACDC_Lan_Room_S4
    .word EventHandler_Default
    .word EventHandler_ACDC_Mayl_Living_Room_S4
    .word EventHandler_ACDC_Mayl_Room_S4
    .word EventHandler_ACDC_Dex_Room_S4
    .word EventHandler_Default
    .word EventHandler_ACDC_Yai_Room_S4
    .word EventHandler_Default
    .word EventHandler_ACDC_Higsbys_S4
    .word EventHandler_ACDC_Station_S4
    .word EventHandler_Default

EventHandler_ACDC_S5:
    .word EventHandler_ACDC_Town_S5
    .word EventHandler_ACDC_School_Gate_S5
    .word EventHandler_ACDC_Lan_Living_Room_S5
    .word EventHandler_ACDC_Lan_Room_S5
    .word EventHandler_Default
    .word EventHandler_ACDC_Mayl_Living_Room_S4
    .word EventHandler_ACDC_Mayl_Room_S5
    .word EventHandler_ACDC_Dex_Room_S5
    .word EventHandler_Default
    .word EventHandler_ACDC_Yai_Room_S5
    .word EventHandler_Default
    .word EventHandler_ACDC_Higsbys_S5
    .word EventHandler_ACDC_Station_S5
    .word EventHandler_ACDC_Secret_Station_S5

global_label MapDialogue_ACDC
    .word MapDialogue_ACDC_Town
    .word MapDialogue_ACDC_School_Gate
    .word MapDialogue_ACDC_Lan_Living_Room
    .word MapDialogue_ACDC_Lan_Room
    .word 0
    .word MapDialogue_ACDC_Mayl_Living_Room
    .word MapDialogue_ACDC_Mayl_Room
    .word MapDialogue_ACDC_Dex_Room
    .word 0
    .word MapDialogue_ACDC_Yai_Room
    .word 0
    .word MapDialogue_ACDC_Higsbys
    .word MapDialogue_ACDC_Station
    .word MapDialogue_ACDC_Secret_Station

MapDialogue_ACDC_Town:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xCC
    .byte 0xE3
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_ACDC_School_Gate:
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

MapDialogue_ACDC_Lan_Living_Room:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE4
    .byte 0xE6
    .byte 0xE6
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_ACDC_Lan_Room:
    .byte 0x0F
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
    .byte 0xFF

MapDialogue_ACDC_Mayl_Living_Room:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
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

MapDialogue_ACDC_Mayl_Room:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
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

MapDialogue_ACDC_Dex_Room:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
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

MapDialogue_ACDC_Yai_Room:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE4
    .byte 0xE5
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_ACDC_Higsbys:
    .byte 0xFF
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

MapDialogue_ACDC_Station:
    .byte 0xDC
    .byte 0xDD
    .byte 0x19
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

MapDialogue_ACDC_Secret_Station:
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
    .byte 0xFF
