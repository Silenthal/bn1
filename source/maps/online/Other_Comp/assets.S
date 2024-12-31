#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_8050D14
    .word NPC_8050D28
    .word NPC_8050D4C
    .word NPC_8050D64
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_8050D28:
    a_create_bmd 250, -250, 0, FLAG_ITEM_OTHER_DOGHOUSE_COMP_SHOTGUN_K, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8050D4C:
    a_init_basic_npc_talk -230, -250, 0, SP_Overworld_Prog, frame=3, dialog=0x0
    a_stop

    .align 2, 0

NPC_8050D64:
    a_init_basic_npc_talk 250, 230, 0, SP_Overworld_Prog, frame=5, dialog=0x1
    a_stop

    .align 2, 0

NPC_8050D7C:
    a_init
    a_disable_turn
    a_disable_dialog
    a_disable_collision
    a_set_palette 0x1
    a_set_sprite_at -150, -10, 0, SP_Overworld_Portal, frame=0
L_8050D8D:
    a_shadow_off
    a_wait 1
    a_jump L_8050D8D

    .align 2, 0

global_label NPCList_8050D98
    .word NPC_8050DAC
    .word NPC_8050DD0
    .word NPC_8050DE8
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_8050DAC:
    a_create_bmd 218, 166, 0, FLAG_ITEM_OTHER_SERVBOT_COMP_HPMEMORY, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8050DD0:
    a_init_basic_npc_talk -198, 102, 0, SP_Overworld_Prog, frame=1, dialog=0x0
    a_stop

    .align 2, 0

NPC_8050DE8:
    a_init_basic_npc_talk 218, -250, 0, SP_Overworld_Prog, frame=3, dialog=0x1
    a_stop

    .align 2, 0

global_label NPCList_8050E00
    .word NPC_8050E14
    .word NPC_8050E38
    .word NPC_8050E50
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_8050E14:
    a_create_bmd 218, -186, 0, FLAG_ITEM_OTHER_NEW_GAME_MACHINE_COMP_CROSSGUN_K, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8050E38:
    a_init_basic_npc_talk -134, -122, 0, SP_Overworld_Prog, frame=1, dialog=0x0
    a_stop

    .align 2, 0

NPC_8050E50:
    a_init_basic_npc_talk 26, 102, 0, SP_Overworld_Prog, frame=3, dialog=0x1
    a_stop

    .align 2, 0

global_label NPCList_8050E68
    .word NPC_8050E80
    .word NPC_8050EA4
    .word NPC_8050EBC
    .word NPC_8050ED4
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_8050E80:
    a_jump_if_flag FLAG_ITEM_OTHER_TELEPHONE_COMP_ESCAPE_J, L_8050EA1
    a_init_bmd_at -230, -186, 0, 0x2, default_radius=1
L_8050E98:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_TELEPHONE_COMP_ESCAPE_J, L_8050E98
L_8050EA1:
    a_destroy

    .align 2, 0

NPC_8050EA4:
    a_init_basic_npc_talk 58, -58, 0, SP_Overworld_Prog, frame=5, dialog=0x0
    a_stop

    .align 2, 0

NPC_8050EBC:
    a_init_basic_npc_talk 250, -250, 0, SP_Overworld_Prog, frame=3, dialog=0x1
    a_stop

    .align 2, 0

NPC_8050ED4:
    a_jump_if_flag FLAG_ITEM_OTHER_TELEPHONE_COMP_1000Z, L_8050EA1
    a_init_bmd_at 218, 230, 0, 0x3, default_radius=1
L_8050EEC:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_TELEPHONE_COMP_1000Z, L_8050EEC
    a_destroy

    .align 2, 0

global_label NPCList_8050EF8
    .word NPC_8050F0C
    .word NPC_8050F30
    .word NPC_8050F48
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_8050F0C:
    a_create_bmd 26, 6, 0, FLAG_ITEM_OTHER_CAR_COMP_HPMEMORY, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8050F30:
    a_init_basic_npc_talk -134, -218, 0, SP_Overworld_Prog, frame=3, dialog=0x0
    a_stop

    .align 2, 0

NPC_8050F48:
    a_init_basic_npc_talk 186, -154, 0, SP_Overworld_Prog, frame=5, dialog=0x1
    a_stop

    .align 2, 0

global_label NPCList_8050F60
    .word NPC_8050F8C
    .word NPC_8050FB0
    .word NPC_8050FC8
    .word NPC_8050D7C
    .word 0xFF

global_label NPCList_8050F74
    .word NPC_8050F8C
    .word NPC_8050FB0
    .word NPC_8050FC8
    .word NPC_8050D7C
    .word NPC_8050FE0
    .word 0xFF

    .align 2, 0

NPC_8050F8C:
    a_create_bmd 218, -218, 0, FLAG_ITEM_OTHER_WATERWORKS_VENDING_MACHINE_SPREADER_J, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8050FB0:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite_at -144, -186, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

    .align 2, 0

NPC_8050FC8:
    a_init_basic_npc_talk -166, -186, 0, SP_Overworld_Prog, frame=1, dialog=0x1
    a_stop

    .align 2, 0

NPC_8050FE0:
    a_init
    a_set_dialog 0x14
    a_set_sprite SP_Overworld_NormalNavi
    a_set_palette 0x2
    a_set_pos 26, 6
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_8050FF8
    .word NPC_805100C
    .word NPC_8051030
    .word NPC_8051048
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_805100C:
    a_create_bmd -134, -186, 0, FLAG_ITEM_OTHER_LOBBY_TV_COMP_ESCAPE_L, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8051030:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x1
    a_set_sprite_at -6, 38, 0, SP_Overworld_NormalNavi, frame=7
    a_stop

    .align 2, 0

NPC_8051048:
    a_init_basic_npc_talk 26, -58, 0, SP_Overworld_Prog, frame=3, dialog=0x0
    a_stop

    .align 2, 0

global_label NPCList_8051060
    .word NPC_8051074
    .word NPC_8051098
    .word NPC_80510B0
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_8051074:
    a_create_bmd -38, -26, 0, FLAG_ITEM_OTHER_LARGE_MONITOR_COMP_HICANNON_J, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8051098:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite_at 250, -186, 0, SP_Overworld_NormalNavi, frame=3
    a_stop

    .align 2, 0

NPC_80510B0:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x1
    a_set_sprite_at 250, 198, 0, SP_Overworld_NormalNavi, frame=7
    a_stop

    .align 2, 0

global_label NPCList_80510C8
    .word NPC_80510E0
    .word NPC_8051104
    .word NPC_805111C
    .word NPC_8051134
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_80510E0:
    a_create_bmd -166, 198, 0, FLAG_ITEM_OTHER_CONTROL_EQUIPMENT_COMP_RECOV200_L, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8051104:
    a_init_basic_npc_talk 90, -250, 0, SP_Overworld_Prog, frame=3, dialog=0x0
    a_stop

    .align 2, 0

NPC_805111C:
    a_init_basic_npc_talk 250, -26, 0, SP_Overworld_Prog, frame=5, dialog=0x1
    a_stop

    .align 2, 0

NPC_8051134:
    a_create_bmd 218, 198, 0, FLAG_ITEM_OTHER_CONTROL_EQUIPMENT_COMP_3000Z, dialog=0x3, default_radius=1

    .align 2, 0

global_label NPCList_8051158
    .word NPC_805116C
    .word NPC_8051190
    .word NPC_80511A8
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_805116C:
    a_create_bmd -198, -218, 0, FLAG_ITEM_OTHER_SCILAB_VENDING_MACHINE_5000Z, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8051190:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x1
    a_set_sprite_at 154, 134, 0, SP_Overworld_NormalNavi, frame=7
    a_stop

    .align 2, 0

NPC_80511A8:
    a_init_basic_npc_talk 218, -26, 0, SP_Overworld_Prog, frame=3, dialog=0x0
    a_stop

    .align 2, 0

global_label NPCList_80511C0
    .word NPC_80511D4
    .word NPC_80511F8
    .word NPC_8051210
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_80511D4:
    a_create_bmd 186, -186, 0, FLAG_ITEM_OTHER_RECYCLED_PET_COMP_HPMEMORY, dialog=0x2, default_radius=1

    .align 2, 0

NPC_80511F8:
    a_init_basic_npc_talk 26, -26, 0, SP_Overworld_Prog, frame=5, dialog=0x0
    a_stop

    .align 2, 0

NPC_8051210:
    a_init_basic_npc_talk 26, 6, 0, SP_Overworld_Prog, frame=5, dialog=0x1
    a_stop

    .align 2, 0

global_label NPCList_8051228
    .word NPC_805123C
    .word NPC_8051260
    .word NPC_8051278
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_805123C:
    a_create_bmd 250, -26, 0, FLAG_ITEM_OTHER_BIG_VASE_COMP_QUAKE3_C, dialog=0x2, default_radius=1

    .align 2, 0

NPC_8051260:
    a_init_basic_npc_talk -70, 6, 0, SP_Overworld_Prog, frame=5, dialog=0x0
    a_stop

    .align 2, 0

NPC_8051278:
    a_init_basic_npc_talk 218, 6, 0, SP_Overworld_Prog, frame=5, dialog=0x1
    a_stop

    .align 2, 0

global_label NPCList_8051290
    .word NPC_80512A4
    .word NPC_80512C8
    .word NPC_80512E0
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_80512A4:
    a_create_bmd 250, 230, 0, FLAG_ITEM_OTHER_BLACKBOARD_COMP_POWERUP, dialog=0x2, default_radius=1

    .align 2, 0

NPC_80512C8:
    a_init_basic_npc_talk 186, -250, 0, SP_Overworld_Prog, frame=3, dialog=0x0
    a_stop

    .align 2, 0

NPC_80512E0:
    a_init_basic_npc_talk -166, 230, 0, SP_Overworld_Prog, frame=1, dialog=0x1
    a_stop

    .align 2, 0

