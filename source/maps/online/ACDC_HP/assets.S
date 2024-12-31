#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_804F47C
    .word NPC_804F4B5
    .word 0xFF

global_label NPCList_804F484
    .word NPC_804F48C
    .word 0xFF

    .align 2, 0

NPC_804F48C:
    a_init
    a_set_sprite SP_Overworld_Roll
    a_set_pos 82, -2
    a_set_sprite_frame 5
L_804F498:
    a_jump_if_flag 0x92, L_804F4A6
    a_wait 1
    a_jump L_804F498
L_804F4A6:
    a_move_f 10, d_sw, 8, 14
    a_set_sprite_frame 5
    a_stop

NPC_804F4B5:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos -42, -36
L_804F4C1:
    a_wait_f 3, 60
    a_move_f 8, d_ne, 8, 10
    a_wait_f 3, 60
    a_move_f 10, d_sw, 8, 10
    a_jump L_804F4C1

    .align 2, 0

global_label NPCList_804F4DC
    .word NPC_804F4E8
    .word NPC_804F50C
    .word 0xFF

    .align 2, 0

NPC_804F4E8:
    a_jump_if_flag FLAG_ITEM_ACDC_MAYL_PC_KEYMAYL, L_804F50B
    a_init_bmd_at 110, 250, 128, dialog=0x5
L_804F502:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_MAYL_PC_KEYMAYL, L_804F502
L_804F50B:
    a_destroy

    .align 2, 0

NPC_804F50C:
    a_jump_if_flag FLAG_ITEM_ACDC_MAYL_PC_RECOV50_L, L_804F52F
    a_init_gmd_at 36, 250, 128, dialog=0x6
L_804F526:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_MAYL_PC_RECOV50_L, L_804F526
L_804F52F:
    a_destroy

global_label NPCList_804F530
    .word NPC_804F53C
    .word NPC_804F551
    .word 0xFF

    .align 2, 0

NPC_804F53C:
    a_init
    a_set_dialog 0x14
    a_set_sprite SP_Overworld_Roll
    a_set_pos 76, 240, 128
    a_set_sprite_frame 3
    a_stop

NPC_804F551:
    a_jump_if_flag FLAG_ITEM_ACDC_MAYL_PC_RECOV50_L, L_804F574
    a_init_gmd_at 36, 250, 128, dialog=0x6
L_804F56B:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_MAYL_PC_RECOV50_L, L_804F56B
L_804F574:
    a_destroy

    .align 2, 0

global_label NPCList_804F578
    .word NPC_804F588
    .word NPC_804F5AC
    .word NPC_804F5D0
    .word 0xFF

    .align 2, 0

NPC_804F588:
    a_jump_if_flag FLAG_ITEM_ACDC_YAI_PC_KEYYAI, L_804F5AB
    a_init_bmd_at 18, -38, 0, dialog=0x5
L_804F5A2:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_YAI_PC_KEYYAI, L_804F5A2
L_804F5AB:
    a_destroy

    .align 2, 0

NPC_804F5AC:
    a_jump_if_flag FLAG_ITEM_ACDC_YAI_PC_RECOV30_L, L_804F5CF
    a_init_gmd_at -174, -38, 0, dialog=0x6
L_804F5C6:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_YAI_PC_RECOV30_L, L_804F5C6
L_804F5CF:
    a_destroy

    .align 2, 0

NPC_804F5D0:
    a_jump_if_flag 0x0, L_804F5FA
    a_jump_if_not_flag 0xE2, L_804F5FA
    a_jump_if_flag 0x99, L_804F5FA
    a_init
    a_set_dialog 0xF
    a_set_sprite SP_Overworld_Glyde
    a_set_pos 50, -50
    a_set_sprite_frame 5
    a_stop
L_804F5FA:
    a_destroy

    .align 2, 0

global_label NPCList_804F5FC
    .word NPC_804F608
    .word NPC_804F62C
    .word 0xFF

    .align 2, 0

NPC_804F608:
    a_jump_if_flag FLAG_ITEM_ACDC_DEX_PC_KEYDEX, L_804F62B
    a_init_bmd_at 430, 80, 0, dialog=0x5
L_804F622:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_DEX_PC_KEYDEX, L_804F622
L_804F62B:
    a_destroy

    .align 2, 0

NPC_804F62C:
    a_jump_if_flag FLAG_ITEM_ACDC_DEX_PC_XPANEL3_B, L_804F64F
    a_init_gmd_at 450, 148, 0, dialog=0x6
L_804F646:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_DEX_PC_XPANEL3_B, L_804F646
L_804F64F:
    a_destroy

global_label EntityAllocParams_804F650
    entity Effect, 0x16, f(-78, -2, 0), 0x301
    entity Effect, 0x16, f(82, -2, 0), 0x10301
    .word 0xFF

global_label EntityAllocParams_804F67C
    entity Effect, 0x16, f(-54, 294, 0), 0x501
    entity Effect, 0x16, f(74, 292, 128), 0x6010501
    .word 0xFF

global_label EntityAllocParams_804F6A8
    entity Effect, 0x16, f(-238, 238, 0), 0x901
    entity Effect, 0x16, f(-30, -36, 0), 0x7010901
    .word 0xFF

global_label EntityAllocParams_804F6D4
    entity Effect, 0x16, f(-550, -26, 0), 0x701
    entity Effect, 0x16, f(474, 100, 0), 0x8010701
    .word 0xFF

