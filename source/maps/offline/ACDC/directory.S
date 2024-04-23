#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

flagSetup_ACDC_Town:
    .word 0x802a9c5 @ FlagSetup_ACDC_S0
    .word 0x802a9c5 @ FlagSetup_ACDC_S0
    .word 0x802a9c5 @ FlagSetup_ACDC_S0
    .word 0x802a9c5 @ FlagSetup_ACDC_S0
    .word 0x802a9c5 @ FlagSetup_ACDC_S0
    .word 0x802a9c5 @ FlagSetup_ACDC_S0
mapSetup_ACDCTown:
    .word 0x802a624 @ mapSetup_ACDC_Town_S0
    .word 0x802a65c @ mapSetup_ACDC_Town_S1
    .word 0x802a694 @ mapSetup_ACDC_Town_S2
    .word 0x802a6cc @ mapSetup_ACDC_Town_S3
    .word 0x802a704 @ mapSetup_ACDC_Town_S4
    .word 0x802a73c @ mapSetup_ACDC_Town_S5
mapSetup_ACDC_Town_S0:
    .word 0x802a9c9 @ MapSetup_ACDC_Town_S0
    .word 0x8018605 @ MapSetup_Default
    .word 0x802bf8d @ MapSetup_ACDC_Lan_Living_Room_S0
    .word 0x802ca51 @ MapSetup_ACDC_Lan_Room_S0
    .word 0x8018605 @ MapSetup_Default
    .word 0x802d545 @ MapSetup_ACDC_Mayl_Living_Room_S0
    .word 0x802d995 @ MapSetup_ACDC_Mayl_Room_S0
    .word 0x802dd09 @ MapSetup_ACDC_Dex_Room_S0
    .word 0x8018605 @ MapSetup_Default
    .word 0x802e415 @ MapSetup_ACDC_Yai_Room_S0
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
mapSetup_ACDC_Town_S1:
    .word 0x802ac59 @ MapSetup_ACDC_Town_S1
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
    .word 0x8018605 @ MapSetup_Default
mapSetup_ACDC_Town_S2:
    .word 0x802ada9 @ MapSetup_ACDC_Town_S2
    .word 0x802b8e9 @ MapSetup_ACDC_School_Gate_S2
    .word 0x802c4f5 @ MapSetup_ACDC_Lan_Living_Room_S2
    .word 0x802cf89 @ MapSetup_ACDC_Lan_Room_S2
    .word 0x8018605 @ MapSetup_Default
    .word 0x802d641 @ MapSetup_ACDC_Mayl_Living_Room_S2
    .word 0x802da39 @ MapSetup_ACDC_Mayl_Room_S2
    .word 0x802de61 @ MapSetup_ACDC_Dex_Room_S2
    .word 0x8018605 @ MapSetup_Default
    .word 0x802e5ad @ MapSetup_ACDC_Yai_Room_S2
    .word 0x8018605 @ MapSetup_Default
    .word 0x802ea3d @ MapSetup_ACDC_Higsby_S2
    .word 0x802f175 @ MapSetup_ACDC_Station_S2
    .word 0x8018605 @ MapSetup_Default
mapSetup_ACDC_Town_S3:
    .word 0x802b369 @ MapSetup_ACDC_Town_S3
    .word 0x802bbd1 @ MapSetup_ACDC_School_Gate_S3
    .word 0x802c6f1 @ MapSetup_ACDC_Lan_Living_Room_S3
    .word 0x802d225 @ MapSetup_ACDC_Lan_Room_S3
    .word 0x8018605 @ MapSetup_Default
    .word 0x802d875 @ MapSetup_ACDC_Mayl_Living_Room_S3
    .word 0x8018605 @ MapSetup_Default
    .word 0x802e0cd @ MapSetup_ACDC_Dex_Room_S3
    .word 0x8018605 @ MapSetup_Default
    .word 0x802e7bd @ MapSetup_ACDC_Yai_Room_S3
    .word 0x8018605 @ MapSetup_Default
    .word 0x802ece1 @ MapSetup_ACDC_Higsby_S3
    .word 0x802f4fd @ MapSetup_ACDC_Station_S3
    .word 0x8018605 @ MapSetup_Default
mapSetup_ACDC_Town_S4:
    .word 0x802b4e1 @ MapSetup_ACDC_Town_S4
    .word 0x802bca9 @ MapSetup_ACDC_School_Gate_S4
    .word 0x802c7d1 @ MapSetup_ACDC_Lan_Living_Room_S4
    .word 0x802d481 @ MapSetup_ACDC_Lan_Room_S4
    .word 0x8018605 @ MapSetup_Default
    .word 0x802d8e9 @ MapSetup_ACDC_Mayl_Living_Room_S4
    .word 0x802db59 @ MapSetup_ACDC_Mayl_Room_S4
    .word 0x802e1d5 @ MapSetup_ACDC_Dex_Room_S4
    .word 0x8018605 @ MapSetup_Default
    .word 0x802e87d @ MapSetup_ACDC_Yai_Room_S4
    .word 0x8018605 @ MapSetup_Default
    .word 0x802ee35 @ MapSetup_ACDC_Higsby_S4
    .word 0x802f641 @ MapSetup_ACDC_Station_S4
    .word 0x8018605 @ MapSetup_Default
mapSetup_ACDC_Town_S5:
    .word 0x802b635 @ MapSetup_ACDC_Town_S5
    .word 0x802bd81 @ MapSetup_ACDC_School_Gate_S5
    .word 0x802c8d9 @ MapSetup_ACDC_Lan_Living_Room_S5
    .word 0x802d2b1 @ MapSetup_ACDC_Lan_Room_S5
    .word 0x8018605 @ MapSetup_Default
    .word 0x802d8e9 @ MapSetup_ACDC_Mayl_Living_Room_S4
    .word 0x802dc11 @ MapSetup_ACDC_Mayl_Room_S5
    .word 0x802e2d5 @ MapSetup_ACDC_Dex_Room_S5
    .word 0x8018605 @ MapSetup_Default
    .word 0x802e93d @ MapSetup_ACDC_Yai_Room_S5
    .word 0x8018605 @ MapSetup_Default
    .word 0x802ef81 @ MapSetup_ACDC_Higsby_S5
    .word 0x802f74d @ MapSetup_ACDC_Station_S5
    .word 0x802f855 @ MapSetup_ACDC_Secret_Station_S5
eventHandler_ACDC_Town:
    .word 0x802a78c @ eventHandler_ACDC_Town_S0
    .word 0x802a7c4 @ eventHandler_ACDC_Town_S1
    .word 0x802a7fc @ eventHandler_ACDC_Town_S2
    .word 0x802a834 @ eventHandler_ACDC_Town_S3
    .word 0x802a86c @ eventHandler_ACDC_Town_S4
    .word 0x802a8a4 @ eventHandler_ACDC_Town_S5
eventHandler_ACDC_Town_S0:
    .word 0x802aa29 @ EventHandler_ACDC_Town_S0
    .word 0x8018621 @ EventHandler_Default
    .word 0x802bfd9 @ EventHandler_ACDC_Lan_Living_Room_S0
    .word 0x802ca8d @ EventHandler_ACDC_Lan_Room_S0
    .word 0x8018621 @ EventHandler_Default
    .word 0x802d571 @ EventHandler_ACDC_Mayl_Living_Room_S0
    .word 0x802d9c1 @ EventHandler_ACDC_Mayl_Room_S0
    .word 0x802dd41 @ EventHandler_ACDC_Dex_Room_S0
    .word 0x8018621 @ EventHandler_Default
    .word 0x802e441 @ EventHandler_ACDC_Yai_Room_S0
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
eventHandler_ACDC_Town_S1:
    .word 0x802ac9d @ EventHandler_ACDC_Town_S1
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
    .word 0x8018621 @ EventHandler_Default
eventHandler_ACDC_Town_S2:
    .word 0x802aed5 @ EventHandler_ACDC_Town_S2
    .word 0x802b94d @ EventHandler_ACDC_School_Gate_S2
    .word 0x802c569 @ EventHandler_ACDC_Lan_Living_Room_S2
    .word 0x802cff1 @ EventHandler_ACDC_Lan_Room_S2
    .word 0x8018621 @ EventHandler_Default
    .word 0x802d699 @ EventHandler_ACDC_Mayl_Living_Room_S2
    .word 0x802da91 @ EventHandler_ACDC_Mayl_Room_S2
    .word 0x802dec5 @ EventHandler_ACDC_Dex_Room_S2
    .word 0x8018621 @ EventHandler_Default
    .word 0x802e605 @ EventHandler_ACDC_Yai_Room_S2
    .word 0x8018621 @ EventHandler_Default
    .word 0x802ea99 @ EventHandler_ACDC_Higsby_S2
    .word 0x802f1cd @ EventHandler_ACDC_Station_S2
    .word 0x8018621 @ EventHandler_Default
eventHandler_ACDC_Town_S3:
    .word 0x802b3ad @ EventHandler_ACDC_Town_S3
    .word 0x802bc0d @ EventHandler_ACDC_School_Gate_S3
    .word 0x802c73d @ EventHandler_ACDC_Lan_Living_Room_S3
    .word 0x802d245 @ EventHandler_ACDC_Lan_Room_S3
    .word 0x8018621 @ EventHandler_Default
    .word 0x802d889 @ EventHandler_ACDC_Mayl_Living_Room_S3
    .word 0x8018621 @ EventHandler_Default
    .word 0x802e109 @ EventHandler_ACDC_Dex_Room_S3
    .word 0x8018621 @ EventHandler_Default
    .word 0x802e7ed @ EventHandler_ACDC_Yai_Room_S3
    .word 0x8018621 @ EventHandler_Default
    .word 0x802ed15 @ EventHandler_ACDC_Higsby_S3
    .word 0x802f52d @ EventHandler_ACDC_Station_S3
    .word 0x8018621 @ EventHandler_Default
eventHandler_ACDC_Town_S4:
    .word 0x802b551 @ EventHandler_ACDC_Town_S4
    .word 0x802bce5 @ EventHandler_ACDC_School_Gate_S4
    .word 0x802c81d @ EventHandler_ACDC_Lan_Living_Room_S4
    .word 0x802d4bd @ EventHandler_ACDC_Lan_Room_S4
    .word 0x8018621 @ EventHandler_Default
    .word 0x802d919 @ EventHandler_ACDC_Mayl_Living_Room_S4
    .word 0x802db89 @ EventHandler_ACDC_Mayl_Room_S4
    .word 0x802e211 @ EventHandler_ACDC_Dex_Room_S4
    .word 0x8018621 @ EventHandler_Default
    .word 0x802e8ad @ EventHandler_ACDC_Yai_Room_S4
    .word 0x8018621 @ EventHandler_Default
    .word 0x802ee69 @ EventHandler_ACDC_Higsby_S4
    .word 0x802f671 @ EventHandler_ACDC_Station_S4
    .word 0x8018621 @ EventHandler_Default
eventHandler_ACDC_Town_S5:
    .word 0x802b699 @ EventHandler_ACDC_Town_S5
    .word 0x802bdb5 @ EventHandler_ACDC_School_Gate_S5
    .word 0x802c925 @ EventHandler_ACDC_Lan_Living_Room_S5
    .word 0x802d2ed @ EventHandler_ACDC_Lan_Room_S5
    .word 0x8018621 @ EventHandler_Default
    .word 0x802d919 @ EventHandler_ACDC_Mayl_Living_Room_S4
    .word 0x802dc41 @ EventHandler_ACDC_Mayl_Room_S5
    .word 0x802e311 @ EventHandler_ACDC_Dex_Room_S5
    .word 0x8018621 @ EventHandler_Default
    .word 0x802e96d @ EventHandler_ACDC_Yai_Room_S5
    .word 0x8018621 @ EventHandler_Default
    .word 0x802efb5 @ EventHandler_ACDC_Higsby_S5
    .word 0x802f77d @ EventHandler_ACDC_Station_S5
    .word 0x802f889 @ EventHandler_ACDC_Secret_Station_S5
mapDialogue_ACDC:
    .word 0x802a914 @ mapDialogue_ACDC_Town
    .word 0x802a924 @ mapDialogue_ACDC_School_Gate
    .word 0x802a934 @ mapDialogue_ACDC_Lan_Living_Room
    .word 0x802a944 @ mapDialogue_ACDC_Lan_Room
    .word 0x0000000 @ 00000000
    .word 0x802a954 @ mapDialogue_ACDC_Mayl_Living_Room
    .word 0x802a964 @ mapDialogue_ACDC_Mayl_Room
    .word 0x802a974 @ mapDialogue_ACDC_Dex_Room
    .word 0x0000000 @ 00000000
    .word 0x802a984 @ mapDialogue_ACDC_Yai_Room
    .word 0x0000000 @ 00000000
    .word 0x802a994 @ mapDialogue_ACDC_Higsby
    .word 0x802a9a4 @ mapDialogue_ACDC_Station
    .word 0x802a9b4 @ mapDialogue_ACDC_Secret_Station
mapDialogue_ACDC_Town:
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
mapDialogue_ACDC_School_Gate:
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
mapDialogue_ACDC_Lan_Living_Room:
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
mapDialogue_ACDC_Lan_Room:
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
mapDialogue_ACDC_Mayl_Living_Room:
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
mapDialogue_ACDC_Mayl_Room:
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
mapDialogue_ACDC_Dex_Room:
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
mapDialogue_ACDC_Yai_Room:
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
mapDialogue_ACDC_Higsby:
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
mapDialogue_ACDC_Station:
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
mapDialogue_ACDC_Secret_Station:
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
