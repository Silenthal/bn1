#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_8050288
    .word NPC_8050294
    .word NPC_80502B8
    .word 0xFF

    .align 2, 0

NPC_8050294:
    a_jump_if_flag FLAG_ITEM_SCILAB_FISH_STAND_COMP_KEYMASA, L_80502B7
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 180, -164
    a_set_radius 4
    a_set_sprite_frame 0
L_80502AE:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCILAB_FISH_STAND_COMP_KEYMASA, L_80502AE
L_80502B7:
    a_destroy

    .align 2, 0

NPC_80502B8:
    a_jump_if_flag FLAG_ITEM_SCILAB_FISH_STAND_COMP_TRISPEAR_J, L_80502DB
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -172, -36
    a_set_radius 4
    a_set_sprite_frame 0
L_80502D2:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_SCILAB_FISH_STAND_COMP_TRISPEAR_J, L_80502D2
L_80502DB:
    a_destroy

global_label EntityAllocParams_80502DC
    entity Effect, 0x16, f(50, -386, 0), 0x2000002
    entity Effect, 0x16, f(162, 350, 0), 0x49010002
    .word 0xFF
