#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_8043A38
    .word NPC_8043A74
    .word NPC_8043A89
    .word NPC_8043A9E
    .word NPC_8043AB3
    .word NPC_8043AC8
    .word NPC_8043ADE
    .word NPC_8043AF4
    .word NPC_8043B0A
    .word NPC_8043B20
    .word NPC_8043B44
    .word NPC_8043B68
    .word NPC_8043B8C
    .word NPC_8043BB0
    .word NPC_8043BD4
    .word 0xFF

    .align 2, 0

NPC_8043A74:
    a_init_basic_npc_talk 328, 92, 0, SP_Overworld_Prog, frame=3, dialog=0x0
    a_stop

NPC_8043A89:
    a_init_basic_npc_talk 422, 136, 0, SP_Overworld_Prog, frame=5, dialog=0x1
    a_stop

NPC_8043A9E:
    a_init_basic_npc_talk 364, 177, 0, SP_Overworld_Prog, frame=7, dialog=0x2
    a_stop

NPC_8043AB3:
    a_init_basic_npc_talk 150, 110, 0, SP_Overworld_Prog, frame=1, dialog=0x3
    a_stop

    .align 2, 0

NPC_8043AC8:
    a_init
    a_disable_turn
    a_set_dialog 0x4
    a_set_sprite_at -30, 175, 0, SP_Overworld_Prog, frame=15
    a_stop

NPC_8043ADE:
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite_at -45, 78, 0, SP_Overworld_Prog, frame=12
    a_stop

    .align 2, 0

NPC_8043AF4:
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite_at -42, -354, 0, SP_Overworld_Prog, frame=13
    a_stop

NPC_8043B0A:
    a_init
    a_disable_turn
    a_set_dialog 0x7
    a_set_sprite_at -372, -135, 0, SP_Overworld_Prog, frame=12
    a_stop

    .align 2, 0

NPC_8043B20:
    a_create_bmd -384, 130, 0, FLAG_ITEM_OVEN_COMP_1_200Z, dialog=0x18

    .align 2, 0

NPC_8043B44:
    a_create_gmd 134, 48, 0, FLAG_ITEM_OVEN_COMP_1_SHOTGUN_Q, dialog=0x10

    .align 2, 0

NPC_8043B68:
    a_create_pmd 6, 98, 0, FLAG_ITEM_OVEN_COMP_1_400Z, dialog=0x11

    .align 2, 0

NPC_8043B8C:
    a_create_bmd -116, -355, 0, FLAG_ITEM_OVEN_COMP_1_STEAL_A, dialog=0x12

    .align 2, 0

NPC_8043BB0:
    a_create_gmd -196, 28, 0, FLAG_ITEM_OVEN_COMP_1_SWORD_B, dialog=0x13, radius=1

    .align 2, 0

NPC_8043BD4:
    a_init_basic_npc_talk -424, 138, 0, SP_Overworld_Prog, frame=7, dialog=0x1D
    a_stop

    .align 2, 0

global_label NPCList_8043BEC
    .word NPC_8043BF4
    .word 0xFF

    .align 2, 0

NPC_8043BF4:
    a_init_basic_npc_talk -372, -135, 0, SP_Overworld_Prog, frame=3, dialog=0x1E
    a_stop

    .align 2, 0

global_label NPCList_8043C0C
    .word NPC_8043C14
    .word 0xFF

    .align 2, 0

NPC_8043C14:
    a_init_basic_npc_talk -372, -135, 0, SP_Overworld_Prog, frame=3, dialog=0x1E
    a_stop

    .align 2, 0

global_label NPCList_8043C2C
    .word NPC_8043C44
    .word NPC_8043C5A
    .word NPC_8043C6F
    .word NPC_8043C91
    .word NPC_8043CB3
    .word 0xFF

    .align 2, 0

NPC_8043C44:
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite_at -248, 8, 0, SP_Overworld_Prog, frame=15
    a_stop

NPC_8043C5A:
    a_init
    a_disable_turn
    a_disable_dialog
    a_set_sprite_at -310, -135, 0, SP_Overworld_FireMan, frame=3
    a_stop

NPC_8043C6F:
    a_create_bmd 144, 80, 0, FLAG_ITEM_OVEN_COMP_2_SHOTGUN_Q, dialog=0x2, default_radius=1

NPC_8043C91:
    a_create_gmd 98, -78, 0, FLAG_ITEM_OVEN_COMP_2_500Z, dialog=0x3, default_radius=1

NPC_8043CB3:
    a_create_pmd -139, -79, 0, FLAG_ITEM_OVEN_COMP_2_LILBOMB_T, dialog=0x4, default_radius=1

    .align 2, 0

global_label NPCList_8043CD8
    .word NPC_8043CE0
    .word 0xFF

    .align 2, 0

NPC_8043CE0:
    a_init
    a_disable_turn
    a_disable_dialog
    a_set_sprite_at -310, -135, 0, SP_Overworld_FireMan, frame=3
    a_stop

    .align 2, 0

global_label EntityAllocParams_8043CF8
    entity Effect, 0x8, f(122, 136, 0), 0x0
    entity Effect, 0x8, f(122, 112, 0), 0x1
    entity Effect, 0x8, f(-342, 116, 0), 0x2
    entity Effect, 0x8, f(-342, 140, 0), 0x3
    .word 0xFF

global_label EntityAllocParams_8043D4C
    entity Effect, 0x8, f(152, 212, 0), 0x4
    entity Effect, 0x8, f(168, 188, 0), 0x105
    entity Effect, 0x8, f(88, 212, 0), 0x6
    entity Effect, 0x8, f(88, 188, 0), 0x107
    entity Effect, 0x8, f(-96, 212, 0), 0x8
    entity Effect, 0x8, f(-96, 188, 0), 0x109
    entity Effect, 0x8, f(-180, 118, 0), 0xA
    entity Effect, 0x8, f(-156, 102, 0), 0x10B
    entity Effect, 0x8, f(196, 52, 0), 0xC
    entity Effect, 0x8, f(172, 52, 0), 0x10D
    entity Effect, 0x8, f(88, 92, 0), 0xE
    entity Effect, 0x8, f(88, 68, 0), 0x10F
    entity Effect, 0x8, f(12, 12, 0), 0x10
    entity Effect, 0x8, f(34, -18, 0), 0x111
    entity Effect, 0x8, f(34, 4, 0), 0x14
    entity Effect, 0x8, f(12, -10, 0), 0x115
    entity Attack, 0x15, f(-124, -10, 0), 0x1A
    entity Attack, 0x15, f(-116, 12, 0), 0x11C
    entity Attack, 0x15, f(-148, -10, 0), 0x19
    entity Attack, 0x15, f(-140, 12, 0), 0x11B
    entity Attack, 0x15, f(-180, -10, 0), 0x1D
    entity Attack, 0x15, f(-164, 12, 0), 0x11E
    entity Attack, 0x15, f(-188, 12, 0), 0x1F
    entity Attack, 0x15, f(34, -92, 0), 0x116
    entity Attack, 0x15, f(12, -92, 0), 0x17
    entity Attack, 0x15, f(12, -70, 0), 0x118
    .word 0xFF

