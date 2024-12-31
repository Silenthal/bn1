#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_8041B3C
    .word NPC_8041B64
    .word NPC_8041B77
    .word NPC_8041B8A
    .word NPC_8041B9D
    .word NPC_8041BB2
    .word NPC_8041BC7
    .word NPC_8041BDC
    .word NPC_8041BF1
    .word NPC_8041C04
    .word 0xFF

    .align 2, 0

NPC_8041B64:
    a_init
    a_set_sprite SP_Overworld_GutsMan
    a_set_pos -298, 102
    a_set_sprite_frame 1
    a_stop

NPC_8041B77:
    a_init
    a_set_sprite SP_Overworld_Roll
    a_set_pos -248, 102
    a_set_sprite_frame 1
    a_stop

NPC_8041B8A:
    a_init
    a_set_sprite SP_Overworld_Glyde
    a_set_pos -344, 62
    a_set_sprite_frame 1
    a_stop

NPC_8041B9D:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -248, 142
    a_set_sprite_frame 1
    a_stop

NPC_8041BB2:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -344, 102
    a_set_sprite_frame 1
    a_stop

NPC_8041BC7:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -298, 62
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_8041BDC:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -344, 142
    a_set_sprite_frame 1
    a_stop

NPC_8041BF1:
    a_init
    a_set_sprite SP_Overworld_MegaMan
    a_set_pos -248, 62
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_8041C04:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite SP_Overworld_NormalNavi2
    a_set_pos -166, 102
    a_set_sprite_frame 5
    a_set_palette 0x1
    a_stop

    .align 2, 0

global_label NPCList_8041C1C
    .word NPC_8041C4C
    .word NPC_8041C63
    .word NPC_8041C78
    .word NPC_8041C8F
    .word NPC_8041CA6
    .word 0xFF

global_label NPCList_8041C34
    .word NPC_8041C4C
    .word NPC_8041C63
    .word NPC_8041C78
    .word NPC_8041C8F
    .word NPC_8041CA6
    .word 0xFF

    .align 2, 0

NPC_8041C4C:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -190, 92
    a_set_sprite_frame 1
    a_stop

NPC_8041C63:
    a_init
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_Glyde
    a_set_pos -330, 160
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_8041C78:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x7
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 130, -30
    a_set_sprite_frame 1
    a_stop

NPC_8041C8F:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x9
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 50, 60
    a_set_sprite_frame 5
    a_stop

NPC_8041CA6:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_1_SHOKWAVE_L, L_8041CC9
    a_init_bmd_at 84, -230, 0, dialog=0xA
L_8041CC0:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_1_SHOKWAVE_L, L_8041CC0
L_8041CC9:
    a_destroy

    .align 2, 0

global_label NPCList_8041CCC
    .word NPC_8041CD4
    .word 0xFF

    .align 2, 0

NPC_8041CD4:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_1_SHOKWAVE_L, L_8041CF7
    a_init_bmd_at 84, -230, 0, dialog=0xA
L_8041CEE:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_1_SHOKWAVE_L, L_8041CEE
L_8041CF7:
    a_destroy

global_label NPCList_8041CF8
    .word NPC_8041D29
    .word NPC_8041D4D
    .word 0xFF

global_label NPCList_8041D04
    .word NPC_8041D14
    .word NPC_8041D29
    .word NPC_8041D4D
    .word 0xFF

    .align 2, 0

NPC_8041D14:
    a_init
    a_set_dialog 0x28
    a_set_sprite SP_Overworld_Prog
    a_set_pos 238, 60, 64
    a_set_sprite_frame 1
    a_stop

NPC_8041D29:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_2_800Z, L_8041D4C
    a_init_bmd_at 20, 204, 32, dialog=0x0
L_8041D43:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_2_800Z, L_8041D43
L_8041D4C:
    a_destroy

NPC_8041D4D:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_2_HICANNON_I, L_8041D70
    a_init_bmd_at 80, 236, 0, dialog=0x1
L_8041D67:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_2_HICANNON_I, L_8041D67
L_8041D70:
    a_destroy

    .align 2, 0

global_label NPCList_8041D74
    .word NPC_8041D80
    .word NPC_8041DA4
    .word 0xFF

    .align 2, 0

NPC_8041D80:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_2_800Z, L_8041DA3
    a_init_bmd_at 20, 204, 32, dialog=0x0
L_8041D9A:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_2_800Z, L_8041D9A
L_8041DA3:
    a_destroy

    .align 2, 0

NPC_8041DA4:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_2_HICANNON_I, L_8041DC7
    a_init_bmd_at 80, 236, 0, dialog=0x1
L_8041DBE:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_2_HICANNON_I, L_8041DBE
L_8041DC7:
    a_destroy

global_label NPCList_8041DC8
    .word NPC_8041DD8
    .word NPC_8041DEF
    .word NPC_8041E13
    .word 0xFF

    .align 2, 0

NPC_8041DD8:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -142, -20
    a_set_sprite_frame 3
    a_stop

NPC_8041DEF:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_3_HPMEMORY, L_8041E12
    a_init_bmd_at -374, -28, 0, dialog=0x2
L_8041E09:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_3_HPMEMORY, L_8041E09
L_8041E12:
    a_destroy

NPC_8041E13:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_3_SPREADER_H, L_8041E36
    a_init_bmd_at -188, -132, 0, dialog=0x3
L_8041E2D:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_3_SPREADER_H, L_8041E2D
L_8041E36:
    a_destroy

    .align 2, 0

global_label NPCList_8041E38
    .word NPC_8041E44
    .word NPC_8041E68
    .word 0xFF

    .align 2, 0

NPC_8041E44:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_3_HPMEMORY, L_8041E67
    a_init_bmd_at -374, -28, 0, dialog=0x2
L_8041E5E:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_3_HPMEMORY, L_8041E5E
L_8041E67:
    a_destroy

    .align 2, 0

NPC_8041E68:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_3_SPREADER_H, L_8041E8B
    a_init_bmd_at -188, -132, 0, dialog=0x3
L_8041E82:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_3_SPREADER_H, L_8041E82
L_8041E8B:
    a_destroy

global_label NPCList_8041E8C
    .word NPC_8041EA0
    .word NPC_8041EB7
    .word NPC_8041ECC
    .word NPC_8041EF0
    .word 0xFF

    .align 2, 0

NPC_8041EA0:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -150, 206
    a_set_sprite_frame 7
    a_stop

NPC_8041EB7:
    a_init
    a_set_dialog 0x1F
    a_set_sprite SP_Overworld_Prog
    a_set_pos -170, -280
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_8041ECC:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_4_400Z, L_8041EEF
    a_init_bmd_at -118, 196, 0, dialog=0x20
L_8041EE6:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_4_400Z, L_8041EE6
L_8041EEF:
    a_destroy

    .align 2, 0

NPC_8041EF0:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_4_QUAKE_A, L_8041F13
    a_init_bmd_at 266, -140, 0, dialog=0x21
L_8041F0A:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_4_QUAKE_A, L_8041F0A
L_8041F13:
    a_destroy

global_label NPCList_8041F14
    .word NPC_8041F20
    .word NPC_8041F44
    .word 0xFF

    .align 2, 0

NPC_8041F20:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_4_400Z, L_8041F43
    a_init_bmd_at -118, 196, 0, dialog=0x20
L_8041F3A:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_4_400Z, L_8041F3A
L_8041F43:
    a_destroy

    .align 2, 0

NPC_8041F44:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_4_QUAKE_A, L_8041F67
    a_init_bmd_at 266, -140, 0, dialog=0x21
L_8041F5E:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_4_QUAKE_A, L_8041F5E
L_8041F67:
    a_destroy

global_label NPCList_8041F68
    .word NPC_8041F74
    .word NPC_8041F89
    .word 0xFF

    .align 2, 0

NPC_8041F74:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_NumberMan
    a_set_pos 128, -66
    a_set_sprite_frame 3
    a_stop

NPC_8041F89:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_5_CANNON_C, L_8041FAC
    a_init_bmd_at 18, -54, 0, dialog=0x1F
L_8041FA3:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_5_CANNON_C, L_8041FA3
L_8041FAC:
    a_destroy

    .align 2, 0

global_label NPCList_8041FB0
    .word NPC_8041FB8
    .word 0xFF

    .align 2, 0

NPC_8041FB8:
    a_jump_if_flag FLAG_ITEM_SCHOOL_COMP_5_CANNON_C, L_8041FDB
    a_init_bmd_at 18, -54, 0, dialog=0x1F
L_8041FD2:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCHOOL_COMP_5_CANNON_C, L_8041FD2
L_8041FDB:
    a_destroy

global_label EntityAllocParams_8041FDC
    entity Effect, 0x1, f(-228, 60, 0), 0xD
    entity Effect, 0x1, f(-228, 100, 0), 0xD
    entity Effect, 0x1, f(-228, 140, 0), 0xD
    entity Effect, 0x1, f(-276, 60, 0), 0xD
    entity Effect, 0x1, f(-276, 100, 0), 0xD
    entity Effect, 0x1, f(-276, 140, 0), 0xD
    entity Effect, 0x1, f(-324, 60, 0), 0xD
    entity Effect, 0x1, f(-324, 100, 0), 0xD
    entity Effect, 0x1, f(-324, 140, 0), 0xD
    entity Effect, 0x1, f(74, 60, 0), 0xD
    entity Effect, 0x1, f(74, 100, 0), 0xD
    entity Effect, 0x1, f(74, 140, 0), 0xD
    entity Effect, 0x1, f(26, 60, 0), 0xD
    entity Effect, 0x1, f(26, 100, 0), 0xD
    entity Effect, 0x1, f(26, 140, 0), 0xD
    entity Effect, 0x1, f(-22, 60, 0), 0xD
    entity Effect, 0x1, f(-22, 100, 0), 0xD
    entity Effect, 0x1, f(-22, 140, 0), 0xD
    .word 0xFF

global_label EntityAllocParams_8042148
    entity Effect, 0x1, f(-228, -20, 0), 0xD
    entity Effect, 0x1, f(-228, 20, 0), 0xD
    entity Effect, 0x1, f(-228, 60, 0), 0xD
    entity Effect, 0x1, f(-276, -20, 0), 0xD
    entity Effect, 0x1, f(-276, 20, 0), 0xD
    entity Effect, 0x1, f(-276, 60, 0), 0xD
    entity Effect, 0x1, f(-324, -20, 0), 0xD
    entity Effect, 0x1, f(-324, 20, 0), 0xD
    entity Effect, 0x1, f(-324, 60, 0), 0xD
    entity Effect, 0x1, f(76, -20, 0), 0xD
    entity Effect, 0x1, f(76, 20, 0), 0xD
    entity Effect, 0x1, f(76, 60, 0), 0xD
    entity Effect, 0x1, f(28, -20, 0), 0xD
    entity Effect, 0x1, f(28, 20, 0), 0xD
    entity Effect, 0x1, f(28, 60, 0), 0xD
    entity Effect, 0x1, f(-20, -20, 0), 0xD
    entity Effect, 0x1, f(-20, 20, 0), 0xD
    entity Effect, 0x1, f(-20, 60, 0), 0xD
    .word 0xFF

global_label EntityAllocParams_80422B4
    entity Effect, 0x1, f(52, -28, 0), 0xD
    entity Effect, 0x1, f(4, -28, 0), 0xD
    entity Effect, 0x1, f(-44, -28, 0), 0xD
    entity Effect, 0x1, f(-44, 12, 0), 0xD
    entity Effect, 0x1, f(-44, 52, 0), 0xD
    .word 0xFF

global_label EntityAllocParams_804231C
    entity Effect, 0x1, f(300, -68, 0), 0xD
    entity Effect, 0x1, f(300, -52, 0), 0xD
    entity Effect, 0x1, f(300, -4, 0), 0xD
    entity Effect, 0x1, f(300, 12, 0), 0xD
    entity Effect, 0x1, f(252, -68, 0), 0xD
    entity Effect, 0x1, f(252, -52, 0), 0xD
    entity Effect, 0x1, f(252, -4, 0), 0xD
    entity Effect, 0x1, f(252, 12, 0), 0xD
    .word 0xFF

