#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_804FFCC
    .word NPC_804FFD8
    .word NPC_804FFFC
    .word 0xFF

    .align 2, 0

NPC_804FFD8:
    a_jump_if_flag 0x2ED, L_804FFFB
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 400, -4
    a_set_radius 4
    a_set_sprite_frame 0
L_804FFF2:
    a_wait 1
    a_jump_if_not_flag 0x2ED, L_804FFF2
L_804FFFB:
    a_destroy

    .align 2, 0

NPC_804FFFC:
    a_jump_if_flag 0x2EE, L_805001F
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 146, 236
    a_set_radius 4
    a_set_sprite_frame 0
L_8050016:
    a_wait 1
    a_jump_if_not_flag 0x2EE, L_8050016
L_805001F:
    a_destroy

global_label EntityAllocParams_8050020
    entity Effect, 0x16, f(-398, -18, 0), 0x603
    entity Effect, 0x16, f(-14, 110, 0), 0x4B010603
    .word 0xFF
