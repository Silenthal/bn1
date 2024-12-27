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
    a_jump_if_flag FLAG_ITEM_OTHER_DOGHOUSE_COMP_SHOTGUN_K, L_8050D49
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 250, -250
    a_set_sprite_frame 0
L_8050D40:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_DOGHOUSE_COMP_SHOTGUN_K, L_8050D40
L_8050D49:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8050D4C:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos -230, -250
    a_set_sprite_frame 3
L_8050D5A:
    a_wait 1
    a_jump L_8050D5A

    .align 2, 0

    .align 2, 0

NPC_8050D64:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 250, 230
    a_set_sprite_frame 5
L_8050D72:
    a_wait 1
    a_jump L_8050D72

    .align 2, 0

    .align 2, 0

NPC_8050D7C:
    a_init
    a_disable_turn
    a_disable_dialog
    a_disable_collision
    a_set_palette 0x1
    a_set_sprite SP_Overworld_Portal
    a_set_pos -150, -10
    a_set_sprite_frame 0
L_8050D8D:
    a_set_no_z_clip
    a_clear_z_clip
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
    a_jump_if_flag FLAG_ITEM_OTHER_SERVBOT_COMP_HPMEMORY, L_8050DCD
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 218, 166
    a_set_sprite_frame 0
L_8050DC4:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_SERVBOT_COMP_HPMEMORY, L_8050DC4
L_8050DCD:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8050DD0:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos -198, 102
    a_set_sprite_frame 1
L_8050DDE:
    a_wait 1
    a_jump L_8050DDE

    .align 2, 0

    .align 2, 0

NPC_8050DE8:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 218, -250
    a_set_sprite_frame 3
L_8050DF6:
    a_wait 1
    a_jump L_8050DF6

    .align 2, 0

global_label NPCList_8050E00
    .word NPC_8050E14
    .word NPC_8050E38
    .word NPC_8050E50
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_8050E14:
    a_jump_if_flag FLAG_ITEM_OTHER_NEW_GAME_MACHINE_COMP_CROSSGUN_K, L_8050E35
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 218, -186
    a_set_sprite_frame 0
L_8050E2C:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_NEW_GAME_MACHINE_COMP_CROSSGUN_K, L_8050E2C
L_8050E35:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8050E38:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos -134, -122
    a_set_sprite_frame 1
L_8050E46:
    a_wait 1
    a_jump L_8050E46

    .align 2, 0

    .align 2, 0

NPC_8050E50:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 26, 102
    a_set_sprite_frame 3
L_8050E5E:
    a_wait 1
    a_jump L_8050E5E

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
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -230, -186
    a_set_sprite_frame 0
L_8050E98:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_TELEPHONE_COMP_ESCAPE_J, L_8050E98
L_8050EA1:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8050EA4:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos 58, -58
    a_set_sprite_frame 5
L_8050EB2:
    a_wait 1
    a_jump L_8050EB2

    .align 2, 0

    .align 2, 0

NPC_8050EBC:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 250, -250
    a_set_sprite_frame 3
L_8050ECA:
    a_wait 1
    a_jump L_8050ECA

    .align 2, 0

    .align 2, 0

NPC_8050ED4:
    a_jump_if_flag FLAG_ITEM_OTHER_TELEPHONE_COMP_1000Z, L_8050EA1
    a_init
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 218, 230
    a_set_sprite_frame 0
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
    a_jump_if_flag FLAG_ITEM_OTHER_CAR_COMP_HPMEMORY, L_8050F2D
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 26, 6
    a_set_sprite_frame 0
L_8050F24:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_CAR_COMP_HPMEMORY, L_8050F24
L_8050F2D:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8050F30:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos -134, -218
    a_set_sprite_frame 3
L_8050F3E:
    a_wait 1
    a_jump L_8050F3E

    .align 2, 0

    .align 2, 0

NPC_8050F48:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 186, -154
    a_set_sprite_frame 5
L_8050F56:
    a_wait 1
    a_jump L_8050F56

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
    a_jump_if_flag FLAG_ITEM_OTHER_WATERWORKS_VENDING_MACHINE_SPREADER_J, L_8050FAD
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 218, -218
    a_set_sprite_frame 0
L_8050FA4:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_WATERWORKS_VENDING_MACHINE_SPREADER_J, L_8050FA4
L_8050FAD:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8050FB0:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -144, -186
    a_set_sprite_frame 5
L_8050FC0:
    a_wait 1
    a_jump L_8050FC0

    .align 2, 0

    .align 2, 0

NPC_8050FC8:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos -166, -186
    a_set_sprite_frame 1
L_8050FD6:
    a_wait 1
    a_jump L_8050FD6

    .align 2, 0

    .align 2, 0

NPC_8050FE0:
    a_init
    a_set_dialog 0x14
    a_set_sprite SP_Overworld_NormalNavi
    a_set_palette 0x2
    a_set_pos 26, 6
    a_set_sprite_frame 5
L_8050FF0:
    a_wait 1
    a_jump L_8050FF0

    .align 2, 0

global_label NPCList_8050FF8
    .word NPC_805100C
    .word NPC_8051030
    .word NPC_8051048
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_805100C:
    a_jump_if_flag FLAG_ITEM_OTHER_LOBBY_TV_COMP_ESCAPE_L, L_805102D
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -134, -186
    a_set_sprite_frame 0
L_8051024:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_LOBBY_TV_COMP_ESCAPE_L, L_8051024
L_805102D:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8051030:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -6, 38
    a_set_sprite_frame 7
L_8051040:
    a_wait 1
    a_jump L_8051040

    .align 2, 0

    .align 2, 0

NPC_8051048:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos 26, -58
    a_set_sprite_frame 3
L_8051056:
    a_wait 1
    a_jump L_8051056

    .align 2, 0

global_label NPCList_8051060
    .word NPC_8051074
    .word NPC_8051098
    .word NPC_80510B0
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_8051074:
    a_jump_if_flag FLAG_ITEM_OTHER_LARGE_MONITOR_COMP_HICANNON_J, L_8051095
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -38, -26
    a_set_sprite_frame 0
L_805108C:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_LARGE_MONITOR_COMP_HICANNON_J, L_805108C
L_8051095:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8051098:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 250, -186
    a_set_sprite_frame 3
L_80510A8:
    a_wait 1
    a_jump L_80510A8

    .align 2, 0

    .align 2, 0

NPC_80510B0:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 250, 198
    a_set_sprite_frame 7
L_80510C0:
    a_wait 1
    a_jump L_80510C0

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
    a_jump_if_flag FLAG_ITEM_OTHER_CONTROL_EQUIPMENT_COMP_RECOV200_L, L_8051101
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -166, 198
    a_set_sprite_frame 0
L_80510F8:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_CONTROL_EQUIPMENT_COMP_RECOV200_L, L_80510F8
L_8051101:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8051104:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos 90, -250
    a_set_sprite_frame 3
L_8051112:
    a_wait 1
    a_jump L_8051112

    .align 2, 0

    .align 2, 0

NPC_805111C:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 250, -26
    a_set_sprite_frame 5
L_805112A:
    a_wait 1
    a_jump L_805112A

    .align 2, 0

    .align 2, 0

NPC_8051134:
    a_jump_if_flag FLAG_ITEM_OTHER_CONTROL_EQUIPMENT_COMP_3000Z, L_8051155
    a_init
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 218, 198
    a_set_sprite_frame 0
L_805114C:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_CONTROL_EQUIPMENT_COMP_3000Z, L_805114C
L_8051155:
    a_destroy

    .align 2, 0

global_label NPCList_8051158
    .word NPC_805116C
    .word NPC_8051190
    .word NPC_80511A8
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_805116C:
    a_jump_if_flag FLAG_ITEM_OTHER_SCILAB_VENDING_MACHINE_5000Z, L_805118D
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -198, -218
    a_set_sprite_frame 0
L_8051184:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_SCILAB_VENDING_MACHINE_5000Z, L_8051184
L_805118D:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8051190:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 154, 134
    a_set_sprite_frame 7
L_80511A0:
    a_wait 1
    a_jump L_80511A0

    .align 2, 0

    .align 2, 0

NPC_80511A8:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos 218, -26
    a_set_sprite_frame 3
L_80511B6:
    a_wait 1
    a_jump L_80511B6

    .align 2, 0

global_label NPCList_80511C0
    .word NPC_80511D4
    .word NPC_80511F8
    .word NPC_8051210
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_80511D4:
    a_jump_if_flag FLAG_ITEM_OTHER_RECYCLED_PET_COMP_HPMEMORY, L_80511F5
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 186, -186
    a_set_sprite_frame 0
L_80511EC:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_RECYCLED_PET_COMP_HPMEMORY, L_80511EC
L_80511F5:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_80511F8:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos 26, -26
    a_set_sprite_frame 5
L_8051206:
    a_wait 1
    a_jump L_8051206

    .align 2, 0

    .align 2, 0

NPC_8051210:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 26, 6
    a_set_sprite_frame 5
L_805121E:
    a_wait 1
    a_jump L_805121E

    .align 2, 0

global_label NPCList_8051228
    .word NPC_805123C
    .word NPC_8051260
    .word NPC_8051278
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_805123C:
    a_jump_if_flag FLAG_ITEM_OTHER_BIG_VASE_COMP_QUAKE3_C, L_805125D
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 250, -26
    a_set_sprite_frame 0
L_8051254:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_BIG_VASE_COMP_QUAKE3_C, L_8051254
L_805125D:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_8051260:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos -70, 6
    a_set_sprite_frame 5
L_805126E:
    a_wait 1
    a_jump L_805126E

    .align 2, 0

    .align 2, 0

NPC_8051278:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 218, 6
    a_set_sprite_frame 5
L_8051286:
    a_wait 1
    a_jump L_8051286

    .align 2, 0

global_label NPCList_8051290
    .word NPC_80512A4
    .word NPC_80512C8
    .word NPC_80512E0
    .word NPC_8050D7C
    .word 0xFF

    .align 2, 0

NPC_80512A4:
    a_jump_if_flag FLAG_ITEM_OTHER_BLACKBOARD_COMP_POWERUP, L_80512C5
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 250, 230
    a_set_sprite_frame 0
L_80512BC:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_OTHER_BLACKBOARD_COMP_POWERUP, L_80512BC
L_80512C5:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_80512C8:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos 186, -250
    a_set_sprite_frame 3
L_80512D6:
    a_wait 1
    a_jump L_80512D6

    .align 2, 0

    .align 2, 0

NPC_80512E0:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos -166, 230
    a_set_sprite_frame 1
L_80512EE:
    a_wait 1
    a_jump L_80512EE

    .align 2, 0

