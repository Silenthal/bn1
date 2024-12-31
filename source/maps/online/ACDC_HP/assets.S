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
    a_set_sprite_at 82, -2, 0, SP_Overworld_Roll, frame=5
L_804F498:
    a_jump_if_flag 0x92, L_804F4A6
    a_wait 1
    a_jump L_804F498
L_804F4A6:
    a_move_f 10, d_sw, 8, 14
    a_set_sprite_frame 5
    a_stop

NPC_804F4B5:
    a_init_basic_npc_talk -42, -36, 0, SP_Overworld_Prog, dialog=0x1
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
    a_create_bmd 110, 250, 128, FLAG_ITEM_ACDC_MAYL_PC_KEYMAYL, dialog=0x5
    .align 2, 0

NPC_804F50C:
    a_create_gmd 36, 250, 128, FLAG_ITEM_ACDC_MAYL_PC_RECOV50_L, dialog=0x6
global_label NPCList_804F530
    .word NPC_804F53C
    .word NPC_804F551
    .word 0xFF

    .align 2, 0

NPC_804F53C:
    a_init_basic_npc_talk 76, 240, 128, SP_Overworld_Roll, frame=3, dialog=0x14
    a_stop

NPC_804F551:
    a_create_gmd 36, 250, 128, FLAG_ITEM_ACDC_MAYL_PC_RECOV50_L, dialog=0x6
    .align 2, 0

global_label NPCList_804F578
    .word NPC_804F588
    .word NPC_804F5AC
    .word NPC_804F5D0
    .word 0xFF

    .align 2, 0

NPC_804F588:
    a_create_bmd 18, -38, 0, FLAG_ITEM_ACDC_YAI_PC_KEYYAI, dialog=0x5
    .align 2, 0

NPC_804F5AC:
    a_create_gmd -174, -38, 0, FLAG_ITEM_ACDC_YAI_PC_RECOV30_L, dialog=0x6
    .align 2, 0

NPC_804F5D0:
    a_jump_if_flag 0x0, L_804F5FA
    a_jump_if_not_flag 0xE2, L_804F5FA
    a_jump_if_flag 0x99, L_804F5FA
    a_init_basic_npc_talk 50, -50, 0, SP_Overworld_Glyde, frame=5, dialog=0xF
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
    a_create_bmd 430, 80, 0, FLAG_ITEM_ACDC_DEX_PC_KEYDEX, dialog=0x5
    .align 2, 0

NPC_804F62C:
    a_create_gmd 450, 148, 0, FLAG_ITEM_ACDC_DEX_PC_XPANEL3_B, dialog=0x6
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

