#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_804FB8C
    .word NPC_804FB98
    .word NPC_804FC7D
    .word 0xFF

    .align 2, 0

NPC_804FB98:
    a_init
    a_set_dialog 0xA
    a_set_sprite SP_Overworld_Prog
    a_set_pos -106, 38
    a_set_sprite_frame 7
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
    a_jump_if_flag FLAG_ITEM_GOVT_YUICHIRO_PC_KEYDAD, L_804FCA0
    a_init_bmd_at 234, -58, 0, dialog=0x4
L_804FC97:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_GOVT_YUICHIRO_PC_KEYDAD, L_804FC97
L_804FCA0:
    a_destroy

    .align 2, 0

global_label NPCList_804FCA4
    .word NPC_804FCB0
    .word NPC_804FCD4
    .word 0xFF

    .align 2, 0

NPC_804FCB0:
    a_jump_if_flag FLAG_ITEM_GOVT_LUNCH_CART_COMP_KEYSAL, L_804FCD3
    a_init_bmd_at 200, 260, 0, dialog=0x5
L_804FCCA:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_GOVT_LUNCH_CART_COMP_KEYSAL, L_804FCCA
L_804FCD3:
    a_destroy

    .align 2, 0

NPC_804FCD4:
    a_jump_if_flag FLAG_ITEM_GOVT_LUNCH_CART_COMP_RECOV120_A, L_804FCF7
    a_init_gmd_at 200, -250, 0, dialog=0x6
L_804FCEE:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_GOVT_LUNCH_CART_COMP_RECOV120_A, L_804FCEE
L_804FCF7:
    a_destroy

global_label EntityAllocParams_804FCF8
    entity Effect, 0x16, f(-198, 6, 0), 0x502
    entity Effect, 0x16, f(218, 6, 0), 0x4A010502
    .word 0xFF

global_label EntityAllocParams_804FD24
    entity Effect, 0x16, f(-118, -202, 0), 0x1000002
    entity Effect, 0x16, f(154, -250, 0), 0x48010002
    .word 0xFF

