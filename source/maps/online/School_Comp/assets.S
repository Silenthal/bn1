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
    a_init_basic_npc -298, 102, 0, SP_Overworld_GutsMan, frame=1
    a_stop

NPC_8041B77:
    a_init_basic_npc -248, 102, 0, SP_Overworld_Roll, frame=1
    a_stop

NPC_8041B8A:
    a_init_basic_npc -344, 62, 0, SP_Overworld_Glyde, frame=1
    a_stop

NPC_8041B9D:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite_at -248, 142, 0, SP_Overworld_NormalNavi, frame=1
    a_stop

NPC_8041BB2:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite_at -344, 102, 0, SP_Overworld_NormalNavi, frame=1
    a_stop

NPC_8041BC7:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite_at -298, 62, 0, SP_Overworld_NormalNavi, frame=1
    a_stop

    .align 2, 0

NPC_8041BDC:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite_at -344, 142, 0, SP_Overworld_NormalNavi, frame=1
    a_stop

NPC_8041BF1:
    a_init_basic_npc -248, 62, 0, SP_Overworld_MegaMan, frame=1
    a_stop

    .align 2, 0

NPC_8041C04:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_sprite_at -166, 102, 0, SP_Overworld_NormalNavi2, frame=5
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
    a_set_sprite_at -190, 92, 0, SP_Overworld_NormalNavi, frame=1
    a_stop

NPC_8041C63:
    a_init_basic_npc_talk -330, 160, 0, SP_Overworld_Glyde, frame=1, dialog=0x6
    a_stop

    .align 2, 0

NPC_8041C78:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x7
    a_set_sprite_at 130, -30, 0, SP_Overworld_NormalNavi, frame=1
    a_stop

NPC_8041C8F:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x9
    a_set_sprite_at 50, 60, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_8041CA6:
    a_create_bmd 84, -230, 0, FLAG_ITEM_SCHOOL_COMP_1_SHOKWAVE_L, dialog=0xA
    .align 2, 0

global_label NPCList_8041CCC
    .word NPC_8041CD4
    .word 0xFF

    .align 2, 0

NPC_8041CD4:
    a_create_bmd 84, -230, 0, FLAG_ITEM_SCHOOL_COMP_1_SHOKWAVE_L, dialog=0xA
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
    a_init_basic_npc_talk 238, 60, 64, SP_Overworld_Prog, frame=1, dialog=0x28
    a_stop

NPC_8041D29:
    a_create_bmd 20, 204, 32, FLAG_ITEM_SCHOOL_COMP_2_800Z, dialog=0x0
NPC_8041D4D:
    a_create_bmd 80, 236, 0, FLAG_ITEM_SCHOOL_COMP_2_HICANNON_I, dialog=0x1
    .align 2, 0

global_label NPCList_8041D74
    .word NPC_8041D80
    .word NPC_8041DA4
    .word 0xFF

    .align 2, 0

NPC_8041D80:
    a_create_bmd 20, 204, 32, FLAG_ITEM_SCHOOL_COMP_2_800Z, dialog=0x0
    .align 2, 0

NPC_8041DA4:
    a_create_bmd 80, 236, 0, FLAG_ITEM_SCHOOL_COMP_2_HICANNON_I, dialog=0x1
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
    a_set_sprite_at -142, -20, 0, SP_Overworld_NormalNavi, frame=3
    a_stop

NPC_8041DEF:
    a_create_bmd -374, -28, 0, FLAG_ITEM_SCHOOL_COMP_3_HPMEMORY, dialog=0x2
NPC_8041E13:
    a_create_bmd -188, -132, 0, FLAG_ITEM_SCHOOL_COMP_3_SPREADER_H, dialog=0x3
    .align 2, 0

global_label NPCList_8041E38
    .word NPC_8041E44
    .word NPC_8041E68
    .word 0xFF

    .align 2, 0

NPC_8041E44:
    a_create_bmd -374, -28, 0, FLAG_ITEM_SCHOOL_COMP_3_HPMEMORY, dialog=0x2
    .align 2, 0

NPC_8041E68:
    a_create_bmd -188, -132, 0, FLAG_ITEM_SCHOOL_COMP_3_SPREADER_H, dialog=0x3
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
    a_set_sprite_at -150, 206, 0, SP_Overworld_NormalNavi, frame=7
    a_stop

NPC_8041EB7:
    a_init_basic_npc_talk -170, -280, 0, SP_Overworld_Prog, frame=1, dialog=0x1F
    a_stop

    .align 2, 0

NPC_8041ECC:
    a_create_bmd -118, 196, 0, FLAG_ITEM_SCHOOL_COMP_4_400Z, dialog=0x20
    .align 2, 0

NPC_8041EF0:
    a_create_bmd 266, -140, 0, FLAG_ITEM_SCHOOL_COMP_4_QUAKE_A, dialog=0x21
global_label NPCList_8041F14
    .word NPC_8041F20
    .word NPC_8041F44
    .word 0xFF

    .align 2, 0

NPC_8041F20:
    a_create_bmd -118, 196, 0, FLAG_ITEM_SCHOOL_COMP_4_400Z, dialog=0x20
    .align 2, 0

NPC_8041F44:
    a_create_bmd 266, -140, 0, FLAG_ITEM_SCHOOL_COMP_4_QUAKE_A, dialog=0x21
global_label NPCList_8041F68
    .word NPC_8041F74
    .word NPC_8041F89
    .word 0xFF

    .align 2, 0

NPC_8041F74:
    a_init_basic_npc_talk 128, -66, 0, SP_Overworld_NumberMan, frame=3, dialog=0x0
    a_stop

NPC_8041F89:
    a_create_bmd 18, -54, 0, FLAG_ITEM_SCHOOL_COMP_5_CANNON_C, dialog=0x1F
    .align 2, 0

global_label NPCList_8041FB0
    .word NPC_8041FB8
    .word 0xFF

    .align 2, 0

NPC_8041FB8:
    a_create_bmd 18, -54, 0, FLAG_ITEM_SCHOOL_COMP_5_CANNON_C, dialog=0x1F
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

