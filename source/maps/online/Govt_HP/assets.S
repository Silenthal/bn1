#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_804FB8C
    .word NPC_804FB98
    .word NPC_804FC7D
    .word 0xFF

    .align 2, 0

NPC_804FB98:
    a_init_basic_npc_talk -106, 38, 0, SP_Overworld_Prog, frame=7, dialog=0xA
    a_stop

NPC_804FBAD:
    a_init_bmd_at 184, -86, 0, dialog=0x14
    a_stop

NPC_804FBC7:
    a_init_bmd_at 106, -86, 0, dialog=0x16
    a_stop

NPC_804FBE1:
    a_init_bmd_at 184, 106, 0, dialog=0x18
    a_stop

NPC_804FBFB:
    a_init_bmd_at 106, 106, 0, dialog=0x1A
    a_stop

NPC_804FC15:
    a_init_bmd_at -100, -86, 0, dialog=0x1C
    a_stop

NPC_804FC2F:
    a_init_bmd_at -206, -86, 0, dialog=0x1E
    a_stop

NPC_804FC49:
    a_init_bmd_at -100, 106, 0, dialog=0x20
    a_stop

NPC_804FC63:
    a_init_bmd_at -206, 106, 0, dialog=0x22
    a_stop

NPC_804FC7D:
    a_create_bmd 234, -58, 0, FLAG_ITEM_GOVT_YUICHIRO_PC_KEYDAD, dialog=0x4
    .align 2, 0

global_label NPCList_804FCA4
    .word NPC_804FCB0
    .word NPC_804FCD4
    .word 0xFF

    .align 2, 0

NPC_804FCB0:
    a_create_bmd 200, 260, 0, FLAG_ITEM_GOVT_LUNCH_CART_COMP_KEYSAL, dialog=0x5
    .align 2, 0

NPC_804FCD4:
    a_create_gmd 200, -250, 0, FLAG_ITEM_GOVT_LUNCH_CART_COMP_RECOV120_A, dialog=0x6
global_label EntityAllocParams_804FCF8
    entity Effect, EFI_TeleportPortal, f(-198, 6, 0), 0x502
    entity Effect, EFI_TeleportPortal, f(218, 6, 0), 0x4A010502
    .word 0xFF

global_label EntityAllocParams_804FD24
    entity Effect, EFI_TeleportPortal, f(-118, -202, 0), 0x1000002
    entity Effect, EFI_TeleportPortal, f(154, -250, 0), 0x48010002
    .word 0xFF

