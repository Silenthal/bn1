#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label FlagSetup_WWW
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_Default
    .word FlagSetup_WWW_S3
    .word FlagSetup_Default
    .word FlagSetup_WWW_S5

global_label MapSetup_WWW
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_None
    .word MapSetup_WWW_S3
    .word MapSetup_None
    .word MapSetup_WWW_S5

MapSetup_WWW_S3:
    .word MapSetup_Default
    .word MapSetup_WWW_Wily_Lab_S3
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

MapSetup_WWW_S5:
    .word MapSetup_WWW_Base_S5
    .word MapSetup_WWW_Wily_Lab_S5
    .word MapSetup_WWW_Rocket_Hangar_S5
    .word MapSetup_WWW_Passage_1_S5
    .word MapSetup_WWW_Passage_2_S5
    .word MapSetup_WWW_Passage_3_S5

global_label EventHandler_WWW
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_None
    .word EventHandler_WWW_S3
    .word EventHandler_None
    .word EventHandler_WWW_S5

EventHandler_WWW_S3:
    .word EventHandler_Default
    .word EventHandler_WWW_Wily_Lab_S3
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default

EventHandler_WWW_S5:
    .word EventHandler_WWW_Base_S5
    .word EventHandler_WWW_Wily_Lab_S5
    .word EventHandler_WWW_Rocket_Hangar_S5
    .word EventHandler_WWW_Passage_1_S5
    .word EventHandler_WWW_Passage_2_S5
    .word EventHandler_WWW_Passage_3_S5

global_label MapDialogue_WWW
    .word MapDialogue_WWW_Base
    .word MapDialogue_WWW_Wily_Lab
    .word MapDialogue_WWW_Rocket_Hangar
    .word MapDialogue_WWW_Passage_1
    .word MapDialogue_WWW_Passage_2
    .word MapDialogue_WWW_Passage_3

MapDialogue_WWW_Base:
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

MapDialogue_WWW_Wily_Lab:
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE4
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

MapDialogue_WWW_Rocket_Hangar:
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

MapDialogue_WWW_Passage_1:
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

MapDialogue_WWW_Passage_2:
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

MapDialogue_WWW_Passage_3:
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


_ts FlagSetup_WWW_S3
    mov        pc,lr


_ts FlagSetup_WWW_S5
    mov        pc,lr

    .align 2, 0
