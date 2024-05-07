#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_DenTown
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_DenTown_S3
    .word FlagSetup_DenTown_S3
    .word FlagSetup_DenTown_S3

global_label MapSetup_DenTown
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_DenTown_S3
    .word MapSetup_DenTown_S4
    .word MapSetup_DenTown_S5

MapSetup_DenTown_S3:
    .word MapSetup_DenTown_Center_S3
    .word MapSetup_DenTown_Station_S3
    .word MapSetup_DenTown_Block_1_S3
    .word MapSetup_DenTown_Block_2_S3
    .word MapSetup_DenTown_Block_3_S3
    .word MapSetup_DenTown_Block_4_S3
    .word MapSetup_DenTown_Miyu_Antiques_S3
    .word MapSetup_DenTown_Summer_School_S3

MapSetup_DenTown_S4:
    .word MapSetup_DenTown_Center_S4
    .word MapSetup_DenTown_Station_S3
    .word MapSetup_DenTown_Block_1_S4
    .word MapSetup_DenTown_Block_2_S4
    .word MapSetup_DenTown_Block_3_S4
    .word MapSetup_DenTown_Block_4_S4
    .word MapSetup_DenTown_Miyu_Antiques_S4
    .word MapSetup_DenTown_Summer_School_S4

MapSetup_DenTown_S5:
    .word MapSetup_DenTown_Center_S5
    .word MapSetup_DenTown_Station_S5
    .word MapSetup_DenTown_Block_1_S5
    .word MapSetup_DenTown_Block_2_S5
    .word MapSetup_DenTown_Block_3_S5
    .word MapSetup_DenTown_Block_4_S5
    .word MapSetup_DenTown_Miyu_Antiques_S5
    .word MapSetup_DenTown_Summer_School_S5

global_label EventHandler_DenTown
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_DenTown_S3
    .word EventHandler_DenTown_S4
    .word EventHandler_DenTown_S5

EventHandler_DenTown_S3:
    .word EventHandler_DenTown_Center_S3
    .word EventHandler_DenTown_Station_S3
    .word EventHandler_DenTown_Block_1_S3
    .word EventHandler_DenTown_Block_2_S3
    .word EventHandler_DenTown_Block_3_S3
    .word EventHandler_DenTown_Block_4_S3
    .word EventHandler_DenTown_Miyu_Antiques_S3
    .word EventHandler_DenTown_Summer_School_S3

EventHandler_DenTown_S4:
    .word EventHandler_DenTown_Center_S4
    .word EventHandler_DenTown_Station_S3
    .word EventHandler_DenTown_Block_1_S4
    .word EventHandler_DenTown_Block_2_S4
    .word EventHandler_DenTown_Block_3_S4
    .word EventHandler_DenTown_Block_4_S4
    .word EventHandler_DenTown_Miyu_Antiques_S4
    .word EventHandler_DenTown_Summer_School_S4

EventHandler_DenTown_S5:
    .word EventHandler_DenTown_Center_S5
    .word EventHandler_DenTown_Station_S5
    .word EventHandler_DenTown_Block_1_S5
    .word EventHandler_DenTown_Block_2_S5
    .word EventHandler_DenTown_Block_3_S5
    .word EventHandler_DenTown_Block_4_S5
    .word EventHandler_DenTown_Miyu_Antiques_S5
    .word EventHandler_DenTown_Summer_School_S5

global_label MapDialogue_DenTown
    .word MapDialogue_DenTown_Center
    .word MapDialogue_DenTown_Station
    .word MapDialogue_DenTown_Block_1
    .word MapDialogue_DenTown_Block_2
    .word MapDialogue_DenTown_Block_3
    .word MapDialogue_DenTown_Block_4
    .word MapDialogue_DenTown_Miyu_Antiques
    .word MapDialogue_DenTown_Summer_School

MapDialogue_DenTown_Center:
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

MapDialogue_DenTown_Station:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
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

MapDialogue_DenTown_Block_1:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
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

MapDialogue_DenTown_Block_2:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
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

MapDialogue_DenTown_Block_3:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
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

MapDialogue_DenTown_Block_4:
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

MapDialogue_DenTown_Miyu_Antiques:
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

MapDialogue_DenTown_Summer_School:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE1
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


_ts FlagSetup_DenTown_S3
    mov        pc,lr

    .align 2, 0
